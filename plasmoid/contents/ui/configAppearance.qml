import QtQuick 2.15
import QtCore
import QtQuick.Controls as QtControls
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

Kirigami.FormLayout {
    property alias cfg_use12HourClock: use12HourClockCheckBox.checked
    property alias cfg_showSeconds: showSecondsCheckBox.checked
    property alias cfg_doFlip: doFlipCheckBox.checked
    property alias cfg_fgopacity: fgopacitySlider.value
    property alias cfg_bgopacity: bgopacitySlider.value
    property string cfg_theme
    property string cfg_backgroundColor

    property var cfg_use12HourClockDefault
    property var cfg_showSecondsDefault
    property var cfg_doFlipDefault
    property var cfg_themeDefault
    property var cfg_fgopacityDefault
    property var cfg_bgopacityDefault
    property var cfg_backgroundColorDefault

    property var backgroundColors: ["red", "green", "blue", "cyan", "magenta", "yellow", "pink", "gray"]
    property var themes: ["asoul", "gelbooru", "moebooru", "rule34"]

    Kirigami.FormLayout {
        RowLayout {
            QtControls.CheckBox {
                id: use12HourClockCheckBox
                text: i18n("Use 12-hour clock")
            }
        }
        RowLayout {
            QtControls.CheckBox {
                id: showSecondsCheckBox
                text: i18n("Show seconds")
            }
        }
        RowLayout {
            QtControls.CheckBox {
                id: doFlipCheckBox
                text: i18n("Flip the digits")
            }
        }
        RowLayout {
            QtControls.Label {
                text: i18n("Digits theme:")
            }
            QtControls.ComboBox {
                id: themeComboBox
                model: themes
                currentIndex: themes.indexOf(cfg_theme)
                onCurrentIndexChanged: cfg_theme = themes[themeComboBox.currentIndex]
            }
        }
        RowLayout {
            QtControls.Label{
                text: i18n("Background color:")
            }
            QtControls.ComboBox {
                id: backgroundColorComboBox
                model: backgroundColors
                currentIndex: backgroundColors.indexOf(cfg_backgroundColor)
                onCurrentIndexChanged: cfg_backgroundColor = backgroundColors[backgroundColorComboBox.currentIndex]
            }
        }
        RowLayout {
            Kirigami.FormData.label: i18n("Digits opacity:")
            QtControls.Slider {
                id: fgopacitySlider
            }
            QtControls.Label {
                text: Math.round(fgopacitySlider.value*100).toString()
            }
        }
        RowLayout {
            Kirigami.FormData.label: i18n("Background opacity:")
            QtControls.Slider {
                id: bgopacitySlider
            }
            QtControls.Label {
                text: Math.round(bgopacitySlider.value*100).toString()
            }
        }
    }
}
