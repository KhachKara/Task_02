import QtQuick 2.12


Item {
    id: root
    property var colorDiod: "red"
    Rectangle {
        anchors.fill: parent
        width: radioButton
        height: width
        radius: width * 0.5
        color: "#21262B"
        Rectangle{
            anchors.centerIn: parent
            color: colorDiod
            width: parent.width * 0.8
            height: width
            radius: width * 0.5
        }
    }
}
