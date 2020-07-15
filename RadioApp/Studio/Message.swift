//
//  Message.swift
//  RadioApp
//
//  Created by Chris Herlemann on 2020-05-03.
//  Copyright © 2020 Chris Herlemann. All rights reserved.
//

import SwiftUI

struct Message : Identifiable {
   
   var id = UUID()
   var sender : Sender
   var text : String
}

enum Sender {
   case User
   case Studio
}
