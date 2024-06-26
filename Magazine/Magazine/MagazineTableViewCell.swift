//
//  MagazineTableViewCell.swift
//  Magazine
//
//  Created by 박재형 on 5/26/24.
//

import UIKit
import Kingfisher

class MagazineTableViewCell: UITableViewCell {
    
    @IBOutlet var magazineImageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
    // MARK: - Main UI 구성
    func configureUI(magazine: Magazine) {
        
        configureImageView(urlAdress: magazine.photo_image)
        configureTitleLabel(title: magazine.title)
        configureSubTitleLabel(title: magazine.subtitle)
        configureDateLabel(dateString: magazine.date)
    }
    
    //TODO: - URL 불러오는 로직 설정하기
    private func configureURL(urlAdress: String) -> URL {
        let url = URL(string: urlAdress)!
        
        return url
    }
    
    //TODO: - Image View 그리는 로직 설정하기
    private func configureImageView(urlAdress: String){
        
        magazineImageView.kf.setImage(with: configureURL(urlAdress: urlAdress))
        magazineImageView.contentMode = .scaleAspectFill
        magazineImageView.layer.cornerRadius = 10
    }
    
    
    //TODO: - Title Label 그리는 로직 설정하기
    func configureTitleLabel(title: String) {
        
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(5))
    }
    
    //TODO: - SubTitle Label 그리는 로직 설정하기
    func configureSubTitleLabel(title: String) {
        
        subTitleLabel.text = title
        subTitleLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight(5))
        subTitleLabel.textColor = .systemGray2
    }
    
    //TODO: - Date Label 그리는 로직 설정하기
    func configureDateLabel(dateString: String) {
        
        
        dateLabel.text = formatDate(dateString: dateString)
        dateLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight(5))
        dateLabel.textColor = .systemGray2
        dateLabel.textAlignment = .right
    }
    
    //TODO: - Date Format 변화
    private func formatDate(dateString: String) -> String? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"
        
        guard let date = dateFormatter.date(from: dateString) else {
            return nil
        }
        
        dateFormatter.dateFormat = "yy년 MM월 dd일"
        return dateFormatter.string(from: date)
    }
}
