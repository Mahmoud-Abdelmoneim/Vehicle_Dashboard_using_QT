import QtQuick

Item {
    id: id_root
    property int value: 0
    property int startAngle : 0
    property double angleLength: 0
    property int maxSpeed: 0

    Rectangle {
        width: id_root.height * 0.016
        height: id_root.height * 0.45
        color: "red"
        anchors {
            horizontalCenter: id_root.horizontalCenter
        }
        antialiasing: true
        y: id_root.height * 0.05
        z:-2
    }

    rotation: value * angleLength + startAngle

    antialiasing: true

    Behavior on rotation {
        SmoothedAnimation { velocity: 1000 }
    }

}
