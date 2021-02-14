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
    property int cases: 8
    property int radioButton: 20


    function stateChanged2(ind, isChecked){
        if (isChecked){
            rep1.itemAt(ind).text = "Checkbox №: " + (ind + 1) + " - Unchecked"
            rep2.itemAt(ind).diod.colorDiod = "red"
        }else{
            rep1.itemAt(ind).text = "Checkbox №: " + (ind + 1) + " - Checked"
            rep2.itemAt(ind).diod.colorDiod = "lightgreen"
        }
    }

    Row{
        spacing: 20
        anchors.centerIn: parent
        RectContainer{
            id: rect1
            anchors.horizontalCenter: root.horizontalCenter
            Column{
                id: col1
                spacing: 26
                padding: 10
                Repeater {
                    id: rep1
                    model: cases
                    Text {
                        id: txt1
                        color: "green"
                        font.pixelSize: 18
                        text: "Checkbox №: " +
                              (index + 1) + " - Unchecked"
                        visible: true
                    }
                }
            }
        }

        RectContainer{
            id: rect2
            anchors.horizontalCenter: root.horizontalCenter
            border.color: "cyan"
            Column{
                id: col2
                spacing: 5
                padding: 10
                Repeater {
                    id: rep2
                    model: cases
                    Row{
                        property alias diod: _diod
                        spacing: 20
                        Item {
                            height: 30
                            width: 70
                            CheckBox {
                                id: chb2
                                text: "Checkbox " + (index + 1) + checked
                                onPressed: {
                                    stateChanged2(index, checkState === Qt.Checked)
                                }
                            }

                            Diod{
                                id: _diod
                                width: radioButton
                                height: width
                                anchors.left: chb2.right
                                anchors.verticalCenter: chb2.verticalCenter
                                visible: true
                            }
                        }
                    }
                }
            }
        }
    }
}

