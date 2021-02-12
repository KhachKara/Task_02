import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtQuick 2.12
//

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Task 02")
    property int cases: 8
    property int radioButton: 8


    Row{
        spacing: 20
        anchors.centerIn: parent
        Rectangle{
            id: rect1
            width: 300
            height: 400
            color: 'white'
            border.color: "black"
            border.width: 3
            Column{
                id: col1
                spacing: 26
                padding: 10
                Repeater {
                    id: rep1
                    model: cases
                    Text {
                        id: txt1
                        color: 'green'
                        font.pixelSize: 18
                        text: "Checkbox №: " +
                              (index + 1) + " - Unchecked"
                    }


                }
            }
        }

        Rectangle{
            id: rect2
            width: 300
            height: 400
            color: 'white'
            border.color: "lightblue"
            border.width: 3
            Column{
                id: col2
                spacing: 5
                padding: 10
                Repeater {
                    id: rep2
                    model: cases
                    Row{
                        spacing: 20
                        CheckBox {
                            id: chb2
                            text: "Checkbox " + (index + 1) + checked
                            nextCheckState: function() {
                                if (checkState === Qt.Checked){
                                    return Qt.Unchecked}
                                else{
                                    return Qt.Checked}
                            }

                            function stateChanged(ind, id){
                                if (checkState === 0){
                                    id.itemAt(index).text = "Checkbox №: " + (index + 1) + " - Checked"
                                    centercyrcle.color = "#70FF00"
                                }else{
                                    id.itemAt(index).text = "Checkbox №: " + (index + 1) + " - Unchecked"
                                    centercyrcle.color = "#FF0000"
                                }
                            }

                            onPressed: {
                                stateChanged(index, rep1)
                            }

                        }
                        Rectangle {
                            border.color: "black"
                            border.width: 1

//                            anchors.horizontalCenter: chb2

                            id: gir  // GRAD/indicator_red
                            width: radioButton
                            height: width
                            radius: width * 0.5
                            color: "#21262B"
                            Rectangle{
                                id: centercyrcle
                                anchors.centerIn: parent
                                color: "#FF0000"
                                width: parent.width * 0.8
                                height: width
                                radius: width * 0.5

                            }

                        }
                    }
                }
            }
        }
    }
}

