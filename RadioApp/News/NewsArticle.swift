//
//  NewsArticle.swift
//  RadioApp
//
//  Created by Chris Herlemann on 2020-04-26.
//  Copyright © 2020 Chris Herlemann. All rights reserved.
//

import SwiftUI

struct NewsArticle: View {
   
   let news: News
   
   var body: some View {
      
      GeometryReader { geometry in
         VStack(alignment: .leading) {
            ZStack(alignment: .bottomLeading) {
               
               self.news.image?
                  .resizable()
                  .aspectRatio(contentMode: .fit)
               self.news.mediaIcon?
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 25.0, height: 25.0)
                  .padding(.all)
                  .background(Color.hightlightColor)
                  .clipped()
                  .padding(.all)
            }
            Group {
               Text(self.news.headline)
                  .font(.title)
                  .multilineTextAlignment(.leading)
               Text(self.news.preview ?? "")
                  .font(.body)
                  .padding(.top)
            }
            .padding(.horizontal)
         }
         .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
         .navigationBarTitle("\(self.news.additionalHeadline!)", displayMode: .inline)
      }
   }
}

struct NewsArticle_Previews: PreviewProvider {
   static var previews: some View {
      /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
   }
}
