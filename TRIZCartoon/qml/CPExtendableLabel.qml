import QtQuick 2.0
import "Resources.js" as R

Rectangle
{
    id: cpLabel
    width: parent.width
    height: {
        if(visible)
        {
            return extended ? (unitHeight + detailData1.height + detailData2.height + detailData3.height + detailData4.height + betweenContentMargin * 3) : unitHeight;
        }
        return 0;
    }

    property int no: -1
    property string type: "eng" /* eng : 공학변수, inv: 발명원리 */
    property string image_extended: R.image("goup.png")
    property string image_extendable: R.image("godown.png")
    property string image_desc: R.image("listhead.png")
    property string title_no: ""
    property string title_ko: "sample"

    property bool extended: false
    property int titleFontSize: R.pt(23)
    property int descFontSize: R.pt(18)
    property string contents1:
        "— Lyrics —
        I know just how to whisper And I know just how to cry
        어떻게 속삭여야 하는지 어떻게 울어야 하는지도 알아요
        I know just where to find the answers And I know just how to lie
        어디서 해답을 찾아야 하는지 어떻게 거짓말을 하는지도 알아요
        I know just how to fake it And I know just how to scheme
        어떻게 속이는지 어떻게 음모를 꾸미는지도 알아요
        I know just when to face the truth And then I know just when to dream
        언제 진실을 마주해야 하는지도 언제 꿈꾸어야 하는지도 알아요
        And I know just where to touch you And I know just what to prove
        당신의 어느 곳을 어루 만져야 하는지 무엇을 확인시켜 줘야 하는지도 알아요";
    property string contents2: ""
    property string contents3: ""
    property string contents4: ""

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

                CPText
                {
                    id: koTxt
                    text: title_ko
                    height: contentHeight
                    width: parent.width - R.dp(88) - noTxt.width //- contentHeight * 2
                    font.pointSize: {
//                        var height1 = contentHeight;
//                        var height2 = contentHeight / lineCount;
//                        console.log("linecount/ " + lineCount);
//                        if(lineCount > 1) return R.pt(20);
                        return titleFontSize;
                    }
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
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

        CPDescText
        {
            id: detailData1
            width: parent.width
            fontSize: descFontSize
            paddingRight: R.dp(120)
            visible: extended
            desc: contents1
        }
        LYMargin { height: R.dp(betweenContentMargin) }
        CPDescText
        {
            id: detailData2
            fontSize: descFontSize
            paddingRight: R.dp(120)
            visible: extended
            desc: contents2
        }
        LYMargin { height: R.dp(betweenContentMargin) }
        CPDescText
        {
            id: detailData3
            fontSize: descFontSize
            paddingRight: R.dp(120)
            visible: extended
            desc: contents3
        }
        LYMargin { height: R.dp(betweenContentMargin) }
        CPDescText
        {
            id: detailData4
            fontSize: descFontSize
            paddingRight: R.dp(100)
            visible: extended
            desc: contents4
        }
    }
}
