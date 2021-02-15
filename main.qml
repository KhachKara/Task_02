import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtQuick 2.12
///

Window {  // создаем основное окно
    id: root  // идент корневого объекта
    width: 640  // длина окна
    height: 480  // ширина окна
    visible: true  // задает видимость окна
    title: qsTr("Task 02")  // заголовок окна или приложения
    property int cases: 8  // количество повторений

    // функция считывает нажат ли чекбокс или ннет
    // и красит диод и контур диода соответствующим цветом

    function stateChanged2(ind, isChecked){
        if (isChecked){
            rep1.itemAt(ind).text = "Checkbox №: " + (ind + 1) + " - Unchecked"
            rep2.itemAt(ind).diod.colorDiod = "red"
            rep2.itemAt(ind).diod.colorBorder = "#21262B"
        }else{
            rep1.itemAt(ind).text = "Checkbox №: " + (ind + 1) + " - Checked"
            rep2.itemAt(ind).diod.colorDiod = "lightgreen"
            rep2.itemAt(ind).diod.colorBorder = "blue"
        }
    }

    // главная строка где расположены контейнеры с текстом
    // в левой части rect1 и с чекбоксами в правой части rect2

    Row{
        spacing: 20  // расстояние между объектами в строке, между rect1 и rect2 20 pix
        anchors.centerIn: parent  // выравнивание строки по чентру с родительским окном
        RectContainer{  // шаблон контейнера для размещение текстовой информации чекбоксов
            id: rect1   // идент. контейнера
            anchors.horizontalCenter: root.horizontalCenter  // выровнивает rect1 с root горизонтально по центру
            Column{  // единственный столбец в rect1 для выведения инфо. чекбоксов
                id: col1  // идент. столбца в rect1
                spacing: 26  // расстояние между строками в столбце
                padding: 10  // отступ по всем сторонам
                Repeater {  // генератор объектов вложенных внутрь
                    id: rep1  // идент. генератора в rect1
                    model: cases  // переменная задает количество повторений в генераторе rep1
                    Text {  // текстовый объект
                        id: txt1  // идент. текстовый объекта в rect1
                        color: "green"  // цвет текста
                        font.pixelSize: 18  // размер шрифта
                        text: "Checkbox №: " +              //  значение параметра text
                              (index + 1) + " - Unchecked"  // index - индекс итерации генератора
                    }
                }
            }
        }

        RectContainer{  // шаблон контейнера для размещение текстовой информации чекбоксов
            id: rect2  // идент. контейнера
            anchors.horizontalCenter: root.horizontalCenter  // выравнивание строки по чентру с родительским окном
            border.color: "cyan"  // цвет контура rect2
            Column{  // единственный столбец в rect2 для чекбоксов
                id: col2  // идент. столбца в rect2
                spacing: 5  // расстояние между строками в столбце
                padding: 10  // отступ по всем сторонам
                Repeater {  // генератор объектов вложенных внутрь
                    id: rep2  // идент. столбца в rect2
                    model: cases  // переменная задает количество повторений в генераторе rep2
                    Row{  // вспомогательная строка для расположения чекбокса и информационного текста рядом на одной строке

                        // в проект добовляется пльзовательский объект diod с идентификатором _diod который наследует свойства
                        // от объекта Item внешнего файла Diod.qml
                        property alias diod: _diod
                        spacing: 20  // расстояние между объектами в строке
                        Item {    // контейнер в котором расположен чекбокс
                            height: 30   // высота клньейнера
                            width: 70  // ширина контейнера
                            CheckBox {    // объект чекбокс прототип
                                id: chb2  // идент. прототипа
                                text: "Checkbox " + (index + 1) + checked  // информация о чекбоксе с меняющейся нумерацией (index + 1)
                                onPressed: {  // при нажатии на чекбокс вызывается функция stateChanged2
                                    stateChanged2(index, checkState === Qt.Checked)  // stateChanged2 принимает два парметра нндекс генератора и
                                                                                     // булевое значение сравнения параметра checkState с
                                                                                     // состоянием чекбокса на момент нажатия
                                                                                     // Qt.Checked метод класса QCheckBox который возвращает true false
                                }
                            }

                            Diod{  // в проект объявляется или всталяеться модуль или объект Diod
                                id: _diod  // идент. объекта
                                width: sizeDiod  // задается диаметр диода
                                height: width  // ширина и высота ровны
                                anchors.left: chb2.right // левая сторна диода позиционирована с правой стороной чекбокса
                                anchors.verticalCenter: chb2.verticalCenter   // вырввниване по горизонтали
                            }
                        }
                    }
                }
            }
        }
    }
}

