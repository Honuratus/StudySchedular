import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Effects


Page {
    // signals
    signal refreshPage()

    // Fonts
    property string interBold : "https://fonts.googleapis.com/css2?family=Inter:wght@800&display=swap"

    // Colors
    property color bgColor : "#0F0F0F"
    property color accentColor : "#00FFFF"
    property color accentHoverColor : "#00CED1"

    property bool isEmpty : mainRepeater.count == 0 ? true : false

    id: mainWindow
    title: qsTr("StudySchedular")
    width: 640
    height: 480
    background: Rectangle{
        anchors.fill: parent
        color: mainWindow.bgColor
        radius: 10
    }

    FontLoader{
        id: customFontLoader
        source: mainWindow.interBold
    }

    Text {
        id: headerText
        text: '<font color="#FFF">Study</font> <font color= "#00FFFF">Planner</font>'
        textFormat: Text.RichText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        font.family: "Inter"
        font.pixelSize: 48
        font.bold: true
    }
    Row{
        id: mainRow
        anchors.centerIn: parent
        spacing: 40
        Repeater{
            id: mainRepeater
            model: []
            delegate: Column{
                spacing: 20
                CircularBar{
                    widthValue: 125
                    heightValue: 125
                    bgStrokeWidth: 4
                    progressWidth: 4
                    value: modelData[0]
                    progressColor: "#FF6B6B"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                ModuleInfo{
                    anchors.horizontalCenter: parent.horizontalCenter
                    textValue: modelData[1]
                }
            }
        }
    }

    LoginButton{
        id:addModuleButton
        widthValue: 50
        heightValue: 50
        anchors.bottom: mainWindow.isEmpty ? undefined : parent.bottom
        anchors.bottomMargin: mainWindow.isEmpty ? 0 : 50
        anchors.horizontalCenter: mainWindow.isEmpty ? undefined : parent.horizontalCenter
        anchors.centerIn:  mainWindow.isEmpty ? parent : undefined
        bgColor: mainWindow.bgColor
        borderColor: accentColor
        textColor: accentColor
        hoveredBgColor: accentColor
        hoveredTextColor: "white"
        textValue: "+"

        ModelCreateWindow{
            id: popupWindow
        }


        function click(){
            if(mainRepeater.count >= 3){
                console.log("You reach the max model number")
            }
            else{
                popupWindow.show()
            }
        }

    }
    MultiEffect{
        source: addModuleButton
        anchors.fill: addModuleButton
        autoPaddingEnabled: true
        shadowBlur: 2.0
        shadowColor: 'black'
        shadowEnabled: true
        shadowVerticalOffset: 1.0
    }


}
