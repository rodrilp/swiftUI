//
//  Quiz10Model.swift
//  practica 5 clase
//
//  Created by Rodrigo Lopez on 28/11/2019.
//  Copyright © 2019 UPM. All rights reserved.
//

import Foundation

struct QuizItem: Codable, Identifiable{
    let id: Int
    let question: String
    let answer: String
    let author: Author?
    let attachment: Attachment?
    let favourite: Bool
    let tips: [String]
    
    struct Author: Codable {
        let isAdmin: Bool?
        let username: String
        let photo: Attachment?
    }
    
    struct Attachment: Codable {
        let filename: String
        let mime: String
        let url: URL?
    }
}

class Quiz10Model: ObservableObject {
    @Published var quizzes = [QuizItem]()
    
    func download(){
        let surl = "https://quiz.dit.upm.es/api/quizzes/random10wa?token=32403b83b30b3e467e6c"
        
        guard let url = URL(string: surl) else {
            print("No se ha podido descargar los quizzes de la url")
            return
        }
        
        do{
            let data = try Data(contentsOf: url)
            //let decoder = JSONDecoder()
            
            //let letra = String(data: data, encoding: .utf8)
            //print(letra)
            
            let quizzes = try JSONDecoder().decode([QuizItem].self, from: data)
            
            self.quizzes = quizzes
            
        }catch{
            print("error")
        }
        
    }
}
