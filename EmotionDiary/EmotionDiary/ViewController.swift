//
//  ViewController.swift
//  EmotionDiary
//
//  Created by 박재형 on 5/18/24.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet var mainBarTitle: UINavigationBar!
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet var buttonsLabel: [UILabel]!
    
    
    
    let buttonsName = ["happyButton", "loveButton", "likeButton", "panicButton", "brokenButton", "depressButton", "boredButton", "confuseButton", "inspireButton"]
    let labelName = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "혼란해", "존경해"]
    var labelCount = ["행복해": 0, "사랑해": 0, "좋아해": 0, "당황해": 0, "속상해": 0, "우울해": 0, "심심해": 0, "혼란해": 0, "존경해": 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        mainBarTitle.topItem!.title = "감정 다이어리"
        
        makeUI()
    }
    
    @IBAction func ButtonTapped(_ sender: UIButton) {
        
        for countIndex in 0..<buttons.count {
            if sender.tag == countIndex {
                    labelCount[labelName[countIndex]]! += 1
                UserDefaults.standard.set(storedValue(labelCount[labelName[countIndex]] ?? 0) , forKey: "\(labelName[countIndex])")
                    buttonsLabel[countIndex].text =
                "\(labelCount[labelName[countIndex]] ?? 0)"
            }
            
        }
        print(labelCount.values)
    }
        
        
        
        func makeUI() {
            for buttonIndex in 0..<buttons.count {
                buttons[buttonIndex].setImage(UIImage(named: "slime\(buttonIndex + 1)"), for: .normal)
                buttons[buttonIndex].contentMode = .scaleAspectFit
                
                buttonsLabel[buttonIndex].text = /*labelName[buttonIndex] +*/ "\(labelCount[labelName[buttonIndex]] ?? 0)"
                buttonsLabel[buttonIndex].textAlignment = .center
            }
            
        }
        

    func storedValue(_ input: Int) -> Int {
        var store = 0
        for i in 0..<buttons.count {
            store = UserDefaults.standard.integer(forKey: labelName[i])
//            buttonsLabel[i].text = "\(store)"
            print(store)
        }
        return store
    }
    }
    
