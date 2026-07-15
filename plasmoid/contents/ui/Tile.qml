import QtQuick 2.15
import QtQuick.Layouts
import org.kde.plasma.plasmoid

Item {
    property int number
    property real speed
    property int margin: parent.height/40
    property string backgroundColor: Plasmoid.configuration.backgroundColor
    property int bgopacity: Plasmoid.configuration.bgopacity

    Layout.minimumHeight: 50
    Layout.minimumWidth: 50
    Layout.fillHeight: true
    implicitWidth: height

    Image {
        anchors.fill: parent
        source: "../image/bg/"+backgroundColor+".png"
            smooth: false
            opacity: Plasmoid.configuration.bgopacity
    }
    Digit {
        anchors {
            top: parent.top
            left: parent.left
            bottom: parent.bottom
            margins: margin
            rightMargin: 0
        }
        width: parent.width/2
        digit: Math.floor(number/10)
        speed: parent.speed-0.25
    }
    Digit {
        anchors {
            top: parent.top
            right: parent.right
            bottom: parent.bottom
            margins: margin
            leftMargin: 0
        }
        width: parent.width/2
        digit: number%10
        speed: parent.speed
    }
}
