//
//  AdvertisementTableViewCell.swift
//  Travel
//
//  Created by 박재형 on 5/27/24.
//

import UIKit

class AdvertisementTableViewCell: UITableViewCell {

    @IBOutlet var adMainLabel: UILabel!
    
    @IBOutlet var adUIView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        adMainLabel.textAlignment = .center
        adUIView.backgroundColor = UIColor.blue
        adUIView.layer.cornerRadius = 10
    }


    
}
