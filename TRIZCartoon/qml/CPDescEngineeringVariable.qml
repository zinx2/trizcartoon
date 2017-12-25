import QtQuick 2.0
import "Resources.js" as R
Column
{
//        width: R.design_size_width
//        height: R.design_size_height
    property int txtFontSize: R.pt(18)
    property int rightMargin: R.dp(120)
    CPSubtitle
    {
        id: subtitle
        anchors { left: parent.left; leftMargin: R.dp(20); }
        title : "공학변수"
    }
    LYMargin { height: R.dp(20) }
    CPDescText
    {
        fontSize: txtFontSize
        paddingRight: R.dp(rightMargin)
        desc: "<font color='"+ R.color_orange + "'>시스템의 주요 특성</font>을 나타내기 위해 사용하는 "
              +"<font color='" + R.color_orange + "'>기술적 변수와 특징</font>을 표현하는 일반화된 용어"
    }

    LYMargin { height: R.dp(30) }
    CPDescText
    {
        fontSize: txtFontSize
        paddingRight: R.dp(rightMargin)
        desc: "1946년부터 1970년대까지 알트슐러(Altshuller)와 그의 동료들이 전세계 특허를 조사해서 추출한 특성으로, "
              + "<font color='"+ R.color_orange + "'>39가지</font>가 있음"
    }

    LYMargin { height: R.dp(30) }
    CPDescText
    {
        fontSize: txtFontSize
        paddingRight: R.dp(rightMargin)
        desc: "움직이는 물체(Moving Object)<br>- 스스로 또는 외부의 힘에 의해 공간적 위치를 쉽게 변화시킬 수 있는 물체"
    }

    LYMargin { height: R.dp(30) }
    CPDescText
    {
        fontSize: txtFontSize
        paddingRight: R.dp(rightMargin)
        desc: "고정된 물체(Nonmoving Object)<br>- 스스로 또는 외부의 힘에 의해 공간적 위치를 쉽게 변화시킬 수 없는 물체"
    }
}
