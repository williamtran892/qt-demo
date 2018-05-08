import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.3
import QtCanvas3D 1.1
import QtQuick.Layouts 1.3

Window {
    id: window
    visible: true
    width: 1280
    height: 720
    color: "#3b3b3b"
    title: qsTr("3D Box Viewer")


//    value panel to be added later
    //    Rectangle {
//        id: valuePanel
//        width: 150
//        height: 100
//        anchors.left: parent.left
//        anchors.top: parent.top
//        opacity: 0.3
//        border.color: "black"
//        border.width: 2
//        radius: 5
//        z: 1
//    }


    RowLayout {
        id: topBarId
        implicitWidth: parent.width
        height: 50
        visible: true

        Rectangle {
            id: rectangleId
            color: "#424242"
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            anchors.fill: parent

            Text {
                id: titleId
                color: "#ffffff"
                text: qsTr("3D Box Viewer")
                font.family: "Verdana"
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 18
            }
            Button {
                id: exitButtonId
                width: 30
                height: 30
                text: qsTr("X")
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 20
            }
        }

    }

    Row {
        id: middleId
        anchors.bottom: listcontainerId.top
        anchors.top: topBarId.bottom
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.right: parent.right
        spacing: 10

        Rectangle {
            id: viewId
            color: "#323232"
            anchors.right: parent.right
            anchors.rightMargin: 1280
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: titleId.bottom
            anchors.topMargin: -520
            height: parent.height

        }

        Rectangle {
            id: controlsId
            width: parent.width/5
            height: parent.height
            color: "#223b4f"
            anchors.right: parent.right
            anchors.rightMargin: 0

        }



    }

    Rectangle {
        id: listcontainerId
        width: parent.width
        height: 150
        color: "#424242"
        border.width: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
    }
}

