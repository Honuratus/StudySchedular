import QtQuick 2.15
import Qt5Compat.GraphicalEffects


Item {
    // Properties
    property color bgColor : "#FF6B6B"
    property color borderColor: "#FF6B6B"
    property color textColor: "#FFF"

    property color hoveredBgColor: "transparent"
    property color hoveredBorderColor: "#FF6B6B"
    property color hoveredTextColor : "#FF6B6B"

    property int widthValue: 250
    property int heightValue: 30
    property int borderWidth: 1
    property bool hovered : false

    property string textValue: "Login"

    id: main
    implicitWidth: widthValue
    implicitHeight: heightValue
    Rectangle{
        Behavior on color{
            ColorAnimation{
                duration: 200
            }
        }

        anchors.fill: parent
        color: main.hovered ? main.hoveredBgColor : main.bgColor
        border.width: main.borderWidth
        border.color: main.borderColor
        radius: 10
        Text{
            Behavior on color{
                ColorAnimation{
                    duration: 200
                }
            }
            anchors.centerIn: parent
            color: main.hovered ? main.hoveredTextColor : main.textColor
            font.pixelSize: 16
            text: main.textValue
        }
    }
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: click()
        onEntered: enter()
        onExited: exit()
    }
    function click(){

    }
    function enter(){
        main.hovered = true
    }
    function exit(){
        main.hovered = false
    }
}
