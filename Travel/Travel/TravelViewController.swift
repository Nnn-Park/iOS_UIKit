//
//  TravelViewController.swift
//  Travel
//
//  Created by 박재형 on 5/27/24.
//

import UIKit

class TravelViewController: UIViewController, UITableViewDelegate{
    
    @IBOutlet var travelTableView: UITableView!
    @IBOutlet var travelMainLabel: UILabel!
    
    var travelInfoList = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        travelTableView.rowHeight = 200
        travelTableView.delegate = self
        travelTableView.dataSource = self
        
        travelMainLabel.text = "도시 상세 정보"
        travelMainLabel.textAlignment = .center
        travelMainLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(5))
        
        travelTableView.register(UINib(nibName: "TravelTableViewCell", bundle: nil), forCellReuseIdentifier: "TravelTableViewCell")
        travelTableView.register(UINib(nibName: "AdvertisementTableViewCell", bundle: nil), forCellReuseIdentifier: "AdvertisementTableViewCell")
    }

}

extension TravelViewController: UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return travelInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if travelInfoList[indexPath.row].ad == false {
            
            let mainCell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell", for: indexPath) as! TravelTableViewCell
            
            mainCell.configureUI(travel: travelInfoList[indexPath.row])

            mainCell.likeButton.tag = indexPath.row
            mainCell.likeButton.addTarget(self, action: #selector(isLikeButtonTapped), for: .touchUpInside)
            
            
            return mainCell
            
        } else {
            
            let adCell = tableView.dequeueReusableCell(withIdentifier: "AdvertisementTableViewCell", for: indexPath) as! AdvertisementTableViewCell
            
            adCell.showAdTitle(travel: travelInfoList[indexPath.row])
            return adCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        travelInfoList[indexPath.row].ad ? 80 : 200
    }
    
    @objc func isLikeButtonTapped(_ sender: UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        travelInfoList[sender.tag].like?.toggle()
        // 좋아요 버튼 있는 row만 reload
        travelTableView.reloadRows(at: [indexPath], with: .automatic)
    }

    
}
