export HF_HUB_ENABLE_HF_TRANSFER=1
export TRANSFORMERS_TRUST_REMOTE_CODE=1

INDEX_NAME=bge-m3
INDEX_PATH=./new_static/index/${INDEX_NAME}/
git lfs install
git clone git@hf.co:datasets/trientp/${INDEX_NAME}
cd ${INDEX_NAME}
cp -r ${INDEX_PATH} .
git add .
git commit -m "Initial upload"
git push

OUTPUT=./new_static/index/nomic-embed-text-v1
INPUT=./new_static/doc_prompt

if [ ! -f "$OUTPUT" ]; then
    echo "Creating index..."
    python -m pyserini.encode input  --corpus ${INPUT} --shard-id 0 output  --embeddings ${OUTPUT} --to-faiss \
        encoder --encoder nomic-ai/nomic-embed-text-v1 --batch 16 --device cuda:0 --encoder-class sentence-transformers \
        --dimension 768 

fi

INDEX_NAME=nomic-embed-text-v1
INDEX_PATH=./new_static/index/${INDEX_NAME}/
git lfs install
git clone git@hf.co:datasets/trientp/${INDEX_NAME}
cd ${INDEX_NAME}
cp -r ${INDEX_PATH} .
git add .
git commit -m "Initial upload"
git push

OUTPUT=./new_static/index/nomic-embed-text-v1.5
INPUT=./new_static/doc_prompt

if [ ! -f "$OUTPUT" ]; then
    echo "Creating index..."
    python -m pyserini.encode input  --corpus ${INPUT} --shard-id 0 output  --embeddings ${OUTPUT} --to-faiss \
        encoder --encoder nomic-ai/nomic-embed-text-v1.5 --batch 16 --device cuda:0 --encoder-class sentence-transformers \
        --dimension 768 

fi

INDEX_NAME=nomic-embed-text-v1.5
INDEX_PATH=./new_static/index/${INDEX_NAME}/
git lfs install
git clone git@hf.co:datasets/trientp/${INDEX_NAME}
cd ${INDEX_NAME}
cp -r ${INDEX_PATH} .
git add .
git commit -m "Initial upload"
git push

OUTPUT=./new_static/index/multilingual-e5-base
INPUT=./new_static/doc

if [ ! -f "$OUTPUT" ]; then
    echo "Creating index..."
    python -m pyserini.encode input  --corpus ${INPUT} --shard-id 0 output  --embeddings ${OUTPUT} --to-faiss \
        encoder --encoder intfloat/multilingual-e5-base --batch 16 --device cuda:0 --encoder-class sentence-transformers \
        --dimension 768 

fi

INDEX_NAME=multilingual-e5-base
INDEX_PATH=./new_static/index/${INDEX_NAME}/
git lfs install
git clone git@hf.co:datasets/trientp/${INDEX_NAME}
cd ${INDEX_NAME}
cp -r ${INDEX_PATH} .
git add .
git commit -m "Initial upload"
git push