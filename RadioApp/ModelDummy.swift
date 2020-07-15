//
//  ModelDummy.swift
//  RadioApp
//
//  Created by Chris Herlemann on 2020-04-21.
//  Copyright © 2020 Chris Herlemann. All rights reserved.
//

import Foundation
import SwiftUI

class DummyModel : ObservableObject {
   
   static let shared = DummyModel()
   
   @Published var testNews = [
      News(image: Image("people-sitting-near-tables"), additionalHeadline: "Regional", headline: "Retro Cafes wieder im Trend", preview: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua."),
      News(image: Image("cassette-tape"), mediaIcon: .init(systemName: "video.fill"), additionalHeadline: "Technik", headline: "So digitalisieren sie ihre Kassetten", preview: "Lorem Ipsum Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua."),
      News(image: Image("vinyl-record"), mediaIcon: .init(systemName: "video.fill"), additionalHeadline: "Musik", headline: "Bester Sound mit Vinyl", preview: "Lorem Ipsum Preview"),
      News(image: Image("home-music"), additionalHeadline: "Einrichtung", headline: "Die ideale Musikstation für Ihr Zuhause", preview: "Lorem Ipsum Preview Lorem Ipsum Preview Lorem Ipsum Preview")

   ]
   
   @Published var testMeditation: [Audio] =
      [
         Audio(cover: Image("four-rock"), title: "Awakening", artist: "Zen Garden",  isFavourite: true, lenght: 345),
         Audio(cover: Image("women-meditation"), title: "Music to Quiet the mind", artist: "Dzen Guru",  isFavourite: false, lenght: 302),
         Audio(cover: Image("brown-pagoda"), title: "Tibetan Bells", artist: "GoldLink",  isFavourite: true, lenght: 242),
         Audio(cover: Image("blooming-blossom"), title: "Nature Sounds", artist: "Zen Garden", isFavourite: false, lenght: 273)
   ]
   
   @Published var testCharts: [Audio] =
      [
         Audio(cover: Image("abstract-art"), title: "Bills", artist: "LunchMoney Lewis", isFavourite: true, lenght: 345),
         Audio(cover: Image("foo-dog"), title: "Raise your Glass", artist: "P!nk",  isFavourite: false, lenght: 273),
         Audio(cover: Image("beach-during-dawn"), title: "Rockabye", artist: "Clean Bandit",  isFavourite: true, lenght: 242),
         Audio(cover: Image("music-editing"), title: "What makes you beautiful", artist: "One Direction", isFavourite: false, lenght: 302),
         Audio(cover: Image("little-things-in-life"), title: "Work from Home", artist: "Fifth Harmony",  isFavourite: true, lenght: 222),
         Audio(cover: Image("gramophone"), title: "Into You", artist: "Ariana Grande",  isFavourite: false, lenght: 252)
   ]
   
   @Published var testForYou: [Audio] =
      [
         Audio(cover: Image("mirror-lake"), title: "Wake Me Up", artist: "Avicii", isFavourite: true, lenght: 345),
         Audio(cover: Image("astronomy"), title: "Footloose", artist: "Kenny Loggins",  isFavourite: false, lenght: 273),
         Audio(cover: Image("panoramic-sea"), title: "Shake It Off", artist: "Taylor Swift",  isFavourite: true, lenght: 242),
         Audio(cover: Image("flight-landscape"), title: "Thank you for the Music", artist: "ABBA",  isFavourite: false, lenght: 302),
         Audio(cover: Image("red-trees"), title: "Bills", artist: "LunchMoney Lewis",  isFavourite: true, lenght: 222),
         Audio(cover: Image("rice-paddy"), title: "What a beautiful day", artist: "Michael Bubble",  isFavourite: false, lenght: 252)
   ]
   
   
   @Published var testModeratoren: [Moderator] =
   [
      Moderator(name: "Jochen", profilePhoto: Image("Jochen"), isActive: false),
      Moderator(name: "Paula", profilePhoto: Image("Paula"), isActive: false),
      Moderator(name: "Carolin", profilePhoto: Image("Carolin"), isActive: true),
      Moderator(name: "Tim", profilePhoto: Image("Tim"), isActive: false),
      Moderator(name: "Hannes", profilePhoto: Image("Hannes"), isActive: false)
   ]
   
   @Published var testMessages : [Message] =
   [
      Message(sender: .Studio, text: "Herzlich Willkommen im Studio Chat!"),
//      Message(sender: .User, text: "Hallo zusammen, echt tolle Musik 👍🏻"),
//      Message(sender: .Studio, text: "Herzlich Willkommen im Studio Chat!"),
//      Message(sender: .User, text: "Hallo zusammen, echt tolle Musik 👍🏻"),
//      Message(sender: .Studio, text: "Herzlich Willkommen im Studio Chat!"),
//      Message(sender: .User, text: "Hallo zusammen, echt tolle Musik 👍🏻"),
//      Message(sender: .Studio, text: "Herzlich Willkommen im Studio Chat!"),
//      Message(sender: .User, text: "Hallo zusammen, echt tolle Musik 👍🏻")
   ]
}
