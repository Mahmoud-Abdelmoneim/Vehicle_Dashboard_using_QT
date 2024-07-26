import QtQuick

Item {
    id:root
    property int gaugeX:0
    property int gaugeY:0

    property int gaugeHeight:0
    property int gaugeWidth:0
    Rectangle{
        id:gauge
        color: "black"
        x:root.gaugeX
        y:root.gaugeY
        radius: root.gaugeHeight/2
        height: root.gaugeHeight
        width: root.gaugeWidth

        Repeater {
                 model: 7
                Item {
                    height: root.gaugeHeight/2
                    transformOrigin: Item.Bottom
                    rotation: index * 15 + 0
                    x: root.gaugeWidth/2

                    Rectangle {
                    height: root.gaugeHeight * 0.04
                    width: height / 4
                    color: "orange"
                    antialiasing: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: root.gaugeHeight * 0.03
                    }


                 }
            }
        NoodleSpeed {
            id: id_speedNeedle
            objectName: "id_speedNeedle"
            anchors {
                top: gauge.top
                bottom: gauge.bottom
                horizontalCenter: parent.horizontalCenter
            }
            value:0
            startAngle: 15
            angleLength: 15 / (7 / (7 - 1))

        }

    }


}
