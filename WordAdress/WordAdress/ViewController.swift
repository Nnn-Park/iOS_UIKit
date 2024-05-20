//
//  ViewController.swift
//  WordAdress
//
//  Created by 박재형 on 5/19/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var wordSearchTextField: UITextField!
    
    @IBOutlet var mainButtons: [UIButton]!
    
    @IBOutlet var mainImage: UIImageView!
    
    @IBOutlet var newWordLabel: UILabel!
    
    
    var newWords: [String: String] = [
        "개이득": "아주 큰 이득을 본 상황을 뜻함",
        "삼귀다": "아직 사귀는 사이가 아닌 썸 타는 단계. 사귀다의 '사'를 숫자 4에 빗대어 4가 되기 전 3=삼으로 표현.",
        "스불재": "스스로 불러온 재앙'으로, 순전히 자신이 자초한 일로 다른 누구를 탓할 수 없는 상황에 쓰는 말",
        "얼죽아": "얼어 죽어도 아이스커피'의 줄임말. 추운 날씨에도 아이스 아메리카노만 마시는 이들을 지칭한다.",
//        "군싹": "군침이 싹 돌다'의 줄임말. 군침이 돌 만큼 맛있거나 좋아 보이는 것을 수식할 때 쓴다.",
//        "나심비": "나'와 '심리' 그리고 '가성비'의 합성어. 가성비보다 스스로의 만족을 위해 지갑을 여는 소비 심리를 일컫는다.",
//        "무야호": "예능 프로그램 <무한도전>에 출연했던 한 출연자에 의해 생겨난 유행어로, 매우 신난다는 뜻."
    ]
    
    var randomNewWord: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateButtonTitles(newWord: updateRandomNewWord())
        makeUI(button: mainButtons, color: .black, cornerRadius: 10, borderWidth: 1)
        wordSearchTextField.placeholder =
        "신조어를 검색해 주세요"
        
       
        
        mainImage.image = UIImage(named: "background")
        mainImage.contentMode = .scaleAspectFill
        
        newWordLabel.text = "신조어 검색"
        newWordLabel.textAlignment = .center
        newWordLabel.numberOfLines = 3
        
    }
    
    @IBAction func searchWordDidEnd(_ sender: UITextField) {
        
        guard let searchedWord = sender.text,
              let meaning = newWords[searchedWord] else {
                newWordLabel.text = "해당하는 단어의 뜻을 찾을 수 없습니다."
                return
            }
            
            newWordLabel.text = meaning
    }
    
    @IBAction func ButtonTapped(_ sender: UIButton) {
        // tag
            showMeaning(for: mainButtons[sender.tag].currentTitle)
            updateButtonTitles(newWord: updateRandomNewWord())
    }
    
    func showMeaning(for word: String?) {
        
        guard let word = word,
              let meaning = newWords[word] else {
            newWordLabel.text = "해당하는 단어의 뜻을 찾을 수 없습니다."
            return
        }
        newWordLabel.text = meaning
    }
    
    func updateButtonTitles(newWord: [String]) {
      
        for index in 0..<mainButtons.count {
            mainButtons[index].setTitle(newWord[index], for: .normal)
        }
    }
    
    func makeUI(button: [UIButton], color: UIColor, cornerRadius: CGFloat, borderWidth: CGFloat) {
        
        for index in 0..<mainButtons.count {
            mainButtons[index].setTitleColor(color, for: .normal)
            mainButtons[index].layer.cornerRadius = cornerRadius
            mainButtons[index].layer.borderWidth = borderWidth
        }
        
    }
    
    func updateRandomNewWord() -> [String] {
        
        if randomNewWord.count == newWords.count {
            randomNewWord.removeAll()
        }
        
        for (word, _) in newWords {
            randomNewWord.append(word)
        }
        
        randomNewWord.shuffle()
        
//        newWords.forEach { word, mean in
//            if word == randomNewWord[newWords.count - 1] {
//                newWords.removeValue(forKey: word)
//            }
//        }
//        print(newWords.keys)
        return randomNewWord
        
    }
    
}
