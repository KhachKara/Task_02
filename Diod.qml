import QtQuick 2.12


Item {
    id: root
    property var colorDiod: "red"  // цвет диода
    property string colorBorder  // цвет контура диода
    property int sizeDiod: 8  // размер диода

    Rectangle {
        anchors.fill: parent
        width: sizeDiod
        height: width
        radius: width * 0.5
        color: "#21262B"
        Rectangle{
            anchors.centerIn: parent
            color: colorDiod
            width: parent.width * 0.75
            height: width
            radius: width * 0.5
        }
    }
}
