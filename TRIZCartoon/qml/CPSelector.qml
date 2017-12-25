import QtQuick 2.0
import "Resources.js" as R
Rectangle
{
//    width: R.dp(500)
//    height: R.dp(200)
    signal evtSelect()
    id: combBox
    radius: 5
    border.width: 1
    property string selectedItemText: "여기를 눌러 특성을 선택하세요."
    property int selectedItemNo: 0
    color: ma.pressed ? R.color_buttonPressed : "white"

    CPText
    {
        width: parent.width
        height: R.dp(100)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: R.pt(18)
        text: selectedItemText
    }

    MouseArea
    {
        id: ma
        width: parent.width
        height: parent.height
        onClicked:
        {
              evtSelect()
        }
    }
}
