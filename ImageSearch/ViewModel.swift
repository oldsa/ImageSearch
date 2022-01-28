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
    @Published var showError = false
    @Published var errorMessage = ""
    
    func submitSearch(search: String)
    {
        ImgurService().pullImages(searchText: search, onCompletion: onRecieved(imagePostList:error:))
        isLoading = true
    }
    
    func onRecieved(imagePostList: [ImgurPost], error: Error?)
    {
        DispatchQueue.main.async {
            if let error = error {
                self.showError = true
                self.errorMessage = error.localizedDescription
            }
            else {
                self.imageList = imagePostList
                self.isLoading = false
            }
        }
    }
}
