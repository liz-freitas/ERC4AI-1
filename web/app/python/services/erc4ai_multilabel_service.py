from simpletransformers.classification import MultiLabelClassificationModel

model_path = "./app/python/models/ERC4AI-Multilabel/"
target_names = ['Transparency', 'Trust', 'Privacy', 'Responsibility', 'Others Principles', 'Non Ethical Principle']

def predict(texts):
    model = MultiLabelClassificationModel("bert", model_path, num_labels=len(target_names))
    prediction = model.predict(texts)

    return prediction
