import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import "Icon.js" as MdiFont

SettingsPage {
    id: mainSettings

    Pane {
        padding: 5
        anchors.fill: parent
        Material.theme: Material.Dark
        Material.accent: Material.Blue
        Material.primary: Material.Blue

        ColumnLayout {
            id: column
            anchors.fill: parent

            GroupBox {
                id: boxData
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                title: "Data Source"

                GridLayout {
                    id: gridLayout
                    anchors.fill: parent
                }
            }

            GroupBox {
                id: boxTracking
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                title: "Tracking Server"

                GridLayout {
                    id: gridTracking
                    anchors.fill: parent
                    rows: 3
                    columns: 2

                    Label {
                        text: qsTr("IP")
                        Layout.fillWidth: false
                    }

                    TextField {
                        id: ipAddress
                        text: qsTr("192.167.123.123")
                        Layout.fillWidth: true
                        inputMask: "000.000.000.000;_"
                        maximumLength: 15
                        font.pixelSize: 12
                    }

                    Label {
                        text: qsTr("Port")
                    }

                    TextField {
                        id: portAddress
                        text: qsTr("50001")
                        Layout.fillWidth: true
                        inputMask: "00000"
                        validator: IntValidator {
                            bottom: 1
                            top: 65000
                        }
                        font.pixelSize: 12
                    }

                    Button {
                        id: btnNetworkConnect
                        width: 50
                        height: 40
                        font.family: "Material Design Icon"
                        font.pointSize: 17
                        text: MdiFont.Icon.linkVariant // linkVariantOff
                        spacing: 0
                        rightPadding: 0
                        leftPadding: 0
                        padding: 3
                    }

                    RowLayout {
                        Label {
                            id: networkStatusIcon
                            font.family: "Material Design Icon"
                            text: MdiFont.Icon.information
                            Material.foreground: Material.Grey
                        }
                        Label {
                            id: networkStatusMessage
                            text: qsTr("Not connected.")
                            Layout.fillWidth: true
                            Material.foreground: Material.Grey
                        }
                    }
                }
            }

            GroupBox {
                id: statusBoard
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                title: "Status Board"
            }
        }
    }
}
