import QtQuick 1.0



Item {

    id: mainMenu
    width: 300
    height: 320

    signal started
    signal continued
    signal exited



    transform:  Rotation{
        id: contentRotation
        origin.x: 160;
        origin.y: 0;
        axis { x: 1; y: 0; z: 0 }
        angle: 0
    }



    Rectangle{
        width: 320
        height: 300
        color: "cornflowerblue"
    }



    Grid{
        id: grid
        rows: 3
        columns: 1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 15



        Rectangle{

            id: startButton
            width: 200
            height:60

            radius: 10

            color: "orange"
            border.width: 3
            border.color: "orangered"

            visible: false


            Text {
                id: startText
                text: "Start"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
                font.pointSize: 12
                color: "white"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: mainMenu.started()
            }
        }



        Rectangle{

            id: exitButton
            width: 200
            height:60
            radius: 10

            color: "orange"
            border.width: 3
            border.color: "orangered"


            Text {
                id: exitText
                text: "Exit"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
                font.pointSize: 12
                color: "white"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: mainMenu.exited()
            }
        }
    }




    states: [


        State {
            name: "normal"
            PropertyChanges{
                target: startButton
                visible: true
            }
            PropertyChanges {
                target: startText
                text: "Start"
            }
        },


        State {
            name: "hidden"
            PropertyChanges {
                target: contentRotation
                angle: 90
            }
        }
    ]
}
