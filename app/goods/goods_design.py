# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'goods/design.ui'
#
# Created by: PyQt5 UI code generator 5.15.6
#
# WARNING: Any manual changes made to this file will be lost when pyuic5 is
# run again.  Do not edit this file unless you know what you are doing.


from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(712, 624)
        MainWindow.setMinimumSize(QtCore.QSize(712, 624))
        MainWindow.setMaximumSize(QtCore.QSize(712, 624))
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.layoutWidget = QtWidgets.QWidget(self.centralwidget)
        self.layoutWidget.setGeometry(QtCore.QRect(10, 60, 691, 51))
        self.layoutWidget.setObjectName("layoutWidget")
        self.horizontalLayout = QtWidgets.QHBoxLayout(self.layoutWidget)
        self.horizontalLayout.setContentsMargins(0, 0, 0, 0)
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.goods_name_edit = QtWidgets.QLineEdit(self.layoutWidget)
        self.goods_name_edit.setObjectName("goods_name_edit")
        self.horizontalLayout.addWidget(self.goods_name_edit)
        self.sort_type_box = QtWidgets.QComboBox(self.layoutWidget)
        self.sort_type_box.setSizeAdjustPolicy(QtWidgets.QComboBox.AdjustToContentsOnFirstShow)
        self.sort_type_box.setObjectName("sort_type_box")
        self.sort_type_box.addItem("")
        self.sort_type_box.setItemText(0, "")
        self.sort_type_box.addItem("")
        self.sort_type_box.addItem("")
        self.horizontalLayout.addWidget(self.sort_type_box)
        self.field_box = QtWidgets.QComboBox(self.layoutWidget)
        self.field_box.setEditable(False)
        self.field_box.setCurrentText("")
        self.field_box.setMaxVisibleItems(10)
        self.field_box.setSizeAdjustPolicy(QtWidgets.QComboBox.AdjustToContents)
        self.field_box.setObjectName("field_box")
        self.field_box.addItem("")
        self.field_box.addItem("")
        self.horizontalLayout.addWidget(self.field_box)
        self.type_box = QtWidgets.QComboBox(self.layoutWidget)
        self.type_box.setSizeAdjustPolicy(QtWidgets.QComboBox.AdjustToContents)
        self.type_box.setObjectName("type_box")
        self.type_box.addItem("")
        self.type_box.addItem("")
        self.type_box.addItem("")
        self.type_box.addItem("")
        self.horizontalLayout.addWidget(self.type_box)
        self.gridLayoutWidget = QtWidgets.QWidget(self.centralwidget)
        self.gridLayoutWidget.setGeometry(QtCore.QRect(10, 140, 691, 431))
        self.gridLayoutWidget.setObjectName("gridLayoutWidget")
        self.goodsGrid = QtWidgets.QGridLayout(self.gridLayoutWidget)
        self.goodsGrid.setContentsMargins(0, 0, 0, 0)
        self.goodsGrid.setObjectName("goodsGrid")
        self.next_btn = QtWidgets.QPushButton(self.centralwidget)
        self.next_btn.setGeometry(QtCore.QRect(610, 110, 89, 25))
        self.next_btn.setObjectName("next_btn")
        self.prev_btn = QtWidgets.QPushButton(self.centralwidget)
        self.prev_btn.setGeometry(QtCore.QRect(10, 110, 89, 25))
        self.prev_btn.setObjectName("prev_btn")
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 712, 22))
        self.menubar.setObjectName("menubar")
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(MainWindow)
        self.statusbar.setObjectName("statusbar")
        MainWindow.setStatusBar(self.statusbar)

        self.retranslateUi(MainWindow)
        self.sort_type_box.setCurrentIndex(1)
        self.field_box.setCurrentIndex(-1)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "Товары"))
        self.sort_type_box.setItemText(1, _translate("MainWindow", "По возрастанию"))
        self.sort_type_box.setItemText(2, _translate("MainWindow", "По убыванию"))
        self.field_box.setPlaceholderText(_translate("MainWindow", "выфвфывфы"))
        self.field_box.setItemText(0, _translate("MainWindow", "Имя"))
        self.field_box.setItemText(1, _translate("MainWindow", "Цена"))
        self.type_box.setItemText(0, _translate("MainWindow", "Все типы"))
        self.type_box.setItemText(1, _translate("MainWindow", "Гранулы"))
        self.type_box.setItemText(2, _translate("MainWindow", "Краски"))
        self.type_box.setItemText(3, _translate("MainWindow", "Нитки"))
        self.next_btn.setText(_translate("MainWindow", ">"))
        self.prev_btn.setText(_translate("MainWindow", "<"))