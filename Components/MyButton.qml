import QtQuick 2.15
import QtQuick.Controls

Item {
    // Colors
    property color accentColor : "#00FFFF"
    property color accentHoverColor : "#00CED1"
    property color borderColor: "transparent"
    property color iconColor : "#FFF"

    // Properties
    property int radiusValue : 10
    property bool hovered : false
    property bool draggable: false
    property bool quitable: false
    property string imageSource : ""
    property int borderWidth : 0

    id:main
    implicitWidth: 45
    implicitHeight: 45


    Rectangle{

        Behavior on color{
            ColorAnimation{
                duration: 200
            }
        }

        width: main.width
        height: main.height
        color: main.hovered ? main.accentHoverColor : main.accentColor
        radius: main.radiusValue
        border.width: main.borderWidth
        border.color: main.borderColor
        IconImage{
            Behavior on color{
                ColorAnimation{
                    duration: 200
                }
            }
            width: 25
            height: 25
            source: main.imageSource
            color: main.iconColor
            anchors.centerIn: parent
        }
    }
    MouseArea{
        id: mouseArea
        property variant clickPos: "1,1"
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onPressed: click()

        onPositionChanged: posChanged()

        onClicked: {
            if(main.quitable){
                Qt.quit()
            }
        }

        onEntered: {
            parent.hovered = true
        }
        onExited: {
            parent.hovered = false
        }
    }
    function click(){
        mouseArea.clickPos  = Qt.point(mouseArea.mouseX, mouseArea.mouseY)
    }
    function posChanged(){
        if(mouseArea.pressed && main.draggable){
            var delta = Qt.point(mouseArea.mouseX-mouseArea.clickPos.x, mouseArea.mouseY-mouseArea.clickPos.y)
            mainW.x += delta.x;
            mainW.y += delta.y;
        }
    }
}


