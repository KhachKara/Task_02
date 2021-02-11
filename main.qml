import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtQuick 2.12
import QtQuick.XmlListModel 2.12


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Task 02")
    property int cases: 8


    Image {
        id: checked
        source: "checkbox.svg"
        visible: true

    }


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
                    CheckBox {
                        id: chb2
                        text: "Checkbox " + (index + 1) + checked
                        checkState: allChildrenChecked ? Qt.Checked :
                                                         anyChildChecked ? Qt.PartiallyChecked : Qt.Unchecked

                        nextCheckState: function() {
                            if (checkState === Qt.Checked){
                                return Qt.Unchecked}
                            else{
                                return Qt.Checked}
                        }

                        function stateChanged(ind, id){
                            if (checkState === 0){
                                id.itemAt(index).text = "Checkbox №: " + (index + 1) + " - Checked"
                            }else{
                                id.itemAt(index).text = "Checkbox №: " + (index + 1) + " - Unchecked"
                            }
                        }

                        onPressed: {
                            stateChanged(index, rep1)
                        }

                    }
                }
            }
        }
    }
}

