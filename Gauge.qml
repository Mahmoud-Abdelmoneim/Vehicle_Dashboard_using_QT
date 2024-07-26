import QtQuick

Item {
    id:root
    property int numberIndexs:0
    property int startAngle:0
    property int angleLength:0
    property int maxSpeed:0

    property int gaugeWidth:0
    property int gaugeHeight:0
    property int gaugeRedius:0

    property int gaugeX:0
    property int gaugeY:0

    property alias gaugrLabel:gaugeText.text

    property int gaugeType:1


    property int gaugeValue: 0
    Rectangle {
        id: circleSpeed

        width: root.gaugeWidth
        height: root.gaugeHeight
        radius: root.gaugeRedius
        //color: "navy"
        color: "black"
        x:root.gaugeX
        y:root.gaugeY




        Canvas {
             id:canvasSpeed
             anchors.fill: parent
             contextType: "2d"
             rotation: 145
             antialiasing: true

             onPaint: {
                 var context = canvasSpeed.getContext('2d');
                 context.strokeStyle = "black";
                 context.lineWidth = circleSpeed.height * 0.05 / 2;
                 context.beginPath();
                 context.arc(circleSpeed.height / 2, circleSpeed.height / 2, circleSpeed.height / 2 - circleSpeed.height * 0.05, 0, Math.PI * 1.1, false);
                 context.stroke();

                 context.strokeStyle = "red";
                 context.lineWidth = circleSpeed.height * 0.05 / 2;
                 context.beginPath();
                 context.arc(circleSpeed.height / 2, circleSpeed.height / 2, circleSpeed.height / 2 - circleSpeed.height * 0.05, Math.PI * 1.1, Math.PI * 1.4, false);
                 context.stroke();
             }
         }




        Repeater {
                 model: root.numberIndexs
                Item {
                    height: circleSpeed.height/2
                    transformOrigin: Item.Bottom
                    rotation: index * root.angleLength + root.startAngle
                    x: circleSpeed.width/2

                    Rectangle {
                    height: circleSpeed.height * 0.03
                    width: height / 8
                    color: "white"
                    antialiasing: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: circleSpeed.height * 0.03
                    }


                 }
            }
        Repeater{
            model: 15
            Item {
                height: circleSpeed.height/2
                transformOrigin: Item.Bottom
                rotation: index * 18 + 234
                x: circleSpeed.width/2
                Rectangle {
                    height: circleSpeed.height * 0.05
                    width: height / 8
                    color: "white"
                    antialiasing: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: circleSpeed.height * 0.03
                }
                Text {
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                    }
                    x: 0
                    y: circleSpeed.height * 0.1
                    color: "white"
                    rotation: 360 - (index * 18 + 234)
                    text: root.gaugeType?(index * (root.maxSpeed / (15 - 1))): (index % 2 == 0 && index / 2 < 8 ? (index / 2): "")
                    font.pixelSize: circleSpeed.height * 0.05
                    //font.family: "Comic Sans MS"
                }
            }
        }
        Rectangle {
               id: id_center

               anchors.centerIn: parent
               height: circleSpeed.height*0.07
               width: height
               radius: width/2
               color: "white"

            }
           Text {
               id: gaugeText
               anchors {
                   horizontalCenter: parent.horizontalCenter
                   top: circleSpeed.verticalCenter
                   topMargin: circleSpeed.height * 0.1
               }
              // text: root.gaugrLabel
               x:100
               color: "red"
               font.pixelSize: circleSpeed.height * 0.08
               //font.family: "Comic Sans MS"
           }
           NoodleSpeed {
               id: id_speedNeedle
               objectName: "id_speedNeedle"
               anchors {
                   top: circleSpeed.top
                   bottom: circleSpeed.bottom
                   horizontalCenter: parent.horizontalCenter
               }
               value:root.gaugeValue
               startAngle: root.startAngle
               angleLength: root.angleLength / (root.maxSpeed / (root.numberIndexs - 1))

           }

    }



}
