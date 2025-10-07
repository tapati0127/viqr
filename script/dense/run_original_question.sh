# #####################################################
SUBSET=test
RETRIEVER_TYPE=dense
MODEL_NAME=org-question
INDEX_PATH=./new_static/index/embeddinggemma-300m
MODEL=google/embeddinggemma-300m
INDEX_NAME=embeddinggemma-300m
PREFIX=""

INPUT=./new_static/${RETRIEVER_TYPE}//${PREFIX}${RETRIEVER_TYPE}-${MODEL_NAME}.${SUBSET}.tsv
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


# #####################################################
SUBSET=test
RETRIEVER_TYPE=dense
MODEL_NAME=org-question
INDEX_PATH=./new_static/index/bge-m3
MODEL=BAAI/bge-m3
INDEX_NAME=bge-m3
PREFIX=""

INPUT=./new_static/${RETRIEVER_TYPE}//${PREFIX}${RETRIEVER_TYPE}-${MODEL_NAME}.${SUBSET}.tsv
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





# #####################################################
SUBSET=test
RETRIEVER_TYPE=dense
MODEL_NAME=org-question
INDEX_PATH=./new_static/index/multilingual-e5-base
MODEL=intfloat/multilingual-e5-base
INDEX_NAME=multilingual-e5-base
PREFIX=""

INPUT=./new_static/${RETRIEVER_TYPE}//${PREFIX}${RETRIEVER_TYPE}-${MODEL_NAME}.${SUBSET}.tsv
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

# #####################################################
SUBSET=test
RETRIEVER_TYPE=dense
MODEL_NAME=org-question
INDEX_PATH=./new_static/index/gte-multilingual-base
MODEL=Alibaba-NLP/gte-multilingual-base
INDEX_NAME=gte-multilingual-base
PREFIX=""

INPUT=./new_static/${RETRIEVER_TYPE}//${PREFIX}${RETRIEVER_TYPE}-${MODEL_NAME}.${SUBSET}.tsv
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


# #####################################################
SUBSET=test
RETRIEVER_TYPE=dense
MODEL_NAME=org-question
INDEX_PATH=./new_static/index/snowflake-arctic-embed-l-v2.0
MODEL=Snowflake/snowflake-arctic-embed-l-v2.0
INDEX_NAME=snowflake-arctic-embed-l-v2.0
PREFIX=""

INPUT=./new_static/${RETRIEVER_TYPE}//${PREFIX}${RETRIEVER_TYPE}-${MODEL_NAME}.${SUBSET}.tsv
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