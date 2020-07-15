//
//  HostingController.swift
//  RadioApp
//
//  Created by Chris Herlemann on 2020-04-26.
//  Copyright © 2020 Chris Herlemann. All rights reserved.
//

import SwiftUI

class HostingController<Content>: UIHostingController<Content> where Content: View {
    @objc override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
