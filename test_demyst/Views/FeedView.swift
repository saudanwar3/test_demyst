//
//  FeedView.swift
//  test_demyst
//
//  Created by Muhammad Saud Anwar on 02/03/2025.
//

import SwiftUI

struct FeedView: View {
    @StateObject private var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.posts.indices, id: \.self) { index in
                        PostCell(post: viewModel.posts[index])
                            .onAppear {
                                if index == viewModel.posts.count - 1 {
                                    viewModel.loadMorePosts()
                                }
                            }
                    }
                }
            }
            .navigationTitle("🔥 Trending") // ✅ Added navigation title
        }
    }
}
