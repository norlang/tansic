import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import "Icon.js" as MdiFont

Item {
    id: button
    width: 80
    height: 80
    property string label: "button"
    property string icon: MdiFont.Icon.cloud
    property int fontSize: 10
    property bool isAppExit: false
    onEnabledChanged: state = ""
    signal clicked


    // states of the button
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
        },
        State {
            name: "Selected"
            PropertyChanges {
                target: btnContainer
                Material.foreground: Material.Blue
                Material.background: "#111111"
            }
            PropertyChanges {
                target: btnImage
                Material.foreground: Material.Blue
            }
            PropertyChanges {
                target: btnText
                Material.foreground: Material.Blue
            }
        }

    ]

    //Rectangle to draw the button
    Pane {
        id: btnContainer
        anchors.fill: parent
        Material.theme: Material.Dark
        Material.foreground: Material.Grey
        //Material.background: "#111"

        ColumnLayout {
            anchors.fill: parent

            Label {
                id: btnImage
                text: qsTr(icon)
                //anchors.top: parent.top
                //anchors.topMargin: 15
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Material Design Icon"
                font.pixelSize: 30
                Material.foreground: Material.Grey
            }

            Label {
                id: btnText
                text: qsTr(label)
                //anchors.bottom: parent.bottom
                //anchors.bottomMargin: 15
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 12
                Material.foreground: Material.Grey
            }

        }

    }

    // transitions for the states
    transitions: [
        Transition {
            from: ""; to: "Hovering"
            ColorAnimation { duration: 50 }
        },
        Transition {
            from: "*"; to: "Pressed"
            ColorAnimation { duration: 10 }
        },
        Transition {
            from: "Pressed"; to: "Selected"
            ColorAnimation { duration: 5 }
        }
    ]

    // Mouse Area to react on click and hover events
    MouseArea {
        anchors.fill: button
        hoverEnabled: true
        onEntered: {
            if (button.state != "Selected")
                button.state='Hovering';}
        onExited: {
            if (button.state != "Selected")
                button.state='';}
        onClicked: {
            if (button.isAppExit)
                Qt.quit();
            else if (button.state != "Selected")
                button.state="Selected";
                button.clicked();}
        onPressed: {
            if (button.state != "Selected")
                button.state="Pressed";}
//        onReleased: {
//            if (containsMouse)
//              button.state="Hovering";
//            else
//              button.state="";
//        }

    }
}

