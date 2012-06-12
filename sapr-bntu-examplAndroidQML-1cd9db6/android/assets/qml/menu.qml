// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: menu_page;
    width: 480; height: 720;
    color: "#3a2b24"

    Text {
        id: text1
        x: 83
        y: 95
        color: "#998177"
        text: qsTr("Jumper")
        font.bold: true
        font.family: "MV Boli"
        font.pixelSize: 54
    }

    Text {
        id: text2
        horizontalAlignment: Text.AlignHCenter
        y: 207
        width: menu_page.width
        color: "#ffffff"
        text: qsTr("New game")
        font.family: "Comic Sans MS"
        font.pixelSize: 36
    }

    Text {
        id: text3
        horizontalAlignment: Text.AlignHCenter
        y: 283
        width: menu_page.width
        color: "#ffffff"
        text: qsTr("Scores")
        font.family: "Comic Sans MS"
        font.pixelSize: 36
    }

    Text {
        id: text4
        horizontalAlignment: Text.AlignHCenter
        y: 357
        width: menu_page.width
        color: "#ffffff"
        text: qsTr("About")
        font.family: "Comic Sans MS"
        font.pixelSize: 36
    }

    Text {
        id: text5
        horizontalAlignment: Text.AlignHCenter
        y: 429
        width: menu_page.width
        color: "#ffffff"
        text: qsTr("Exit")
        font.bold: false
        font.family: "Comic Sans MS"
        font.pixelSize: 36
        MouseArea {
            anchors.fill: parent
            onClicked: {
                Qt.quit();
            }
        }
    }
}
