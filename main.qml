import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3
import "Icon.js" as MdiFont

ApplicationWindow {
    id: rootWindow
    visible: true
    visibility: Window.FullScreen
    title: qsTr("TANSIC - Tool for Audio-assisted Navigation in Neurosurgery")
    Material.theme: Material.Dark
    Material.accent: Material.LightBlue

//    VisualNavigationContainer {
//        id: visualNavigationContainer
//        parentWidth: parent.width
//        parentHeight: parent.height
//        sideBarWidth: 60
//        padding: 0
//        anchors.top: parent.top
//        anchors.topMargin: 0
//        anchors.left: parent.left
//        anchors.leftMargin: 0
//    }
    GridLayout {
        id: visualNavigationContainer
        rows: 2
        columns: 2
        columnSpacing: 0
        rowSpacing: 0
        width: parent.width * 0.7
        height: 456
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        Material.theme: Material.Dark
        Material.accent: Material.LightBlue

        ColumnLayout{
            width: 60
            spacing: 0
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop

            Button {
                id: btnVisualRotate3D
                font.family: "Material Design Icon"
                text: MdiFont.Icon.rotate3d
                font.pointSize: 15
                Material.foreground: hovered ? Material.Blue : Material.Grey
            }

            Button {
                id: btnVisualZoomIn3D
                font.family: "Material Design Icon"
                text: MdiFont.Icon.magnifyPlus
                font.pointSize: 15
                Material.foreground: hovered ? Material.Blue : Material.Grey
            }

            Button {
                id: btnVisualZoomOut3D
                font.family: "Material Design Icon"
                text: MdiFont.Icon.magnifyMinus
                font.pointSize: 15
                Material.foreground: hovered ? Material.Blue : Material.Grey
            }
        }

        Pane {
            width: parent.width * 0.95
            height: parent.height * 0.66
            Layout.fillWidth: true
            Layout.fillHeight: true
            Frame {
                id: nav3DView
                anchors.fill: parent


            }
        }

        ColumnLayout{

        }

        Pane {
            id: orthoView
            Layout.fillWidth: true
            Layout.fillHeight: true
            RowLayout{
                anchors.fill: parent

                Frame{
                    id: orthoViewSag
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
                Frame{
                    id: orthoViewTrans
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                }
                Frame{
                    id: orthoViewCor
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }
        }
    }

    TansicStatusBar {
        id: statusBar
        parentWidth: parent.width
        parentHeight: parent.height
        padding: 0
        anchors.top: visualNavigationContainer.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.topMargin: 0

    }

    MainBackground {
        id: settingsContainer
        padding: 0
        anchors.bottom: statusBar.top
        anchors.bottomMargin: 0
        anchors.left: visualNavigationContainer.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: 0

        GroupBox {
            id: groupBox
            padding: 0
            spacing: 0
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            GroupBox {
                id: settingsBtnContainer
                width: 80
                padding: 0
                topPadding: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0

                ButtonGroup {
                    buttons: settingsColumn.children
                }

                Column {
                    id: settingsColumn
                    anchors.fill: parent

                    SettingsButton {
                        id: btnMainSettings
                        label: "Main"
                        icon: MdiFont.Icon.apps
                    }

                    SettingsButton {
                        id: btnVisualSettings
                        label: "Visual"
                        icon: MdiFont.Icon.desktopMac
                    }

                    SettingsButton {
                        id: btnAudioSettings
                        label: "Audio"
                        icon: MdiFont.Icon.voice
                    }

                    SettingsButton {
                        id: btnMiscSettings
                        label: "Misc"
                        icon: MdiFont.Icon.settings
                    }

                }

                SettingsButton {
                    id: btnExitApplication
                    anchors.bottom: parent.bottom
                    label: "Exit"
                    icon: MdiFont.Icon.exitToApp
                    isAppExit: true
                }


            }

            StackLayout {
                id: settingsViewContainer
                anchors.right: settingsBtnContainer.left
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.rightMargin: 0
                currentIndex: 0

                SettingsPageMain {
                    pageWidth: parent.width
                    pageHeight: parent.height

                }
            }

        }

    }
}
