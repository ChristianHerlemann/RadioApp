//
//  OnboardingView.swift
//  RadioApp
//
//  Created by Chris Herlemann on 2020-04-20.
//  Copyright © 2020 Chris Herlemann. All rights reserved.
//

import SwiftUI

struct OnboardingStep: View {
   
   let headline: String
   let description: String
   
   var body: some View {
      VStack{
         Image("DefaultOnboarding")
            .padding(.bottom, 70.0)
            .padding()
         
         Text(headline)
            .font(.system(size: 32))
            .fontWeight(.bold)
            .padding([.leading, .bottom, .trailing], 40.0)
         Text(description)
            .font(.system(size: 17))
            .padding(.horizontal, 20)
      }
      .multilineTextAlignment(.center)
   }
}

struct TestView: View {
   @Environment(\.presentationMode) var presentation
   @State private var currentPage = 0
   
   var body: some View {
      VStack {
         PagerView(pageCount: 3, currentIndex: $currentPage) {
            OnboardingStep(headline: "Informier dich hier über alles Wichtige und Neue", description: "Die neusten Videos, Podcasts, Infos zu Events und Aktionen im Feed.")
            OnboardingStep(headline: "Hier findest du alle Audios an einem Ort", description: "Zum Entdecken, Anhören, Abonnieren, Merken und Herunterladen.")
            OnboardingStep(headline: "Radio hören und sehen welche Sendungen laufen", description: "Hier findest du die Programmvorschau und kannst den Livestream starten.")
         }
         
         HStack {
            if self.currentPage > 0 {
               Button(action: {
                  
                  if self.currentPage > 0
                  {
                     self.currentPage -= 1
                  }
                  
               }) {
                  Text("Zurück")
               }
               .padding()
               .animation(.easeIn)
            }
            
            Button(action: {
               
               if self.currentPage < 2
               {
                  withAnimation(.linear(duration: 0.1))
                  {
                     self.currentPage += 1
                  }
               }
               else
               {
                  
                     UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: {})
               }
            }) {
               Text(self.currentPage < 2 ? "Weiter" : "Fertig")
                  
            }
            .padding()
            .transition(.slide)
         }
      }
      .foregroundColor(.primaryColor)
      .background(Color.white)
      
   }
}

struct OnboardingView_Previews: PreviewProvider {
   
   static var previews: some View {
      TestView()
   }
}
