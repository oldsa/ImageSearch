//
//  ViewModel.swift
//  Image Search
//
//  Created by Anthony Olds on 1/27/22.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var imageList = [ImgurPost]()
    
    @Published var isLoading = false
    
    func submitSearch(search: String)
    {
        ImgurService().pullImages(searchText: search, onCompletion: onRecieved(imagePostList:error:))
        
        isLoading = true
    }
    
    func onRecieved(imagePostList: [ImgurPost], error: Error?)
    {
        DispatchQueue.main.async {
            //todo Error handling
            self.imageList = imagePostList
            self.isLoading = false
        }
    }
}
