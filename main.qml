import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5

Window {
    width: 600
    height: 480
    visible: true

    Rectangle {
        id: base
        anchors.fill: parent
        state: "otherState"
        color: "lightgrey"

        Rectangle {
            id: leftRectagle
            x: 100
            y: 100
            width: 100
            height: 100
            radius: 5
            color: "green"
            Text {
                id: move
                anchors.centerIn: parent
                text: qsTr("MOVE")
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if ((circle.x + circle.width) < rightRectagle.x) {
                        circle.x += 10;
                        base.state = "otherState";
                    }
                    else base.state = "startState";
                }
            }
        }

        Rectangle {
            id: rightRectagle
            x: 400
            y: 100
            width: 100
            height: 100
            radius: 5
            color: "green"
            Text {
                id: back
                anchors.centerIn: parent
                text: qsTr("BACK")
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    base.state = "startState";
                }
            }
        }

        Rectangle {
            id: circle
            x: leftRectagle.x + 5
            y: leftRectagle.x + 5
            width: leftRectagle.width - 10
            height: leftRectagle.height - 10
            radius: leftRectagle.width / 2
            color: "transparent"
            border.color: "red"
            border.width: 5
        }

        states: [
            State {
                name: "startState"
                PropertyChanges {
                    target: circle
                    x: leftRectagle.x + 5
                }
            },
            State {
                name: "otherState"
                PropertyChanges {
                    target: circle
                    x: circle.x
                }
            }
        ]

        transitions: [
            Transition {
                from: "otherState"
                to: "startState"

                NumberAnimation {
                    target: circle
                    property: "x"
                    duration: 500
                    easing.type: Easing.OutBounce
                }
            }
        ]
    }
}
