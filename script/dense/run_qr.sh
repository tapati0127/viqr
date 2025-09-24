##############
##############
SUBSET=test
RETRIEVER_TYPE=dense
NUM_QUERIES=1
MODEL_NAME=$1
SAVED_MODEL_NAME=$2
MODEL_TYPE=vit5qr
INDEX_PATH=./new_static/index/bge-m3
ENCODER_PATH=BAAI/bge-m3
INDEX_NAME=bge-m3


RANKING_PATH=./new_static/exp/${INDEX_NAME}/${RETRIEVER_TYPE}.${SAVED_MODEL_NAME}.${SUBSET}.tsv
QRELS=./new_static/${RETRIEVER_TYPE}/qrels.${SUBSET}.tsv
EVAL=./new_static/exp/${INDEX_NAME}/${RETRIEVER_TYPE}.${SAVED_MODEL_NAME}.${SUBSET}.tsv
###########
START_TIME=$(date +%s%3N)
PYTHONPATH=. python viqr/run_exp_qr.py --subset test\
    --data_path /data1/workspaces/trientp/viqr/static/conversation_topic_shifted.test.csv\
    --model_base_dir static/models\
    --model_name ${MODEL_NAME}\
    --model_type ${MODEL_TYPE}\
    --device cuda:0\
    --num_queries ${NUM_QUERIES}\
    --retriever_type ${RETRIEVER_TYPE}\
    --index_path ${INDEX_PATH}\
    --combining_method heuristic_fusion\
    --ranking_path ${RANKING_PATH}\
    --encoder_path ${ENCODER_PATH}

END_TIME=$(date +%s%3N)
###########
python eval.py --qrel ${QRELS} --run ${RANKING_PATH} --save ${EVAL}
ELAPSED_TIME=$((END_TIME - START_TIME))
echo "${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}========${ELAPSED_TIME}"
echo "time	${ELAPSED_TIME}" >> ${EVAL}



##############
##############
SUBSET=test
RETRIEVER_TYPE=dense
NUM_QUERIES=1
MODEL_NAME=$1
SAVED_MODEL_NAME=$2
MODEL_TYPE=vit5qr
INDEX_PATH=./new_static/index/gte-multilingual-base
ENCODER_PATH=Alibaba-NLP/gte-multilingual-base
INDEX_NAME=gte-multilingual-base
# INPUT_PREFIX=""
# REWRITE_PREFIX="search_query: "

RANKING_PATH=./new_static/exp/${INDEX_NAME}/${RETRIEVER_TYPE}.${SAVED_MODEL_NAME}.${SUBSET}.tsv
QRELS=./new_static/${RETRIEVER_TYPE}/qrels.${SUBSET}.tsv
EVAL=./new_static/exp/${INDEX_NAME}/${RETRIEVER_TYPE}.${SAVED_MODEL_NAME}.${SUBSET}.tsv
###########
START_TIME=$(date +%s%3N)
PYTHONPATH=. python viqr/run_exp_qr.py --subset test\
    --data_path /data1/workspaces/trientp/viqr/static/conversation_topic_shifted.test.csv\
    --model_base_dir static/models\
    --model_name ${MODEL_NAME}\
    --model_type ${MODEL_TYPE}\
    --device cuda:0\
    --num_queries ${NUM_QUERIES}\
    --retriever_type ${RETRIEVER_TYPE}\
    --index_path ${INDEX_PATH}\
    --combining_method heuristic_fusion\
    --ranking_path ${RANKING_PATH}\
    --encoder_path ${ENCODER_PATH}

END_TIME=$(date +%s%3N)
###########
python eval.py --qrel ${QRELS} --run ${RANKING_PATH} --save ${EVAL}
ELAPSED_TIME=$((END_TIME - START_TIME))
echo "${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}========${ELAPSED_TIME}"
echo "time	${ELAPSED_TIME}" >> ${EVAL}



##############
##############
SUBSET=test
RETRIEVER_TYPE=dense
NUM_QUERIES=1
MODEL_NAME=$1
SAVED_MODEL_NAME=$2
MODEL_TYPE=vit5qr
INDEX_PATH=./new_static/index/snowflake-arctic-embed-l-v2.0
ENCODER_PATH=Snowflake/snowflake-arctic-embed-l-v2.0
INDEX_NAME=snowflake-arctic-embed-l-v2.0
# INPUT_PREFIX=""
# REWRITE_PREFIX="search_query: "

RANKING_PATH=./new_static/exp/${INDEX_NAME}/${RETRIEVER_TYPE}.${SAVED_MODEL_NAME}.${SUBSET}.tsv
QRELS=./new_static/${RETRIEVER_TYPE}/qrels.${SUBSET}.tsv
EVAL=./new_static/exp/${INDEX_NAME}/${RETRIEVER_TYPE}.${SAVED_MODEL_NAME}.${SUBSET}.tsv
###########
START_TIME=$(date +%s%3N)
PYTHONPATH=. python viqr/run_exp_qr.py --subset test\
    --data_path /data1/workspaces/trientp/viqr/static/conversation_topic_shifted.test.csv\
    --model_base_dir static/models\
    --model_name ${MODEL_NAME}\
    --model_type ${MODEL_TYPE}\
    --device cuda:0\
    --num_queries ${NUM_QUERIES}\
    --retriever_type ${RETRIEVER_TYPE}\
    --index_path ${INDEX_PATH}\
    --combining_method heuristic_fusion\
    --ranking_path ${RANKING_PATH}\
    --encoder_path ${ENCODER_PATH}

END_TIME=$(date +%s%3N)
###########
python eval.py --qrel ${QRELS} --run ${RANKING_PATH} --save ${EVAL}
ELAPSED_TIME=$((END_TIME - START_TIME))
echo "${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}========${ELAPSED_TIME}"
echo "time	${ELAPSED_TIME}" >> ${EVAL}


##############
##############
SUBSET=test
RETRIEVER_TYPE=dense
NUM_QUERIES=1
MODEL_NAME=$1
SAVED_MODEL_NAME=$2
MODEL_TYPE=vit5qr
INDEX_PATH=./new_static/index/multilingual-e5-base
ENCODER_PATH=intfloat/multilingual-e5-base
INDEX_NAME=multilingual-e5-base


RANKING_PATH=./new_static/exp/${INDEX_NAME}/${RETRIEVER_TYPE}.${SAVED_MODEL_NAME}.${SUBSET}.tsv
QRELS=./new_static/${RETRIEVER_TYPE}/qrels.${SUBSET}.tsv
EVAL=./new_static/exp/${INDEX_NAME}/${RETRIEVER_TYPE}.${SAVED_MODEL_NAME}.${SUBSET}.tsv
###########
START_TIME=$(date +%s%3N)
PYTHONPATH=. python viqr/run_exp_qr.py --subset test\
    --data_path /data1/workspaces/trientp/viqr/static/conversation_topic_shifted.test.csv\
    --model_base_dir static/models\
    --model_name ${MODEL_NAME}\
    --model_type ${MODEL_TYPE}\
    --device cuda:0\
    --num_queries ${NUM_QUERIES}\
    --retriever_type ${RETRIEVER_TYPE}\
    --index_path ${INDEX_PATH}\
    --combining_method heuristic_fusion\
    --ranking_path ${RANKING_PATH}\
    --encoder_path ${ENCODER_PATH}

END_TIME=$(date +%s%3N)
###########
python eval.py --qrel ${QRELS} --run ${RANKING_PATH} --save ${EVAL}
ELAPSED_TIME=$((END_TIME - START_TIME))
echo "${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}========${ELAPSED_TIME}"
echo "time	${ELAPSED_TIME}" >> ${EVAL}