//
//  RadioView.swift
//  RadioApp
//
//  Created by Chris Herlemann on 2020-04-17.
//  Copyright © 2020 Chris Herlemann. All rights reserved.
//

import SwiftUI
import Combine

struct RadioView: View {
   
   @ObservedObject var player: Player = Player.shared
   
   var body: some View {
      
      GeometryReader { geometry in
         VStack{
            Text(self.player.playingAudio.title)
               .padding()
               .font(.system(size: 19, weight: .bold))
            self.player.playingAudio.cover
               .resizable()
               .aspectRatio(contentMode: .fill)
               .frame(width: geometry.size.width - 90, height: geometry.size.width - 90, alignment: .center)
               .frame(maxWidth: geometry.size.height * 0.4, maxHeight: geometry.size.height * 0.4, alignment: .center)
               .aspectRatio(contentMode: .fill)
               .cornerRadius(15)
               .padding()
               .clipped()
            Text(self.player.playingAudio.title)
               .foregroundColor(Color.black)
               .padding([.top, .leading, .trailing])
               .font(.system(size: 19))
            
            PlayerControls(player: self.player)
               .padding()
            Spacer()
         }
         .frame(alignment: .top)
         .background(
            self.player.playingAudio.cover
               .resizable()
               .aspectRatio(contentMode: .fill)
               .blur(radius: 6)
               .opacity(0.4)
         )
      }
   }
}

struct PlayerControls : View {
   
   @ObservedObject var player: Player
   
   var body : some View {
      HStack{
         Button(action: { self.player.playingAudio.isFavourite.toggle() }) {
            Image.init(systemName: self.player.playingAudio.isFavourite ? "heart.fill" : "heart")
         }
         .frame(maxWidth: .infinity)
         
         Button(action: { self.player.skip() }) {
            Image.init(systemName: "backward.fill")
         }
         .frame(maxWidth: .infinity)
         
         Button(action: { self.player.isPlaying.toggle() }) {
            Image.init(systemName: Player.shared.isPlaying ? "pause.circle.fill" : "play.circle.fill")
               .frame(width: 54.0, height: 54.0)
         }
         .frame(maxWidth: .infinity)
         .font(.system(size: 54))
         .background(Color.hightlightColor)
         .clipShape(Circle())
         
         Button(action: {self.player.skip()}) {
            Image.init(systemName: "forward.fill")
         }
         .frame(maxWidth: .infinity)
         
         Button(action: {}) {
            Image.init(systemName: "text.justify")
         }
         .frame(maxWidth: .infinity)
      }
      .imageScale(.large)
      .accentColor(.primaryColor)
      .frame(maxWidth: .infinity)
   }
   
   
}

#if DEBUG

struct RadioView_Previews: PreviewProvider {
   static var previews: some View {
      RadioView()
   }
}

#endif
