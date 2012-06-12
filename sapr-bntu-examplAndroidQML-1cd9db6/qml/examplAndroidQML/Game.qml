import Qt 4.7

Rectangle {
    id: game
    width: 300
    height: 300


    property int card1
    property int card2
    property int remaining


    Rectangle{
        id: background
        width: 300
        height: 300
        color: "#6F0564"
    }


    Grid{
        id: deck
        rows: 4
        columns: 4

        anchors.top: background.top
        anchors.left: background.left


        Repeater{
            model: 16


            Card{onSelected: openCard(index)}
        }
    }



    Timer{
        id:closeTimer
        interval: 1000
        onTriggered: validatePar()
    }


    MainMenu{
        id: mainMenu
        state: "normal"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        onStarted: startGame()
        onContinued: game.state = "running"
        onExited: Qt.quit()
    }


   //Javascript


    function init(){
        card1=-1
        card2=-1
        remaining=8
    }


    function startGame(){

        init()

        for(var i=0;i<16;i++){
            deck.children[i].state=""
        }

        randomizeCards()

        game.state="running"
    }

    function randomizeCards(){

        var sortedArray = ['1','2','3','4','5','6','7','8','1','2','3','4','5','6','7','8']

        var date = new Date()
        var mils = date.getMilliseconds()

        for(var i=0;i<16;i++){
            var located = false
            while(!located){
                var randomnumber = Math.floor((Math.random()*mils)%16)

                var content= sortedArray[randomnumber]
                if(content !=''){
                    deck.children[i].parNumber = content
                    sortedArray[randomnumber]=''
                    located=true;
                }
            }
        }

    }


    function openCard(index){

        deck.children[index].state = "open"

        if(card1==-1){
            card1=index
        }
        else{

            if(index== card1) return

            card2=index
            deck.enabled = false
            closeTimer.start()
        }
    }





    function validatePar(){


        var parNumber1 = deck.children[card1].parNumber
        var parNumber2 = deck.children[card2].parNumber
        var state = ""

        if(parNumber1==parNumber2){
            state = "removed"
            remaining--
        }

        deck.children[card1].state = state
        deck.children[card2].state = state

        card1 = -1
        card2 = -1
        deck.enabled = true


        if(remaining==0){
        game.state="finished"
        }
    }

   states: [

       State {
           name: "running"

           PropertyChanges {
               target: deck
               enabled: true
           }
           PropertyChanges {
               target: mainMenu
               state: "hidden"

           }
       }
   ]

}
