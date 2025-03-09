import sys
from simpletransformers.classification import MultiLabelClassificationModel

model_path = "./app/python/models/ERC4AI-Multilabel/"
target_names = ['Transparency', 'Trust', 'Privacy', 'Responsibility', 'Others Principles', 'Non Ethical Principle']
texts = sys.argv[1:]

model = MultiLabelClassificationModel("bert", model_path, num_labels=len(target_names))
prediction = model.predict(texts)

for text, pred in zip(texts, prediction[0]):
    print(text)
    for i, label in enumerate(target_names):
        # print(f"{label}: {pred[i]}")
        if pred[i] == 1:
            print(label)
    print()
