import QtQuick 2.0
import "Resources.js" as R

ListView {
    clip: true    
    property string footerSize : R.dp(800)
    model: opt.ds ? ds_model : md.eng
    boundsBehavior: Flickable.StopAtBounds
    maximumFlickVelocity: R.design_size_height
    delegate: CPExtendableLabel {
        type: opt.ds ? "eng" : model.modelData.type
        no: opt.ds ? number : model.modelData.id
        title_no: {
            if(opt.ds)
                return number;

            if(model.modelData.id > -1)
                return model.modelData.error ? "" : (model.modelData.id + 1) + ". ";

            return "";
        }
        title_ko: opt.ds ? name : model.modelData.name
        contents1: opt.ds ? content : model.modelData.desc1
        contents2: opt.ds ? content : model.modelData.desc2
        contents3: opt.ds ? content : model.modelData.desc3
        contents4: opt.ds ? content : model.modelData.desc4
        visible: opt.ds ? "true" : model.modelData.visibled
        extended: opt.ds ? "true" :  model.modelData.extended
    }

    header:LYMargin
    {
        height: R.dp(10)
    }

    footer: LYMargin
    {
        height: footerSize
    }


    ListModel {
                    id: ds_model
                    ListElement {
                        name: "Bill SmithBill SmithBill SmithBill SmithBill SmithBill SmithBill SmithBill SmithBill SmithBill SmithBill SmithBill SmithBill SmithBill SmithBill SmithBill SmithBill SmithBill Smith"
                        number: "0"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        text: "AAA"
                        visibled: true
                    }
                    ListElement {
                        name: "John Brown"
                        number: "1"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        text: "BBB"
                        visibled: true
                    }
                    ListElement {
                        name: "Sam Wise"
                        number: "2"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        text: "CCC"
                        visibled: true
                    }
                    ListElement {
                        name: "Bill Smith"
                        number: "3"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        text: "DDD"
                        visibled: true
                    }
                    ListElement {
                        name: "John Brown"
                        number: "4"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        text: "EEE"
                        visibled: true
                    }
                    ListElement {
                        name: "Sam Wise"
                        number: "5"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        text: "FFF"
                        visibled: true
                    }
                    ListElement {
                        name: "Bill Smith"
                        number: "6"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        visibled: true
                    }
                    ListElement {
                        name: "John Brown"
                        number: "7"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        visibled: true
                    }
                    ListElement {
                        name: "Sam Wise"
                        number: "8"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        visibled: true
                    }
                    ListElement {
                        name: "Bill Smith"
                        number: "9"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        visibled: true
                    }
                    ListElement {
                        name: "John Brown"
                        number: "10"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        visibled: true
                    }
                    ListElement {
                        name: "Sam Wise"
                        number: "11"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        visibled: true
                    }
                    ListElement {
                        name: "Bill Smith"
                        number: "12"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        visibled: true
                    }
                    ListElement {
                        name: "John Brown"
                        number: "13"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        visibled: true
                    }
                    ListElement {
                        name: "Sam Wise"
                        number: "14"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        visibled: true
                    }
                    ListElement {
                        name: "Bill Smith"
                        number: "15"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        visibled: true
                    }
                    ListElement {
                        name: "John Brown"
                        number: "16"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        visibled: true
                    }
                    ListElement {
                        name: "Sam Wise"
                        number: "17"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        visibled: true
                    }
                    ListElement {
                        name: "Bill Smith"
                        number: "18"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        visibled: true
                    }
                    ListElement {
                        name: "John Brown"
                        number: "19"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        visibled: true
                    }
                    ListElement {
                        name: "Sam Wise"
                        number: "20"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        visibled: true
                    }
                    ListElement {
                        name: "Bill Smith"
                        number: "21"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        visibled: true
                    }
                    ListElement {
                        name: "John Brown"
                        number: "22"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        visibled: true
                    }
                    ListElement {
                        name: "Sam Wise"
                        number: "23"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        visibled: true
                    }
                }
}
