//
//  ContentView.swift
//  practica 5 clase
//
//  Created by Rodrigo Lopez on 28/11/2019.
//  Copyright © 2019 UPM. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var quizModel: Quiz10Model
    
    
    var body: some View {
        NavigationView{
            List(quizModel.quizzes){ quizItem in
                NavigationLink(destination: QuizDetail(quizItem: quizItem )){
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
                }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
