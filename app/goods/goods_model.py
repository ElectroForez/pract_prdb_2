from PyQt5.QtCore import pyqtSignal, QObject

from common.Db import db


class GoodsModel(QObject):

    goods_changed = pyqtSignal()

    def __init__(self):
        super().__init__()
        self.db = db
        self._filter_good_name = ""
        self._sort_field = "m.ID"
        self._sort_type = "ASC"
        self._goods_type = ""
        self._limit = 6
        self._offset = 0
        self._goods = self.get_goods()

    @property
    def goods(self):
        return self._goods

    @goods.setter
    def goods(self, value):
        self._goods = value
        self.goods_changed.emit()

    @property
    def filter_good_name(self):
        return self._filter_good_name

    @filter_good_name.setter
    def filter_good_name(self, value):
        self._filter_good_name = value
        self.goods = self.get_goods()

    @property
    def sort_field(self):
        return self._sort_field

    @sort_field.setter
    def sort_field(self, value):
        self._sort_field = value
        self.goods = self.get_goods()

    @property
    def sort_type(self):
        return self._sort_type

    @sort_type.setter
    def sort_type(self, value):
        self._sort_type = value
        self.goods = self.get_goods()

    @property
    def goods_type(self):
        return self._goods_type

    @goods_type.setter
    def goods_type(self, value):
        self._goods_type = value
        self.goods = self.get_goods()

    @property
    def offset(self):
        return self._offset

    @property
    def limit(self):
        return self._limit

    @offset.setter
    def offset(self, value):
        self._offset = value
        self.goods = self.get_goods()

    def get_all_goods(self):
        self.db.cursor.execute("select m.Title, m.MinCount, m.CountInStock, m.Image from Material m "
                               "INNER JOIN MaterialType mt ON mt.ID = m.MaterialTypeID")

        result = self.db.cursor.fetchall()
        return result

    def get_goods(self):
        self.db.cursor.execute("select "
                               "m.Title, "
                               "m.MinCount, "
                               "m.CountInStock, "
                               "m.Image, "
                               "m.Cost "
                               "from Material m "
                               "INNER JOIN MaterialType mt ON mt.ID = m.MaterialTypeID "
                               f"WHERE "
                               f"m.Title LIKE '%{self._filter_good_name}%' "
                               f"AND "
                               f"mt.Title LIKE '%{self._goods_type}%'"
                               f"ORDER BY {self._sort_field} {self._sort_type} "
                               f"LIMIT {self._limit} "
                               f"OFFSET {self._offset}")

        result = self.db.cursor.fetchall()
        return result