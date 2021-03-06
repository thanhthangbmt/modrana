import QtQuick 2.0
import "modrana_components"

IconGridPage {

    function getPage(menu) {
        if (menu == "RouteMenu") {
            // until we have a proper routing page just enable
            // a simplified routing mode right away :)
            rWin.mapPage.routingEnabled = true
            rWin.getPage(null)
            rWin.notify("Routing mode enabled", 3000)

        } else {
            // just do the normal thing
            return rWin.getPage(menu)
        }
    }

    model : ListModel {
        id : testModel
        ListElement {
            caption : "Search"
            icon : "search.png"
            menu : "SearchMenu"
        }

        // TODO: un-comment once implemented
        /*
        ListElement {
            caption : "POI"
            icon : "poi.png"
            menu : "PoiMenu"
        }
        */

        ListElement {
            caption : "Route"
            icon : "route.png"
            menu : "RouteMenu"
        }

        ListElement {
            caption : "Map"
            icon : "map.png"
            menu : "MapMenu"
        }

        // TODO: un-comment once
        // mode does something
        /*
        ListElement {
            caption : "Mode"
            icon : "mode.png"
            menu : "ModeMenu"
        }
        */

        ListElement {
            caption : "Tracks"
            icon : "tracklogs.png"
            menu : "TracksMenu"
        }
        ListElement {
            caption : "Info"
            icon : "info.png"
            menu : "InfoMenu"
        }
        ListElement {
            caption : "Options"
            icon : "3gears.png"
            menu : "OptionsMenu"
        }

        Component.onCompleted : {
            if (rWin.showUnfinishedFeatures) {
                testModel.append(
                    {"caption": "POI", "icon":"poi.png", "menu":""}
                )
                testModel.append(
                    {"caption": "Data", "icon":"download.png", "menu":""}
                )
            }
        }
    }
}