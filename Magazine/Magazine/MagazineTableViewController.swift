//
//  MagazineTableViewController.swift
//  Magazine
//
//  Created by 박재형 on 5/26/24.
//

import UIKit
import Kingfisher

class MagazineTableViewController: UITableViewController {

    
    
    @IBOutlet var magazineTopTitle: UILabel!
    
    var magazineList: [Magazine] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 530
        
        magazineTopTitle.text = "SeSAC TRAVEL"
        magazineTopTitle.textAlignment = .center
        magazineTopTitle.font = .systemFont(ofSize: 20, weight: .bold)
        
        let magazineInfo = MagazineInfo()
        magazineList = magazineInfo.magazine
            
       
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MagazineTableViewCell", for: indexPath) as! MagazineTableViewCell
        
        cell.configureUI(magazine: magazineList[indexPath.row])
        
        return cell
    }
    
    
    
}
