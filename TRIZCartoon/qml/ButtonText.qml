import QtQuick 2.4
import "Resources.js" as R

Rectangle {
    id:btn
    width: isRec ? parent.width : txt.paintedWidth+sideMargins*2
    height:isRec ? R.HEIGHT_M : txt.paintedHeight
    color: "transparent"
    border.color: "transparent"
    radius: G.MARGIN_S
    opacity:{
        if(isPressedOpacity && active)ma.pressed?pressedOpacity : 1
        else 1
    }
    //// Signal //////////////////////////////////////////////////////////
    signal _clicked()


    //// Properties /////////////////////////////////////////////////////
    property int     align : 1                    //0:왼쪽 정렬, 1:가운데 정렬, 2:오른쪽 정렬
    property real   sideMargins : 0//G.MARGIN_M
    property real   margins : R.MARGIN_M

    property string text: "텍스트ddd"          //텍스트
    property color  textColor : "white"
    property int     fontSize: R.font_ML   //글사이즈
    property int     fontType  : 0
    property color  textStrokeColor : "transparent"   //글자 스트로크
    property bool  fontBold : false
    property real    lineHeight : txt.lineCount==1?1 : G.TEXT_LINE_HEIGHT_M

    property real    rectOpacity : 0.3
    property color  inactiveColor : "gray"
    property string rectColor : isRec ? "white":"transparent"
    property string pressedColor : isRec ? R.COLOR_Cyan : "transparent"
    property color  pressedTextColor : textColor
    property real    pressedOpacity : 0.6
    property bool  isPressedOpacity : pressedColor=="transparent"

    property bool  hoverEnabled : true
    property color hoverdColor : rectColor

    property bool active : true
    property alias mouseArea: ma
    property int     mouseAreaMargin : - R.MARGIN_XS
    property bool  isRec : false


    //// Component ////////////////////////////////////////////////////

    Rectangle{// 배경만 투명도가 들어갈때가 있어서 따로 만듦.
        visible: pressedColor!="transparent" || rectColor!="transparent" || ( hoverEnabled && ma.containsMouse )
        color: {
            if(ma.containsMouse )  ma.pressed ? pressedColor : hoverdColor
            else rectColor //pressedColor
        }
        anchors.fill: parent
        radius: parent.radius
        border.color:parent.border.color
        border.width: parent.border.width
        opacity: active? rectOpacity : 0.4
    }

    ExtendedText {
        id:txt
        text: btn.text
        anchors{
            verticalCenter:parent.verticalCenter;
            horizontalCenter: if(align==1) parent.horizontalCenter
            left: if(align==0) parent.left
            margins: btn.margins
        }
        font.pixelSize: fontSize
        color: ma.pressed?pressedTextColor :textColor
        style :Text.Outline;
        styleColor: textStrokeColor
        font.bold: fontBold
        lineHeight: btn.lineHeight
//        fontType: btn.fontType
    }

    MouseArea {
        id:ma
        visible: active
        anchors.fill: parent
        anchors.margins: mouseAreaMargin
        hoverEnabled: btn.hoverEnabled
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            btn._clicked()
        }
    }
}
