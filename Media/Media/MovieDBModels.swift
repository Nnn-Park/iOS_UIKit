//
//  MovieDBModels.swift
//  Media
//
//  Created by 박재형 on 6/11/24.
//

import Foundation

struct MovieDB: Decodable {
    let page: Int
    let results: [Result]
}

struct Result: Decodable {
    let poster_path: String?
}
