import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.12
import "../Components"
import "../Constants"

// Open Enable Coin Modal
Popup {
    id: root
    anchors.centerIn: Overlay.overlay
    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
    width: 365

    // Inside modal
    ColumnLayout {
        width: parent.width
        // Title
        DefaultText {
            text: qsTr("Send")
            font.pointSize: Style.textSize2
        }

        // Send address
        TextFieldWithTitle {
            id: input_address
            title: qsTr("Recipient's address")
            field.placeholderText: qsTr("Enter address of the recipient")
        }

        // Amount input
        TextFieldWithTitle {
            id: input_amount
            title: qsTr("Amount to send")
            field.placeholderText: qsTr("Enter the amount to send")
            field.validator: RegExpValidator {
                regExp: /(0|([1-9][0-9]*))(\.[0-9]{1,8})?/
            }
        }

        // Buttons
        RowLayout {
            Button {
                text: qsTr("Close")
                Layout.fillWidth: true
                onClicked: root.close()
            }
            Button {
                text: qsTr("Send")
                Layout.fillWidth: true
                onClicked: () => {
                    if(input_amount.field.acceptableInput)
                        console.log("Send to " + input_address.field.text + ", amount: " + input_amount.field.text)
                    else {
                        console.log("Input not acceptable " + input_amount.field.text)
                    }
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:600;width:1200}
}
##^##*/