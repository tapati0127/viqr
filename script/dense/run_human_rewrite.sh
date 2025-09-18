# #####################################################
SUBSET=test
RETRIEVER_TYPE=dense
MODEL_NAME=rewrite
INDEX_PATH=static/index/dense
MODEL=bkai-foundation-models/vietnamese-bi-encoder

INPUT=/data1/workspaces/trientp/viqr/static/${RETRIEVER_TYPE}/${RETRIEVER_TYPE}-${MODEL_NAME}.${SUBSET}.tsv
RANKING_PATH=/data1/workspaces/trientp/viqr/rankings/${RETRIEVER_TYPE}.${MODEL_NAME}.${SUBSET}.tsv
QRELS=/data1/workspaces/trientp/viqr/static/${RETRIEVER_TYPE}/qrels.${SUBSET}.tsv
EVAL=/data1/workspaces/trientp/viqr/exp/${RETRIEVER_TYPE}.${MODEL_NAME}.${SUBSET}.tsv

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
