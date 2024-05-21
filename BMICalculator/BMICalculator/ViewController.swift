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
    
    
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var heightTextField: UITextField!
    
    
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var weightLabelTextField: UITextField!
    
    
    @IBOutlet var randomCalculateButton: UIButton!
    @IBOutlet var resultButton: UIButton!
    
    var height = 0
    var weight = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainImageView.image = UIImage(named: "image")
        
        mainTitle.text = "BMI Calculator"
        mainTitle.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        subTitle.text = "당신의 BMI 지수를\n알려드릴께요."
        subTitle.numberOfLines = 2
        subTitle.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
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
    }
    
    @IBAction func keyBoardDismiss(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
    }
    
    
    @IBAction func heightTextFieldEditingDidEnd(_ sender: UITextField) {
        
        if sender.text != nil {
            height = Int(sender.text!)!
        } else {
            height = 0
        }
        print(height)
    }
    
    
    @IBAction func weightTextFieldEditingDidEnd(_ sender: UITextField) {
        
        if sender.text != nil {
            weight = Int(sender.text!)!
        } else {
            weight = 0
        }
        print(weight)
    }
    
    
    @IBAction func resultButtonTapped(_ sender: UIButton) {
        let bmiResult = calculateBMI(height, weight)
        let formattedBMI = String(format: "%.1f", bmiResult)
        let alret = UIAlertController(title: "당신의 BMI는 \(formattedBMI)입니다.", message: "", preferredStyle: .alert)
        let yes = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alret.addAction(yes)
        
        present(alret, animated: true, completion: nil)
    }
    
    func calculateBMI(_ height: Int, _ weight: Int) -> Double {
        let heightInMeters = Double(height) / 100.0
        let bmiResult = Double(weight) / (heightInMeters * heightInMeters)
        print(bmiResult)
        return bmiResult
    }
    
    
}

