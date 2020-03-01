//
//  PostData.swift
//  Live-News
//
//  Created by Ден on 28.02.2020.
//  Copyright © 2020 Ден. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let articles: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return publishedAt
    }
    let publishedAt: String
    let source: Name
    let title: String
    let url: String?
}

struct Name: Decodable {
    let name: String
}


    

