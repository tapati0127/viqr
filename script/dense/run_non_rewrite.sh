##############
##############
SUBSET=test
RETRIEVER_TYPE=dense
NUM_QUERIES=1
MODEL_NAME=0
MODEL_TYPE=0
INDEX_PATH=static/index/dense_bge-m3
ENCODER_PATH=BAAI/bge-m3

RANKING_PATH=/data1/workspaces/trientp/viqr/rankings/non/${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}.tsv
QRELS=/data1/workspaces/trientp/viqr/static/${RETRIEVER_TYPE}/qrels.${SUBSET}.tsv
EVAL=/data1/workspaces/trientp/viqr/exp/non_${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}.tsv
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

