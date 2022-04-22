//
//  Webservices.swift
//  NewsApplication
//
//  Created by Utku on 25.03.2022.
//

import Foundation

class WebServices {
    
    func haberleriIndir(url: URL, completion: @escaping ([News]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else  if let data = data {
                let haberlerDizisi = try? JSONDecoder().decode([News].self, from: data)
                if let haberlerDizisi = haberlerDizisi {
                    completion(haberlerDizisi)
                }
            }
        }.resume()
    }
}
