//
//  File.swift
//  Sporting Russia
//
//  Created by Eduard Sinyakov on 10/9/19.
//  Copyright © 2019 Eduard Siniakov. All rights reserved.
//

import Foundation

struct SearchResponse: Decodable {
    var status: String
    var totalResults: Int
    var articles: [News]
}

struct News: Decodable {
   // var source: [Source]
    var title: String?
    var description: String?
    var urlToImage: String?
    var url: String?
}


struct Source: Decodable {
    var id: String?
    var name: String?
}
