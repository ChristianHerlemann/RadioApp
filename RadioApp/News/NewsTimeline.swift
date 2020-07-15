//
//  NewsTimeline.swift
//  RadioApp
//
//  Created by Chris Herlemann on 2020-04-26.
//  Copyright © 2020 Chris Herlemann. All rights reserved.
//

import SwiftUI

struct NewsTimeline: View {
   
   @State var showMiniplayer = true
   var newsFeed : [News] = DummyModel.shared.testNews
   
   init() {
      UITableView.appearance().separatorColor = .clear
   }
   
    var body: some View {
      
         List(newsFeed) { news in
               NewsPreview(news: news)
                  .padding(.bottom, 30)
         }
   }
}

#if DEBUG


struct NewsTimeline_Previews: PreviewProvider {
    static var previews: some View {
         NewsTimeline()
    }
}

#endif



