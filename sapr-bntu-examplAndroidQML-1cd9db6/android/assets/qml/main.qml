import QtQuick 1.1

Rectangle {
    id: page;
    width: 480; height: 640;
    color: "#694C34";
    property int  score: 0
    Image {
        width: 480;
        height: 640;
        fillMode: Image.Tile;
        anchors.fill: parent
        source: "/mnt/sdcard/andr/stone.jpg";
    }

//////////////////////////////



/////////////////////////////
    Text {
        id: name;
        x: 7;
        y: 3;
        color: "White";
        text: "MonsterMiner"; font.family: "Swis721 BlkCn BT"; font.pointSize: 16; z:1;
    }
}
