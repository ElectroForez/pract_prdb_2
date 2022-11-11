from PyQt5.QtCore import QObject, pyqtSlot


class GoodsController(QObject):
    def __init__(self, view, model):
        super().__init__()

        self._model = model
        self._view = view

    @pyqtSlot(str)
    def filter_by_login(self, value):
        self._model.history = self._model.get_history_by_login(value)

    @pyqtSlot(str)
    def sort_type_change(self, value):
        if value == "По возрастанию":
            print("asc")
            self._model.sort_type = "ASC"
        else:
            self._model.sort_type = "DESC"

    @pyqtSlot(str)
    def sort_field_change(self, value):
        if value == "Имя":
            self._model.sort_field = "m.Title"
        if value == "Цена":
            self._model.sort_field = "m.Cost"

    @pyqtSlot(str)
    def good_type_change(self, value):
        if value == "Все типы":
            self._model.goods_type = ""
        else:
            self._model.goods_type = value

    @pyqtSlot()
    def next_click(self):
        if self._model.offset + self._model.limit > len(self._model.get_all_goods()):
            return
        else:
            self._model.offset += self._model.limit

    @pyqtSlot()
    def prev_click(self):
        if self._model.offset - self._model.limit < 0:
            self._model.offset = 0
        else:
            self._model.offset -= self._model.limit

    @pyqtSlot(str)
    def good_name_change(self, value):
        self._model.filter_good_name = value