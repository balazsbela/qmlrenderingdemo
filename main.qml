import QtQuick 2.0
import QtQuick.Controls 1.4

import com.models 1.0


ApplicationWindow {
    visible: true
    title: qsTr("Repeater example")
    width: 1366
    height: 720

    QQmlVariantListModel
    {
        id: modelTest
    }

    //    ListModel {
    //        id: modelTest
    //        onCountChanged:
    //        {
    //            //console.log("Count changed!")
    //        }
    //    }


    Rectangle {
        id:rectangle
        width:1366
        height:500

        function populateModelNoList()
        {
            console.log(slider.value)
            console.time("append")

            repeater.model = undefined;
            modelTest.clear();

            for (var i =0; i < slider.value; i++ )
            {
                modelTest.append({ "bg" : Qt.hsla (Math.random (), 0.85, 0.45, 1.0).toString (),
                                   "height" : i + 100
                                 });
            }

            repeater.model = modelTest;

            console.timeEnd("append")

        }

        function populateModel()
        {
            console.log(slider.value)
            console.time("append")

            var list = [];

            for (var i =0; i < slider.value; i++ )
            {
                //              console.log("appending")
                list[i] = { "bg" : Qt.hsla (Math.random (), 0.85, 0.45, 1.0).toString (),
                            "height" : i + 100 };
            }

            modelTest.clear();
            modelTest.appendList(list);

            console.timeEnd("append")

        }


        Timer {
            id: timer
            interval: 17;
            onTriggered: { rectangle.populateModelNoList() }
        }


        Flow {
            anchors.fill: parent;

            // Replace with Repeater to experience slowness
            ListView {
                id:repeater
                model: modelTest
                spacing: 1
                orientation: Qt.Horizontal
                //                    onItemAdded:
                //                    {
                ////                        console.log("Repeater item added!")
                //                    }

                anchors.fill: parent
                focus:true
                delegate:
                    Rectangle {
                    id: rect;
                    color: model.qtVariant.bg;
                    width: 5
                    opacity: 0.5
                    height:model.qtVariant.height
                    scale: 1.0
                    PropertyAnimation {
                        target: rect;
                        property: "opacity";
                        from: 0.1;
                        to: 1.0;
                        duration: 1000;
                        running: true;
                        loops: 1;
                    }
                }
            }
        }
    }

    Slider
    {
        id: slider
        height:60
        width:500
        maximumValue: 100000.0
        stepSize: 1.0

        onValueChanged: {
            timer.start()
        }
    }
}
