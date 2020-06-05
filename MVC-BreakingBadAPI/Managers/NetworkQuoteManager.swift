//
//  NetworkQuoteManager.swift
//  MVC-BreakingBadAPI
//
//  Created by i.artemov on 05.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

import Alamofire

enum NetworkQuoteManager {
    
    static func getRandomQuote(completionHandler: @escaping (Result<[Quote], Error>) -> Void) {
        AF.request("https://www.breakingbadapi.com/api/quote/random", method: .get).responseJSON { response in
            switch response.result {
            case .success:
                if let jsonData = response.data {
                    do {
                        let quote = try JSONDecoder().decode([Quote].self, from: jsonData)
                        completionHandler(.success(quote))
                    } catch let error {
                        completionHandler(.failure(error))
                    }
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
