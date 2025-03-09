import sys
from simpletransformers.classification import ClassificationModel
from text_preprocess import preprocess_text

model_path = "./app/python/models/ERC4AI-Binary/"
texts = sys.argv[1:]
preprocessed_texts = [preprocess_text(text) for text in texts]

model = ClassificationModel("bert", model_path)
prediction = model.predict(preprocessed_texts)

for text, pred in zip(preprocessed_texts, prediction[0]):
    print(text)
    print(pred)
    print()
