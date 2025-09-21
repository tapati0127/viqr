# #####################################################
SUBSET=test
RETRIEVER_TYPE=dense
MODEL_NAME=rewrite
INDEX_PATH=./new_static/index/nomic-embed-text-v1
INDEX_NAME=nomic-embed-text-v1
MODEL=nomic-ai/nomic-embed-text-v1
PREFIX=prefix_ # Prefix file

INPUT=new_static/${RETRIEVER_TYPE}/${PREFIX}${RETRIEVER_TYPE}-${MODEL_NAME}.${SUBSET}.tsv
RANKING_PATH=new_static/exp/${INDEX_NAME}/${RETRIEVER_TYPE}.${MODEL_NAME}.${SUBSET}.tsv
QRELS=new_static/${RETRIEVER_TYPE}/qrels.${SUBSET}.tsv
EVAL=new_static/exp/${INDEX_NAME}/${RETRIEVER_TYPE}.${MODEL_NAME}.${SUBSET}.tsv

python -m pyserini.search.faiss \
  --index ${INDEX_PATH} \
  --topics ${INPUT} \
  --output ${RANKING_PATH} \
  --hits 100 \
  --encoder-class sentence \
  --device cpu \
  --batch-size 64 \
  --encoder ${MODEL}

python eval.py --qrel ${QRELS} --run ${RANKING_PATH} --save ${EVAL}
###
echo "time	0" >> ${EVAL}


# #####################################################
SUBSET=test
RETRIEVER_TYPE=dense
MODEL_NAME=rewrite
INDEX_PATH=./new_static/index/nomic-embed-text-v1.5
INDEX_NAME=nomic-embed-text-v1.5
MODEL=nomic-ai/nomic-embed-text-v1.5
PREFIX=prefix_

INPUT=new_static/${RETRIEVER_TYPE}/${PREFIX}${RETRIEVER_TYPE}-${MODEL_NAME}.${SUBSET}.tsv
RANKING_PATH=new_static/exp/${INDEX_NAME}/${RETRIEVER_TYPE}.${MODEL_NAME}.${SUBSET}.tsv
QRELS=new_static/${RETRIEVER_TYPE}/qrels.${SUBSET}.tsv
EVAL=new_static/exp/${INDEX_NAME}/${RETRIEVER_TYPE}.${MODEL_NAME}.${SUBSET}.tsv

python -m pyserini.search.faiss \
  --index ${INDEX_PATH} \
  --topics ${INPUT} \
  --output ${RANKING_PATH} \
  --hits 100 \
  --encoder-class sentence \
  --device cpu \
  --batch-size 64 \
  --encoder ${MODEL}

python eval.py --qrel ${QRELS} --run ${RANKING_PATH} --save ${EVAL}
###
echo "time	0" >> ${EVAL}
