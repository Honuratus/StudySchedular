import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects
import QtQuick.Controls.Fusion

Window {
    // Colors
    property color bgColor : "#0F0F0F"
    property color accentColor : "#00FFFF"
    property color accentHoverColor : "#00CED1"
    property color textColor: "white"

    property string titleTextValue: "New Module"

    property bool accepted: false

    id: popupWindow
    width: 400
    height: 400
    color: popupWindow.bgColor
    Rectangle{
        id: mainBox
        color: popupWindow.bgColor
        width: 300
        height: 150
        anchors.centerIn: parent
        border.color: popupWindow.accentColor
        border.width: 1
        radius: 10
        layer.enabled: true
        layer.effect: DropShadow{
            verticalOffset: 10
            color: "black"
            radius: 8
        }
        Text{
            id: title
            color: popupWindow.textColor
            font.pixelSize: 24
            text: popupWindow.titleTextValue
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            visible: !accepted
        }
        TextField{
            id: moduleNameField
            width: 250
            height: 30
            background: Rectangle{
                width: 250
                height: 30
                color: popupWindow.bgColor
                border.color: popupWindow.accentColor
                border.width: 1
                radius:10
                visible: !accepted
            }
            anchors.top: title.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter

        }
        Text{
            color: popupWindow.textColor
            font.pixelSize: 24
            text: "Module creation was succesfull!"
            anchors.centerIn: parent
            visible: accepted
        }
    }
    LoginButton{
        id:submitButton
        widthValue: 250
        heightValue: 30
        bgColor: popupWindow.bgColor
        borderColor: popupWindow.accentColor
        textColor: popupWindow.accentColor
        hoveredBgColor: popupWindow.accentColor
        hoveredTextColor: "white"
        textValue: "Submit"
        anchors.top: mainBox.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        function click(){
            var username = database_manager.user
            if(database_manager.create_module(username, moduleNameField.text) !== 0)
            {
                accepted = true
            }
            else{
                console.log("Try again something went wrong")
            }
        }
    }

}
