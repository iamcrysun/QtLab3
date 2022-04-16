import QtQuick 6.0
import QtQuick.Window 6.0
import QtQuick.Controls 6.0// это версия библиотеки, содержащей Contol (аналоги виджетов) для версии Qt 5.6
import QtQuick.Layouts 6.0


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("И ленин такой молодой!")

    // объявляется системная палитра
    SystemPalette {
          id: palette;
          colorGroup: SystemPalette.Active
       }

    Rectangle{
        radius: 20
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: btnAdd.top
        border.color: "#e1e7d6"

        ListView {
            id: stamplist
            anchors.fill: parent
            model: stampModel // назначение модели, данные которой отображаются списком
            delegate: DelegateForStamp{}
            clip: true //
            activeFocusOnTab: true  // реагирование на перемещение между элементами ввода с помощью Tab
            focus: true  // элемент может получить фокус
        }
   }

    RoundButton {
        id: btnAdd
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.rightMargin: 8
        anchors.right:btnEdit.left
        text: "Добавить"
        width: 100

        onClicked: windowAdd.show()
    }

    RoundButton {
        id: btnEdit
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.right: btnDel.left
        anchors.rightMargin: 8
        text: "Редактировать"
        width: 100

        onClicked: {
            var nameSt = stamplist.currentItem.personData.nameSt
            var yearSt = stamplist.currentItem.personData.yearSt
            var countSt = stamplist.currentItem.personData.countSt
            var countrySt = stamplist.currentItem.personData.countrySt

            windowEdit.execute(nameSt, countrySt, yearSt, countSt, stamplist.currentIndex)
        }
    }

    RoundButton {
        id: btnDel
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.right:parent.right
        anchors.rightMargin: 8
        text: "Удалить"
        width: 100
        enabled: stamplist.currentIndex >= 0
        onClicked: del(stamplist.currentIndex)
    }

    SpinBox {
                id: textSelArea
                Layout.fillWidth: true
                editable: true
                from: 0
                to: 2147483647
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.leftMargin: 8
                anchors.right: btndel.right
                anchors.rightMargin: 8
            }
            RoundButton {
                id: butCount
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 8
                anchors.left: textSelArea.right
                anchors.leftMargin: 8
                text: "Подсчитать"
                width: 100
                enabled: textSelArea.text !== ""
                onClicked: windowCount.countStamps(textSelArea.value)
            }


    DialogForAdd {
        id: windowAdd
    }
    DialogForEdit{
        id: windowEdit
    }

    DialogForCount {
        id: windowCount
    }
}
