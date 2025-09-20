import json
import os


OUTPUT_PATH="./new_static/doc_prompt"
FILE_NAME="viwiki-passages.jsonl"
INPUT="./new_static/doc/viwiki-passages.jsonl"

os.makedirs(OUTPUT_PATH, exist_ok=True)

with open(os.path.join(OUTPUT_PATH, FILE_NAME), "w") as fw:
    with open(INPUT) as f:
        for line in f.readlines():
            item = json.loads(line)
            item['contents'] = "search_document: " + item['contents']
            fw.write(json.dumps(item, ensure_ascii=False) + '\n')
