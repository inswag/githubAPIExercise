//
//  UserList.swift
//  GitHubAPIExercise
//
//  Created by 박인수 on 21/08/2019.
//  Copyright © 2019 inswag. All rights reserved.
//

import Foundation

struct UserList: Decodable {
    let avatarURL: String
    let id: Int
    let login: String
    
    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
        case id = "id"
        case login = "login"
    }
}
