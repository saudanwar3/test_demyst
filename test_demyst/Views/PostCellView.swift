//
//  PostCellView.swift
//  test_demyst
//
//  Created by Muhammad Saud Anwar on 02/03/2025.
//

import SwiftUI
import AVKit

struct PostCell: View {
    let post: Post
    @State private var image: UIImage? = nil
    @State private var player: AVPlayer?
    
    var body: some View {
        VStack {
            if post.isVideo {
                VideoPlayer(player: player)
                    .frame(height: 300)
                    .onAppear {
                        print("Playing video: \(post.mediaURL)")
                        player = VideoCache.getPlayer(urlString: post.mediaURL)
                        player?.play()
                        player?.isMuted = false
                    }
                    .onDisappear {
                        print("Pausing video: \(post.mediaURL)")
                        player?.pause()
                        player?.isMuted = true
                    }
            } else {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                } else {
                    Image("placeholder")
                        .resizable()
                        .scaledToFit()
                        .onAppear {
                            print("Loading image: \(post.mediaURL)")
                            ImageCache.loadImage(urlString: post.mediaURL) { loadedImage in
                                self.image = loadedImage
                            }
                        }
                }
            }
        }
    }
}
