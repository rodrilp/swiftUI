//
//  QuizDetail.swift
//  practica 5 clase
//
//  Created by Rodrigo Lopez on 02/12/2019.
//  Copyright © 2019 UPM. All rights reserved.
//

import SwiftUI

private let defaults = UserDefaults.standard

struct QuizDetail: View {
    
    var quizItem: QuizItem
    
    @EnvironmentObject var imageStore: ImageStore
    
    @State private var respuesta: String = ""
    @State private var showingAlert: Bool = false
    var puntuacionModel: PuntuacionModel
    
    var body: some View {
        
        ZStack{
            Color.blue.opacity(0.2).edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Spacer()
                    Text("Score : \(puntuacionModel.correctQuizzes.count)")
                        .padding(.horizontal, CGFloat(10))
                    
                }
                .padding(.bottom, CGFloat(30))
                Text(quizItem.question)
                .font(.title)
                .foregroundColor(Color.black.opacity(0.6))

                
                Image(uiImage: self.imageStore.image(url: quizItem.attachment?.url))
                    .resizable()
                    .frame(minWidth: 0, maxWidth: CGFloat(380), minHeight: 0 ,maxHeight: CGFloat(230) )
                    .scaledToFill()
                    .padding(.all)
                //Spacer()
                TextField("Aquí su respuesta", text: $respuesta)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, CGFloat(30))
                Spacer()
                
                Button(action: {
                    self.showingAlert = true
                }) {
                    Text("Comprobar")
                    .foregroundColor(Color.black.opacity(0.6))
                    .font(.title)

                }
                    
                .alert(isPresented: $showingAlert) {
                    if respuesta == quizItem.answer{
                        if (puntuacionModel.correctQuizzes.contains(quizItem.id)){
                            return Alert(title: Text("Comprobación"), message: Text("Has acertado"), dismissButton: .default(Text("Seguir jugando")))

                        }else{
                            puntuacionModel.correctQuizzes.append(quizItem.id)
                            defaults.set(puntuacionModel.correctQuizzes, forKey: "score")
                            return Alert(title: Text("Comprobación"), message: Text("Has acertado"), dismissButton: .default(Text("Seguir jugando")))
                        }

                    }else{
                        return Alert(title: Text("Comprobación"), message: Text("Has fallado"), dismissButton: .default(Text("Vuelve a intentarlo")))
                    }
                }

                Spacer()
                
                
            
            }
        }
        
    }
}


