//
//  Player.swift
//  RadioApp
//
//  Created by Chris Herlemann on 2020-04-28.
//  Copyright © 2020 Chris Herlemann. All rights reserved.
//

import SwiftUI
import Combine

class Player : ObservableObject {
   
   static var shared = Player()
   
   @Published var playingAudio: Audio = DummyModel.shared.testForYou.randomElement()!
   @Published var isPlaying: Bool = false
   @Published var currentTimestamp: Double = 0
   
   
   private init() {}
   
   func play(_ audio: Audio)
   {
      playingAudio = audio
      isPlaying = true
   }
   
   func skip() {
      playingAudio = DummyModel.shared.testForYou.randomElement()!
   }
}
