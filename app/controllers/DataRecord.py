import json

class DataRecord:
    def __init__(self, filename):
        self.__filename = "app/controllers/data/" + filename
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

    def update_por_id(self, obj, key_field="id"):
        data = self.get_all()

        obj_key = getattr(obj, key_field)
        if isinstance(obj_key, str):
            obj_key = obj_key.strip().lower()

        updated = False
        for i, item in enumerate(data):
            item_key = item.get(key_field)
            if isinstance(item_key, str):
                item_key = item_key.strip().lower()

            if item_key == obj_key:
                item_to_save = obj.to_dict()

                # if "equipe" in item_to_save:
                #     equipe = item_to_save["equipe"]
                #     item_to_save["equipe"] = equipe.nome if equipe else None

                data[i] = item_to_save
                updated = True
                break

        if not updated:
            print("Não encontrado no sistema")

        with open(self.__filename, "w", encoding="utf-8") as fjson:
            json.dump(data, fjson, indent=4, ensure_ascii=False)

        self.__models = data