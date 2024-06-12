//
//  BoxOfficeStruct.swift
//  BoxOffice
//
//  Created by 박재형 on 6/12/24.
//

import Foundation

struct BoxOfficeResponse: Decodable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Decodable {
    var dailyBoxOfficeList: [BoxOffice]
}

struct BoxOffice: Decodable {
    let rank: String
    let movieNm: String
    let openDt: String
}
