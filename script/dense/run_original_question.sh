# #####################################################
SUBSET=test
RETRIEVER_TYPE=dense
MODEL_NAME=org-question
INDEX_PATH=./new_static/index/bge-m3
MODEL=BAAI/bge-m3
INDEX_NAME=bge-m3

INPUT=./new_static/${RETRIEVER_TYPE}/${RETRIEVER_TYPE}-${MODEL_NAME}.${SUBSET}.tsv
RANKING_PATH=./new_static/exp/${INDEX_NAME}/${RETRIEVER_TYPE}.${MODEL_NAME}.${SUBSET}.tsv
QRELS=./new_static/${RETRIEVER_TYPE}/qrels.${SUBSET}.tsv
EVAL=./new_static/exp/${INDEX_NAME}/${RETRIEVER_TYPE}.${MODEL_NAME}.${SUBSET}.tsv

python -m pyserini.search.faiss \
  --index ${INDEX_PATH} \
  --topics ${INPUT} \
  --output ${RANKING_PATH} \
  --hits 100 \
  --encoder-class sentence \
  --device cuda:0 \
  --batch-size 64 \
  --encoder ${MODEL}

python eval.py --qrel ${QRELS} --run ${RANKING_PATH} --save ${EVAL}
###
echo "time	0" >> ${EVAL}
