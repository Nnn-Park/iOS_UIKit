//
//  CityViewController.swift
//  Travel
//
//  Created by 박재형 on 5/31/24.
//

import UIKit

class CityViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet var cityTableView: UITableView!
    
    @IBOutlet var citySegmentedControl: UISegmentedControl!
    
    var cityInfoList = CityInfo().city
    var filteredCityInfoList: [City] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "인기 도시"
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        cityTableView.register(UINib(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "CityTableViewCell")
        
        citySegmentedControl.addTarget(self, action: #selector(segmentedControlUpdate(_:)), for: .valueChanged)
        
        filteredCityInfoList = cityInfoList
        cityTableView.reloadData()
        
    }
    
    
    @objc func segmentedControlUpdate(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
            
        case 0:
            // 전체
            filteredCityInfoList = cityInfoList
        case 1:
            // 국내
            filteredCityInfoList = cityInfoList.filter { $0.domestic_travel }
        case 2:
            // 해외
            filteredCityInfoList = cityInfoList.filter { !$0.domestic_travel }
        default:
            break
        }
        cityTableView.reloadData()
    }
}

extension CityViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredCityInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
        
        cell.configureUI(city: filteredCityInfoList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
