import QtQuick

Item {
    id: root
    property int arrowWidth:0
    property int arrowHeight:0
    property int arrowX:0
    property int arrowY:0

    property double rotate:0
    Canvas {
            id: canvas
            width: root.arrowWidth
            height: root.arrowWidth
            //anchors.centerIn: parent
            x:root.arrowX
            y:root.arrowY
            onPaint: {
                var ctx = canvas.getContext("2d")
                ctx.clearRect(0, 0, canvas.width, canvas.height)

                ctx.save()
                ctx.translate(canvas.width / 2, canvas.height / 2) // Move the origin to the center
                ctx.rotate(root.rotate) // Rotate the arrow (example: 45 degrees)

                // Draw the arrow
                ctx.beginPath()
                ctx.moveTo(-30, -10) // Start point of the arrow
                ctx.lineTo(0, -10)  // Base of the arrow shaft
                ctx.lineTo(0, -30)  // Left side of the arrowhead
                ctx.lineTo(30, 0)   // Tip of the arrow
                ctx.lineTo(0, 30)   // Right side of the arrowhead
                ctx.lineTo(0, 10)   // Base of the arrow shaft
                ctx.lineTo(-30, 10) // Back to the starting point
                ctx.closePath()
                ctx.fillStyle = "lime"
                ctx.fill()
                ctx.restore()
            }

        }

}
