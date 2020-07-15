//
//  StudioMessenger.swift
//  RadioApp
//
//  Created by Chris Herlemann on 2020-05-02.
//  Copyright © 2020 Chris Herlemann. All rights reserved.
//

import SwiftUI

struct StudioMessenger: View {
   
   @ObservedObject var  messagesModel = DummyModel.shared
   
   var body: some View {
      
      VStack(spacing: 0) {
         ModeratorList()
         MessageArea(messages: self.messagesModel.testMessages)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
         Spacer()
         InputArea()
         
      }
      .frame(maxHeight: .infinity)
      .keyboardAdaptive()
   }
}

struct ModeratorList: View {
   
   var moderatoren = DummyModel.shared.testModeratoren
   
   var body: some View {
      
      ScrollView(.horizontal, showsIndicators: false) {
         HStack {
            ForEach(moderatoren) { moderator in
               VStack {
                  moderator.profilePhoto
                     .resizable()
                     .aspectRatio(contentMode: .fill)
                     .frame(width: 56, height: 56)
                     .clipShape(Circle())
                     .padding()
                     .background((moderator.isActive ? Color.hightlightColor : Color.primaryColor))
                     .frame(width: 60, height: 60)
                     .clipShape(Circle())
                     .padding(6)
                  Text(moderator.name)
                     .foregroundColor((moderator.isActive ? Color.hightlightColor : Color.secondaryColor))
               }
               
               
            }
         }
      }
      .padding(.vertical)
      .background(Color.primaryColor)
   }
}

struct MessageArea: View {
   
   var messages : [Message]
   
   var body: some View {
      GeometryReader { geometry in
         List(self.messages) { message in
            HStack {
               if message.sender == Sender.User {
                  Spacer()
                  Text(message.text)
                  .foregroundColor(.white)
                  .padding()
                  .background(Image("UserMessage"))
                  .frame(maxWidth: geometry.size.width * 0.8, alignment: .trailing)
               } else {
                  Text(message.text)
                  .foregroundColor(.white)
                  .padding()
                  .background(Image("StudioMessage"))
                  .frame(maxWidth: geometry.size.width * 0.8, alignment: .leading)
                  Spacer()
               }
            }
         }
      
      }
   }
}

struct InputArea: View {
   
   @State private var message: String = ""
   
   var body: some View {
      
      HStack {
         TextField("Enter your message...", text: self.$message)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.secondaryColor)
            .cornerRadius(10)
         Button(action: {self.sendMessage()}) {
            Image(systemName: "paperplane.fill")
               .foregroundColor(.secondaryColor)
               .padding()
         }
         .background(Color.hightlightColor)
         .clipShape(Circle())
      }
      .padding()
      .background(Color.primaryColor)
   }
   
   func sendMessage() {
      DummyModel.shared.testMessages.append(Message(sender: .User, text: message))
      message = ""
     
      UIApplication.shared.endEditing()
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
         DummyModel.shared.testMessages.append(Message(sender: .Studio, text: "Es freut uns von dir zu hören!"))
      }
   }
}


struct Messenger_Previews: PreviewProvider {
   static var previews: some View {
      BaseView{StudioMessenger()}
   }
}


