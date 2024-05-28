import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Controls.Fusion
import Qt5Compat.GraphicalEffects


Page {
    // signal for loader
    signal changeToRegister()
    signal changeToMain()

    // Colors
    property color bgColor: "#FF6B6B"
    property color boxColor : "#0F0F0F"
    property color accentColor : "#00FFFF"

    id: loginWindow
    title: qsTr("StudySchedular")
    width: 640
    height: 480
    background: Rectangle{
        anchors.fill: parent
        color: loginWindow.boxColor
        radius: 10
    }


    Rectangle{
        id: mainRect
        anchors.centerIn: parent
        width: 300
        height: 400
        radius: 10
        border.width: 1
        border.color: loginWindow.bgColor
        color: "#0F0F0F"
        layer.enabled: true
        layer.effect: DropShadow{
            verticalOffset: 5
            color: "black"
            radius:8
        }

        Text{
            id:titleText
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Welcome back!"
            color: "white"
            font.pixelSize: 24
        }
        Text{
            id: usernameText
            anchors.top: titleText.bottom
            anchors.topMargin: 30
            anchors.left: parent.left
            anchors.leftMargin: 20
            text:"Username:"
            color: "white"
            font.pixelSize: 16
        }
        TextField{
            id: usernameTextField
            anchors.top: usernameText.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            width: 250
            height: 30
            verticalAlignment: TextField.AlignVCenter
            font.pixelSize: 12
            color: "white"
            background:Rectangle{
                anchors.fill: parent
                color: "transparent"
                border.width: 1
                border.color: loginWindow.bgColor
                radius: 10
            }
        }

        Text{
            id: passwordText
            anchors.top: usernameTextField.bottom
            anchors.topMargin: 50
            anchors.left: parent.left
            anchors.leftMargin: 20
            text:"Password:"
            color: "white"
            font.pixelSize: 16
        }
        TextField{
            id: passwordTextField
            anchors.top: passwordText.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            width: 250
            height: 30
            verticalAlignment: TextField.AlignVCenter
            font.pixelSize: 12
            color: "white"
            echoMode: TextField.Password
            background:Rectangle{
                anchors.fill: parent
                color: "transparent"
                border.width: 1
                border.color: loginWindow.bgColor
                radius: 10
            }
        }
        LoginButton{
            id:loginButton
            anchors.top: passwordTextField.bottom
            anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
            function click(){
                if(database_manager.log_in(usernameTextField.text, passwordTextField.text) !== 0){
                    changeToMain()
                }
                else{
                    console.log("Wrong info")
                }

            }
        }
        Text{
            text: "Click to register"
            color: loginWindow.bgColor
            font.pixelSize: 12
            anchors.top: loginButton.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            MouseArea{
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {

                    loginWindow.changeToRegister()
                }
            }
        }
    }


}
