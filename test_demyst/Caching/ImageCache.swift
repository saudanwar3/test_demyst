//
//  ImageCache.swift
//  test_demyst
//
//  Created by Muhammad Saud Anwar on 02/03/2025.
//

import UIKit

class ImageCache {
    static let shared = NSCache<NSString, UIImage>()
    
    static func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = shared.object(forKey: urlString as NSString) {
            print("Loaded cached image: \(urlString)")
            completion(cachedImage)
            return
        }

        guard let url = URL(string: urlString) else {
            print("Invalid image URL: \(urlString)")
            completion(UIImage(named: "placeholder")) // Use placeholder if URL is invalid
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error loading image: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(UIImage(named: "placeholder")) // Show placeholder if error
                }
                return
            }

            if let data = data, let image = UIImage(data: data) {
                shared.setObject(image, forKey: urlString as NSString)
                print("Cached new image: \(urlString)")
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                print("Failed to decode image from data: \(urlString)")
                DispatchQueue.main.async {
                    completion(UIImage(named: "placeholder")) // Show placeholder if decoding fails
                }
            }
        }.resume()
    }
}
