//
//  TravelSpotViewController.swift
//  Travel
//
//  Created by 박재형 on 5/29/24.
//

import UIKit

class TravelSpotViewController: UIViewController {

    @IBOutlet var navigtaionBarTitle: UINavigationBar!
    var maintTtle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let maintTtle else {
            return
        }
            self.navigtaionBarTitle.topItem?.title = maintTtle
 
        }
        
    }
    

