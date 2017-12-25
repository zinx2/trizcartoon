import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import "Resources.js" as R

ApplicationWindow {
    id: appWindow
    visible: true
    width: 1500
    height: 888
    title: qsTr("Triz Contradiction Matrix")


    Component.onCompleted: {
        //        R.design_size_width = di.width();
        fadeoutTimer.running = true;
        console.log(R.design_size_width)
    }

    property bool doQuit: false
    Timer
    {
        id: doQuitControl
        interval:1500
        repeat: false
        onTriggered: {
            doQuit = false
        }
    }
    Item {
        anchors.fill : parent
        focus: true
        Keys.onReleased : {
            console.log("Keys.onReleased >> ")
            if(/*event.key === Qt.Key_Back || */event.key === Qt.Key_Escape)
            {
                if(popupStack.depth > 0)
                {
                    popupStack.clear();
                    return;
                }

                console.log("stackView.depth >> " + stackView.depth)
                if(stackView.depth > 1)
                    stackView.pop();
                else
                {
                    if(!doQuit)
                    {
                        toast("한번 더 누르면 앱을 종료합니다.");
                        doQuit = true;
                        doQuitControl.start();
                    }
                    else
                        Qt.quit();
                }
            }
        }
        Keys.onBackPressed: {
            console.log("Keys.onBackPressed >> ")
            if (Qt.inputMethod.visible)
            {
                Qt.inputMethod.hide()
                return;
            }

            if(popupStack.depth > 0)
            {
                popupStack.clear();
                return;
            }

            if(stackView.depth > 1)
                stackView.pop();
            else
            {
                if(!doQuit)
                {
                    toast("한번 더 누르면 앱을 종료합니다.");
                    doQuit = true;
                    doQuitControl.start();
                }
                else
                    Qt.quit();
            }
        }
    }

    StackView
    {
        id: stackView
        anchors.fill: parent
        visible: true

        initialItem: VWMain { }
    }

    StackView
    {
        id: popupStack
        z: 99999
    }

    Rectangle
    {
        id: splashView
        anchors.fill: parent
        visible: true
        Image
        {
            anchors.centerIn: parent
            width: R.dp(184)
            height: R.dp(349)
            source: R.image("splash.png")
        }
        Behavior on opacity { NumberAnimation { duration: 1000 ;easing.type: Easing.InQuad}  }
    }

    Timer
    {
        id:fadeoutTimer
        interval:10
        repeat: false
        onTriggered:{
            splashView.opacity = 0;
            hideTimer.start();
        }
    }
    Timer
    {
        id:hideTimer
        interval:800
        repeat: false
        onTriggered: {
            splashView.visible=false;
        }
    }


    CPToast
    {
        id: toastPopup
        anchors
        {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: R.dp(150)
        }
//        visible: false
    }

    function toast(message)
    {
        toastPopup.show(message);
    }

    function popup(component/*src*/, properties, callback)
    {
        //        var component = Qt.createComponent(src);
        if(component.status == Component.Ready)
        {
            if(typeof properties === "undefined" || properties === null) properties = {"x":0, "y":0}

            //            var obj = Qt.createComponent(src).createObject(this, properties);
            var obj = component.createObject(this, properties);
            if(obj === null || typeof obj === "undefined") return;
            obj.evtBack.connect(function() {
                popupStack.clear()
            });
            obj.evtCallback.connect(callback);

            popupStack.push(obj, StackView.Immediate);
        }
    }
}

