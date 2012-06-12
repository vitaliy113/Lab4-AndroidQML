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
    source: "Stone-Wall-Seamless-Pattern.jpg";
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
    Text {
        id:score;
        x: page.width-100;
        y: 3;
        color: "White";
        text: "0";
        font.family: "Swis721 BlkCn BT"; font.pointSize: 16; z:1;

    }
    function getscore(a) {
        if (a > page.score) page.score = a;
        return page.score - 90;
    }
    Rectangle {
        id: stats_block;
        width: page.width; height: 30;
        color: "#222";
        transformOrigin: Item.Center;
        opacity: 0.860;
    }
    Rectangle {
      id: ground;
      x:0; y:page.height-50;
      width: page.width; height: 61;
      color: "#00000000";
      opacity: 1.0;
      Image {
          source:randomImage();//"Stone-seamless-background.png";
          width: 480;
          height: 60;
          fillMode: Image.Tile;
          anchors.fill: parent
          function randomImage()
          {
          var images = ["Stone-seamless-background.png", "Stone-seamless-background.png"];
          var idx = Math.floor((Math.random() * 100)) % images.length;
          return (images[idx]);
          }
      }
    }
    Rectangle {
      id: digger;
      x: 285;
      y: 550;
      z: 2;
      width: 50;
      height: 49;
      color: "#00000000";
      focus: true;
      Keys.onLeftPressed: if (digger.pos.x != 0) digger.pos.x -= 5;
      Keys.onRightPressed: if (digger.pos.x !== (page.width-digger.width)) digger.pos.x += 5;
      Keys.onUpPressed: digger.pos.y -= 5;
      Keys.onDownPressed: if (digger.pos.y !== (page.height-ground.height + 20 - digger.height)) digger.pos.y += 5;
      onYChanged: score.text = getscore(page.height - digger.y);

      Image {
          fillMode: Image.Center;
          rotation: 0;
          transformOrigin: Item.Center;
          visible: true;
          source: "me-mini.png";
      }
    }
    Rectangle {
        id:kartinka_ot_botinka;
        x:page.width-monster1.width;
        y:page.height/2 - 3;
        z:0;
        height:86
        color: "#ad9e8a"
        opacity: 0.610
        width:monster1.width;
        SequentialAnimation on x {
            loops: Animation.complete;
            PropertyAction { target: kartinka_ot_botinka; property: "width"; value: kartinka_ot_botinka.width+1; }
            NumberAnimation { to:0; duration:3000 }
        }

        // Новое свойство объекта, необходимое
        // для изменения состояния при удалении объекта
        property bool remove: false
        // При добавлении объекта
        property bool show: false
        Firework
        {
            id: firework1
        }

        Firework
        {
            id: firework2
        }

        states: [
            State
            {
                // Состояние, в которое переходит объект
                // тогда, когда нам нужно его удалить
                name: "remove"; when: remove === true;
                PropertyChanges { target: kartinka_ot_botinka; opacity: 0 }
                StateChangeScript { script: kartinka_ot_botinka.destroy(1000); }
            },
            State
            {
                // Состояние, в которое переходит объект
                // тогда, когда нам нужно его отобразить
                name: "show"; when: show === true;
                StateChangeScript { script: firework1.burst(50); }
                StateChangeScript { script: firework2.burst(50); }
                PropertyChanges { target: kartinka_ot_botinka; opacity: 1 }
            }
        ]

        Behavior on opacity { NumberAnimation { duration: 300 }
    }
    }

    Rectangle {
        id:monster1;
        color:"#00000000";
        width:50;height:50;
        x:page.width - monster1.width
        y:page.height/2;
        Image {
            id: monster1Image;
            source: "Angry-monster1-l.png";
        }
        onXChanged:{ if((digger.pos.x < monster1.pos.x+30) && (digger.pos.x > monster1.pos.x) && (digger.pos.y > monster1.pos.y-monster1.height) && (digger.pos.y < monster1.pos.y+83)) {digger.pos.y = page.height - 90; page.score = 0; score.text = "0"; }
            if(kartinka_ot_botinka.width < page.width) {
                kartinka_ot_botinka.show = true;
                kartinka_ot_botinka.width = kartinka_ot_botinka.width + 5;
            }
        kartinka_ot_botinka.show = false;
        }

        SequentialAnimation on x {

            loops: Animation.Infinite;
            NumberAnimation { to: 0; duration:3000; }
            PropertyAction { target: monster1Image; property: "source"; value: "Angry-monster1-r.png"; }
            NumberAnimation { to: page.width - 50; duration: 3000 }
            PropertyAction { target: monster1Image; property: "source"; value: "Angry-monster1-l.png"; }
        }
    }
}
