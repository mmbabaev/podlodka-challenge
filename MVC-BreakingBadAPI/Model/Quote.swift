//
//  Quote.swift
//  MVC-BreakingBadAPI
//
//  Created by i.artemov on 05.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import Foundation

struct Quote: Codable {
    let id: String
    let quote: String
    let author: String
    
    enum CodingKeys: String, CodingKey {
        case id = "quote_id"
        case quote
        case author
    }
    
    static func getRandomQuote(completion: @escaping (Result<Quote, Error>) -> Void) {
        NetworkQuoteManager.getRandomQuote { result in
            return result
        }
    }
}
