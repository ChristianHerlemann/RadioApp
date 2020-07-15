//
//  Moderator.swift
//  RadioApp
//
//  Created by Chris Herlemann on 2020-05-02.
//  Copyright © 2020 Chris Herlemann. All rights reserved.
//

import SwiftUI

struct Moderator : Identifiable {
   
   var id = UUID()
   let name : String
   let profilePhoto : Image
   var isActive : Bool
}
