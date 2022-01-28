//
//  ContentView.swift
//  Image Search
//
//  Created by Anthony Olds on 1/26/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.dismissSearch) private var dismissSearch
    
    @StateObject private var viewModel = ViewModel()
    
    @State private var searchText = ""
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            if(viewModel.isLoading)
            {
                VStack
                {
                    Text("Retrieving Images of \(searchText) from Imgur!")
                    ProgressView()
                }
            }
            else
            {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach (viewModel.imageList) { imagePost in
                            NavigationLink(destination: {
                                DetailedImageView(imageURL: imagePost.images?.first?.url ?? imagePost.url!, title: imagePost.title ?? "No title!", description: imagePost.description ?? "No Description!")
                            }, label: {
                                NiceImageView(url: imagePost.images?.first?.url ?? imagePost.url!)
                                    .frame(height: 100)
                            })
                        }
                    }
                }.onAppear(perform: {
                    searchText = ""
                })
            }
        }
        .searchable(text:$searchText)
        .onSubmit(of: .search) {
            viewModel.submitSearch(search: searchText)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
