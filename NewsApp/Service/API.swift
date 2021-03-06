//
//  API.swift
//  NewsApp
//
//  Created by Sabina Huseynova on 25.09.21.
//

import Foundation
import UIKit

struct API {
    
 static let baseUrl = "https://newsapi.org/v2/top-headlines"
 static let baseUrl1 = "https://newsapi.org/v2/top-headlines/sources"
 static let apiKey = "3f21ce1e408444928ebd80a06129d57a"
 static var pageSize = "10"
 static var page = "1"
}

//enum Query {
//    
//    case countryQ
//    case categoryQ
//    case publishedAtQ
//    case sourceQ
//    case searchingQ
//}
//    var queryItem: [URLQueryItem] {
//        switch self {
//        case .countryQ:
//            [
//                "country": String.self,
//                "apiKey": API.apiKey
//            ]
//        case .categoryQ:
//            [
//                "category": query,
//                "apiKey": API.apiKey
//            ]
//        case .sourceQ:
//            [
//                "sources": query,
//                "apiKey": API.apiKey
//            ]
//        case .publishedAtQ:
//            [
//                "from": query,
//                "apiKey": API.apiKey
//            ]
//        case .searchingQ:
//            [
//                "q": query,
//                "apiKey": API.apiKey
//            ]
//        case .everythingQ:
//            [
//                "sources": "",
//                "apiKey": API.apiKey
//            ]
//            
//        }
//
//    }
//}



