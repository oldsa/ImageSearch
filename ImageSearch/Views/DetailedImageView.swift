//
//  DetailedImageView.swift
//  Image Search
//
//  Created by Anthony Olds on 1/27/22.
//

import SwiftUI

struct DetailedImageView: View {
    
    var imageURL : URL
    var title : String
    var description : String
    
    var body: some View {
        VStack {
            Text(title)
            Text(description)
            NiceImageView(url: imageURL)
        }
    }
}
