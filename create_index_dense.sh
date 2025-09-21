# OUTPUT=./new_static/index/bge-m3
# INPUT=./new_static/doc_prompt

# if [ ! -f "$OUTPUT" ]; then
#     echo "Creating index..."
#     python -m pyserini.encode input  --corpus ${INPUT} --shard-id 0 output  --embeddings ${OUTPUT} --to-faiss \
#         encoder --encoder BAAI/bge-m3 --batch 32 --device cuda:0 --encoder-class sentence-transformers \
#         --dimension 1024 

# fi


# OUTPUT=./new_static/index/nomic-embed-text-v1
# INPUT=./new_static/doc_prompt

# if [ ! -f "$OUTPUT" ]; then
#     echo "Creating index..."
#     python -m pyserini.encode input  --corpus ${INPUT} --shard-id 0 output  --embeddings ${OUTPUT} --to-faiss \
#         encoder --encoder nomic-ai/nomic-embed-text-v1 --batch 16 --device cuda:0 --encoder-class sentence-transformers \
#         --dimension 768 

# fi

# OUTPUT=./new_static/index/nomic-embed-text-v1.5
# INPUT=./new_static/doc_prompt

# if [ ! -f "$OUTPUT" ]; then
#     echo "Creating index..."
#     python -m pyserini.encode input  --corpus ${INPUT} --shard-id 0 output  --embeddings ${OUTPUT} --to-faiss \
#         encoder --encoder nomic-ai/nomic-embed-text-v1.5 --batch 16 --device cuda:0 --encoder-class sentence-transformers \
#         --dimension 768 

# fi


# OUTPUT=./new_static/index/multilingual-e5-base
# INPUT=./new_static/doc

# if [ ! -f "$OUTPUT" ]; then
#     echo "Creating index..."
#     python -m pyserini.encode input  --corpus ${INPUT} --shard-id 0 output  --embeddings ${OUTPUT} --to-faiss \
#         encoder --encoder intfloat/multilingual-e5-base --batch 16 --device cuda:0 --encoder-class sentence-transformers \
#         --dimension 768 

# fi

OUTPUT=./new_static/index/snowflake-arctic-embed-l-v2.0
INPUT=./new_static/doc

if [ ! -f "$OUTPUT" ]; then
    echo "Creating index..."
    python -m pyserini.encode input  --corpus ${INPUT} --shard-id 0 output  --embeddings ${OUTPUT} --to-faiss \
        encoder --encoder Snowflake/snowflake-arctic-embed-l-v2.0 --batch 32 --device cuda:0 --encoder-class sentence-transformers \
        --dimension 1024 

fi


OUTPUT=./new_static/index/gte-multilingual-base
INPUT=./new_static/doc

if [ ! -f "$OUTPUT" ]; then
    echo "Creating index..."
    python -m pyserini.encode input  --corpus ${INPUT} --shard-id 0 output  --embeddings ${OUTPUT} --to-faiss \
        encoder --encoder Alibaba-NLP/gte-multilingual-base --batch 32 --device cuda:0 --encoder-class sentence-transformers \
        --dimension 768 

fi
