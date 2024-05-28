import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Controls.Fusion
import "Components"

Window {
    property bool loginOrRegister: pageLoader.source=="Components/LoginPage.qml" || pageLoader.source=="Components/RegisterPage.qml"

    id: mainW
    width: 640
    height: 480
    visible: true
    flags: Qt.FramelessWindowHint | Qt.Window
    color: "transparent"

    MyButton{
        id: dragButton
        anchors.bottom: parent.bottom
        draggable: true
        imageSource: "../Images/drag.png"

        accentColor: mainW.loginOrRegister ? "#0F0F0F" : "#00CED1"
        borderColor: "#00CED1"
        borderWidth: mainW.loginOrRegister ? 1 : 0
        iconColor: mainW.loginOrRegister ? hovered ? "#FFF" : "#00CED1" : "#FFF"

        z: 3
    }
    MyButton{
        id:quitButton
        quitable: true
        imageSource: "../Images/quit.png"
        anchors.bottom: parent.bottom
        anchors.right: parent.right

        accentColor: mainW.loginOrRegister ? "#0F0F0F" : "#00CED1"
        borderColor: "#00CED1"
        borderWidth: mainW.loginOrRegister ? 1 : 0
        iconColor: mainW.loginOrRegister ? hovered ? "#FFF" : "#00CED1" : "#FFF"
        z: 3
    }

    Loader{
        property bool valid: item != null
        id: pageLoader
        anchors.fill: parent
        source: ""
    }
    function loadPage(pageUrl){
        pageLoader.source = pageUrl
    }
    Component.onCompleted: {
        loadPage("Components/LoginPage.qml")
    }
    Connections {
            ignoreUnknownSignals: true
            target: pageLoader.valid ? pageLoader.item : null
            function onChangeToRegister()
            {
                pageLoader.source = "Components/RegisterPage.qml"
            }
            function onChangeToLogin(){
                loadPage("Components/LoginPage.qml")
            }
            function onChangeToMain(){
                loadPage("Components/MainPage.qml")
            }
            function onRefreshPage(){
                var source = pageLoader.source
                pageLoader.source = ""
                pageLoader.source = source
            }
        }


}
