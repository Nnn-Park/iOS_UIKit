//
//  TravelViewController.swift
//  Travel
//
//  Created by 박재형 on 5/27/24.
//

import UIKit

class TravelViewController: UIViewController, UITableViewDelegate{
    
    @IBOutlet var travelTableView: UITableView!

    var travelInfoList = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "도시 상세 정보"
        
        travelTableView.rowHeight = 200
        travelTableView.delegate = self
        travelTableView.dataSource = self
        
        
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
            adCell.findAdCell()
            adCell.showAdTitle(travel: travelInfoList[indexPath.row])
            return adCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if travelInfoList[indexPath.row].ad == false {
            
            let indexPath = IndexPath(row: indexPath.row, section: 0)
            let data = travelInfoList[indexPath.row]
            
            guard let travelSpotViewController = self.storyboard?.instantiateViewController(withIdentifier: "TravelSpotViewController") as? TravelSpotViewController else { return
            }
            travelSpotViewController.data = data
                
            self.navigationController?.pushViewController(travelSpotViewController, animated: true)
        }
        else {
            

//            let data = travelInfoList[indexPath.row]
            
            guard let AdvertisementInfoViewController = self.storyboard?.instantiateViewController(withIdentifier: "AdvertisementInfoViewController") as? AdvertisementInfoViewController else {
                return
            }

            AdvertisementInfoViewController.modalPresentationStyle = .fullScreen
            
            present(AdvertisementInfoViewController, animated: true)
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
