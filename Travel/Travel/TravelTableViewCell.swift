//
//  TravelTableViewCell.swift
//  Travel
//
//  Created by 박재형 on 5/27/24.
//

import UIKit
import Kingfisher

class TravelTableViewCell: UITableViewCell {

    
    @IBOutlet var travelNameLabel: UILabel!
    @IBOutlet var travelInfoLabel: UILabel!
    
    @IBOutlet var travelImageView: UIImageView!
    
    
    @IBOutlet var travelGradeLabel: UILabel!
    
   
    @IBOutlet var travelSaveLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureUI(travel: Travel) {
        
        configureImageView(urlAdress: travel.travel_image)
        configureTitleLabel(title: travel.title)
        configureDescriptionLabel(title: travel.description)
        configureGradeLabel(grade: travel.grade)
        configureSaveLabel(save: travel.save)
    }

    //TODO: - URL 불러오는 로직 설정하기
    private func configureURL(urlAdress: String) -> URL? {
        
        guard let url = URL(string: urlAdress) else {
            return nil
        }
        
        return url
    }
    
    //TODO: - Image View 그리는 로직 설정하기
    private func configureImageView(urlAdress: String?){
        
        if let adress = urlAdress {
            travelImageView.kf.setImage(with: configureURL(urlAdress: adress))
        }
        travelImageView.contentMode = .scaleAspectFill
        travelImageView.layer.cornerRadius = 10
    }
    
    //TODO: - Title Label 그리는 로직 설정하기
    private func configureTitleLabel(title: String) {
        
        travelNameLabel.text = title
        travelNameLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(5))
    }
    
    //TODO: - description Label 그리는 로직 설정하기
    private func configureDescriptionLabel(title: String?) {
        
        if let mainTitle = title {
            travelInfoLabel.text = mainTitle
        }
        travelInfoLabel.numberOfLines = 5
        travelInfoLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight(5))
        travelInfoLabel.textColor = .systemGray2
    }
    
    //TODO: - 별점 표시하는 레이블
    private func configureGradeLabel(grade: Double?) {
        if let grade {
            travelGradeLabel.text = "\(grade)점"
        }
        travelGradeLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight(5))
        travelGradeLabel.textColor = .systemYellow
    }
    
    //TODO: - 저장 횟수 표시하는 레이블
    private func configureSaveLabel(save: Int?) {
        if let saved = save {
            travelSaveLabel.text = "저장 \(saved.formatted())"
        }
        travelSaveLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight(5))
        travelSaveLabel.textColor = .black
    }
    
}
