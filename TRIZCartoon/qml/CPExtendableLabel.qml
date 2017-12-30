import QtQuick 2.0
import "Resources.js" as R

Rectangle
{
    id: cpLabel
    width: parent.width
    height: R.dp(50)

    property int no: -1
    property string title_no: ""
    property string title_ko: "sample"
    property int titleFontSize: R.pt(23)

    property int txtContentHeight: koTxt.contentHeight
    property int unitHeight: txtContentHeight + R.dp(40)
    property int imageHeight: R.dp(48)
    property int betweenContentMargin: R.dp(15)

    signal _clicked()

    Column
    {
        id: dataLayout
        width: parent.width
        height: parent.height

        Rectangle
        {
            id: metaData
            width: parent.width
            height: unitHeight
            color: ma.pressed ? R.color_buttonPressed : cpLabel.color

            Row
            {
                width: parent.width
                height: unitHeight
                LYMargin { width: R.dp(20) }
                Image
                {
                    anchors.verticalCenter: parent.verticalCenter
                    source: extended ? image_extended : image_extendable
                    width: imageHeight
                    height: imageHeight
                }
                LYMargin { width: R.dp(20) }
                CPText
                {
                    id: noTxt
                    text: title_no
                    height: txtContentHeight
                    font.pointSize: titleFontSize
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                    visible: type == "eng"
                }
            }


            MouseArea {
                id: ma
                anchors.fill: parent
                onClicked: {
                    md.extend(type, no);
                }
            }
        }
    }
}
