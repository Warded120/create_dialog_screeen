/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick 6.3
import QtQuick.Controls 6.3
import ToDoList
import QtQuick.Layouts 1.0

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    color: "#234567"

    property bool isopen: false

    Label{
        id:header
        width: Constants.width
        height: 35
        text: qsTr("Goals:")
        horizontalAlignment: "AlignHCenter"
        verticalAlignment: "AlignVCenter"
        font.pointSize: 20
    }

    Column{        
        width:400
        spacing: 10
        anchors.top: header.bottom
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 25

        Repeater{
            id: repeater
            model: ListModel{
                id:myListModel

                ListElement{name: "Set a goal"}

                function addgoal() {
                    return{"name":inputvar.text}
                }
            }
            Rectangle{
                id:task
                width:400
                height: 75
                color:"#345678"
                radius: 30

                CheckBox{
                    id:checkbox
                    height: 25
                    text: name
                    anchors.left:parent.left
                    anchors.leftMargin: 15
                    anchors.top:parent.top
                    anchors.topMargin: 25
                    font.pointSize: 14
                }
            }
        }
    }

    Rectangle{
        id:pop_up
        width: 400
        height: 150
        color: "#345678"
        radius: 30
        visible: rectangle.isopen

        anchors.bottom: add_cancel.top
        anchors.bottomMargin: 25
        anchors.left: parent.left
        anchors.leftMargin: 40
        anchors.right: parent.right
        anchors.rightMargin: 40

        TextField{
            id:inputvar
            width:350
            height: 75
            font.pointSize: 14
            horizontalAlignment: "AlignHCenter"
            wrapMode: "Wrap"
            maximumLength: 99

            placeholderText: qsTr("Enter a goal")

            anchors.top: pop_up.top
            anchors.topMargin: 10
            anchors.right: pop_up.right
            anchors.rightMargin: 25
        }

        RoundButton{
            id:add
            width:150
            text: qsTr("Add")

            anchors.left: pop_up.left
            anchors.leftMargin: 40
            anchors.bottom:  pop_up.bottom
            anchors.bottomMargin: 10

            Connections {
                target: add
                onClicked: myListModel.append(myListModel.addgoal())
            }
            Connections {
                target: add
                onClicked: rectangle.isopen = false
            }
            Connections {
                target: cancel
                onClicked: inputvar.text = ""
            }
        }
        RoundButton{
            id:cancel
            width:150
            text: qsTr("Cancel")

            anchors.right: pop_up.right
            anchors.rightMargin: 40
            anchors.bottom:  pop_up.bottom
            anchors.bottomMargin: 10

            Connections {
                target: cancel
                onClicked: rectangle.isopen = false
            }
            Connections {
                target: cancel
                onClicked: inputvar.text = ""
            }
        }
    }

    RoundButton {
        id: add_cancel
        text: qsTr("Create a task")
        width: 430

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 25

        anchors.horizontalCenter: parent.horizontalCenter

        Connections {
            target: add_cancel
            onClicked: rectangle.isopen = !rectangle.isopen
        }
    }
    states: [
        State {
            name: "clicked"
            when: add_cancel.checked
        }
    ]
}
