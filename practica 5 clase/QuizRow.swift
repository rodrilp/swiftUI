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
    
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    let url = URL(string: "https://quiz.dit.upm.es/")!
    
    
    
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
                                    
                                    let url = URL(string: "https://reqres.in/api/cupcakes")!
                                    var request = URLRequest(url: url)
                                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                                    request.httpMethod = "POST"
                                    request.httpBody = encoded
                                    // /users/tokenOwner/favourites/\(quizItem.id)?token=32403b83b30b3e467e6c
                        })
                    
                    
                }else{
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .scaledToFill()
                }
            }
        }
    }
    
}
