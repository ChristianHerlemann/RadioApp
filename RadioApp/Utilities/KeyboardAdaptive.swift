//
//  KeyboardAdaptive.swift
//  RadioApp
//
//  Created by Chris Herlemann on 2020-05-03.
//  Copyright © 2020 Chris Herlemann. All rights reserved.
//

import SwiftUI
import Combine

struct KeyboardAdaptive: ViewModifier {
   @State private var bottomPadding: CGFloat = 0
   
   func body(content: Content) -> some View {
         GeometryReader { geometry in
            content
               .padding(.bottom, self.bottomPadding)
               .onReceive(Publishers.keyboardHeight) { keyboardHeight in
                  self.bottomPadding = max(0, keyboardHeight - geometry.safeAreaInsets.bottom)
            }
            .animation(.easeOut(duration: 0.16))
         }
      }
   }

extension View {
   func keyboardAdaptive() -> some View {
      ModifiedContent(content: self, modifier: KeyboardAdaptive())
   }
}
