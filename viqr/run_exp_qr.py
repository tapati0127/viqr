import os
import argparse

import pandas as pd
from tqdm import tqdm

from qr_model import ViT5QR, ViT5QRTokenDecider
from retriever import Retriever


def parse_args():
    parser = argparse.ArgumentParser(description="")
    parser.add_argument("--subset", type=str, default="test", help="")
    parser.add_argument("--data_path", type=str, default="/data1/workspaces/trientp/viqr/static/conversation_topic_shifted.test.csv", help="Path to the test dataset")
    parser.add_argument("--model_base_dir", type=str, default="vit5-query-rewriting",)
    parser.add_argument("--model_name", type=str, default="vit5-query-rewriting",)
    parser.add_argument("--model_type", type=str, default="vit5qr", help="vit5qr / vit5qr-tokendecider")
    parser.add_argument("--device", type=str, default="cuda", help="cpu / cuda")
    parser.add_argument("--separator", type=str, default="<pad>")
    parser.add_argument("--num_queries", type=int, default=1)
    parser.add_argument("--is_rewrite", type=int, default=1, help="")

    parser.add_argument("--retriever_type", type=str, default="bm25", help="bm25 / dense")
    parser.add_argument("--index_path", type=str, default="bm25", help="bm25 / dense")
    parser.add_argument("--encoder_path", type=str, default="", help="")
    parser.add_argument("--k", type=int, default=100, help="")
    parser.add_argument("--combining_method", type=str, default="heuristic_fusion", help="")
    parser.add_argument("--ranking_path", type=str, default="/data1/workspaces/trientp/viqr/rankings", help="")
    
    
    return parser.parse_args()

# Hàm tạo dữ liệu query rewriting với đầu ra có [YES]/[NO] + rewrite, bao gồm cả turn_id = 0
def build_query_rewriting_data_with_labels(df, separator='<pad>'):
    result = []
    for session_id, session_data in df.groupby('session_id'):
        session_data = session_data.sort_values('turn_id')  # Sắp xếp theo turn_id
        context = []  # Lưu ngữ cảnh
        for i, row in session_data.iterrows():
            # Tạo đầu vào: Ngữ cảnh + câu hỏi hiện tại, sử dụng SEP để phân cách
            input_text = f" {separator} ".join(context) + f" {separator} {row['new_question']}" if context else row['new_question']
            
            output_text = row['rewrite']
            
            result.append({"qid": i, 'input': input_text, 'output': output_text})
            
            # Cập nhật ngữ cảnh với định dạng sử dụng SEP
            context.append(f"{row['new_question']} {separator} {row['answer']}")
    return result



args = parse_args()
df = pd.read_csv(args.data_path)
data = build_query_rewriting_data_with_labels(df)

if args.model_type == "vit5qr":
    model = ViT5QR(model_path = args.model_name, 
                   device = args.device)
elif args.model_type == "vit5qr-tokendecider":
    model = ViT5QRTokenDecider(model_path = args.model_name,
                               device = args.device)
    
retriever = Retriever(retriever_type=args.retriever_type,
            index_path=args.index_path,
            encoder_path=args.encoder_path,
            device = args.device)

with open(args.ranking_path, "w") as fw:
    for item in tqdm(data):
        input_text = item['input']
        qid = item['qid']
        if args.is_rewrite:
            rewrites = model.predict(input_text, args.num_queries)
        else:
            rewrites = [input_text]
        results = retriever.batch_search(rewrites=rewrites,
                                         k=args.k,
                                         combining_method=args.combining_method)
        for i, (doc_id, score) in enumerate(results):
            if i+1 > args.k:
                continue
            fw.write(f"{qid} Q0 {doc_id} {i+1} {score} {args.num_queries}\n")

    


