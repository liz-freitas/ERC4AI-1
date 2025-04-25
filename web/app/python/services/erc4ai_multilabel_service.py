import sys
from simpletransformers.classification import MultiLabelClassificationModel
from text_preprocess import preprocess_text

model_path = "./app/python/models/ERC4AI-Multilabel/"
target_names = ["Transparency", "Trust", "Privacy", "Other Principle", "Non-Ethical Principle" ]
texts = sys.argv[1:]
preprocessed_texts = [preprocess_text(text) for text in texts]

model = MultiLabelClassificationModel("bert", model_path, num_labels=len(target_names))
prediction = model.predict(preprocessed_texts)

for text, pred in zip(preprocessed_texts, prediction[0]):
    print(text)
    for i, label in enumerate(target_names):
        # print(f"{label}: {pred[i]}")
        if pred[i] == 1:
            print(label)
    print()
