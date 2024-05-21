//
//  ViewController.swift
//  SeSac240520
//
//  Created by 박재형 on 5/20/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet var labelList: [UILabel]!
    
    
    
    @IBOutlet var oneButton: UIButton!
    @IBOutlet var twoButton: UIButton!
    @IBOutlet var threeButton: UIButton!
    
    @IBOutlet var oneLabel: UILabel!
    @IBOutlet var twoLabel: UILabel!
    @IBOutlet var threeLabel: UILabel!
    
    var oneCount = 1
    var twoCount = 1
    var threeCount = 1
    
    var count = [0, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        designLabelUI(labelName: labelList[0], thisIsTextColor: .red)
        designLabelUI(labelName: twoLabel, thisIsTextColor: .green)
        designLabelUI(labelName: threeLabel, thisIsTextColor: .blue)
        
        designButtonUI(button: oneButton, title: "클릭", titleColor: .red)
        designButtonUI(button: twoButton, title: "클릭", titleColor: .red)
        designButtonUI(button: threeButton, title: "클릭", titleColor: .red)
        
    }
    
    // 1. 어떤 버튼
    // -> currentTitle (옵셔널 조심, 버전 조심)
    // -> tag
    // 2. 아웃렌 뭐 어케 안되나
    @IBAction func oneButtonClicked(_ sender: UIButton) {
        
        count[sender.tag - 1] += 1
        
        labelList[sender.tag - 1].text = "\(count[sender.tag - 1])"
    }
    
    
    @IBAction func imageViewTapped(_ sender: UITapGestureRecognizer) {
        
        
        print("==========")
    }
    
    // 1. Did End On Exit
    // 2. view.endEditing(true)
    @IBAction func keboardDismiss(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
    }
    
    
    
    
    
    // 매개변수(Parameter)
    // 외부 매개변수(Argument Label) ex. thisIsTextColor
    // 내부 매개변수(Parameter Name) ex. color
    // oneLabel, twoLabel.. : 전달인자(Argument)
    // _: 와일드카드 식별자(WildCard Pattern)
    func designLabelUI(labelName: UILabel, thisIsTextColor color: UIColor) {
        
        labelName.text = "0"
        labelName.textColor = color
        labelName.font
        = .boldSystemFont(ofSize: 30)
        labelName.textAlignment = .center
    }
    
    func designButtonUI(button: UIButton, title: String, titleColor: UIColor) {
        
        button.setTitleColor(titleColor, for: .normal)
        button.setTitle(title, for: .normal)
    }
    
    
    
    
    
    
    
    
    
}

