##############
##############
SUBSET=test
RETRIEVER_TYPE=dense
NUM_QUERIES=1
MODEL_NAME=vit5-qr
MODEL_TYPE=vit5qr
INDEX_PATH=static/index/dense
ENCODER_PATH=bkai-foundation-models/vietnamese-bi-encoder

RANKING_PATH=/data1/workspaces/trientp/viqr/rankings/${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}.tsv
QRELS=/data1/workspaces/trientp/viqr/static/${RETRIEVER_TYPE}/qrels.${SUBSET}.tsv
EVAL=/data1/workspaces/trientp/viqr/exp/${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}.tsv
###########
START_TIME=$(date +%s%3N)
PYTHONPATH=. python viqr/run_exp_qr.py --subset test\
    --data_path /data1/workspaces/trientp/viqr/static/conversation_topic_shifted.test.csv\
    --model_base_dir static/models\
    --model_name ${MODEL_NAME}\
    --model_type ${MODEL_TYPE}\
    --device cuda\
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
NUM_QUERIES=2
MODEL_NAME=vit5-qr
MODEL_TYPE=vit5qr
INDEX_PATH=static/index/dense
ENCODER_PATH=bkai-foundation-models/vietnamese-bi-encoder

RANKING_PATH=/data1/workspaces/trientp/viqr/rankings/${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}.tsv
QRELS=/data1/workspaces/trientp/viqr/static/${RETRIEVER_TYPE}/qrels.${SUBSET}.tsv
EVAL=/data1/workspaces/trientp/viqr/exp/${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}.tsv
###########
START_TIME=$(date +%s%3N)
PYTHONPATH=. python viqr/run_exp_qr.py --subset test\
    --data_path /data1/workspaces/trientp/viqr/static/conversation_topic_shifted.test.csv\
    --model_base_dir static/models\
    --model_name ${MODEL_NAME}\
    --model_type ${MODEL_TYPE}\
    --device cuda\
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
NUM_QUERIES=3
MODEL_NAME=vit5-qr
MODEL_TYPE=vit5qr
INDEX_PATH=static/index/dense
ENCODER_PATH=bkai-foundation-models/vietnamese-bi-encoder

RANKING_PATH=/data1/workspaces/trientp/viqr/rankings/${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}.tsv
QRELS=/data1/workspaces/trientp/viqr/static/${RETRIEVER_TYPE}/qrels.${SUBSET}.tsv
EVAL=/data1/workspaces/trientp/viqr/exp/${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}.tsv
###########
START_TIME=$(date +%s%3N)
PYTHONPATH=. python viqr/run_exp_qr.py --subset test\
    --data_path /data1/workspaces/trientp/viqr/static/conversation_topic_shifted.test.csv\
    --model_base_dir static/models\
    --model_name ${MODEL_NAME}\
    --model_type ${MODEL_TYPE}\
    --device cuda\
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
NUM_QUERIES=4
MODEL_NAME=vit5-qr
MODEL_TYPE=vit5qr
INDEX_PATH=static/index/dense
ENCODER_PATH=bkai-foundation-models/vietnamese-bi-encoder

RANKING_PATH=/data1/workspaces/trientp/viqr/rankings/${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}.tsv
QRELS=/data1/workspaces/trientp/viqr/static/${RETRIEVER_TYPE}/qrels.${SUBSET}.tsv
EVAL=/data1/workspaces/trientp/viqr/exp/${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}.tsv
###########
START_TIME=$(date +%s%3N)
PYTHONPATH=. python viqr/run_exp_qr.py --subset test\
    --data_path /data1/workspaces/trientp/viqr/static/conversation_topic_shifted.test.csv\
    --model_base_dir static/models\
    --model_name ${MODEL_NAME}\
    --model_type ${MODEL_TYPE}\
    --device cuda\
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
NUM_QUERIES=5
MODEL_NAME=vit5-qr
MODEL_TYPE=vit5qr
INDEX_PATH=static/index/dense
ENCODER_PATH=bkai-foundation-models/vietnamese-bi-encoder

RANKING_PATH=/data1/workspaces/trientp/viqr/rankings/${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}.tsv
QRELS=/data1/workspaces/trientp/viqr/static/${RETRIEVER_TYPE}/qrels.${SUBSET}.tsv
EVAL=/data1/workspaces/trientp/viqr/exp/${RETRIEVER_TYPE}.${MODEL_NAME}.${NUM_QUERIES}.${SUBSET}.tsv
###########
START_TIME=$(date +%s%3N)
PYTHONPATH=. python viqr/run_exp_qr.py --subset test\
    --data_path /data1/workspaces/trientp/viqr/static/conversation_topic_shifted.test.csv\
    --model_base_dir static/models\
    --model_name ${MODEL_NAME}\
    --model_type ${MODEL_TYPE}\
    --device cuda\
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
