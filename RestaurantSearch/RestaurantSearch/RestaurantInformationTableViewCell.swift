//
//  RestaurantInformationTableViewCell.swift
//  RestaurantSearch
//
//  Created by 박재형 on 5/26/24.
//

import UIKit
import Kingfisher

class RestaurantInformationTableViewCell: UITableViewCell {


    @IBOutlet var restaurantImageView: UIImageView!
    
    
    @IBOutlet var restaurantNameLabel: UILabel!
    @IBOutlet var restaurantCategoryLabel: UILabel!
    @IBOutlet var restaurantAdressLabel: UILabel!
    @IBOutlet var restaurantPhoneNumberLabel: UILabel!
    @IBOutlet var restaurantPriceLabel: UILabel!
    
    
    // MARK: - Main UI 구성
    func configureUI(restaurant: Restaurant) {
        
        configureImageView(urlAdress: restaurant.image)
        configureNameTitleLabel(title: restaurant.name)
        configureCategoryTitleLabel(title: restaurant.category)
        configureAdresseLabel(title: restaurant.address)
        configurePhoneNumberLabel(title: restaurant.phoneNumber)
        configurePriceLabel(number: restaurant.price)
    }
    
    //TODO: - URL 불러오는 로직 설정하기
    private func configureURL(urlAdress: String) -> URL {
        let url = URL(string: urlAdress)!
        
        return url
    }
    
    //TODO: - Image View 그리는 로직 설정하기
    private func configureImageView(urlAdress: String){
        
        restaurantImageView.kf.setImage(with: configureURL(urlAdress: urlAdress))
        restaurantImageView.contentMode = .scaleAspectFill
        restaurantImageView.layer.cornerRadius = 10
    }
    
    
    //TODO: - 식당 이름 Label 그리는 로직 설정하기
    func configureNameTitleLabel(title: String) {
        
        restaurantNameLabel.text = title
        restaurantNameLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(5))
    }
    
    //TODO: - 카테고리 Label 그리는 로직 설정하기
    func configureCategoryTitleLabel(title: String) {
        
        restaurantCategoryLabel.text = title
        restaurantCategoryLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight(5))
        restaurantCategoryLabel.textColor = .systemGray2
    }
    
    //TODO: - 주소 Label 그리는 로직 설정하기
    func configureAdresseLabel(title: String) {
        
        restaurantAdressLabel.text = "주소: \(title)"
        restaurantAdressLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight(5))
        restaurantAdressLabel.textColor = .systemGray2
        restaurantAdressLabel.textAlignment = .left
    }
    
    //TODO: - 전화번호 Label 그리는 로직 설정하기
    func configurePhoneNumberLabel(title: String) {
        
        restaurantPhoneNumberLabel.text = title
        restaurantPhoneNumberLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight(5))
        restaurantPhoneNumberLabel.textColor = .systemGray2
        restaurantPhoneNumberLabel.textAlignment = .right
    }
    
    //TODO: - 가격 Label 그리는 로직 설정하기
    func configurePriceLabel(number: Int) {
        
        restaurantPriceLabel.text = "가격: \(number)"
        restaurantPriceLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight(5))
        restaurantPriceLabel.textColor = .systemGray2
        restaurantPriceLabel.textAlignment = .right
    }
    
}
