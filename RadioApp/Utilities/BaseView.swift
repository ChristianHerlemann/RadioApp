//
//  BaseView.swift
//  RadioApp
//
//  Created by Chris Herlemann on 2020-04-26.
//  Copyright © 2020 Chris Herlemann. All rights reserved.
//

import SwiftUI

struct BaseView<Content: View>: View {
   
   @State var opacity : Double = 1
   @State var height : CGFloat = 0
   @State var floating = false
   
   let miniPlayerHeight: CGFloat = 80
   
   let content: Content
   
   init(@ViewBuilder content: () -> Content) {
      self.content = content()
      
      let appearance = UINavigationBarAppearance()
      appearance.backgroundColor = .primaryColor
      appearance.titleTextAttributes = [
         .font : UIFont.systemFont(ofSize: 20),
         NSAttributedString.Key.foregroundColor : UIColor.white
      ]
      
      UINavigationBar.appearance().standardAppearance = appearance
   }
   
   var body: some View {
      GeometryReader{geo in
         
         
         self.content
            .padding(.bottom, self.miniPlayerHeight)
         FloatingMiniPlayer(floating: self.$floating)
            .frame(width: geo.size.width)
            .background(self.floating ? Color.primaryColor : Color.white)
            .onAppear { self.openFloatingPlayer(geo, false) }
            .gesture(TapGesture()
               .onEnded {
                  if self.height > 100 {
                     
                     self.openFloatingPlayer(geo, true)
                  }
                  else{
                     self.openFloatingPlayer(geo, false)
                     
                     
                  }
            })
            .gesture(DragGesture()
               
               .onChanged({ (value) in
                  
                  
                  if self.height >= 0 {
                     
                     self.height += value.translation.height / 8
                     self.opacity = 0.5
                  }
               })
               .onEnded({ (value) in
                  
                  if self.height > 100 && !self.floating {
                     
                     self.openFloatingPlayer(geo, false)
                  }
                  else{
                     
                     self.openFloatingPlayer(geo, self.height < geo.size.height - 150)
                  }
               })
         ).opacity(self.opacity)
            .offset(y: self.height)
            .animation(.spring())
      }
   }
   
   func openFloatingPlayer(_ geo: GeometryProxy, _ open: Bool) {
      
      if open {
         
         self.height = 0
         self.opacity = 1
         self.floating = false
         
      } else {
         
         self.height = geo.size.height - self.miniPlayerHeight
         self.opacity = 1
         self.floating = true
         
      }
   }
}

struct FloatingMiniPlayer: View {
   
   @ObservedObject var player: Player = Player.shared
   @Binding var floating: Bool
   
   var body: some View {
      
      GeometryReader { geometry in
         VStack{
            if !self.floating {
               Text(self.player.playingAudio.title)
                  .padding()
                  .font(.system(size: 19, weight: .bold))
            }
            
            HStack {
               self.player.playingAudio.cover
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: (!self.floating ? (geometry.size.width - 90) : 50), height: (!self.floating ? (geometry.size.width - 90) : 50), alignment: .center)
                  .cornerRadius(15)
                  .padding()
                  .clipped()
               
               if self.floating {
                  
                  VStack (alignment: .leading) {
                     Text(self.player.playingAudio.title)
                     Text(self.player.playingAudio.artist)
                  }
                  .frame(maxWidth: .infinity, alignment: .leading)
                  .foregroundColor(.secondaryColor)
                  Button(action: {self.player.isPlaying.toggle()}){
                     Image(systemName: self.player.isPlaying ? "pause.fill" : "play.fill")
                     .frame(width: 50, height: 50, alignment: .center)
                  }
                  .padding()
                  .accentColor(.hightlightColor)
                  .imageScale(.large)
                  
                  
               }
            }
            if !self.floating {
               Text(self.player.playingAudio.title)
                  .frame(maxWidth: .infinity)
                  .foregroundColor(Color.black)
                  .padding([.top, .leading, .trailing])
                  .font(.system(size: 19))
               
               PlayerControls(player: self.player)
                  .padding()
            }
            Spacer()
         }
         .accentColor(.hightlightColor)
         .frame(alignment: .top)
         .background(PlayerBackground(floating: self.$floating))
      }
   }
}

struct PlayerBackground: View {
   
   @Binding var floating: Bool
   
   var body: some View {
   
      ZStack {
         if !floating {
            Player.shared.playingAudio.cover
            .resizable()
            .aspectRatio(contentMode: .fill)
            .blur(radius: 6)
            .opacity(0.4)
         } else {
            Color.primaryColor
         }
         
      }
      
   }
}

struct BaseView_Previews: PreviewProvider {
   static var previews: some View {
 
    Tabbar()
   }
}
