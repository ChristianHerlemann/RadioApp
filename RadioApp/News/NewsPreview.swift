//
//  NewsPreview.swift
//  RadioApp
//
//  Created by Chris Herlemann on 2020-04-26.
//  Copyright © 2020 Chris Herlemann. All rights reserved.
//

import SwiftUI

struct NewsPreview: View {
   
   let news: News
   
   var body: some View {
      
      ZStack {
         VStack(alignment: .leading) {
            ZStack(alignment: .bottomLeading) {
               GeometryReader { geometry in
                  EmptyView()
               }
               self.news.image?
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .cornerRadius(15)
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
               Text(self.news.additionalHeadline!)
                  .padding(/*@START_MENU_TOKEN@*/.all, 4.0/*@END_MENU_TOKEN@*/)
                  .foregroundColor(.white)
                  .background(Color.hightlightColor)
               Text(self.news.headline)
                  .font(.title)
                  .multilineTextAlignment(.leading)
                  .padding(.top, 4.0)
            }
            Text(news.preview ?? "")
               .font(.body)
               .padding(.top)
               .lineLimit(3)
            Spacer()
         }
         NavigationLink(destination: NewsArticle(news: news)){
            EmptyView()
         }
      }
   }
}

struct NewsPreview_Previews: PreviewProvider {
   static var previews: some View {
      NewsPreview(news: DummyModel.shared.testNews.first!)
   }
}
