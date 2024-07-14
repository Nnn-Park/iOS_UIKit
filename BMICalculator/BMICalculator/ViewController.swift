//
//  ViewController.swift
//  BMICalculator
//
//  Created by 박재형 on 5/21/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var mainTitle: UILabel!
    @IBOutlet var subTitle: UILabel!
    
    @IBOutlet var mainImageView: UIImageView!
    
    @IBOutlet var nicknameLabel: UILabel!
    @IBOutlet var nicknameTextField: UITextField!
    
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var heightTextField: UITextField!
    
    
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var weightLabelTextField: UITextField!
    
    
    @IBOutlet var randomCalculateButton: UIButton!
    @IBOutlet var resultButton: UIButton!
    @IBOutlet var recentresultButton: UIButton!
    @IBOutlet var removeRecentResultButton: UIButton!
    
    let viewModel = ViewModel()
    
    var height = 0
    var weight = 0
    var nickname = ""
    var bmiResult: Double = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mainImageView.image = UIImage(named: "image")
        
        mainTitle.text = "BMI Calculator"
        mainTitle.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        subTitle.text = "당신의 BMI 지수를\n알려드릴께요."
        subTitle.numberOfLines = 2
        subTitle.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        nicknameLabel.text = "닉네임을 적어주세요."
        nicknameLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        nicknameTextField.layer.cornerRadius = 15
        nicknameTextField.layer.borderWidth = 2
        
        heightLabel.text = "키가 어떻게 되시나요?"
        heightLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        heightTextField.layer.cornerRadius = 15
        heightTextField.layer.borderWidth = 2
        
        weightLabel.text = "몸무게는 어떻게 되시나요?"
        weightLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        weightLabelTextField.layer.cornerRadius = 15
        weightLabelTextField.layer.borderWidth = 2
        
        randomCalculateButton.setTitle("랜덤으로 BMI 계산하기", for: .normal)
        randomCalculateButton.setTitleColor(.red, for: .normal)
        
        resultButton.setTitle("결과 확인", for: .normal)
        resultButton.backgroundColor = .purple
        resultButton.layer.cornerRadius = 15
        
        recentresultButton.setTitle("최신 결과 확인", for: .normal)
        recentresultButton.setTitleColor(.lightGray, for: .normal)
        
        removeRecentResultButton.setTitle("최신 결과 삭제", for: .normal)
        removeRecentResultButton.setTitleColor(.lightGray, for: .normal)
        bindData()
    }
    
    func bindData() {
        
        viewModel.outputBMIResult.bind { value in
            print(value)
            self.bmiResult = value
            print("VC == \(self.bmiResult)")
        }
        
    }
    
    
    @IBAction func keyBoardDismiss(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
    }
    
    
    @IBAction func heightTextFieldEditingDidEnd(_ sender: UITextField) {
        
        viewModel.inputHeight.value = Int(sender.text ?? "")
        
//        if sender.text != nil {
//            height = Int(sender.text!)!
//        } else {
//            height = 0
//        }
//        print(height)
//        UserDefaults.standard.set(height, forKey: "height")
    }
    
    
    @IBAction func weightTextFieldEditingDidEnd(_ sender: UITextField) {
        
        viewModel.inputWeight.value = Int(sender.text ?? "")
//        if sender.text != nil {
//            weight = Int(sender.text!) ?? 0
//        } else {
//            weight = 0
//        }
//        print(weight)
//        UserDefaults.standard.set(weight, forKey: "weight")
    }
    
    @IBAction func nicknameTextFieldEditingDidEnd(_ sender: UITextField) {
        
        if let name = sender.text {
            nickname = name
        }
        print(nickname)
        UserDefaults.standard.set(nickname, forKey: "nickname")
    }
    
    
    
    @IBAction func randomCalculateButtonDidTapped(_ sender: UIButton) {
        
//        alertRandomResult()
    }
    
    @IBAction func resultButtonTapped(_ sender: UIButton) {
        
        
        alertResult()
    }
    
    @IBAction func recentresultButtonTapped(_ sender: UIButton) {
        
        alertRecentResult()
    }
    
    @IBAction func removeRecentresultButtonTapped(_ sender: UIButton) {
        
        alertRemoveRecentResult()
    }
    
    
    
    
    
    func makeRandomHeight() -> Int {
        let heightValue = Int.random(in: 100...200)
        
        return heightValue
    }
    
    func makeRandomWeight() -> Int {
        
        let weightValue = Int.random(in: 20...130)
        
        return weightValue
    }
    
    
    func alertResult() {
        
//        let bmiResult = viewModel.outputBMIResult.value
        let formattedBMI = String(format: "%.1f", bmiResult)
        let alret = UIAlertController(title: "\(nickname)님의 BMI는 \(formattedBMI)입니다.", message: "", preferredStyle: .alert)
        let yes = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alret.addAction(yes)
        
        present(alret, animated: true, completion: nil)
    }
    
//    func alertRandomResult() {
//        
//        let bmiResult = calculateBMI(makeRandomHeight(), makeRandomWeight())
//        let formattedBMI = String(format: "%.1f", bmiResult)
//        let alret = UIAlertController(title: "랜덤 BMI는 \(formattedBMI)입니다.", message: "", preferredStyle: .alert)
//        let yes = UIAlertAction(title: "확인", style: .default, handler: nil)
//        
//        alret.addAction(yes)
//        
//        present(alret, animated: true, completion: nil)
//    }
    
    func alertRecentResult() {
//        let bmiResult = UserDefaults.standard.double(forKey: "BMIResult")
        let formattedBMI = String(format: "%.1f", bmiResult)
        let alret = UIAlertController(title: "가장 최근의 BMI는 \(formattedBMI)입니다.", message: "", preferredStyle: .alert)
        let yes = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alret.addAction(yes)
        
        present(alret, animated: true, completion: nil)
    }
    
    func alertRemoveRecentResult() {
//        UserDefaults.standard.removeObject(forKey: "BMIResult")
        let alret = UIAlertController(title: "가장 최근의 BMI결과가 삭제되었습니다.", message: "", preferredStyle: .alert)
        let yes = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alret.addAction(yes)
        
        present(alret, animated: true, completion: nil)
    }
    
}

