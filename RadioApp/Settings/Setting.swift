//
//  Settings.swift
//  RadioApp
//
//  Created by Chris Herlemann on 2020-04-26.
//  Copyright © 2020 Chris Herlemann. All rights reserved.
//

import SwiftUI

struct Setting: Identifiable {
    var id = UUID()
    var name: String
   @Binding var enabled: Bool
   
}

#if DEBUG

let testSettings = [
      Setting(name: "Download nur über WLAN", enabled: .constant(true)),
      Setting(name: "Abonnierte Podcast automatisch herunterladen", enabled: .constant(false)),
      Setting(name: "Gemertke Audios und Videos automatisch herunterladen", enabled: .constant(false)),
      Setting(name: "Audio Stream Qualität HQ", enabled: .constant(true)),
      Setting(name: "Profil anzeigen", enabled: .constant(true)),
      Setting(name: "Abmelden", enabled: .constant(false)),
      Setting(name: "Profil löschen", enabled: .constant(false)),
      Setting(name: "Benachrichtigungen", enabled: .constant(true)),
      Setting(name: "Anonyme Statistik übermitteln", enabled: .constant(true)),
      Setting(name: "FAQ", enabled: .constant(true)),
      Setting(name: "Kontakt", enabled: .constant(false)),
      Setting(name: "Impressum", enabled: .constant(false)),
      Setting(name: "Datenschutz", enabled: .constant(true)),
]

//let testSettings = [
//   "Datenmanager" :
//   [
//      Setting(name: "Download nur über WLAN", enabled: .constant(true)),
//      Setting(name: "Abonnierte Podcast automatisch herunterladen", enabled: .constant(false)),
//      Setting(name: "Gemertke Audios und Videos automatisch herunterladen", enabled: .constant(false)),
//      Setting(name: "Audio Stream Qualität HQ", enabled: .constant(true)),
//   ],
//   "Benutzereinstellungen":
//   [
//      Setting(name: "Profil anzeigen", enabled: .constant(true)),
//      Setting(name: "Abmelden", enabled: .constant(false)),
//      Setting(name: "Profil löschen", enabled: .constant(false)),
//      Setting(name: "Benachrichtigungen", enabled: .constant(true)),
//      Setting(name: "Anonyme Statistik übermitteln", enabled: .constant(true))
//   ],
//   "Service" :
//   [
//      Setting(name: "FAQ", enabled: .constant(true)),
//      Setting(name: "Kontakt", enabled: .constant(false)),
//      Setting(name: "Impressum", enabled: .constant(false)),
//      Setting(name: "Datenschutz", enabled: .constant(true)),
//   ]
//]
#endif
