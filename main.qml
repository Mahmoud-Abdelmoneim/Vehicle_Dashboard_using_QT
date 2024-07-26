import QtQuick
import QT_hello
import QtQuick.Controls
import QtQuick.Layouts
Window {
    id:root
    width: 2080
    height: 2000
    visible: true
    //color: "navy"
    color: "black"
    title: qsTr("main window")
    z:-2
    Rectangle {
        border.color: "skyblue"; color: "transparent"
        border.width: 10
        height: 700
        width: 1550
        y:100
        x:200
        bottomLeftRadius:200
        bottomRightRadius :200
        topLeftRadius:200
        topRightRadius:200

    }
    CustomGauge{

        gaugeHeight:250
        gaugeWidth:250
        gaugeX: 1450
        gaugeY: 500


    }

    Gauge{
        id:speed
        gaugeType:88
        gaugeX: 300
        gaugeY: 250
        gaugeHeight: 500
        gaugeWidth: 500
        gaugeRedius: 250

        numberIndexs: 127
        startAngle: 234
        angleLength: 2
        maxSpeed: 280

        gaugrLabel: "\nKm/h"
        gaugeValue:0

    }


    Gauge{
        id:rmpgauge
        gaugeX: speed.gaugeX+750
        gaugeY: speed.gaugeY
        gaugeType:0
        gaugeHeight: 500
        gaugeWidth: 500
        gaugeRedius: 250

        numberIndexs: 29
        startAngle: 234
        angleLength: 9
        maxSpeed: 7

        gaugrLabel: "\nrpm x 1000"

        gaugeValue: 4
    }


    Arrow{
        id:rightsign
        arrowX:975
        arrowY:300
        arrowHeight :100
        arrowWidth :100
        //rotate: Math.PI

    }

    Arrow{
        id:leftsign
        arrowX:775
        arrowY:300
        arrowHeight :100
        arrowWidth :100
        rotate: Math.PI

    }

    Image {
        id: light
        source: "qrc:/QT_hello/assets/light.png"

        height: 40
        width: 40
        y:330
        x:905

    }
    Image {
        id: doors
        source: "qrc:/QT_hello/assets/doors.png"

        height: 70
        width: 70
        y:600
        x:950


    }
    Image {
        id: oil
        source: "qrc:/QT_hello/assets/oil.png"

        height: 70
        width: 70
        y:600
        x:850

    }
    Image {
        id: banzen
        source: "qrc:/QT_hello/assets/banzen.png"

        height: 35
        width: 35
        y:590
        x:1600

    }

    Rectangle{

        width: 200
        height: 3
        y:440
        x:825
    }
    Rectangle{

        width: 160
        height: 3
        y:560
        x:840
    }
    Rectangle{
        x:960
        y:460
        width:70
        height: 80
        color: "black"
        border.color: "white"
        bottomLeftRadius:10
        bottomRightRadius :10
        topLeftRadius:10
        topRightRadius:10

        Text {
            id: quicks
            text: qsTr("P")
            anchors.centerIn: parent
            font.pixelSize:80
            color: "white"
        }
    }
    Text {
        id: kmh
        text: qsTr("km/h")
        x:900
        y:500
        font.pixelSize:20
        color: "white"
    }
    Text {
        id: speednum
        text: qsTr("0")
        height: 100
        x:820
        y:480
        font.pixelSize:50
        color: "white"
    }




    Button{

        height: 50
        width: 100
        y:950
        text: "light"
        onClicked: light.visible=!light.visible

    }
    Button{

        height: 50
        width: 100
        y:950
        x:100
        text: "doors"
        onClicked: doors.visible=!doors.visible

    }
    Button{

        height: 50
        width: 100
        y:950
        x:200
        text: "left"
        onClicked:
        {

            leftsign.visible=!leftsign.visible
        }
    }
    Button{

        height: 50
        width: 100
        y:950
        x:700
        text: "right"
        onClicked:
        {
            rightsign.visible=!rightsign.visible

        }
    }




    Slider{
        height: 30
        id:speedSlider
        from:0
        value: 0
        to:280
        y:950
        x:350
        width:200
        onMoved: {
            speednum.text=parseInt(speedSlider.value)
            speed.gaugeValue = speedSlider.value
        }
    }
    Slider{
        height: 30
        id:rpmSlider
        from:0
        value: 0
        to:7
        y:980
        x:350
        width:200
        onMoved: rmpgauge.gaugeValue = rpmSlider.value
    }
    Slider{
        height: 30
        id:quickSlider
        from:0
        value: 0
        to:3
        stepSize: 1
        y:980
        x:560
        width:100
        onMoved:
        {
           (quickSlider.value===0)? quicks.text="N":
           (quickSlider.value===1)? quicks.text="P":
           (quickSlider.value===2)? quicks.text="D":quicks.text="R"

        }
    }


}


