import Qt3D.Core 2.0
import Qt3D.Extras 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0

import QtDataVisualization 1.2

Rectangle {
    id: scene3DRoot
    anchors.fill: parent
    anchors.margins: 0
    color: "darkRed"

    property alias camera: sceneRoot.camera
    property alias entity: sceneRoot.entity

    // transform: Rotation {
    //     id: sceneRotation
    //     axis.x: 1
    //     axis.y: 0
    //     axis.z: 0
    //     origin.x: scene.width / 2
    //     origin.y: scene.height / 2
    // }

    Scene3D {
        id: scene3D
        anchors.fill: parent
        anchors.margins: 10
        focus: true
        aspects: ["input", "logic"]
        cameraAspectRatioMode: Scene3D.AutomaticAspectRatio

        Entity {
            id: sceneRoot

            property Entity entity
            property alias camera: sceneRootCamera
            property alias renderSettings: sceneRootRenderSettings
            property alias inputSettings: sceneRootInputSettings

            components: [
                sceneRoot.renderSettings,
                sceneRoot.inputSettings,
                sceneRoot.entity
            ]

            RenderSettings {
                id: sceneRootRenderSettings
                activeFrameGraph: ForwardRenderer {
                    camera: sceneRoot.camera
                    clearColor: "transparent"
                }
            }

            InputSettings {
                id: sceneRootRenderSettings
            }

            Camera {
                id: sceneRootCamera
                projectionType: CameraLens.PerspectiveProjection
                fieldOfView: 22.5
                aspectRatio: scene3D.width / scene3D.height
                nearPlane:   0.01
                farPlane:    1000.0
                viewCenter: Qt.vector3d( 0.0, 0.0, 0.0 )
                upVector:   Qt.vector3d( 0.0, 1.0, 0.0 )
            }

            FirstPersonCameraController{ camera: sceneRoot.camera }
        }
    }
}
