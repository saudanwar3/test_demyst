//
//  Post.swift
//  test_demyst
//
//  Created by Muhammad Saud Anwar on 02/03/2025.
//

import Foundation

enum MediaType: Hashable {
    case image(URL)
    case video(URL)
}

struct Post: Identifiable, Hashable {
    let id = UUID()
    let media: [MediaType]
}
