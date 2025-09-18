OUTPUT=./new_static/index/bge-m3
INPUT=./new_static/doc

if [ ! -f "$OUTPUT" ]; then
    echo "Creating index..."
    python -m pyserini.encode input  --corpus ${INPUT} --shard-id 0 output  --embeddings ${OUTPUT} --to-faiss \
        encoder --encoder BAAI/bge-m3 --batch 264 --device cpu --encoder-class sentence-transformers \
        --dimension 1024 

fi