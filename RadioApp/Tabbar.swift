//
//  Tabbar.swift
//  RadioApp
//
//  Created by Chris Herlemann on 2020-04-17.
//  Copyright © 2020 Chris Herlemann. All rights reserved.
//

import SwiftUI

struct Tabbar: View {
   
   @State var showSettings = false
   
   init() {
      UITabBar.appearance().backgroundColor = .primaryColor
      UITabBar.appearance().barTintColor = .primaryColor
      UITabBar.appearance().unselectedItemTintColor = .secondaryColor
   }
   
   var body: some View {
      
      VStack(spacing: 0) {
         HeaderView(showSettings: self.$showSettings)
            .frame(height: 44, alignment: .top)
         TabView {
            BaseView{NewsTimeline()}
               
               .tabItem {
                  Image(systemName: "star.fill")
                  Text("News")
            }
            ExploreView()
               .tabItem {
                  Image(systemName: "safari.fill")
                  Text("ENTDECKEN")
            }
            RadioView()
               .tabItem {
                  Image(systemName: "dot.radiowaves.left.and.right")
                  Text("RADIO")
            }
            StudioMessenger()
               .tabItem {
                  Image(systemName: "text.bubble.fill")
                  Text("STUDIO")
            }
         }
         .accentColor(.hightlightColor)
         
         .sheet(isPresented: self.$showSettings) {
            
            VStack {
               HeaderView(showSettings: self.$showSettings)
               .frame(height: 44, alignment: .top)
               Settings(settings: testSettings)
            }
            
         }
      }
   }
}

struct Tabbar_Previews: PreviewProvider {
   static var previews: some View {
      Tabbar()
   }
}

struct HeaderView: View {
   
   @Binding var showSettings: Bool
   
   var body: some View {
      
      ZStack {
         Color.primaryColor
            .edgesIgnoringSafeArea(.all)
         HStack {
            Spacer()
            Button(action: {self.showSettings.toggle()}) {
               Image(systemName: showSettings ? "xmark" : "gear")
                  .font(.system(size: 22))
                  .foregroundColor(.secondaryColor)
               .padding()
            }
         }
      }
   }
}
