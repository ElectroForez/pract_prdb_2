import sys

from PyQt5.QtWidgets import QApplication
# from goods.good_contrl import GoodsController
from goods.goods_view import GoodsView
from goods.goods_model import GoodsModel


class App(QApplication):
    def __init__(self, sys_argv):
        super(App, self).__init__(sys_argv)

        self.model = GoodsModel()
        self.view = GoodsView(self.model)
        self.view.show()


if __name__ == '__main__':
    app = App(sys.argv)
    sys.exit(app.exec_())
