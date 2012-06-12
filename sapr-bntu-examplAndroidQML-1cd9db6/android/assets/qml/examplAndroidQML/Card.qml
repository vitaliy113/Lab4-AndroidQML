import QtQuick 1.0



Item {

    id: card
    width:75
    height:75

    signal selected
    property string parNumber: '1'


    Image {
        id: coverImg
        source: "/sdcard/andr/cover.PNG"


        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter


        transform:  Rotation{
            id: coverRotation
            origin.x: 35;
            origin.y: 35;
            axis { x: 0; y: 1; z: 0 }
            angle: 0
        }

    }


    Image {
        id: contentImg

        source: "/sdcard/andr/card"+parNumber+".PNG"


        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter


        transform:  Rotation{
            id: contentRotation
            origin.x: 35;
            origin.y: 35;
            axis { x: 0; y: 1; z: 0 }
            angle: 90
        }
    }

    MouseArea {

        id: interactiveArea
        anchors.fill: parent
        onClicked: card.selected()
    }




    states: [

        State {
            name: "open"
            PropertyChanges {
                target: coverRotation
                angle: 90
            }
            PropertyChanges {
                target: contentRotation
                angle: 0

            }
        },

        State {
            name: "removed"
            PropertyChanges {
                target: contentRotation
                angle:0

            }
            PropertyChanges {
                target: coverImg
                visible: false
            }

            PropertyChanges {
                target: interactiveArea
                enabled: false
            }
            PropertyChanges {
                target: contentImg
                width:0
                height:0
                rotation:360
            }
        }
    ]




    transitions: [
        Transition {
            from: ""
            to: "open"
            reversible: true
                SequentialAnimation{
                NumberAnimation { target: coverRotation; property: "angle"; duration: 150 }
                NumberAnimation { target: contentRotation; property: "angle"; duration: 150 }
            }
        },
        Transition {
            from: "open"
            to: "removed"
            NumberAnimation { target: contentImg; properties: "rotation,width,height"; duration: 200 }

        }
    ]
}
