# #####################################################
SUBSET=test
RETRIEVER_TYPE=bm25
MODEL_NAME=org-question
INDEX_PATH=static/index/bm25

INPUT=/data1/workspaces/trientp/viqr/static/${RETRIEVER_TYPE}/${RETRIEVER_TYPE}-${MODEL_NAME}.${SUBSET}.tsv
RANKING_PATH=/data1/workspaces/trientp/viqr/rankings/${RETRIEVER_TYPE}.${MODEL_NAME}.${SUBSET}.tsv
QRELS=/data1/workspaces/trientp/viqr/static/${RETRIEVER_TYPE}/qrels.${SUBSET}.tsv
EVAL=/data1/workspaces/trientp/viqr/exp/${RETRIEVER_TYPE}.${MODEL_NAME}.${SUBSET}.tsv

python -m pyserini.search.lucene \
  --index ${INDEX_PATH} \
  --topics ${INPUT} \
  --output ${RANKING_PATH} \
  --hits 100 \
  --bm25

python eval.py --qrel ${QRELS} --run ${RANKING_PATH} --save ${EVAL}
###
echo "time	0" >> ${EVAL}
