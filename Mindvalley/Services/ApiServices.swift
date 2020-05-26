//
//  ApiConstants.swift
//  Mindvalley
//
//  Created by Amaechi Osazuwa on 20/05/2020.
//  Copyright © 2020  Amaechi Osazuwa. All rights reserved.
//

import UIKit

class ApiServices: NSObject {
    
    static let sharedInstance = ApiServices()
    static let baseurl = "https://pastebin.com/raw/"
    
    // one function to get all api services for episodes, channels and categories
    func getGenericData<T:Decodable>(urlString:String,completion:@escaping(Result<T, Error>)->()){
        guard let url = URL(string: "\(ApiServices.baseurl)\(urlString)") else {return}
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(.failure(err))
                return
            }
            do {
                let data = try JSONDecoder().decode(T.self, from: data!)
                DispatchQueue.main.async {
                     completion (.success(data))
                }
            } catch let jsonErr {
                print(jsonErr.localizedDescription)
                completion(.failure(jsonErr))
            }
        }.resume()
    }
}
