//
//  ContentView.swift
//  practica 5 clase
//
//  Created by Rodrigo Lopez on 28/11/2019.
//  Copyright © 2019 UPM. All rights reserved.
//

import SwiftUI

private let defaults = UserDefaults.standard

struct ContentView: View {
    
    @EnvironmentObject var quizModel: Quiz10Model
    @EnvironmentObject var puntuacionModel: PuntuacionModel
    
    var body: some View {
        NavigationView{
            List(quizModel.quizzes){ quizItem in
                NavigationLink(destination: QuizDetail(quizItem: quizItem,  puntuacionModel: self.puntuacionModel)){
                    QuizRow(quizItem: quizItem)
                }
            }
            .navigationBarTitle(Text("Quizzes"))
            .navigationBarItems(leading:
                HStack{
                    Image(systemName: "arrow.clockwise")
                        .resizable()
                        .frame(width: 22, height: 25)
                        .gesture(
                            TapGesture(count: 1)
                                .onEnded {
                                    self.quizModel.download()
                        })
                    Spacer()
                    Text("Score : \(puntuacionModel.correctQuizzes.count)")
                    .padding(.leading, CGFloat(30))
                    
                }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
