//
//  Comment.swift
//  MVP.Router.Assemply.Tests
//
//  Created by admin on 25.07.2023.
//

import Foundation

struct Comment: Decodable {
    var postId: Int
    var id:     Int
    var name:   String
    var email:  String
    var body:   String
}
