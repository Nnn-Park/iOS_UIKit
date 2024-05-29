//
//  AdvertisementTableViewCell.swift
//  Travel
//
//  Created by 박재형 on 5/27/24.
//

import UIKit

class AdvertisementTableViewCell: UITableViewCell {

    @IBOutlet var adMainLabel: UILabel!
    
    @IBOutlet var adUIView: UIView!
    
    // Cell Reuse 해결 하기 위한 연산 프로퍼티
    var isBackgroundRandom: Bool? {
        didSet {
            if isBackgroundRandom == true {
                adUIView.backgroundColor = .random
            } else {
                adUIView.backgroundColor = .random
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureAdUI()
    }
    
    //MARK: - ad == true일 때 광고 레이블 적용
    func showAdTitle(travel: Travel) {
        if travel.ad == true {
            adMainLabel.text = travel.title
        } else {
            return
        }
    }
    
    //MARK: - 광고 레이블 그리기
    // 배경색이 2개만 나오는 것 확인 -> Cell 재사용 때문
    func configureAdUI() {
        adMainLabel.textAlignment = .center
        adMainLabel.numberOfLines = 3
        adMainLabel.font = UIFont.systemFont(ofSize: 15)
        
        adUIView.backgroundColor = .random
        adUIView.layer.cornerRadius = 15
    }
    
    //MARK: - ad Cell의 배경만 random Color로 만들기
    func findAdCell(ad: Bool) {
        adUIView.backgroundColor = .random
    }
    
}

// MARK: - 랜덤컬러
extension UIColor {
    public class var random: UIColor {
        return UIColor(red: CGFloat(Float.random(in: 0...1)),
                       green: CGFloat(Float.random(in: 0...1)),
                       blue: CGFloat(Float.random(in: 0...1)), alpha: 1.0)
    }
}

