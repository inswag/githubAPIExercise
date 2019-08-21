//
//  MainController.swift
//  GitHubAPIExercise
//
//  Created by 박인수 on 21/08/2019.
//  Copyright © 2019 inswag. All rights reserved.
//


import UIKit
import Alamofire
import Kingfisher


class MainTableVC: UITableViewController {
    
    let cellID = "cellID"
    
    private let userListService: UserListServiceType = UserListService()
    var fetchedUserList: [UserList] = []
    
    var pageNumber = 30
    
    var exchangedValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = .white
        self.tableView.register(UserListCell.self, forCellReuseIdentifier: cellID)
        
        // RefreshControl
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        // Network
        fetchUserList()
        print("viewDidLoad Finished")
    }
    
    // RefreshControl function
    @objc func handleRefresh() {
        print("Handling refresh.." )
        fetchedUserList.removeAll()
        pageNumber = 30
        fetchUserList()
    }
    
    fileprivate func fetchUserList(since: Int = 0) {
        self.tableView.refreshControl?.endRefreshing()
        
        userListService.fetchUserList(since: since) { (result) in
            switch result {
            case .success(let value):
                value.forEach {
                    self.fetchedUserList.append($0)
                }
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    fileprivate func paginateUserList() {
        print("will Paginate User List!")
        print("pageNumber: ", pageNumber)
        
        fetchUserList(since: pageNumber)
        pageNumber += 30
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.rowHeight = 176 - 32
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
}

extension MainTableVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection: \(fetchedUserList.count)")
        return fetchedUserList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! UserListCell
        cell.orderNumber.text = "\(fetchedUserList[indexPath.row].id)"
        cell.username.text = "\(fetchedUserList[indexPath.row].login)"
        cell.userProfileIV.kf.setImage(with: URL(string: fetchedUserList[indexPath.row].avatarURL))
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.pageNumber - 1 {
            self.paginateUserList()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.exchangedValue = self.fetchedUserList[indexPath.row].id
        print(self.exchangedValue)
        self.navigationController?.pushViewController(Coordinator.second(id: exchangedValue).viewController, animated: true)
    }
    
}
