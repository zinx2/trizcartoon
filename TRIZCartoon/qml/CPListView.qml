import QtQuick 2.0
import "Resources.js" as R

ListView {
    id: listView
    clip: true
    property string footerSize : R.dp(500)
    model: opt.ds ? ds_model : md.list

    boundsBehavior: Flickable.StopAtBounds
    maximumFlickVelocity: R.design_size_height * 3
    cacheBuffer : R.design_size_height * 3
    delegate: Rectangle {

        width: listView.width
        height: visible ? R.dp(150) : 0
        visible: opt.ds ? vs : model.modelData.visibled

        property int no: opt.ds ? number : model.modelData.id
        property string title: opt.ds ? name : model.modelData.name
        color: ma.pressed ? R.color_buttonPressed : "white"

        Column
        {
            width: parent.width
            height: parent.height

            Row
            {
                width: parent.width
                height: parent.height - 1
                LYMargin { width: R.dp(40) }
                CPText
                {
                    height: parent.height
                    font.pointSize: R.pt(22)
                    text: (no+1) + ". " + title
                    verticalAlignment: Text.AlignVCenter
                }
            }


            LYMargin
            {
                width: parent.width
                color: "black"
                visible: (listView.model.count-1) != index
            }
        }

        MouseArea
        {
            id: ma
            width: parent.width
            height: parent.height
            onClicked:
            {
                if(!opt.ds)
                    md.setCurrentIndex(no);
            }
        }

    }

    header:Rectangle
    {
        width: listView.width
        height: R.dp(100)
        color: "orange"
        CPText
        {
            height:parent.height
            font.pointSize: R.pt(20)
            text: "40가지 발명 원리"
            verticalAlignment: Text.AlignVCenter
            color: "white"
            anchors
            {
                left: parent.left
                leftMargin: R.dp(20)
            }
        }
    }

    footer: LYMargin
    {
        height: footerSize
    }
}
