//
//  Post.swift
//  test_demyst
//
//  Created by Muhammad Saud Anwar on 02/03/2025.
//

import Foundation

struct Post: Identifiable {
    let id = UUID()
    let mediaURL: String
    let isVideo: Bool
}
