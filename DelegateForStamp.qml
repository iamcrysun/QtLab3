import QtQuick 6.0
import QtQuick.Controls 6.0  // это версия библиотеки, содержащей Contol (аналоги виджетов) для версии Qt 5.6
import QtQuick.Layouts 6.0

Rectangle {
    id: stampItem
    radius: 20
    readonly property color evenBackgroundColor: "#e1e7d6"  // цвет для четных пунктов списка
    readonly property color oddBackgroundColor: "#ffffff"   // цвет для нечетных пунктов списка
    readonly property color selectedBackgroundColor: "#bbe590"  // цвет выделенного элемента списка

    property bool isCurrent: stampItem.ListView.view.currentIndex === index   // назначено свойство isCurrent истинно для текущего (выделенного) элемента списка
    property bool selected: stampItemMouseArea.containsMouse || isCurrent // назначено свойство "быть выделенным",
    //которому присвоено значение "при наведении мыши,
    //или совпадении текущего индекса модели"

    property variant personData: model // свойство для доступа к данным конкретного студента

    width: parent ? parent.width : stamplist.width
    height: 200
    // состояние текущего элемента (Rectangle)
    states: [
        State {
            when: selected
            // как реагировать, если состояние стало selected
            PropertyChanges { target: stampItem;  // для какого элемента должно назначаться свойство при этом состоянии (selected)
                color: isCurrent ? "#aac370" : "#bbe590"  /* какое свойство целевого объекта (Rectangle)
                                                                                                  и какое значение присвоить*/
            }
        },
        State {
            when: !selected
            PropertyChanges { target: stampItem;  color: isCurrent ? palette.highlight : index % 2 == 0 ? evenBackgroundColor : oddBackgroundColor }
        }
    ]

    MouseArea {
        id: stampItemMouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            stampItem.ListView.view.currentIndex = index
            stampItem.forceActiveFocus()

        }
    }
    Item {
        id: itemOfstampents
        width: parent.width
        height: 160
        Column{
            id: t2
            anchors.left: parent.left
            anchors.leftMargin: 10
            width: 240
            anchors.verticalCenter: parent.verticalCenter
            Text {
                id: textn
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Название марки"
                color: "#2a3b11"
                font.pointSize: 12
                font.family: "Segoe Script"
            }
            Text {
                id: textName
                anchors.horizontalCenter: parent.horizontalCenter
                text: nameSt
                color: "#53994c"
                font.pointSize: 18
                font.bold: true
            }
        }
        Column{
            anchors.left: t2.right
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            Text {

                text: "Год"
                color: "#2a3b11"
                font.pointSize: 10
                font.family: "Segoe Script"
            }
            Text {
                id: textYear
                text: yearSt
                color: "#53994c"
                font.pointSize: 12
            }
            Text {

                text: "Тираж"
                color: "#2a3b11"
                font.pointSize: 10
                font.family: "Segoe Script"
            }
            Text {
                id: textCount
                color: "#53994c"
                text: countSt
                font.pointSize: 12
            }

            Text {   
                text: "Cтрана"
                color: "#2a3b11"
                font.pointSize: 10
                font.family: "Segoe Script"
            }
            Text {
                id:textCountry
                color: "#53994c"
                text: countrySt
                font.pointSize: 12
            }
        }

    }
}
