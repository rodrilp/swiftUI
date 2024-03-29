//
//  QuizRow.swift
//  practica 5 clase
//
//  Created by Rodrigo Lopez on 02/12/2019.
//  Copyright © 2019 UPM. All rights reserved.
//

import SwiftUI

struct QuizRow: View {
    var quizItem: QuizItem
    
    @EnvironmentObject var imageStore: ImageStore
    @EnvironmentObject var quizModel: Quiz10Model
    
    var body: some View{
        HStack{
            Image(uiImage: self.imageStore.image(url: quizItem.attachment?.url))
                .resizable()
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading){
                Text(quizItem.question)
                    .font(.title)
                Text(quizItem.author!.username)
                    .font(.subheadline)
            }
            Spacer()
            
            HStack{
                if quizItem.favourite == true {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .scaledToFill()
                        .foregroundColor(.yellow)
                        .gesture(
                            TapGesture(count: 1)
                                .onEnded {
                                    self.quizModel.toggleFavourite(self.quizItem)
                            }
                        )
                }else{
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .scaledToFill()
                        .gesture(
                            TapGesture(count: 1)
                                .onEnded {
                                    self.quizModel.toggleFavourite(self.quizItem)
                            }
                        )
                }
            }
        }
    }
    
}
