//
//  ImgurService.swift
//  Image Search
//
//  Created by Anthony Olds on 1/26/22.
//

import Foundation

public class ImgurService {
    private let CLIENT_ID = "b067d5cb828ec5a"
    
    private let IMGUR_URL = "https://api.imgur.com/3/gallery/search/top/?q_all="
    
    func pullImages(searchText: String, onCompletion: @escaping ([ImgurPost], Error?)->())
    {
        
        let replaceSpaces = searchText.replacingOccurrences(of: " ", with: ",")
        
        let url = URL(string: IMGUR_URL + replaceSpaces)!
        var request = URLRequest(url: url)
        request.setValue("Client-ID \(CLIENT_ID)", forHTTPHeaderField: "Authorization")
        
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.httpAdditionalHeaders = [
            "Authorization" : "Client-ID \(CLIENT_ID)"
        ]
        
        let session = URLSession(configuration: sessionConfiguration)
        
        session.dataTask(with: request, completionHandler: {(data, response, error) in
            if let data = data {
                print(String(decoding: data, as: UTF8.self))
                do {
                    let decoder = JSONDecoder()
                    let imgurData = try decoder.decode(ImgurData.self, from: data)
                    onCompletion(imgurData.data, nil)
                } catch {
                    print("Couldn't parse json response as \(ImgurData.self):\n\(error)")
                }
            }
        }).resume()
        
    }
}
