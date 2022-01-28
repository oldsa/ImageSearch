//
//  NiceImageView.swift
//  Image Search
//
//  Created by Anthony Olds on 1/27/22.
//

import SwiftUI

struct NiceImageView: View {
    var url : URL
    
    var body: some View {
        AsyncImage(url: url){ loadedImage in
            loadedImage.resizable().scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
}

struct NiceImageView_Previews: PreviewProvider {
    static var previews: some View {
        NiceImageView(url: URL(string: "https://i.imgur.com/T3Z93tU.mp4")!)
    }
}
