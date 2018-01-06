import QtQuick 2.10
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3
import "Icon.js" as MdiFont

MainBackground {
    id: statusbar
    property int parentWidth: 1920
    property int parentHeight: 1080
    width: parentWidth
    height: 0.05 * parentHeight
    padding: 0

    Item {
        id: item2
        anchors.fill: parent

        RowLayout {
            id: rowLayout
            visible: true
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 60

            RowLayout {
                id: rowVolumeCtrl
                width: 100
                height: 100

                Label {
                    id: labelVolume
                    text: qsTr("Volume")
                }

                Label {
                    id: labelVolumeDown
                    font.family: "Material Design Icon"
                    text: qsTr(MdiFont.Icon.volumeLow)
                    font.pointSize: 14
                }

                Slider {
                    id: sliderVolume
                    width: 300
                    stepSize: 1
                    to: 128
                    from: 0
                    value: 50
                }

                Label {
                    id: labelVolumeUp
                    font.family: "Material Design Icon"
                    text: qsTr(MdiFont.Icon.volumeHigh)
                    font.pointSize: 14
                }
            }

            RoundButton {
                id: playpause
                padding: 0

                anchors.verticalCenter: parent.verticalCenter
                font.family: "Material Design Icon"
                font.weight: Font.Light
                text: MdiFont.Icon.pauseCircleOutline
                Material.foreground: Material.Green
                highlighted: false
                spacing: 0
                font.pointSize: 27
                background: Rectangle {
                    opacity: 0
                }
            }

            //            Pane {
            //                id: btnPlayPause
            //                padding: 0
            //                Layout.minimumHeight: 40
            //                Layout.minimumWidth: 40

            //                Label {
            //                    id: labelPlayBtn
            //                    font.family: "Material Design Icon"
            //                    text: qsTr(MdiFont.Icon.pauseCircleOutline)
            //                    font.weight: Font.Light
            //                    font.pointSize: btnPlayPause.height * 0.7
            //                    verticalAlignment: Text.AlignVCenter
            //                    horizontalAlignment: Text.AlignHCenter
            //                    anchors.horizontalCenter: parent.horizontalCenter
            //                    anchors.verticalCenter: parent.verticalCenter
            //                    anchors.top: parent.top
            //                }

            //                MouseArea {
            //                    id: mouseArea
            //                    hoverEnabled: true
            //                    anchors.fill: parent
            //                }
            //            }
            RowLayout {
                id: rowPitchCtrl
                width: 100
                height: 100

                Label {
                    id: labelPitchDown
                    font.family: "Material Design Icon"
                    text: qsTr(MdiFont.Icon.download)
                    font.pointSize: 14
                }

                Slider {
                    id: sliderPitch
                    width: 300
                    stepSize: 1
                    to: 128
                    from: 0
                    value: 50
                }

                Label {
                    id: labelPitchUp
                    font.family: "Material Design Icon"
                    text: qsTr(MdiFont.Icon.upload)
                    font.pointSize: 14
                }

                Label {
                    id: labelPitch
                    text: qsTr(" Pitch")
                }
            }
        }
    }
}
