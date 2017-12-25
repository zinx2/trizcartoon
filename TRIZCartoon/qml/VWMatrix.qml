import QtQuick 2.0
import QtQuick.Controls 2.2
import "Resources.js" as R

Paper {
    id: mainView
    visibleBackBtn: true

    Loader
    {
        id: loader
        width: parent.width
        height: parent.height
    }

    Component
    {
        id: component
        Column
        {
            width: parent.width
            height: parent.height - R.height_titlaBar
            y: R.height_titlaBar

            LYMargin { height: R.dp(30) }
            CPDescContradictionMatrix
            {

            }

            LYMargin { height: R.dp(60) }
            CPDescEngineeringVariable { }
        }
    }

    onEvtBack:
    {
        stackView.pop();
    }

    Component.onCompleted:
    {
        viewTrigger.start();
    }

    Keys.onReleased : {
        if (event.key == Qt.Key_Back)
            stackView.pop();
    }

    Timer
    {
        id: viewTrigger
        interval: 200
        repeat: false
        onTriggered:
        {
            loader.sourceComponent = component;
        }
    }
}
