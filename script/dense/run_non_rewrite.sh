# ##############
# ##############
# SUBSET=test
# RETRIEVER_TYPE=dense
# NUM_QUERIES=1
# MODEL_NAME=0
# MODEL_TYPE=0
# INDEX_PATH=./new_static/index/nomic-embed-text-v1
# ENCODER_PATH=nomic-ai/nomic-embed-text-v1
# INDEX_NAME=nomic-embed-text-v1
# INPUT_PREFIX="search_query: " #prefix to the last query
# # REWRITE_PREFIX="" #prefix to the rewritten query

# RANKING_PATH=./new_static/exp/${INDEX_NAME}/${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}.tsv
# QRELS=./new_static/${RETRIEVER_TYPE}/qrels.${SUBSET}.tsv
# EVAL=./new_static/exp/${INDEX_NAME}/non_${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}.tsv
# ###########
# START_TIME=$(date +%s%3N)
# PYTHONPATH=. python viqr/run_exp_qr.py --subset test\
#     --data_path /data1/workspaces/trientp/viqr/static/conversation_topic_shifted.test.csv\
#     --model_base_dir static/models\
#     --model_name ${MODEL_NAME}\
#     --model_type ${MODEL_TYPE}\
#     --device cpu\
#     --num_queries ${NUM_QUERIES}\
#     --retriever_type ${RETRIEVER_TYPE}\
#     --index_path ${INDEX_PATH}\
#     --combining_method heuristic_fusion\
#     --ranking_path ${RANKING_PATH}\
#     --encoder_path ${ENCODER_PATH}\
#     --is_rewrite 0\
#     --input_prefix ${INPUT_PREFIX}
#     # --rewrite_prefix ${REWRITE_PREFIX}

# END_TIME=$(date +%s%3N)
# ###########
# python eval.py --qrel ${QRELS} --run ${RANKING_PATH} --save ${EVAL}
# ELAPSED_TIME=$((END_TIME - START_TIME))
# echo "${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}========${ELAPSED_TIME}"
# echo "time	${ELAPSED_TIME}" >> ${EVAL}

# ##############
# ##############
# SUBSET=test
# RETRIEVER_TYPE=dense
# NUM_QUERIES=1
# MODEL_NAME=0
# MODEL_TYPE=0
# INDEX_PATH=./new_static/index/nomic-embed-text-v1.5
# ENCODER_PATH=nomic-ai/nomic-embed-text-v1.5
# INDEX_NAME=nomic-embed-text-v1.5
# INPUT_PREFIX="search_query: "
# # REWRITE_PREFIX=""

# RANKING_PATH=./new_static/exp/${INDEX_NAME}/${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}.tsv
# QRELS=./new_static/${RETRIEVER_TYPE}/qrels.${SUBSET}.tsv
# EVAL=./new_static/exp/${INDEX_NAME}/non_${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}.tsv
# ###########
# START_TIME=$(date +%s%3N)
# PYTHONPATH=. python viqr/run_exp_qr.py --subset test\
#     --data_path /data1/workspaces/trientp/viqr/static/conversation_topic_shifted.test.csv\
#     --model_base_dir static/models\
#     --model_name ${MODEL_NAME}\
#     --model_type ${MODEL_TYPE}\
#     --device cpu\
#     --num_queries ${NUM_QUERIES}\
#     --retriever_type ${RETRIEVER_TYPE}\
#     --index_path ${INDEX_PATH}\
#     --combining_method heuristic_fusion\
#     --ranking_path ${RANKING_PATH}\
#     --encoder_path ${ENCODER_PATH}\
#     --is_rewrite 0\
#     --input_prefix ${INPUT_PREFIX}
#     # --rewrite_prefix ${REWRITE_PREFIX}

# END_TIME=$(date +%s%3N)
# ###########
# python eval.py --qrel ${QRELS} --run ${RANKING_PATH} --save ${EVAL}
# ELAPSED_TIME=$((END_TIME - START_TIME))
# echo "${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}========${ELAPSED_TIME}"
# echo "time	${ELAPSED_TIME}" >> ${EVAL}


##############
##############
SUBSET=test
RETRIEVER_TYPE=dense
NUM_QUERIES=1
MODEL_NAME=0
MODEL_TYPE=0
INDEX_PATH=./new_static/index/snowflake-arctic-embed-l-v2.0
ENCODER_PATH=Snowflake/snowflake-arctic-embed-l-v2.0
INDEX_NAME=snowflake-arctic-embed-l-v2.0
INPUT_PREFIX="" #prefix to the last query
# REWRITE_PREFIX="" #prefix to the rewritten query

RANKING_PATH=./new_static/exp/${INDEX_NAME}/${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}.tsv
QRELS=./new_static/${RETRIEVER_TYPE}/qrels.${SUBSET}.tsv
EVAL=./new_static/exp/${INDEX_NAME}/non_${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}.tsv
###########
START_TIME=$(date +%s%3N)
PYTHONPATH=. python viqr/run_exp_qr.py --subset test\
    --data_path /data1/workspaces/trientp/viqr/static/conversation_topic_shifted.test.csv\
    --model_base_dir static/models\
    --model_name ${MODEL_NAME}\
    --model_type ${MODEL_TYPE}\
    --device cpu\
    --num_queries ${NUM_QUERIES}\
    --retriever_type ${RETRIEVER_TYPE}\
    --index_path ${INDEX_PATH}\
    --combining_method heuristic_fusion\
    --ranking_path ${RANKING_PATH}\
    --encoder_path ${ENCODER_PATH}\
    --is_rewrite 0
    # --rewrite_prefix ${REWRITE_PREFIX}

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
MODEL_NAME=0
MODEL_TYPE=0
INDEX_PATH=./new_static/index/gte-multilingual-base
ENCODER_PATH=Alibaba-NLP/gte-multilingual-base
INDEX_NAME=gte-multilingual-base
# INPUT_PREFIX="search_query: "
# REWRITE_PREFIX=""

RANKING_PATH=./new_static/exp/${INDEX_NAME}/${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}.tsv
QRELS=./new_static/${RETRIEVER_TYPE}/qrels.${SUBSET}.tsv
EVAL=./new_static/exp/${INDEX_NAME}/non_${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}.tsv
###########
START_TIME=$(date +%s%3N)
PYTHONPATH=. python viqr/run_exp_qr.py --subset test\
    --data_path /data1/workspaces/trientp/viqr/static/conversation_topic_shifted.test.csv\
    --model_base_dir static/models\
    --model_name ${MODEL_NAME}\
    --model_type ${MODEL_TYPE}\
    --device cpu\
    --num_queries ${NUM_QUERIES}\
    --retriever_type ${RETRIEVER_TYPE}\
    --index_path ${INDEX_PATH}\
    --combining_method heuristic_fusion\
    --ranking_path ${RANKING_PATH}\
    --encoder_path ${ENCODER_PATH}\
    --is_rewrite 0

END_TIME=$(date +%s%3N)
###########
python eval.py --qrel ${QRELS} --run ${RANKING_PATH} --save ${EVAL}
ELAPSED_TIME=$((END_TIME - START_TIME))
echo "${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}========${ELAPSED_TIME}"
echo "time	${ELAPSED_TIME}" >> ${EVAL}

