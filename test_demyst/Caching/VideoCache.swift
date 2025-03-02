//
//  VideoCache.swift
//  test_demyst
//
//  Created by Muhammad Saud Anwar on 02/03/2025.
//

import AVKit

class VideoCache {
    static var shared = [String: AVPlayer]()

    static func getPlayer(urlString: String) -> AVPlayer {
        if let player = shared[urlString] {
            print("Loaded cached video: \(urlString)")
            return player
        }

        guard let url = URL(string: urlString) else {
            print("Invalid video URL: \(urlString)")
            return AVPlayer()
        }

        let player = AVPlayer(url: url)
        player.isMuted = true  // ✅ Start muted by default
        shared[urlString] = player

        print("Cached new video: \(urlString)")
        return player
    }
}
