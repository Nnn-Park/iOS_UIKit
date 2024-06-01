//
//  CityTableViewCell.swift
//  Travel
//
//  Created by 박재형 on 5/31/24.
//

import UIKit
import Kingfisher

class CityTableViewCell: UITableViewCell {

    @IBOutlet var cityImage: UIImageView!
    
    @IBOutlet var cityNameLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureUI(city: City) {
        configureImageView(urlAdress: city.city_image)
        configureCityNameLabel(cityName: city.city_name, cityEnName: city.city_english_name)
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
            cityImage.kf.setImage(with: configureURL(urlAdress: adress))
        }
        cityImage.contentMode = .scaleAspectFill
        cityImage.layer.cornerRadius = 10
    }
    
    //TODO: - City Label 그리는 로직 설정하기
    private func configureCityNameLabel(cityName: String, cityEnName: String) {
        
        cityNameLabel.text = "\(cityName) | \(cityEnName)"
        cityNameLabel.textAlignment = .right
        cityNameLabel.textColor = .white
        cityNameLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(5))
    }
    
    
    
}
