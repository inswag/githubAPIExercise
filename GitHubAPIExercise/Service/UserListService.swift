//
//  UserListService.swift
//  GitHubAPIExercise
//
//  Created by 박인수 on 21/08/2019.
//  Copyright © 2019 inswag. All rights reserved.
//

import Foundation
import Alamofire

protocol UserListServiceType {
    func fetchUserList(since: Int, completion: @escaping (Result<[UserList]>) -> ())
}

enum API {
    static let baseURL = "https://api.github.com/users?since="
    static let client = "?client_id=dcd4d4bc4194d79d99b8&client_secret=25461acdedb15cc21a93679305e8b4f0da4bbeaf"
}

enum Result<T> {
    case success(T)
    case failure(Data?, Error)
}

struct UserListService: UserListServiceType {
    
    func fetchUserList(since: Int = 0, completion: @escaping (Result<[UserList]>) -> ()) {
        
        let api = "\(API.baseURL)\(since)\(API.client)"
        Alamofire
            .request(api, method: .get)
            .validate()
            .responseData { (response) in
                switch response.result {
                case .success(let value) :
                    do {
                        let decodableValue = try JSONDecoder().decode([UserList].self, from: value)
                        completion(Result.success(decodableValue))
                    } catch {
                        completion(.failure(nil, error))
                    }
                case .failure(let error) :
                    completion(.failure(response.data!, error))
                }
        }
    }
}


