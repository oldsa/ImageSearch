//
//  ImgurImage.swift
//  Image Search
//
//  Created by Anthony Olds on 1/27/22.
//

import Foundation

struct ImgurImage: Codable, Identifiable {
    var id: String
    var title: String?
    var description: String?
    var link: String
    var url: URL? {
        URL(string: link)
    }
}
