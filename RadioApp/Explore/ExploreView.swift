//
//  ExploreView.swift
//  RadioApp
//
//  Created by Chris Herlemann on 2020-04-21.
//  Copyright © 2020 Chris Herlemann. All rights reserved.
//

import SwiftUI
import Lottie

struct ExploreView: View{
   
   var model = DummyModel.shared
   
   var body: some View {
      
      GeometryReader { geometry in
         VStack(spacing: 0.0) {
            Image("HeaderImage")
               .resizable()
               .aspectRatio(contentMode: .fit)
               .frame(width: geometry.size.width, alignment: .bottom)
               .padding(.bottom, 12)
            ScrollView(.vertical, showsIndicators: false, content: {
               VStack {
                  
                  ExploreSlider(name: "For You", audios: self.model.testForYou, geo: geometry)
                  ExploreSlider(name: "Charts", audios: self.model.testCharts, geo: geometry)
                  ExploreSlider(name: "Meditation Podcast", audios: self.model.testMeditation, geo: geometry)
               }
            })
               .frame(width: geometry.size.width, alignment: .center)
         }
      }
      
      
   }
}

struct ExploreView_Previews: PreviewProvider
{
   static var previews: some View {
      BaseView {ExploreView()}
   }
}

struct SliderPage: View {
   
   @ObservedObject var player = Player.shared
   var audio: Audio
   
   var body: some View {
      GeometryReader { geometry in
         VStack {
            ZStack {
               self.audio.cover
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: geometry.size.width, height: geometry.size.width, alignment: .center)
                  .clipped()
                  .cornerRadius(10)

               if self.audio.id == self.player.playingAudio.id
               {
                  LottieView(name: "playingEqualizer", play: .constant(self.player.isPlaying))
                     .background(Color.secondaryColor.opacity(0.6))
                     .clipShape(Circle())
                     .frame(width: geometry.size.width * 0.6, height: geometry.size.width * 0.6, alignment: .center)
               }
            }
            Text(self.audio.title)
               .multilineTextAlignment(.leading)
               .lineLimit(2)
               .allowsTightening(false)
               .foregroundColor(.hightlightColor)
               .frame(width: geometry.size.width, alignment: .leading)
            Text(self.audio.artist)
               .foregroundColor(.primaryColor)
               .frame(width: geometry.size.width, alignment: .leading)
            
         }
         .frame(width: 140, height: geometry.size.height, alignment: .top)
         .onTapGesture { Player.shared.play(self.audio) }
      }
   }
}

struct ExploreSlider: View {
   
   let name: String
   var audios: [Audio]
   var geo: GeometryProxy
   
   var body: some View {
      VStack {
         ZStack {
            Rectangle()
               .frame(height: 1)
               .foregroundColor(.primaryColor)
            Text(name)
               .padding(4)
               .background(Color.hightlightColor)
               .foregroundColor(.secondaryColor)
         }
         ScrollView(.horizontal, showsIndicators: false, content: {
            HStack {
               ForEach(audios) { audio in
                  SliderPage(audio: audio)
                     .frame(width: self.geo.size.width * 0.33, height: self.geo.size.height * 0.3, alignment: .center)
               }
            }
            .frame(maxHeight: 200)
            .frame(alignment: .top)
            .padding(.all)
         })
      }
   }
}
