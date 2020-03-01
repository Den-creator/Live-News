//
//  NetworkManager.swift
//  Live-News
//
//  Created by Ден on 28.02.2020.
//  Copyright © 2020 Ден. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
        
   @Published var posts = [Post]()
    
    let url = "https://newsapi.org/v2/top-headlines?country=ua&apiKey="
    let api = ApiKey.apiKey
    
    var category: String?
    
    func getCategory(_ category: String?) {
        self.category = category
    }
    
    func fatchData() {
        
        if let selectedCategory = category {
            if let url = URL(string: url + api + "&category=\(selectedCategory)") {
                print(url)
                
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { (data, response, error) in
                    if error == nil {
                        let decoder = JSONDecoder()
                        if let safeData = data {
                            do {
                                let results = try decoder.decode(Results.self, from: safeData)
                                DispatchQueue.main.async {
                                    self.posts = results.articles
                                }
                            } catch {
                                print(error)
                            }
                        }
                    }
                }
                task.resume()
            }
            
        }

}
}

