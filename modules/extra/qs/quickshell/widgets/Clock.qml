import Quickshell
import QtQuick
import QtQuick.Layouts

Item {
    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
    Text {
        id: clockText
        text: Qt.formatDateTime(clock.date, "hh:mm  dd-MM")
    }
}
