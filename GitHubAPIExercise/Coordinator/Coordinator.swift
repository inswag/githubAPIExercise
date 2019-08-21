//
//  Coordinator.swift
//  GitHubAPIExercise
//
//  Created by 박인수 on 21/08/2019.
//  Copyright © 2019 inswag. All rights reserved.
//

import UIKit

enum Coordinator {
    case main
    case second(id: Int)
}



extension Coordinator {

    var viewController: UIViewController {
        switch self {
        case .main:
            let mainTableVC = MainTableVC()
            let navMainTableVC = UINavigationController(rootViewController: mainTableVC)
            return navMainTableVC
        case .second(id: let value):
            let secondVC = SecondVC(receivedID: value)
            return secondVC
        }
    }
    
}
