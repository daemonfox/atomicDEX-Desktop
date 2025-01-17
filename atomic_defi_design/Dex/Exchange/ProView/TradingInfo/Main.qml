import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import Qaterial 1.0 as Qaterial

import Dex.Themes 1.0 as Dex
import "../../../Constants"
import "../../../Components"
import "../../Trade"
import "../../ProView"

Widget
{
    width: 580
    property alias currentIndex: tabView.currentIndex

    title: qsTr("Trading Information")

    background: null
    margins: 0

    Connections
    {
        target: exchange_trade
        function onOrderSelected() { tabView.currentIndex = 0; }
    }

    Qaterial.LatoTabBar
    {
        id: tabView
        property int pair_chart_idx: 0
        property int order_idx: 1
        property int history_idx: 2

        background: null
        Layout.leftMargin: 6

        Qaterial.LatoTabButton
        {
            text: qsTr("Chart")
            font.pixelSize: 14
            textColor: checked ? Dex.CurrentTheme.foregroundColor : Dex.CurrentTheme.foregroundColor2
            textSecondaryColor: Dex.CurrentTheme.foregroundColor2
            indicatorColor: Dex.CurrentTheme.foregroundColor
        }
        Qaterial.LatoTabButton
        {
            text: qsTr("Orders")
            font.pixelSize: 14
            textColor: checked ? Dex.CurrentTheme.foregroundColor : Dex.CurrentTheme.foregroundColor2
            textSecondaryColor: Dex.CurrentTheme.foregroundColor2
            indicatorColor: Dex.CurrentTheme.foregroundColor
        }
        Qaterial.LatoTabButton
        {
            text: qsTr("History")
            font.pixelSize: 14
            textColor: checked ? Dex.CurrentTheme.foregroundColor : Dex.CurrentTheme.foregroundColor2
            textSecondaryColor: Dex.CurrentTheme.foregroundColor2
            indicatorColor: Dex.CurrentTheme.foregroundColor
        }
    }

    Rectangle
    {
        Layout.fillHeight: true
        color: Dex.CurrentTheme.floatingBackgroundColor
        radius: 10
        Layout.preferredWidth: 580

        Qaterial.SwipeView
        {
            id: swipeView
            clip: true
            interactive: false
            currentIndex: tabView.currentIndex
            anchors.fill: parent

            ColumnLayout
            {
                Layout.fillHeight: true
                Layout.fillWidth: true
                spacing: 10
                // Chart
                Chart
                {
                    id: chart
                    Layout.topMargin: 20
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    Layout.fillHeight: true
                    Layout.minimumWidth: 555
                    Layout.minimumHeight: 200
                }

                PriceLineSimplified
                {
                    id: price_line
                    Layout.bottomMargin: 20
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }

            onCurrentIndexChanged:
            {
                swipeView.currentItem.update();
            }

            OrdersPage { clip: true }

            OrdersPage
            {
                is_history: true
                clip: true
            }
        }
    }
}
