//
//  ImgurPost.swift
//  Image Search
//
//  Created by Anthony Olds on 1/27/22.
//

import Foundation

struct ImgurPost : Codable, Identifiable {
    var id: String
    var title: String?
    var description: String?
    var is_album: Bool
    var images: [ImgurImage]?
    var link: String
    var url: URL? {
        URL(string: link)
    }
}

struct ImgurData : Codable {
    var data: [ImgurPost]
    var success: Bool
    var status: Int
}
