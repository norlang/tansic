import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import "Icon.js" as MdiFont

Item {
    id: button
    property int size: 50
    width: size
    height: 1.62 * size // it's golden!
    property string icon: MdiFont.Icon.cloud
    onEnabledChanged: state = ""
    signal clicked

    // States of the button
    states: [
        State {
            name: "Hovering"
            PropertyChanges {
                target: btnContainer
                Material.background: "#444444"
            }
            PropertyChanges {
                target: btnImage
                Material.foreground: Material.Blue
            }

        },
        State {
            name: "Pressed"
            PropertyChanges {
                target: btnImage
                Material.foreground: Material.Blue
            }
            PropertyChanges {
                target: btnContainer
                Material.background: "#111111"
                Material.elevation: -2
            }
        }

    ]

    // Draw the button
    Pane {
        id: btnContainer
        padding: 0
        anchors.fill: parent
        Material.theme: Material.Dark
        Material.foreground: Material.Grey
        Material.elevation: 0

        Label {
            id: btnImage
            text: qsTr(icon)
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.family: "Material Design Icon"
            font.pixelSize: 0.6 * size
            Material.foreground: Material.Grey
        }

    }

    // Transitions between the states
    transitions: [
        Transition {
            from: ""; to: "Hovering"
            ColorAnimation { duration: 50 }
        },
        Transition {
            from: "*"; to: "Pressed"
            ColorAnimation { duration: 10 }
        }
    ]

    // Mouse Area to react on click and hover events
    MouseArea {
        anchors.fill: button
        hoverEnabled: true
        onEntered: {button.state='Hovering'}
        onExited: {button.state=''}
        onClicked: {button.clicked();}
        onPressed: {button.state="Pressed"}
        onReleased: {
            if (containsMouse)
              button.state="Hovering";
            else
              button.state="";
        }

    }
}
