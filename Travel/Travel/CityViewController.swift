//
//  CityViewController.swift
//  Travel
//
//  Created by 박재형 on 5/31/24.
//

import UIKit

class CityViewController: UIViewController, UITableViewDelegate {

    
    @IBOutlet var cityTableView: UITableView!
    
    var cityInfoList = CityInfo().city
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "인기 도시"
        
//        cityTableView.rowHeight = 200
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        cityTableView.register(UINib(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "CityTableViewCell")
    }
    


}

extension CityViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cityInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
        
        cell.configureUI(city: cityInfoList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
