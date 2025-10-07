bash create_index_dense.sh
bash script/dense/run_non_rewrite.sh
bash script/dense/run_original_question.sh
bash script/dense/run_human_rewrite.sh

bash script/dense/run_qr.sh  trientp/mlong-t5-tglobal-base-qr mlong-t5-tglobal-base-qr
bash script/dense/run_token_decider.sh trientp/mlong-t5-tglobal-base-qr-decider mlong-t5-tglobal-base-qr-decider
bash script/dense/run_qr.sh  ./static/models/vit5-qr vit5-qr
bash script/dense/run_token_decider.sh ./static/models/vit5-token-decider-eos vit5-token-decider-eos
bash script/dense/run_qr.sh  trientp/mt5-small-qr mt5-small-qr
bash script/dense/run_token_decider.sh trientp/mt5-small-qr-decider mt5-small-qr-decider

bash script/dense/run_token_decider.sh trientp/Qwen1.5-0.5B-qr-decider Qwen1.5-0.5B-qr-decider "<|endoftext|>"

bash script/dense/run_qr.sh  mt5-base-qr mt5-base-qr
bash script/dense/run_token_decider.sh mt5-base-qr-decider mt5-base-qr-decider

