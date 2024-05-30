//
//  TravelSpotViewController.swift
//  Travel
//
//  Created by 박재형 on 5/29/24.
//

import UIKit
import Kingfisher

class TravelSpotViewController: UIViewController {
    
    
    @IBOutlet var travelSpotInfoImage: UIImageView!
    
    @IBOutlet var travelSpotDescriptionLabel: UILabel!
    
    @IBOutlet var travelSpotLikeButton: UIButton!
    @IBOutlet var travelSpotSaveButton: UIButton!
    @IBOutlet var travelSpotAdButton: UIButton!
    
    var data: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let data else {
            return
        }
        
        navigationItem.title = data.title
        
        configureUI(travelInfo: data)
    }
    
    
    
    func configureUI(travelInfo: Travel) {
        
        configureImageView(urlAdress: travelInfo.travel_image)
        configureDescriptionLabel(description: travelInfo.description)
        configureLikeButton()
        configureSaveButton()
        configureAdButton()
        likeButtonAlert()
        saveButtonAlert()
    }
    
    //MARK: - URL 불러오는 로직 설정
    private func configureURL(urlAdress: String) -> URL? {
        
        guard let url = URL(string: urlAdress) else {
            return nil
        }
        
        return url
    }
    
    
    
    //MARK: - Image View 그리는 로직 설정
    private func configureImageView(urlAdress: String?){
        
        if let adress = urlAdress {
            travelSpotInfoImage.kf.setImage(with: configureURL(urlAdress: adress))
        }
        travelSpotInfoImage.contentMode = .scaleAspectFill
        travelSpotInfoImage.layer.cornerRadius = 10
    }
    
    //MARK: - Travel 정보 레이블 그리는 로직 설정
    private func configureDescriptionLabel(description: String?) {
        if let description {
            travelSpotDescriptionLabel.text = description
        }
        travelSpotDescriptionLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(3))
        travelSpotDescriptionLabel.numberOfLines = 0
        travelSpotDescriptionLabel.textAlignment = .natural
        travelSpotDescriptionLabel.textColor = .black
    }
    
    
    private func configureLikeButton() {
        
        travelSpotLikeButton.setTitle("좋아요", for: .normal)
        travelSpotLikeButton.tintColor = .white
        travelSpotLikeButton.backgroundColor = .systemRed
        travelSpotLikeButton.layer.cornerRadius = 10
    }
    
    private func configureSaveButton() {
        
        travelSpotSaveButton.setTitle("저장", for: .normal)
        travelSpotSaveButton.tintColor = .white
        travelSpotSaveButton.backgroundColor = .systemBlue
        travelSpotSaveButton.layer.cornerRadius = 10
    }
    
    private func configureAdButton() {
        
        travelSpotAdButton.setTitle("광고 페이지로 이동하기", for: .normal)
        travelSpotAdButton.tintColor = .white
        travelSpotAdButton.backgroundColor = .black
        travelSpotAdButton.layer.cornerRadius = 10
    }
    
    func likeButtonAlert() {
        
        travelSpotLikeButton.addTarget(nil, action: #selector(likeButtonTapped), for: .touchUpInside)
    }
    
    func saveButtonAlert() {
        
        travelSpotSaveButton.addTarget(nil, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    // AlertAction
    @objc func likeButtonTapped() {
        
        let alert = UIAlertController(title: "좋아요 버튼을 누르시겠습니까?", message: "", preferredStyle: .alert)
        
        let open = UIAlertAction(title: "확인", style: .default)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(cancel)
        alert.addAction(open)
        
        present(alert, animated: true)
    }
    
    @objc func saveButtonTapped() {
        
        let alert = UIAlertController(title: "저장 버튼을 누르시겠습니까?", message: "", preferredStyle: .alert)
        
        let open = UIAlertAction(title: "확인", style: .default)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(cancel)
        alert.addAction(open)
        
        present(alert, animated: true)
    }
}


