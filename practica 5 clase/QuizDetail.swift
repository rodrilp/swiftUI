//
//  QuizDetail.swift
//  practica 5 clase
//
//  Created by Rodrigo Lopez on 02/12/2019.
//  Copyright © 2019 UPM. All rights reserved.
//

import SwiftUI

struct QuizDetail: View {
    
    var quizItem: QuizItem
    
    @EnvironmentObject var imageStore: ImageStore
    
    @State private var respuesta: String = ""
    @State private var showingAlert: Bool = false
    
    var body: some View {
        VStack{
            VStack{
                Image(uiImage: self.imageStore.image(url: quizItem.attachment?.url))
                    .resizable()
                    .scaledToFill()
                    .padding(.bottom)
                    .frame(height: CGFloat(300))
                    .edgesIgnoringSafeArea(.top)
                
                Text(quizItem.question)
                    .font(.title)
                
                TextField("Aquí su respuesta", text: $respuesta)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, CGFloat(30))
                
                Button(action: {
                    self.showingAlert = true
                }) {
                    Text("Comprobar")
                }
                    
                .alert(isPresented: $showingAlert) {
                    if respuesta == quizItem.answer{
                        return Alert(title: Text("Comprobación"), message: Text("Has acertado"), dismissButton: .default(Text("Got it!")))
                    }else{
                        return Alert(title: Text("Comprobación"), message: Text("Has fallado"), dismissButton: .default(Text("Got it!")))
                    }
                }
                
                Spacer()
            }
        }
        
    }
}

/*
 struct QuizDetail_Previews: PreviewProvider {
 static var previews: some View {
 QuizDetail()
 }
 }
 */
