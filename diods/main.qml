import QtQuick 2.12
import QtQuick.Window 2.12
//
Window {
    width: 789
    height: 547
    visible: true
    title: qsTr("qml diods")

    property int radioButton: 8

    Column{
        anchors.centerIn: parent
        spacing: 20

        // Diods

        // red diod
        Rectangle {
            id: gir  // GRAD/indicator_red
            width: radioButton
            height: width
            radius: width * 0.5
            color: "#21262B"
            Rectangle{
                anchors.centerIn: parent
                color: "#FF0000"
                width: parent.width * 0.8
                height: width
                radius: width * 0.5

            }

        }


        // yellow diod
        Rectangle {
            id: giy  // GRAD/indicator_yellow
            width: radioButton
            height: width
            radius: width * 0.5
            color: "#FFB800"
            Rectangle{
                anchors.centerIn: parent
                color: "#FF0000"
                width: parent.width * 0.75
                height: width
                radius: width * 0.5

            }

        }


        // green diod
        Rectangle {
            id: gig  // GRAD/indicator_green
            width: radioButton
            height: width
            radius: width * 0.5
            color: "#FFB800"
            Rectangle{
                anchors.centerIn: parent
                color: "#70FF00"
                width: parent.width * 0.8
                height: width
                radius: width * 0.5
            }
        }

        Rectangle {
            id: swi_4D5AB2  // Подключить #4D5AB2
            width: 117
            height: 27
            radius: width * 0.5
            color: "#4D5AB2"
            Text {
                id: swi_Txt_4D5AB2
                text: qsTr("Подключить")
                color: "#FFFFFF"
                font.family: "Roboto"
                font.pixelSize: 13
                font.styleName: "normal"
                lineHeight: 15
                anchors.centerIn: parent
            }
        }

        Rectangle {
            id: swi_DCAA29  // Подключить #DCAA29
            width: 117
            height: 27
            radius: width * 0.5
            color: "#DCAA29"
            Text {
                id: swi_Txt_DCAA29
                text: qsTr("Подключить")
                color: "#FFFFFF"
                font.family: "Roboto"
                font.pixelSize: 13
                font.styleName: "normal"
                lineHeight: 15
                anchors.centerIn: parent
            }
        }
    }
}
