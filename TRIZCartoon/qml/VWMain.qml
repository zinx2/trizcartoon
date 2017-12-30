import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "Resources.js" as R

Paper {
    id: mainView
    visibleBackBtn: searching
    visibleSearchBtn: true
    //    width: R.design_size_width
    //    height: R.design_size_height

    property bool searching : false
    onEvtSearch :
    {
        if(!searching)
            searching = true;
        else
        {
            Qt.inputMethod.commit()
            console.log(editWords.text)
            if(editWords.text !== "")
            {
                console.log(editWords.text)
                md.search(editWords.text);
            }
        }
    }

    onEvtBack:
    {
        editWords.text = "";
        searching = false;
        md.initialize();
    }


    Rectangle
    {
        width: parent.width - R.dp(160) - (searching ?  R.height_titlaBar : 0)
        height: R.dp(112)//R.height_titlaBar - R.dp(8) * 4
        visible: searching
        anchors
        {
            left: parent.left
            leftMargin: R.dp(16) + (searching ?  R.height_titlaBar : 0)
            top: parent.top
            topMargin: R.dp(16)
        }

        color: "white"
        border.width: 1
        radius: 5

        CPTextField
        {
            id: editWords
            width: parent.width - R.dp(8) * 2
            height: parent.height - R.dp(8) * 2
            anchors
            {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }

            onFocusChanged:
            {
                if(!editWords.focus)
                    mainView.forceActiveFocus();
            }

            onEvtSearch:
            {
                md.search(editWords.text);
            }

            onEvtBack:
            {
                if(editWords.text !== "")
                    editWords.text = ""

            }
        }


    }

    Loader
    {
        id: loader
        width: parent.width
        height: parent.height - R.height_titlaBar
        y: R.height_titlaBar// + searchBar.height
        //Behavior on y { NumberAnimation { duration: 200 } }
    }
    Component
    {
        id: component
        Column
        {
            id: mainColumn
            width: parent.width
            height: parent.height //- R.height_titlaBar
            //        y: R.height_titlaBar

            CPListView
            {
                model: opt.ds ? ds_model : md.list
                width: parent.width
                height: parent.height
            }
        }
    }

    Timer
    {
        id:viewTrigger
        interval:100
        repeat: false
        onTriggered: {
            loader.sourceComponent = component;
        }
    }

    Component.onCompleted:
    {
        viewTrigger.start();
        forceActiveFocus();
    }


    ListModel {
        id: ds_model
        ListElement {
            name: "Bill Smith"
            number: "0"
            content: "conttetwetpwfjpwefpojwepofjw234234pojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojef555"
            text: "AAA"
            vs : "true"
        }
        ListElement {
            name: "John Brown"
            number: "1"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            text: "BBB"
            vs : "true"
        }
        ListElement {
            name: "Sam Wise"
            number: "2"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            text: "CCC"
            vs : "true"
        }
        ListElement {
            name: "Bill Smith"
            number: "3"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            text: "DDD"
            vs : "true"
        }
        ListElement {
            name: "John Brown"
            number: "4"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            text: "EEE"
            vs : "true"
        }
        ListElement {
            name: "Sam Wise"
            number: "5"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            text: "FFF"
            vs : "true"
        }
        ListElement {
            name: "Bill Smith"
            number: "6"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            vs : "true"
        }
        ListElement {
            name: "John Brown"
            number: "7"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            vs : "true"
        }
        ListElement {
            name: "Sam Wise"
            number: "8"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            vs : "true"
        }
        ListElement {
            name: "Bill Smith"
            number: "9"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            vs : "true"
        }
        ListElement {
            name: "John Brown"
            number: "10"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            vs : "true"
        }
        ListElement {
            name: "Sam Wise"
            number: "11"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            vs : "true"
        }
        ListElement {
            name: "Bill Smith"
            number: "12"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            vs : "true"
        }
        ListElement {
            name: "John Brown"
            number: "13"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            vs : "true"
        }
        ListElement {
            name: "Sam Wise"
            number: "14"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            vs : "true"
        }
        ListElement {
            name: "Bill Smith"
            number: "15"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            vs : "true"
        }
        ListElement {
            name: "John Brown"
            number: "16"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            vs : "true"
        }
        ListElement {
            name: "Sam Wise"
            number: "17"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            vs : "true"
        }
        ListElement {
            name: "Bill Smith"
            number: "18"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            vs : "true"
        }
        ListElement {
            name: "John Brown"
            number: "19"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            vs : "true"
        }
        ListElement {
            name: "Sam Wise"
            number: "20"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            vs : "true"
        }
        ListElement {
            name: "Bill Smith"
            number: "21"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            vs : "true"
        }
        ListElement {
            name: "John Brown"
            number: "22"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            vs : "true"
        }
        ListElement {
            name: "Sam Wise"
            number: "23"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            vs : "true"
        }
    }
}

