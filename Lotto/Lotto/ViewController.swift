//
//  ViewController.swift
//  Lotto
//
//  Created by 박재형 on 6/8/24.
//

import UIKit

import SnapKit
import Alamofire

struct Lotto: Decodable {
    let drwNoDate: String
    let drwNo: Int
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
    let recentDrwtNo: Int
}


class ViewController: UIViewController {

    let searchLottoRoundTextField = UITextField()
    
    let lottoWinnerNumberInfoLabel = UILabel()
    let lottoDrawLotsDateLabel = UILabel()
    let lottoWinningNumberLabel = UILabel()
    let roundWinningResultLabel = UILabel()
    let firstWinningNumberLabel = UILabel()
    let secondWinningNumberLabel = UILabel()
    let thirdWinningNumberLabel = UILabel()
    let fourthWinningNumberLabel = UILabel()
    let fifthWinningNumberLabel = UILabel()
    let sixthWinningNumberLabel = UILabel()
    let bonusWinningNumberLabel = UILabel()
    let plusLabel = UILabel()
    let bonusLabel = UILabel()
    
    let searchLottoRoundResultPicker = UIPickerView()
    
    var DrwNoMin: Int = 1
    var recentDrwNo: Int = 1122
    
    var allround = Array(1...1122)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchLottoRoundResultPicker.delegate = self
        searchLottoRoundResultPicker.dataSource = self
        configureHierarchy()
        configureLayout()
        configureUI()
        getLottoData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        firstWinningNumberLabel.layer.cornerRadius = firstWinningNumberLabel.frame.width / 2
        secondWinningNumberLabel.layer.cornerRadius = firstWinningNumberLabel.frame.width / 2
        thirdWinningNumberLabel.layer.cornerRadius = firstWinningNumberLabel.frame.width / 2
        fourthWinningNumberLabel.layer.cornerRadius = firstWinningNumberLabel.frame.width / 2
        fifthWinningNumberLabel.layer.cornerRadius = firstWinningNumberLabel.frame.width / 2
        sixthWinningNumberLabel.layer.cornerRadius = firstWinningNumberLabel.frame.width / 2
        plusLabel.layer.cornerRadius = plusLabel.frame.width / 2
        bonusWinningNumberLabel.layer.cornerRadius = firstWinningNumberLabel.frame.width / 2
    }

    func configureHierarchy() {
        
        view.addSubview(searchLottoRoundTextField)
        view.addSubview(lottoWinnerNumberInfoLabel)
        view.addSubview(lottoDrawLotsDateLabel)
        view.addSubview(lottoWinningNumberLabel)
        view.addSubview(roundWinningResultLabel)
        view.addSubview(firstWinningNumberLabel)
        view.addSubview(secondWinningNumberLabel)
        view.addSubview(thirdWinningNumberLabel)
        view.addSubview(fourthWinningNumberLabel)
        view.addSubview(fifthWinningNumberLabel)
        view.addSubview(sixthWinningNumberLabel)
        view.addSubview(plusLabel)
        view.addSubview(bonusWinningNumberLabel)
        view.addSubview(bonusLabel)
//        view.addSubview(searchLottoRoundResultPicker)
    }

    func configureLayout() {
        
        searchLottoRoundTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-40)
            make.height.equalTo(40)
        }
        
        lottoWinnerNumberInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(searchLottoRoundTextField.snp.bottom).offset(15)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(40)
        }
        
        lottoDrawLotsDateLabel.snp.makeConstraints { make in
            make.top.equalTo(searchLottoRoundTextField.snp.bottom).offset(15)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-40)
        }
        
        roundWinningResultLabel.snp.makeConstraints { make in
            make.top.equalTo(lottoDrawLotsDateLabel.snp.bottom).offset(60)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        firstWinningNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(roundWinningResultLabel.snp.bottom).offset(15)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        secondWinningNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(roundWinningResultLabel.snp.bottom).offset(15)
            make.leading.equalTo(firstWinningNumberLabel.snp.trailing).offset(5)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        thirdWinningNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(roundWinningResultLabel.snp.bottom).offset(15)
            make.leading.equalTo(secondWinningNumberLabel.snp.trailing).offset(5)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        fourthWinningNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(roundWinningResultLabel.snp.bottom).offset(15)
            make.leading.equalTo(thirdWinningNumberLabel.snp.trailing).offset(5)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        fifthWinningNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(roundWinningResultLabel.snp.bottom).offset(15)
            make.leading.equalTo(fourthWinningNumberLabel.snp.trailing).offset(5)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        sixthWinningNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(roundWinningResultLabel.snp.bottom).offset(15)
            make.leading.equalTo(fifthWinningNumberLabel.snp.trailing).offset(5)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        plusLabel.snp.makeConstraints { make in
            make.top.equalTo(roundWinningResultLabel.snp.bottom).offset(15)
            make.leading.equalTo(sixthWinningNumberLabel.snp.trailing).offset(5)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        bonusWinningNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(roundWinningResultLabel.snp.bottom).offset(15)
            make.leading.equalTo(plusLabel.snp.trailing).offset(5)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        bonusLabel.snp.makeConstraints { make in
            make.top.equalTo(bonusWinningNumberLabel.snp.bottom).offset(5)
            make.trailing.equalTo(bonusWinningNumberLabel.snp.trailing)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
    }
    
    func configureUI() {
        
        view.backgroundColor = .white
        searchLottoRoundTextField.backgroundColor = .white
        searchLottoRoundTextField.borderStyle = .roundedRect
        searchLottoRoundTextField.layer.cornerRadius = 15
        
        lottoWinnerNumberInfoLabel.text = "당첨번호 안내"
        lottoWinnerNumberInfoLabel.textColor = .black
        lottoWinnerNumberInfoLabel.font = .systemFont(ofSize: 15)
        
        lottoDrawLotsDateLabel.textColor = .black
        lottoDrawLotsDateLabel.font = .systemFont(ofSize: 12)
        
//        roundWinningResultLabel.text = "913회 당첨결과" // 회차 불러오기
        roundWinningResultLabel.font = .boldSystemFont(ofSize: 20)
        
        firstWinningNumberLabel.textAlignment = .center
        firstWinningNumberLabel.clipsToBounds = true
        firstWinningNumberLabel.backgroundColor = .yellow
        
        secondWinningNumberLabel.textAlignment = .center
        secondWinningNumberLabel.clipsToBounds = true
        secondWinningNumberLabel.backgroundColor = .systemBlue
        
        thirdWinningNumberLabel.textAlignment = .center
        thirdWinningNumberLabel.clipsToBounds = true
        thirdWinningNumberLabel.backgroundColor = .systemBlue
        
        fourthWinningNumberLabel.textAlignment = .center
        fourthWinningNumberLabel.clipsToBounds = true
        fourthWinningNumberLabel.backgroundColor = .red
        
        fifthWinningNumberLabel.textAlignment = .center
        fifthWinningNumberLabel.clipsToBounds = true
        fifthWinningNumberLabel.backgroundColor = .red
        
        sixthWinningNumberLabel.textAlignment = .center
        sixthWinningNumberLabel.clipsToBounds = true
        sixthWinningNumberLabel.backgroundColor = .lightGray
        
        plusLabel.text = "+"
        plusLabel.textAlignment = .center
        plusLabel.backgroundColor = .white
        
        bonusWinningNumberLabel.textAlignment = .center
        bonusWinningNumberLabel.clipsToBounds = true
        bonusWinningNumberLabel.backgroundColor = .lightGray
        
        bonusLabel.text = "보너스"
        bonusLabel.textAlignment = .center
        bonusLabel.font = .systemFont(ofSize: 15)

    }
    
    func getLottoData() {
        
        let url = "\(APIURL.lottoURL)"
        
        
        AF.request(url).responseDecodable(of: Lotto.self) { response in
            
            switch response.result {
            case .success(let value):
                self.roundWinningResultLabel.text = "\(value.drwNo)회 당첨결과"
                self.lottoDrawLotsDateLabel.text = "\(value.drwNoDate) 추첨"
                self.firstWinningNumberLabel.text = "\(value.drwtNo1)"
                self.secondWinningNumberLabel.text = "\(value.drwtNo2)"
                self.thirdWinningNumberLabel.text = "\(value.drwtNo3)"
                self.fourthWinningNumberLabel.text = "\(value.drwtNo4)"
                self.fifthWinningNumberLabel.text = "\(value.drwtNo5)"
                self.sixthWinningNumberLabel.text = "\(value.drwtNo6)"
                self.bonusWinningNumberLabel.text = "\(value.bnusNo)"
                self.recentDrwNo = value.recentDrwtNo
            case.failure(let error):
                print(error)
                self.roundWinningResultLabel.text = "회차를 불러올 수 없습니다."
            }
            
            
        }
        print("2222")
    }
    
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return recentDrwNo
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(allround[row])"
    }
    
}
