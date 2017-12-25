import QtQuick 2.7
import "Resources.js" as R

TextEdit {
    readOnly: true
    wrapMode: TextEdit.Wrap /* If you want to use this property, please set 'width' */
    activeFocusOnPress: false
    text:
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
        당신의 어느 곳을 어루 만져야 하는지 무엇을 확인시켜 줘야 하는지도 알아요"

    color: "white"
    font.family: fontNanumBarunGothic.name
    FontLoader {
        id: fontNanumBarunGothic
        source: R.os() === "android" ? R.font("NanumBarunGothic_android.ttf") : R.font("NanumBarunGothic_ios.ttf")
    }
}
