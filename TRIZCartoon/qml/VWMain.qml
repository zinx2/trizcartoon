import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import "Resources.js" as R

Paper {
    id: mainView
    visibleBackBtn: false

    //    width: R.design_size_width
    //    height: R.design_size_height

    CPSearchBar
    {
        id: searchBar
        y: R.height_titlaBar

        Behavior on y { NumberAnimation { duration: 300 } }
        MouseArea
        {
            id: ma
            width: parent.width
            height: parent.height
            onClicked:
            {
                searchBar.y =  0
                loader.y = R.height_titlaBar
            }
        }
    }

    Loader
    {
        id: loader
        width: parent.width
        height: parent.height - R.height_titlaBar - searchBar.height
        y: R.height_titlaBar + searchBar.height
        Behavior on y { NumberAnimation { duration: 300 } }
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

            Rectangle
            {
                id: selectView
                width: parent.width
                height: layoutButtons1.height + subtitle1.height + combBox1.height + subtitle2.height + combBox2.height + layoutButtons2.height + R.dp(20) * 2 + R.dp(40) * 3
                color: R.color_bgColor001

                Column
                {
                    width: parent.width
                    height: parent.height

                    Row
                    {
                        id: layoutButtons1
                        width: R.dp(800)
                        height: R.dp(120)
                        anchors
                        {
                            right: parent.right
                        }
                        CPButton
                        {
                            type: "text"
                            btnName: "모순행렬이란?"
                            fontSize: R.pt(20)
                            pressedColor: R.color_buttonPressed
                            sourceWidth: layoutButtons1.width / 2 //R.dp(300)
                            sourceHeight: layoutButtons1.height //R.dp(150)
                            on_Clicked:
                            {
                                stackView.push(R.component_matrix, { titleText: btnName });
                            }
                        }

                        CPButton
                        {
                            type: "text"
                            btnName: "공학변수 보기"
                            fontSize: R.pt(20)
                            pressedColor: R.color_buttonPressed
                            sourceWidth: layoutButtons1.width / 2 //R.dp(300)
                            sourceHeight: layoutButtons1.height
                            on_Clicked:
                            {

                                stackView.push(R.component_engineering, { titleText: btnName });
                            }
                        }
                    }

                    CPSubtitle
                    {
                        id: subtitle1
                        anchors
                        {
                            left: parent.left
                            leftMargin: R.dp(20)
                        }
                        title : "개선되는 특성"
                    }
                    LYMargin { height: R.dp(20) }

                    CPSelector
                    {
                        id: combBox1
                        width: parent.width
                        height: R.dp(100)
                        anchors
                        {
                            left: parent.left
                            leftMargin: R.dp(40)
                            right: parent.right
                            rightMargin: R.dp(40)
                        }
                        onEvtSelect:
                        {
                            popup(R.component_popup /*R.view_file_popup*/,
                                  {"visible": true, "width": mainView.width, "height": mainView.height },
                                  function(obj)
                                  {
                                      selectedItemNo = obj.no
                                      selectedItemText = obj.no + obj.name;
                                  });
                        }
                    }
                    LYMargin { height: R.dp(40) }

                    CPSubtitle
                    {
                        id: subtitle2
                        anchors
                        {
                            left: parent.left
                            leftMargin: R.dp(20)
                        }
                        title : "악화되는 특성"
                    }
                    LYMargin { height: R.dp(20) }

                    CPSelector
                    {
                        id: combBox2
                        width: parent.width
                        height: R.dp(100)
                        anchors
                        {
                            left: parent.left
                            leftMargin: R.dp(40)
                            right: parent.right
                            rightMargin: R.dp(40)
                        }
                        onEvtSelect:
                        {
                            popup(R.component_popup /*R.view_file_popup*/,
                                  {"visible": true, "width": mainView.width, "height": mainView.height },
                                  function(obj)
                                  {
                                      selectedItemNo = obj.no
                                      selectedItemText = obj.no + obj.name;
                                  });
                        }
                    }
                    LYMargin { height: R.dp(40) }

                    Row
                    {
                        id: layoutButtons2
                        width: R.dp(350)
                        height: R.dp(100)
                        anchors
                        {
                            right: parent.right
                            rightMargin: R.dp(40)
                        }

                        CPButton
                        {
                            type: "text"
                            btnName: "발명원리 탐색"
                            fontSize: R.pt(20)
                            pressedColor: R.color_buttonPressed
                            rectColor: R.color_buttonColor001
                            textColor: "white"
                            sourceWidth: parent.width
                            sourceHeight: parent.height
                            radius: 10
                            on_Clicked:
                            {
                                md.getConcept(combBox1.selectedItemNo, combBox2.selectedItemNo)
                            }
                        }
                    }
                }
            }

            Rectangle
            {
                id: resultView
                width: parent.width
                height: mainColumn.height - selectView.height
                color: "white"

                CPSubtitle
                {
                    id: subtitle
                    anchors
                    {
                        top: parent.top
                        topMargin: R.dp(20)
                        left: parent.left
                        leftMargin: R.dp(20)
                    }
                    title : "도출되는 발명원리 목록"
                }

                CPListViewMatrix
                {
                    width: parent.width
                    height: parent.height - subtitle.height
                    model: opt.ds ? ds_model : md.inv
                    footerSize: R.dp(500)
                    anchors
                    {
                        top: subtitle.bottom
                        topMargin: R.dp(20)
                    }
                }
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
    }


    ListModel {
        id: ds_model
        ListElement {
            name: "Bill Smith"
            number: "0"
            content: "conttetwetpwfjpwefpojwepofjw234234pojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojef555"
            text: "AAA"
        }
        ListElement {
            name: "John Brown"
            number: "1"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            text: "BBB"
        }
        ListElement {
            name: "Sam Wise"
            number: "2"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            text: "CCC"
        }
        ListElement {
            name: "Bill Smith"
            number: "3"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            text: "DDD"
        }
        ListElement {
            name: "John Brown"
            number: "4"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            text: "EEE"
        }
        ListElement {
            name: "Sam Wise"
            number: "5"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
            text: "FFF"
        }
        ListElement {
            name: "Bill Smith"
            number: "6"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
        }
        ListElement {
            name: "John Brown"
            number: "7"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
        }
        ListElement {
            name: "Sam Wise"
            number: "8"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
        }
        ListElement {
            name: "Bill Smith"
            number: "9"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
        }
        ListElement {
            name: "John Brown"
            number: "10"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
        }
        ListElement {
            name: "Sam Wise"
            number: "11"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
        }
        ListElement {
            name: "Bill Smith"
            number: "12"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
        }
        ListElement {
            name: "John Brown"
            number: "13"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
        }
        ListElement {
            name: "Sam Wise"
            number: "14"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
        }
        ListElement {
            name: "Bill Smith"
            number: "15"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
        }
        ListElement {
            name: "John Brown"
            number: "16"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
        }
        ListElement {
            name: "Sam Wise"
            number: "17"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
        }
        ListElement {
            name: "Bill Smith"
            number: "18"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
        }
        ListElement {
            name: "John Brown"
            number: "19"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
        }
        ListElement {
            name: "Sam Wise"
            number: "20"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
        }
        ListElement {
            name: "Bill Smith"
            number: "21"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
        }
        ListElement {
            name: "John Brown"
            number: "22"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
        }
        ListElement {
            name: "Sam Wise"
            number: "23"
            content: "conttetwetpwfjpwefpojwepofjwpojef"
        }
    }
}

