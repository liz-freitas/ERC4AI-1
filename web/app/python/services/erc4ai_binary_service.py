from simpletransformers.classification import ClassificationModel

model_path = "./app/python/models/ERC4AI-Binary/"

def predict(texts):
    model = ClassificationModel("bert", model_path)
    prediction = model.predict(texts)

    return prediction

# from simpletransformers.classification import ClassificationModel
# model = ClassificationModel("bert", "./app/python/models/ERC4AI-Binary/")
# model.predict(["O sistema não deve ser transparente"])