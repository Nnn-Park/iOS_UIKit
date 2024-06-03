//
//  ReusableProtocol.swift
//  Travel
//
//  Created by 박재형 on 6/3/24.
//

import UIKit

enum Identifier: String {
    case TravelViewController
    case AdvertisementInfoViewController
    case CityViewController
    case TravelTalkViewController
    
    var identifier: String {
        switch self {
        case .TravelViewController: return "TravelTableViewCell"
        case .AdvertisementInfoViewController: return "AdvertisementTableViewCell"
        case .CityViewController: return "CityTableViewCell"
        case .TravelTalkViewController: return "TravelTalkTableViewCell"
        }
    }
}

// VC id
extension UIViewController {
    
    
}
