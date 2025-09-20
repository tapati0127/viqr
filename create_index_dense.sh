OUTPUT=./new_static/index/nomic-embed-text-v1
INPUT=./new_static/doc_prompt

if [ ! -f "$OUTPUT" ]; then
    echo "Creating index..."
    python -m pyserini.encode input  --corpus ${INPUT} --shard-id 0 output  --embeddings ${OUTPUT} --to-faiss \
        encoder --encoder nomic-ai/nomic-embed-text-v1 --batch 16 --device cuda:0 --encoder-class sentence-transformers \
        --dimension 768 

fi

OUTPUT=./new_static/index/nomic-embed-text-v1.5
INPUT=./new_static/doc_prompt

if [ ! -f "$OUTPUT" ]; then
    echo "Creating index..."
    python -m pyserini.encode input  --corpus ${INPUT} --shard-id 0 output  --embeddings ${OUTPUT} --to-faiss \
        encoder --encoder nomic-ai/nomic-embed-text-v1.5 --batch 16 --device cuda:0 --encoder-class sentence-transformers \
        --dimension 768 

fi