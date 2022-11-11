from PyQt5.QtCore import pyqtSlot, QTimer, Qt
from PyQt5.QtGui import QPixmap
from PyQt5.QtWidgets import QMainWindow, QLineEdit, QMessageBox, QHBoxLayout, QVBoxLayout, QLabel, QWidget
from goods.goods_design import Ui_MainWindow

from goods.good_contrl import GoodsController
from goods.goods_model import GoodsModel


class GoodsView(QMainWindow):

    def __init__(self, model: GoodsModel):
        super().__init__()

        self._model = model
        self._controller = GoodsController(self, self._model)
        self._ui = Ui_MainWindow()
        self.setAttribute(Qt.WA_DeleteOnClose)
        self._ui.setupUi(self)
        self.init_slots()
        self.init_data()

    def init_slots(self):
        self._model.goods_changed.connect(self.on_goods_change)
        self._ui.sort_type_box.currentTextChanged.connect(self._controller.sort_type_change)
        self._ui.field_box.currentTextChanged.connect(self._controller.sort_field_change)
        self._ui.type_box.currentTextChanged.connect(self._controller.good_type_change)
        self._ui.next_btn.clicked.connect(self._controller.next_click)
        self._ui.prev_btn.clicked.connect(self._controller.prev_click)
        self._ui.goods_name_edit.textChanged.connect(self._controller.good_name_change)


    def init_data(self):
        self.draw_goods()

    @pyqtSlot()
    def on_goods_change(self):
        print("draw goods")
        self.draw_goods()

    def draw_goods(self):
        for i in reversed(range(self._ui.goodsGrid.count())):
            self._ui.goodsGrid.itemAt(i).widget().setParent(None)

        goods = self._model.goods[:6]

        positions = [(i, j) for i in range(2) for j in range(3)]

        for position, good in zip(positions, goods):
            good_widget = self.get_good_widget(good)

            self._ui.goodsGrid.addWidget(good_widget, *position)

    def show_error(self, text):
        msg_box = QMessageBox()
        msg_box.setText(text)
        msg_box.setIcon(QMessageBox.Critical)
        msg_box.setWindowTitle("Ошибка авторизации")
        msg_box.exec()

    @pyqtSlot(int)
    def on_show_pass_changed(self, is_checked):
        mode = QLineEdit.Normal if is_checked else QLineEdit.Password
        self._ui.pass_edit.setEchoMode(mode)

    @pyqtSlot()
    def on_authorize_click(self):
        login = self._ui.login_edit.text()
        password = self._ui.pass_edit.text()
        self._controller.authorize(login, password)

    def get_good_widget(self, good_obj):
        good = {
            "name": good_obj[0],
            "min_count": good_obj[1],
            "stock_count": good_obj[2],
            "image_path": good_obj[3],
            "cost": good_obj[4]
        }

        for good_key in good.keys():
            good[good_key] = str(good[good_key])

        widget = QWidget()
        widget.setMaximumSize(250, 250)

        layout = QVBoxLayout()
        layout.addWidget(QLabel(good["name"]))

        photo_label = QLabel()
        if good["image_path"]:
            photo = QPixmap(good["image_path"])
            photo_label.setPixmap(photo)
        else:
            photo_label.setText("Нет фото")
        photo_label.setFixedSize(100, 100)
        photo_label.setAlignment(Qt.AlignCenter)
        photo_label.adjustSize()
        layout.addWidget(photo_label)

        layout.addWidget(self.get_property_layout("Мин. кол", good["min_count"]))
        layout.addWidget(self.get_property_layout("Стоимость", good["cost"]))
        widget.setLayout(layout)
        # widget.setStyleSheet("border: 1px solid black;")
        widget.setStyleSheet("background-color: white;")

        return widget

    def get_property_layout(self, name, value):
        widget = QWidget()
        layout = QHBoxLayout()
        layout.addWidget(QLabel(name))
        layout.addWidget(QLabel(value))
        widget.setLayout(layout)
        return widget
