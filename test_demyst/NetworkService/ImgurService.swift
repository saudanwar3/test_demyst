////
////  ImgurService.swift
////  test_demyst
////
////  Created by Muhammad Saud Anwar on 02/03/2025.
////
//
import Foundation
import Combine

struct ImgurResponse: Codable {
    let data: [ImgurItem]
}

struct ImgurItem: Codable {
    let link: String?
    let is_album: Bool? // Indicates if it's an album
}

class ImgurService {
    private let clientID = "0a55a14f01cdfab"

    func fetchPosts(page: Int) -> AnyPublisher<[Post], Error> {
        guard let url = URL(string: "https://api.imgur.com/3/gallery/hot/viral/\(page)") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.setValue("Client-ID \(clientID)", forHTTPHeaderField: "Authorization")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .handleEvents(receiveSubscription: { _ in print("Fetching page: \(page)") },
                          receiveOutput: { data, _ in print("Received data: \(data.count) bytes") },
                          receiveCompletion: { completion in print("Completion: \(completion)") })
            .map(\.data)
            .decode(type: ImgurResponse.self, decoder: JSONDecoder())
            .map { response in
                response.data.compactMap { item -> Post? in
                    guard let link = item.link, !(item.is_album ?? false) else {
                        print("Skipping album: \(item.link ?? "Unknown")")
                        return nil
                    }
                    let isVideo = link.hasSuffix(".mp4") || link.contains("/video/")
                    return Post(mediaURL: link, isVideo: isVideo)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
