//
//  Quiz10Model.swift
//  practica 5 clase
//
//  Created by Rodrigo Lopez on 28/11/2019.
//  Copyright © 2019 UPM. All rights reserved.
//

import Foundation

let session = URLSession.shared

struct QuizItem: Codable, Identifiable{
    let id: Int
    let question: String
    let answer: String
    let author: Author?
    let attachment: Attachment?
    var favourite: Bool
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


class PuntuacionModel: ObservableObject{
    @Published var correctQuizzes = [Int]()
    
    init(){
        var optional: [Int]? = nil
        if let data = UserDefaults.standard.value(forKey:"score") as? [Int] {
            optional = data
        }
        correctQuizzes = optional ?? []
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
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let quizzes = try? JSONDecoder().decode([QuizItem].self, from: data){
                DispatchQueue.main.async {
                    self.quizzes = quizzes
                }
            }
        }
            

        
    }
    
    func toggleFavourite(_ quizItem: QuizItem) {
        
        guard let index = quizzes.firstIndex(where: {$0.id == quizItem.id}) else{
            print("Error 1")
            return
        }
        
        guard let url = URL(string: "https://quiz.dit.upm.es/api/users/tokenOwner/favourites/\(quizItem.id)?token=32403b83b30b3e467e6c") else{
            print("Error 2")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = quizItem.favourite ? "DELETE" : "PUT"
        request.addValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
        
        let task = session.uploadTask(with: request, from: Data()){
            (data: Data?, res: URLResponse?, error: Error? ) in
            
            if error != nil {
                print("Error 3")
                return
            }
            
            let code = (res as! HTTPURLResponse).statusCode
            
            if code != 200 {
                print("Error 4")
                return
            }
        }
    
        print("Actualizado")
        
        DispatchQueue.main.async {
            self.quizzes[index].favourite.toggle()
        }
        
        task.resume()
    }
}
