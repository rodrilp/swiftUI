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
    @Binding var respuesta: String
    
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
                    .padding(.horizontal, 30)
                
            }
            Spacer()
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
