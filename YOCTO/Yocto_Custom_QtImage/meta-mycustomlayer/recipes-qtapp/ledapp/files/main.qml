import QtQuick
import QtQuick.Controls
import Led 1.0

ApplicationWindow {
    visible: true
    width: 800
    height: 480
    title: "LED Control"

    LedController {
        id: led
    }

    Rectangle {
        anchors.fill: parent
        color: "#f0f0f0"

        Column {
            anchors.centerIn: parent
            spacing: 20

            Text {
                text: "LED State: " + (led.ledState ? "ON" : "OFF")
                font.pixelSize: 24
            }

            Button {
                text: led.ledState ? "Turn OFF" : "Turn ON"
                onClicked: led.setLedState(!led.ledState)
            }
        }
    }
}