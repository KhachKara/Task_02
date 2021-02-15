import QtQuick 2.12


Item {
    id: root
    property var colorDiod: "red"  // цвет диода
    property var colorBorder: "#21262B"  // цвет контура диода
    property int sizeDiod: 8  // размер диода

    width: sizeDiod
    height: sizeDiod

    Rectangle {
        anchors.fill: parent
        width: sizeDiod
        height: width
        radius: width * 0.5
        color: colorBorder
        Rectangle{
            anchors.centerIn: parent
            color: colorDiod
            width: parent.width * 0.75
            height: width
            radius: width * 0.5
        }
    }
}
