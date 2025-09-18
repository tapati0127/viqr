import re
from typing import List, Dict, Tuple


from underthesea import word_tokenize
from pyserini.search.lucene import LuceneSearcher
from pyserini.encode import AutoQueryEncoder
from pyserini.search.faiss import FaissSearcher


def remove_punctuation_except_underscore_vietnamese(text):
    return re.sub(r'[^\w\s_]', '', text)

def preprocess_bm25(content):
    content = word_tokenize(content, format="text")
    content = remove_punctuation_except_underscore_vietnamese(content)
    content = content.lower()
    return content

def preprocess_dense(content):
    content = word_tokenize(content, format="text")
    return content

def reciprocal_rank_fusion(rankings:  List[Dict], k=100) -> Dict:
    """
    Implements Reciprocal Rank Fusion (RRF) for combining rankings from multiple retrieval models.

    Args:
        rankings (list of dict): A list of rankings from different models. Each ranking is a dictionary
                                 where keys are document IDs and values are their ranks (1-based).
        k (int): The rank cut-off parameter for RRF.

    Returns:
        dict: Combined scores for each document.
    """
    fused_scores = {}

    for ranking in rankings:
        for doc_id, rank in ranking.items():
            # RRF score calculation
            fused_scores[doc_id] = fused_scores.get(doc_id, 0) + 1 / (k + rank)

    return fused_scores


def heuristic_fusion(rankings: List[Dict], k = None)  -> Dict:
    """
    Implements Reciprocal Rank Fusion (RRF) for combining rankings from multiple retrieval models.

    Args:
        rankings (list of dict): A list of rankings from different models. Each ranking is a dictionary
                                 where keys are document IDs and values are their ranks (1-based).
        k (int): The rank cut-off parameter for RRF.

    Returns:
        dict: Combined scores for each document.
    """
    fused_scores = {}

    for ranking in rankings:
        for doc_id, score in ranking.items():
            # RRF score calculation
            fused_scores[doc_id] = max(fused_scores.get(doc_id, 0), score)

    return fused_scores

class Retriever:
    def __init__(self, 
                 retriever_type: str,
                 index_path: str,
                 encoder_path: str = None,
                 device: str = "cpu",
                 dimension=768
                 ):
        if retriever_type == "bm25":
            self._retriever = LuceneSearcher(index_dir=index_path)
            self._preprocess = preprocess_bm25
        elif retriever_type == "dense":
            encoder = AutoQueryEncoder(encoder_path, 
                                       device=device,
                                       pooling='mean', l2_norm=True
                                       )
            self._retriever = FaissSearcher(
                index_path,
                encoder)
            self._preprocess = preprocess_dense
        else:
            raise NotImplementedError("Please input the correct retriever type: bm25 or dense")
        
    def batch_search(self, rewrites: List[str], 
                     k = 100, 
                     combining_method='heuristic_fusion'):
        hits_dict: Dict = self._retriever.batch_search([self._preprocess(rewrite) for rewrite in rewrites],
                                                 [str(i) for i in range(len(rewrites))],
                                                 k=k)
        
        rankings: List[Dict] = []
        for hits in hits_dict.values():
            _hits_dict = dict()
            for hit in hits:
                _hits_dict[hit.docid]=hit.score
            rankings.append(_hits_dict)

        if len(rewrites) == 1:
            fused_scores: Dict = rankings[0]
        else:
            if combining_method == 'heuristic_fusion':
                fusion_function = heuristic_fusion
            elif combining_method == 'reciprocal_rank_fusion':
                fusion_function = reciprocal_rank_fusion
            else:
                raise NotImplementedError("Please input the correct combining method: heuristic_fusion or reciprocal_rank_fusion")
            
            fused_scores: Dict = fusion_function(rankings, k=k)

        # sorted_docs: [(doc_id, score), (doc_id, score), ...]
        sorted_docs: Tuple[int, float] = sorted(fused_scores.items(), key=lambda x: x[1], reverse=True)
        return sorted_docs



