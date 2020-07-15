//
//  News.swift
//  RadioApp
//
//  Created by Chris Herlemann on 2020-04-17.
//  Copyright © 2020 Chris Herlemann. All rights reserved.
//

import SwiftUI

struct News : Identifiable {
   var id = UUID()
   var image : Image?
   var mediaIcon: Image?
   var additionalHeadline : String?
   var headline : String
   var preview : String?
}
