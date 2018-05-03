import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.3
import QtCanvas3D 1.1

Window {
    id: window
    visible: true
    width: 1280
    height: 720
    color: "#3b3b3b"
    title: qsTr("Hello World")

    Column {
        id: columnId
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        anchors.fill: parent

        Rectangle {
            id: rectangleID
            width: columnId
            height: 200
            color: "#696969"
            anchors.topMargin: 600
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.fill: parent

            GroupBox {
                id: groupBoxId
                anchors.fill: parent
                title: qsTr("Controls")

                Grid {
                    id: grid
                    anchors.fill: parent
                    rows: 3
                    columns: 3

                }
            }



        }
    }
}
