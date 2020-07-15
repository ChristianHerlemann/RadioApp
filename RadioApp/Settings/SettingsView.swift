//
//  SettingsView.swift
//  RadioApp
//
//  Created by Chris Herlemann on 2020-04-23.
//  Copyright © 2020 Chris Herlemann. All rights reserved.
//

import SwiftUI

struct Settings: View {
   
   let settings: [Setting]
   
   var body: some View {
      
      List {
         Section(header: CustomeHeader(), footer: CustomeFooter()) {
            SettingsRow(setting: settings.first!, turnedOn: settings.first!.$enabled)
            SettingsRow(setting: settings.first!, turnedOn: settings.first!.$enabled)
            SettingsRow(setting: settings.first!, turnedOn: settings.first!.$enabled)
            SettingsRow(setting: settings.first!, turnedOn: settings.first!.$enabled)
            SettingsRow(setting: settings.first!, turnedOn: settings.first!.$enabled)
         }
         Section(header: CustomeHeader(), footer: CustomeFooter()) {
            SettingsRow(setting: settings.first!, turnedOn: settings.first!.$enabled)
            SettingsRow(setting: settings.first!, turnedOn: settings.first!.$enabled)
            SettingsRow(setting: settings.first!, turnedOn: settings.first!.$enabled)
            SettingsRow(setting: settings.first!, turnedOn: settings.first!.$enabled)
            SettingsRow(setting: settings.first!, turnedOn: settings.first!.$enabled)
         }
         Section(header: CustomeHeader(), footer: CustomeFooter()) {
            SettingsRow(setting: settings.first!, turnedOn: settings.first!.$enabled)
            SettingsRow(setting: settings.first!, turnedOn: settings.first!.$enabled)
            SettingsRow(setting: settings.first!, turnedOn: settings.first!.$enabled)
            SettingsRow(setting: settings.first!, turnedOn: settings.first!.$enabled)
            SettingsRow(setting: settings.first!, turnedOn: settings.first!.$enabled)
         }
      }.listStyle(GroupedListStyle())
   }
}

struct SettingsRow: View {
   var setting: Setting
   @Binding var turnedOn: Bool
   
   var body: some View {
      
      Toggle(isOn: self.$turnedOn) {
         Text("\(setting.name)")
      }
   }
}

struct CustomeHeader: View {
   
   var body: some View {
      HStack {
         Text("Header")
            .font(.headline)
            .foregroundColor(.secondaryColor)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color.primaryColor)
            .padding([.top, .horizontal])
         Spacer()
      }
      .background(Color.white)
      .listRowInsets(EdgeInsets(
         top: 0,
         leading: 0,
         bottom: 0,
         trailing: 0))
   }
}

struct CustomeFooter: View {
   
   var body: some View {
      HStack {
         Text("Header")
            .font(.headline)
            .foregroundColor(.secondaryColor)
            .padding(.all, 0)
            .padding([.top, .horizontal])
         Spacer()
      }
      .background(Color.white)
      .listRowInsets(EdgeInsets(
         top: 0,
         leading: 0,
         bottom: 0,
         trailing: 0))
   }
}

struct Settings_Previews: PreviewProvider {
   
   static var previews: some View {
      
      Settings(settings: testSettings)
   }
}
