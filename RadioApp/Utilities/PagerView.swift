//
//  PagerView.swift
//  RadioApp
//
//  Created by Chris Herlemann on 2020-04-22.
//  Copyright © 2020 Chris Herlemann. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct PagerView<Content: View>: View {
   let pageCount: Int
   @Binding var currentIndex: Int
   let content: Content
   
   init(pageCount: Int, currentIndex: Binding<Int>, @ViewBuilder content: () -> Content) {
      self.pageCount = pageCount
      self._currentIndex = currentIndex
      self.content = content()
   }
   
   @GestureState private var translation: CGFloat = 0
   
   var body: some View {
      GeometryReader { geometry in
         
         VStack {
            HStack(spacing: 0) {
               self.content.frame(width: geometry.size.width)
            }
            .frame(width: geometry.size.width, alignment: .leading)
            .offset(x: -CGFloat(self.currentIndex) * geometry.size.width)
            .offset(x: self.translation)
            .animation(.interactiveSpring())
            .gesture(
               DragGesture().updating(self.$translation) { value, state, _ in
                  state = value.translation.width
               }.onEnded { value in
                  let offset = value.translation.width / geometry.size.width
                  let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                  self.currentIndex = min(max(Int(newIndex), 0), self.pageCount - 1)
               }
            )
            PageControl(pageCount: self.pageCount, currentIndex: self.$currentIndex)
            .padding()
         }
      }
   }
}

struct PageControl: UIViewRepresentable {
   
   
   var pageCount: Int
   @Binding var currentIndex: Int
   
   func makeUIView(context: Context) -> UIPageControl {
       let control = UIPageControl()
       control.numberOfPages = pageCount
       control.currentPageIndicatorTintColor = .hightlightColor
      control.pageIndicatorTintColor = .primaryColor

       return control
   }
   
   func updateUIView(_ uiView: UIPageControl, context: Context) {
       uiView.currentPage = currentIndex
   }
}

struct VPagerView<Content: View>: View {
   let pageCount: Int
   @Binding var currentIndex: Int
   let content: Content
   
   init(pageCount: Int, currentIndex: Binding<Int>, @ViewBuilder content: () -> Content) {
      self.pageCount = pageCount
      self._currentIndex = currentIndex
      self.content = content()
   }
   
   @GestureState private var translation: CGFloat = 0
   
   var body: some View {
      GeometryReader { geometry in
         
         HStack {
            VStack(spacing: 0) {
               self.content.frame(height: geometry.size.height)
            }
            .frame(height: geometry.size.height, alignment: .top)
            .offset(y: -CGFloat(self.currentIndex) * geometry.size.height)
            .offset(y: self.translation)
            .animation(.interactiveSpring())
            .gesture(
               DragGesture().updating(self.$translation) { value, state, _ in
                  state = value.translation.height
               }.onEnded { value in
                  let offset = value.translation.height / geometry.size.height
                  let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                  self.currentIndex = min(max(Int(newIndex), 0), self.pageCount - 1)
               }
            )
            .padding()
         }
      }
   }
}
