import json

class DataRecord:
    def __init__(self, filename):
        self.__filename = "controllers/data/" + filename
        self.__models = []
        self.read()

    def read(self):
        try:
            with open(self.__filename, "r", encoding="utf-8") as fjson:
                self.__models = json.load(fjson)
        except FileNotFoundError:
            print(f"O arquivo {self.__filename} não existe!")
            self.__models = []

    def __write(self, model):
        self.__models.append(model.to_dict())
        self.save()

    def save(self):
        with open(self.__filename, "w", encoding="utf-8") as fjson:
            json.dump(self.__models, fjson, indent=4, ensure_ascii=False)

    def add(self, model):
        self.__write(model)

    def clear(self):
        self.__models = []

    def get_all(self):
        return self.__models

    #todo: um update