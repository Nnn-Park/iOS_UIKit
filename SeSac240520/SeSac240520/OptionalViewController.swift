//
//  OptionalViewController.swift
//  SeSac240520
//
//  Created by 박재형 on 5/20/24.
//

import UIKit

class OptionalViewController: UIViewController {
    
    
    @IBOutlet var searchTextField: UITextField!
    
    @IBOutlet var searchButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
        
        
        
        
    }
    
    
    
    // 1. 바탕 탭제스처
    // 2. return
    // 3. 버튼 클릭
    
    @IBAction func keboardDisMiss(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
    }
    
    @IBAction func keboardReturnDisMiss(_ sender: UITextField) {
        
        

    }
    
    @IBAction func buttonkeyboardDisMiss(_ sender: UIButton) {
        
        view.endEditing(true)
    }
    
}
