//
//  SecondController.swift
//  GitHubAPIExercise
//
//  Created by 박인수 on 21/08/2019.
//  Copyright © 2019 inswag. All rights reserved.
//

import UIKit
import Foundation

class SecondVC: UIViewController {
    
    var receivedID: Int
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        print("Second View Controller !: ", receivedID)
    }
    
    init(receivedID: Int) {
        
        self.receivedID = receivedID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
