//
//  DetailedImageView.swift
//  Image Search
//
//  Created by Anthony Olds on 1/27/22.
//

import SwiftUI

struct DetailedImageView: View { 
    var imageURL : URL
    var title : String?
    var description : String?
    
    var body: some View {
        VStack(alignment: .leading) {
            if let title = title {
                Text("Title: ").bold()
                Text(title).padding(.bottom, 5)
                
            }
            if let description = description {
                Text("Description: ").bold()
                Text(description)
            }
            NiceImageView(url: imageURL)
        }
    }
}
