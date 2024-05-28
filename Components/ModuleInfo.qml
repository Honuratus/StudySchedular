import QtQuick 2.15
import QtQuick.Effects

Item {
    // Colors
    property color fillColor: "#1F1F1F"

    // Text properties
    property string textValue: ""
    property int transitionDuration : 200


    id:main
    implicitWidth: 150
    implicitHeight: 50

    Rectangle{
        id: moduleInfoRect
        Behavior on color{
            ColorAnimation{
                duration: main.transitionDuration
            }
        }

        property bool hovered: false

        width: main.width
        height: main.height
        radius: 10
        color: hovered ?  "#FFF" : main.fillColor

        Text{
            Behavior on color{
                ColorAnimation{
                    duration: main.transitionDuration
                }
            }

            text: main.textValue
            color: parent.hovered ? "black" : "#FFF"
            font.pixelSize: 16
            anchors.centerIn: parent

        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onEntered:{
                parent.hovered = true
            }
            onExited:{
                parent.hovered = false
            }
        }

    }
    MultiEffect {
        source: moduleInfoRect
        anchors.fill: moduleInfoRect
        autoPaddingEnabled: true
        shadowBlur: 2.0
        shadowColor: 'black'
        shadowEnabled: true
        shadowVerticalOffset: moduleInfoRect.shadowSize
    }
}
