import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Private 1.0
import "Resources.js" as R
ComboBox
{
    id: combBox
    currentIndex: 0
    width: parent.width
    height: parent.height



//    currentIndex: 2
//    activeFocusOnPress: true

    style: ComboBoxStyle {
        id: comboBox
        background: Rectangle {
            id: rectCategory
            color: "white"
            border.width: 1
            border.color: R.color_appTitlebar
            width: combBox.width
            height: combBox.height
            radius: 5

            MouseArea
            {
                width: parent.width
                height: parent.width

                onClicked:
                {
                    console.log("clicked!!");
                }
            }
        }
        label: Text {
            width: combBox.width
            height: combBox.height
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 15
            font.family: fontNanumBarunGothic.name
            color: "black"
            text: control.currentText

            FontLoader {
                id: fontNanumBarunGothic
                source: R.os() === "android" ? R.font("NanumBarunGothic_android.ttf") : R.font("NanumBarunGothic_ios.ttf")
            }
        }
    }

    onActivated:
    {
        console.log("Activated~");
    }

    onAccepted:
    {
        console.log("Accepted~");
    }

    //    dropDownButtonWidth: parent.width

    //    style : ComboBoxStyle {
    //        background: Rectangle {
    //            color: "white"
    //            border.width: 1
    //        }
    //        label: Text {
    //                verticalAlignment: Text.AlignVCenter
    //                horizontalAlignment: Text.AlignHCenter
    //                font.pointSize: R.pt(25)
    //                font.family: fontNanumBarunGothic.name
    //                color: "black"
    //                text: model.modelData.name
    //                //text: opt.ds ? name : model.modelData.name // control.currentText
    //            }
    //    }







    //    model: [ "A", "B", "C", "D" ]
}
