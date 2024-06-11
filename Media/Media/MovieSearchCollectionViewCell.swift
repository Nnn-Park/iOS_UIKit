//
//  MovieSearchCollectionViewCell.swift
//  Media
//
//  Created by 박재형 on 6/11/24.
//

import UIKit

import Kingfisher
import SnapKit

class MovieSearchCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MovieSearchCollectionViewCell"
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .blue
        contentView.addSubview(imageView)
        
        
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaLayoutGuide)
        }
    }
    
    func makeImage(data: String) {
        
        let url = URL(string: data)
        imageView.kf.setImage(with: url)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
