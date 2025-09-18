from typing import List
from transformers import AutoModelForSeq2SeqLM, AutoTokenizer

class ViT5QR:
    def __init__(self, 
                 model_path: str,
                 device: str,
                 truncation_side: str = 'left',
                 input_max_length: int = 1000,
                 output_max_length: int = 60,
                 separator: str = "<pad>"
                 ):
        self._device = device
        self._model = AutoModelForSeq2SeqLM.from_pretrained(model_path).to(device)
        self._tokenizer = AutoTokenizer.from_pretrained(model_path, truncation_side=truncation_side) 
        self._input_max_length = input_max_length
        self._output_max_length = output_max_length
        self._separator = separator


    def predict(self, input_text: str, num_queries: int = 1) -> List[str]:
        model_inputs = self._tokenizer([input_text], 
                                       truncation=True, 
                                       padding='longest', 
                                       max_length=self._input_max_length,
                                       return_tensors="pt").to(self._device)
        if num_queries == 1:
            model_outputs = self._model.generate(**model_inputs, 
                                                 max_new_tokens=self._output_max_length)
        else:
            model_outputs = self._model.generate(**model_inputs, max_new_tokens=60,
                                    num_return_sequences=num_queries,  # Số câu sinh ra
                                        num_beams=num_queries,  # Beam search với số beam bằng số rewrites
                                        no_repeat_ngram_size=2,
                                        early_stopping=True,
                                        # do_sample=True
                                    )
        output_texts = self._tokenizer.batch_decode(model_outputs, skip_special_tokens=True)
        return output_texts
    

class ViT5QRTokenDecider(ViT5QR):
    def predict(self, input_text: str, num_queries: int = 1) -> List[str]:
        model_inputs = self._tokenizer([input_text], 
                                       truncation=True, 
                                       padding='longest', 
                                       max_length=self._input_max_length,
                                       return_tensors="pt").to(self._device)
        query_only = input_text.split(self._separator)[-1]
        if num_queries == 1:
            model_outputs = self._model.generate(**model_inputs, 
                                                 max_new_tokens=self._output_max_length)
        else:
            model_outputs = self._model.generate(**model_inputs, max_new_tokens=60,
                                    num_return_sequences=num_queries,  # Số câu sinh ra
                                        num_beams=num_queries,  # Beam search với số beam bằng số rewrites
                                        no_repeat_ngram_size=2,
                                        early_stopping=True,
                                        # do_sample=True
                                    )
        output_texts = self._tokenizer.batch_decode(model_outputs, skip_special_tokens=True)
        # print(output_texts)
        rewrites = set()
        for rewrite in output_texts:
            if rewrite:
                rewrites.add(rewrite)
            else: # Empty query --> Do not rewrite --> Use orginal query
                # return [query_only]
                rewrites.add(query_only)
                return list(rewrites)
        return list(rewrites)
    
# model = ViT5QR("/data1/workspaces/trientp/viqr/static/models/vit5-token-decider-eos",
#                "cuda")
# output = model.predict("Tiệm bánh hoàng tử bé là bộ phim của ai?",
#                        num_queries=3
#                        )
# print(output)
