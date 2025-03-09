import sys
from simpletransformers.classification import ClassificationModel

model_path = "./app/python/models/ERC4AI-Binary/"
texts = sys.argv[1:]

model = ClassificationModel("bert", model_path)
prediction = model.predict(texts)

for text, pred in zip(texts, prediction[0]):
    print(text)
    print(pred)
    print()
