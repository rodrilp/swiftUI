//
//  ImageStore.swift
//  practica 5 clase
//
//  Created by Rodrigo Lopez on 28/11/2019.
//  Copyright © 2019 UPM. All rights reserved.
//

import UIKit

class ImageStore: ObservableObject {
    
    //Cache para las Imagenes.
    //La clave es una string para una URL
    @Published var imagesCache = [URL:UIImage]()
    
    let defaultImage = UIImage(named: "none")!
    
    func image(url: URL?) -> UIImage {
        
        guard let url = url else {
            return defaultImage
        }
        
        if let img = imagesCache[url]{
            return img
        }
        
        self.imagesCache[url] = defaultImage
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let img = UIImage(data: data){
                print(url)
                
                DispatchQueue.main.async {
                    self.imagesCache[url] = img
                }
            }
        }
        return defaultImage
    }
}
