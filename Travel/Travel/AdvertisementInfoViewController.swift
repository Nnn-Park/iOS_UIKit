//
//  AdvertisementInfoViewController.swift
//  Travel
//
//  Created by 박재형 on 5/29/24.
//

import UIKit

class AdvertisementInfoViewController: UIViewController {

    @IBOutlet var navigationBarTitle: UINavigationBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBarTitle.topItem?.title = "광고 화면"
        navigationBarTitle.topItem?.leftBarButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: #selector(leftBarButtonItemTapped))
    }
    
    @objc func leftBarButtonItemTapped() {
        
        dismiss(animated: true)
    }

   

}
