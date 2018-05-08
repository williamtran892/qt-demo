import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.3
import QtCanvas3D 1.1
import QtQuick.Layouts 1.3
import Qt3D.Core 2.9
import "glcode.js" as GLCode

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
                onClicked: Qt.quit()
            }

            Button {
                id: loadfileId
                width: 120
                height: 30
                text: qsTr("Open file")
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: exitButtonId.left
                anchors.rightMargin: 10

            }

            TextField {
                id: textFieldId
                width: 300
                height: 30
                text: qsTr("")
                placeholderText: "Paste file location"
                anchors.rightMargin: 10
                selectionColor: "#bf2e8f"
                font.capitalization: Font.AllLowercase
                font.family: "Verdana"
                font.pixelSize: 12
                anchors.right: loadfileId.left
                anchors.verticalCenter: parent.verticalCenter
                color: "#000000"
                padding: 5
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
            anchors.right: controlsId.left
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: titleId.bottom
            anchors.topMargin: -520
            height: parent.height
            color: "#d96262"

            Canvas3D {
                id: canvas3d
                anchors.fill: parent
                Layout.fillHeight: true
                Layout.fillWidth: true
                //! [1]
                property double xRot: 0.0
                property double yRot: 45.0
                property double distance: 2.0
                //! [1]
                property double itemSize: 1.0
                property double lightX: 0.0
                property double lightY: 45.0
                property double lightDistance: 2.0
                property bool animatingLight: false
                property bool animatingCamera: false
                property bool drawWireframe: false

                onInitializeGL: {
                    GLCode.initializeGL(canvas3d, eventSource);
                }

                onPaintGL: {
                    GLCode.paintGL(canvas3d);
                }

                onResizeGL: {
                    GLCode.resizeGL(canvas3d);
                }

                ControlEventSource {
                    anchors.fill: parent
                    focus: true
                    id: eventSource
                }
                //! [0]
//                MouseArea {
//                    anchors.fill: parent
//                    //! [0]
//                    //! [2]
//                    onMouseXChanged: {
//                        // Do not rotate if we don't have previous value
//                        if (previousY !== 0)
//                            canvas3d.yRot += mouseY - previousY
//                        previousY = mouseY
//                        // Limit the rotation to -90...90 degrees
//                        if (canvas3d.yRot > 90)
//                            canvas3d.yRot = 90
//                        if (canvas3d.yRot < -90)
//                            canvas3d.yRot = -90
//                    }
//                    onMouseYChanged: {
//                        // Do not rotate if we don't have previous value
//                        if (previousX !== 0)
//                            canvas3d.xRot += mouseX - previousX
//                        previousX = mouseX
//                        // Wrap the rotation around
//                        if (canvas3d.xRot > 180)
//                            canvas3d.xRot -= 360
//                        if (canvas3d.xRot < -180)
//                            canvas3d.xRot += 360
//                    }
//                    onReleased: {
//                        // Reset previous mouse positions to avoid rotation jumping
//                        previousX = 0
//                        previousY = 0
//                    }
//                    //! [2]
//                    //! [4]
//                    onWheel: {
//                        canvas3d.distance -= wheel.angleDelta.y / 1000.0
//                        // Limit the distance to 0.5...10
//                        if (canvas3d.distance < 0.5)
//                            canvas3d.distance = 0.5
//                        if (canvas3d.distance > 10)
//                            canvas3d.distance = 10
//                    }
//                    //! [4]
//                }
            }
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

//    Connections {
//        target: textFieldId
//        onClicked: print("clicked")
//    }


}

