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
        }
    }
    
}
/*
struct QuizRow_Previews: PreviewProvider {
    static var previews: some View {
        QuizRow(quizItem: quizModel.quizzes[1])
    }
}
*/
