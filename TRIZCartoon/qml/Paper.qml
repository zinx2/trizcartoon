import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "Resources.js" as R

Rectangle {

    property bool visibleBackBtn : true
    property string titleText : R.string_title
    signal evtBack()

    width: opt.ds ? R.design_size_width : parent.width
    height: opt.ds ? R.design_size_height : parent.height

    Rectangle
    {
        id: titleBar
        height: R.height_titlaBar
        width: parent.width
        color: R.color_appTitlebar

        CPButton
        {
            id: btnBack
            x: 0; y: 0
            visible: visibleBackBtn
            width: parent.height
            height: parent.height
            sourceWidth: R.dp(100)
            sourceHeight: R.dp(100)
            type: "image"
            on_Clicked:
            {
                evtBack()
            }
        }

        Label
        {
            width: parent.width
            height: parent.height
            text: titleText
            color: R.color_appTitleText
            horizontalAlignment : Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: R.pt(24)
            font.family: fontNanumBarunGothic.name
            FontLoader {
                id: fontNanumBarunGothic
                source: R.os() === "android" ? R.font("NanumBarunGothic_android.ttf") : R.font("NanumBarunGothic_ios.ttf")
            }
        }
    }
}
