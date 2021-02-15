import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtQuick 2.12
///

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Task 02")
    property int cases: 8  // количество повторений

    // функция считывает нажат ли чекбокс или ннет
    // и красит диод и контур диода соответствующим цветом
    function stateChanged2(ind, isChecked) {
        rep1.itemAt(ind).text =  "Checkbox №: " + (ind + 1) + (isChecked ? " - Unchecked" : " - Checked")
        rep2.itemAt(ind).diod.colorDiod = isChecked ? "red" : "lightgreen"
        rep2.itemAt(ind).diod.colorBorder = isChecked ? "#21262B" : "blue"
    }

    // главная строка где расположены контейнеры с текстом
    // в левой части и с чекбоксами в правой части

    Row {
        spacing: 20
        anchors.centerIn: parent
        RectContainer {
            anchors.horizontalCenter: root.horizontalCenter
            Column {  // столбец для выведения инфо. чекбоксов
                spacing: 26
                padding: 10
                Repeater {
                    id: rep1
                    model: cases  // переменная задает количество повторений
                    Text {
                        color: "green"
                        font.pixelSize: 18
                        text: "Checkbox №: " + (index + 1) + " - Unchecked"
                    }
                }
            }
        }

        RectContainer {  // шаблон контейнера для размещение текстовой информации чекбоксов
            anchors.horizontalCenter: root.horizontalCenter
            border.color: "cyan"
            Column {  // столбец для чекбоксов
                spacing: 5
                padding: 10
                Repeater {
                    id: rep2
                    model: cases  // переменная задает количество повторений в генераторе rep2
                    Row {
                        // Добавляет к делегату rep2 возможность обратиться к свойствам диода
                        property alias diod: _diod
                        spacing: 20
                        Item {
                            height: 30
                            width: 70
                            CheckBox {
                                id: chb2
                                text: "Checkbox " + (index + 1) + checked
                                onPressed: stateChanged2(index, checked)
                            }

                            Diod {
                                id: _diod
                                anchors.left: chb2.right
                                anchors.verticalCenter: chb2.verticalCenter
                            }
                        }
                    }
                }
            }
        }
    }
}

