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
    
    static func getRandomQuote(completion: @escaping (Quote?, Error?) -> Void) {
        NetworkQuoteManager.getRandomQuote { result in
            switch result {
            case .success(let quote):
                completion(quote.first, nil)
            case.failure(let error):
                completion(nil, error)
            }
        }
    }
}
