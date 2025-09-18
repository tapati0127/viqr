OUTPUT=./new_static/index/bm25
INPUT=./new_static/doc

if [ ! -f "$OUTPUT" ]; then
    echo "Creating index..."
    python -m pyserini.index -collection JsonCollection \
                            -generator DefaultLuceneDocumentGenerator \
                            -threads 20 \
                            -input ${INPUT} \
                            -index ${OUTPUT} \
                            -language vi
fi