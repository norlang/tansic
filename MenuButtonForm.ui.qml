import QtQuick 2.4
import QtQuick.Controls.Material 2.2

Rectangle {
    id: menuButton
    width: 80
    height: 80
    Material.theme: Material.Dark
    Material.foreground: Material.Grey
    property string label: "button"
    property url icon: "qrc:/qtquickplugin/images/template_image.png"

    states: [
        State {
            name: "Hovering"
            PropertyChanges {
                target: button
                Material.foreground: Material.LightBlue
            }
        },
        State {
            name: "Pressed"
            PropertyChanges {
                target: button
                Material.foreground: Material.Blue
            }
        }
    ]

    Image {
        id: buttonImage
        width: 30
        height: 30
        anchors.top: parent.top
        anchors.topMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
        source: icon
    }

    Text {
        id: buttonText
        text: qsTr(label)
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 12
    }

    MouseArea {
        anchors.fill: menuButton
        hoverEnabled: true
        onEntered: button.state = 'Hovering'
        onExited: button.state = ''
        onPressed: button.state = "Pressed"
    }
}
