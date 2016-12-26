
import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import Qt3D.Core 2.0

ApplicationWindow {
    id: appWindow
    objectName: "Application Window"
    modality: Qt.ApplicationModal
    title: "Basic layouts"
    minimumWidth: 640
    minimumHeight: 480
    x: (Screen.desktopAvailableWidth - width) / 2
    y: (Screen.desktopAvailableHeight - height) / 2
    visible: true

    RowLayout {
        objectName: "RowLayout"
        id: layout
        spacing: 0
        anchors.fill: parent

        Rectangle {
            objectName: "RectLeft"
            color: 'teal'
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumWidth: 50
            Layout.preferredWidth: 100
            Layout.maximumWidth: 150
            Layout.minimumHeight: 150

            Text {
                anchors.centerIn: parent
                text: parent.width + 'x' + parent.height
            }
        }

        Basic3DScene {
            objectName: "RectRight"
            Layout.fillWidth: true
            Layout.fillHeight: true

            WireframeMaterial {
                id: wireframeMaterial
                effect: WireframeEffect {}
                ambient: Qt.rgba( 0.2, 0.0, 0.0, 1.0 )
                diffuse: Qt.rgba( 0.8, 0.0, 0.0, 1.0 )

                SequentialAnimation {
                    loops: Animation.Infinite
                    running: true

                    NumberAnimation {
                       target: wireframeMaterial;
                       property: "lineWidth";
                       duration: 1000;
                       from: 0.8
                       to: 1.8
                    }

                    NumberAnimation {
                        target: wireframeMaterial;
                        property: "lineWidth";
                        duration: 1000;
                        from: 1.8
                        to: 0.8
                    }

                    PauseAnimation { duration: 1500 }
                }
            }

            TrefoilKnot {
                id: trefoilKnot
                material: wireframeMaterial
            }

            Text {
                anchors.centerIn: parent
                text: parent.width + 'x' + parent.height
            }
        }
    }
}
