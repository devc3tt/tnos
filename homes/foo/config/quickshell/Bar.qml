import Quickshell
import QtQuick
import QtQuick.Layouts

import "widgets"

PanelWindow {
    implicitHeight: 30
    anchors {
        top: true
        left: true
        right: true
    }
    RowLayout {
        anchors.fill: parent
        spacing: 5
        Layout.preferredHeight: parent.height
        Clock {}
    }
    Row {
        spacing: 5
        anchors.centerIn: parent
        anchors.verticalCenter: parent.verticalCenter
        Text {
            text: "hi"
        }
    }
    RowLayout {
        anchors.fill: parent
        spacing: 5
        layoutDirection: Qt.RightToLeft
        Text {
            text: "hi"
        }
    }
}
