//
//  RestaurantSearchTableViewController.swift
//  RestaurantSearch
//
//  Created by 박재형 on 5/26/24.
//

import UIKit

class RestaurantSearchTableViewController: UITableViewController {

    @IBOutlet var restaurantSearchTitleLabel: UILabel!
    
    
    
    
    
    var restaurantInfo: [Restaurant] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 560
        restaurantSearchTitleLabel.text = "식당"
        restaurantSearchTitleLabel.textAlignment = .center
        restaurantSearchTitleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        let restaurantList = RestaurantList()
        restaurantInfo = restaurantList.restaurantArray
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return restaurantInfo.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "RestaurantInformationTableViewCell") as! RestaurantInformationTableViewCell
        
        cell.configureUI(restaurant: restaurantInfo[indexPath.row])
        
        return cell
    }
    
}
