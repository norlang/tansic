import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import "Icon.js" as MdiFont

MainBackground {
    id: navImage
    property int parentHeight: 1080
    property int parentWidth: 1920
    property int sideBarWidth: 60
    width: 0.7 * parentWidth
    height: 0.95 * parentHeight
    padding: 0
    Material.theme: Material.Dark
    Material.accent: Material.Blue

    GroupBox {
        id: navImage3D
        padding: 0
        anchors.bottom: navImageOrtho.top
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        height: 0.66 * parent.height

        ColumnLayout {
            id: navImage3DBtnContainer
            width: navImage.sideBarWidth
            anchors.right: navImage3DViewerContainer.left
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.top: parent.top

            ColumnLayout {
                spacing: 0
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop

                Button {
                    id: btnVisualRotate3D1
                    font.family: "Material Design Icon"
                    text: MdiFont.Icon.rotate3d
                    padding: 12
                    font.pointSize: 15
                    Layout.fillWidth: true
                    Material.foreground: hovered ? Material.Blue : Material.Grey
                }

                Button {
                    id: btnVisualZoomIn3D1
                    font.family: "Material Design Icon"
                    text: MdiFont.Icon.magnifyPlus
                    font.pointSize: 15
                    Layout.fillWidth: true
                    Material.foreground: hovered ? Material.Blue : Material.Grey
                }

                Button {
                    id: btnVisualZoomOut3D1
                    font.family: "Material Design Icon"
                    text: MdiFont.Icon.magnifyMinus
                    font.pointSize: 15
                    Layout.fillWidth: true
                    Material.foreground: hovered ? Material.Blue : Material.Grey
                }
            }
        }

        Rectangle {
            id: navImage3DViewerContainer
            anchors.left: navImage3DBtnContainer.right
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.top: parent.top
        }
    }

    GroupBox {
        id: navImageOrtho
        padding: 0
        anchors.top: navImage3D.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.topMargin: 0

        GroupBox {
            id: navImageOrthoBtnContainer
            width: navImage.sideBarWidth
            padding: 0
            anchors.right: navImageOrthoViewerContainer.left
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.rightMargin: 0
        }

        Rectangle {
            id: navImageOrthoViewerContainer
            anchors.left: navImageOrthoBtnContainer.right
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.top: parent.top
            anchors.leftMargin: 0
        }
    }
}
