# This Python file uses the following encoding: utf-8

import sys
from pathlib import Path

from PySide6.QtGui import QGuiApplication, QSurfaceFormat
from PySide6.QtQml import QQmlApplicationEngine
from Classes.database_manager import DatabaseManager



if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    database_m = DatabaseManager()
    engine.rootContext().setContextProperty("database_manager", database_m)


    # Setting sample value
    format = QSurfaceFormat()
    format.setSamples(8)
    QSurfaceFormat.setDefaultFormat(format)


    qml_file = Path(__file__).resolve().parent / "main.qml"
    engine.load(qml_file)
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
