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
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func configureUI(travel: Travel) {
        
        configureImageView(urlAdress: travel.travel_image)
        configureTitleLabel(title: travel.title)
        configureDescriptionLabel(title: travel.description)
    }

    //TODO: - URL 불러오는 로직 설정하기
    private func configureURL(urlAdress: String) -> URL {
        
        let url = URL(string: urlAdress)!
        
        return url
    }
    
    //TODO: - Image View 그리는 로직 설정하기
    private func configureImageView(urlAdress: String?){
        if let adress = urlAdress {
            travelImageView.kf.setImage(with: configureURL(urlAdress: adress))
            print(adress)
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
    
    
}
