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
        adUIView.backgroundColor = .random
        adUIView.layer.cornerRadius = 10
    }
    
}

extension UIColor {
    public class var random: UIColor {
        return UIColor(red: CGFloat(drand48()),
                       green: CGFloat(drand48()),
                       blue: CGFloat(drand48()), alpha: 1.0)
    }
}

