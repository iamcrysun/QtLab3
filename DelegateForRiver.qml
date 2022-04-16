import QtQuick 6.0
import QtQuick.Controls 6.0  // это версия библиотеки, содержащей Contol (аналоги виджетов) для версии Qt 5.6
import QtQuick.Layouts 6.0

Rectangle {
    id: rivItem
    readonly property color evenBackgroundColor: "#E0FFFF"  // цвет для четных пунктов списка
    readonly property color oddBackgroundColor: "#B0C4DE"   // цвет для нечетных пунктов списка
    readonly property color selectedBackgroundColor: "#00FFFF"  // цвет выделенного элемента списка

    property bool isCurrent: rivItem.ListView.view.currentIndex === index   // назначено свойство isCurrent истинно для текущего (выделенного) элемента списка
    property bool selected: rivItemMouseArea.containsMouse || isCurrent // назначено свойство "быть выделенным",
    //которому присвоено значение "при наведении мыши,
    //или совпадении текущего индекса модели"

    property variant riverData: model // свойство для доступа к данным конкретного студента

    width: parent ? parent.width : rivList.width
    height: 160

    // состояние текущего элемента (Rectangle)
    states: [
        State {
            when: selected
            // как реагировать, если состояние стало selected
            PropertyChanges { target: rivItem;  // для какого элемента должно назначаться свойство при этом состоянии (selected)
                color: isCurrent ? palette.highlight : selectedBackgroundColor  /* какое свойство целевого объекта (Rectangle)
                                                                                                  и какое значение присвоить*/
            }
        },
        State {
            when: !selected
            PropertyChanges { target: rivItem;  color: isCurrent ? palette.highlight : index % 2 == 0 ? evenBackgroundColor : oddBackgroundColor }
        }
    ]

    MouseArea {
        id: rivItemMouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            rivItem.ListView.view.currentIndex = index
            rivItem.forceActiveFocus()
        }
    }
    Item {
        id: itemOfRivers
        width: parent.width
        height: 160
        Column{
            id: t2
            anchors.left: parent.left
            anchors.leftMargin: 10
            width: 240
            anchors.verticalCenter: parent.verticalCenter
            Text {
                id: t1
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Название реки:"
                color: "DarkBlue"
                font.pointSize: 12
            }
            Text {
                id: textName
                anchors.horizontalCenter: parent.horizontalCenter
                text: nameOfRiver
                color: "DarkBlue"
                font.pointSize: 18
                font.bold: true
            }
        }
        Column{
            anchors.left: t2.right
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            Text {
                text: "Протяженность:"
                color: "DarkBlue"
                font.pointSize: 10
            }
            Text {
                id: textLenght
                text: lenghtOfRiver
                color: "DarkBlue"
                font.pointSize: 12
                font.bold: true
            }
            Text {
                text: "Куда впадает:"
                color: "DarkBlue"
                font.pointSize: 10
            }
            Text {
                id: textFlow
                color: "DarkBlue"
                text: flowOfRiver
                font.pointSize: 12
                font.bold: true
            }
            Text {
                text: "Годовой сток:"
                color: "DarkBlue"
                font.pointSize: 10
            }
            Text {
                id: textRunoff
                text: runoffOfRiver
                color: "DarkBlue"
                font.pointSize: 12
                font.bold: true
            }
            Text {
                text: "Площадь бассейна:"
                color: "DarkBlue"
                font.pointSize: 10
            }
            Text {
                id: textArea
                color: "DarkBlue"
                text: areaOfRiver
                font.pointSize: 12
                font.bold: true
            }
        }

    }
}
