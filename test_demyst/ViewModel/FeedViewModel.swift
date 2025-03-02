//
//  FeedViewModel.swift
//  test_demyst
//
//  Created by Muhammad Saud Anwar on 02/03/2025.
//

import SwiftUI
import Combine

class FeedViewModel: ObservableObject {
    @Published var posts: [Post] = []
    private var cancellables = Set<AnyCancellable>()
    private var page = 0
    private let imgurService = ImgurService()
    
    init() {
        loadMorePosts()
    }

    func loadMorePosts() {
        print("Loading more posts, page: \(page)")
        
        imgurService.fetchPosts(page: page)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Successfully loaded posts")
                case .failure(let error):
                    print("Error fetching posts: \(error.localizedDescription)")
                }
            }, receiveValue: { newPosts in
                self.posts.append(contentsOf: newPosts)
                self.page += 1
            })
            .store(in: &cancellables)
    }
}
