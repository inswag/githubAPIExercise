//
//  MainUserListCell.swift
//  GitHubAPIExercise
//
//  Created by 박인수 on 21/08/2019.
//  Copyright © 2019 inswag. All rights reserved.
//

import UIKit
import SnapKit

class UserListCell: UITableViewCell {
    
    let cellID = "cellID"
    
    let backgroundBorder: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2.0
        return view
    }()
    
    let userProfileIV: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .lightGray
        return iv
    }()
    
    let orderNumber: UILabel = {
        let label = UILabel()
        label.text = "숫자"
        label.textAlignment = .left
        return label
    }()
    
    let username: UILabel = {
        let label = UILabel()
        label.text = "유저이름"
        label.textAlignment = .left
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: cellID)
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        // Snapkit 으로 오토레이아웃
        
        let stackView = UIStackView(arrangedSubviews: [orderNumber, username])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        self.contentView.addSubview(backgroundBorder)
        self.backgroundBorder.addSubview(userProfileIV)
        self.backgroundBorder.addSubview(stackView)
        
        backgroundBorder.snp.makeConstraints { (m) in
            m.top.equalToSuperview().offset(8)
            m.leading.equalToSuperview().offset(16)
            m.trailing.equalToSuperview().offset(-16)
            m.bottom.equalToSuperview().offset(-8)
        }
        userProfileIV.snp.makeConstraints { (m) in
            m.top.equalTo(0)
            m.leading.equalTo(0)
            m.width.height.equalTo(128)
        }
        
        stackView.snp.makeConstraints { (m) in
            m.centerY.equalTo(userProfileIV.snp.centerY)
            m.leading.equalTo(userProfileIV.snp.trailing).offset(16)
            m.trailing.equalTo(backgroundBorder.snp.trailing).offset(-16)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}
