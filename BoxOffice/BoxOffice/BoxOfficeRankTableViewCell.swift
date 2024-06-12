//
//  BoxOfficeRankTableViewCell.swift
//  BoxOffice
//
//  Created by 박재형 on 6/12/24.
//

import UIKit

import SnapKit


class BoxOfficeRankTableViewCell: UITableViewCell {
    
    static let identifier = "BoxOfficeRankTableViewCell"
    
    let rankView = UIView()
    
    let rank = UILabel()
    let movieTitle = UILabel()
    let date = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .systemGray6
        
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        
        contentView.addSubview(rankView)
        contentView.addSubview(rank)
        contentView.addSubview(movieTitle)
        contentView.addSubview(date)
    }
    
    func configureLayout() {
        
        rankView.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(15)
            make.width.equalTo(50)
            make.height.equalTo(35)
        }
        
        rank.snp.makeConstraints { make in
            make.centerX.equalTo(rankView)
            make.centerY.equalTo(rankView)
        }
      
        movieTitle.snp.makeConstraints { make in
            make.top.equalTo(rankView.snp.top)
            make.leading.equalTo(rankView.snp.trailing).offset(20)
            make.width.equalTo(150)
            make.height.equalTo(rankView.snp.height)
        }
    
        date.snp.makeConstraints { make in
            make.top.equalTo(rankView.snp.top)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).offset(-10)
            make.width.equalTo(100)
            make.height.equalTo(rankView.snp.height)
        }
        
    }
    
    func configureUI() {
        
        rankView.backgroundColor = .white
        rank.textColor = .black
        movieTitle.textColor = .black
        date.textColor = .black
    }

}
