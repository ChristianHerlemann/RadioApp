//
//  Audio.swift
//  RadioApp
//
//  Created by Chris Herlemann on 2020-04-28.
//  Copyright © 2020 Chris Herlemann. All rights reserved.
//

import SwiftUI

struct Audio : Identifiable{
   
   var id = UUID()
   var cover: Image
   var title: String
   var artist: String
   var isFavourite: Bool = false
   var lenght: Double
   
}
