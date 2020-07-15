//
//  UIApplication.swift
//  RadioApp
//
//  Created by Chris Herlemann on 2020-05-03.
//  Copyright © 2020 Chris Herlemann. All rights reserved.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
