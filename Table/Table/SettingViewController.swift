//
//  SettingViewController.swift
//  Table
//
//  Created by 박재형 on 5/23/24.
//

import UIKit

class SettingViewController: UITableViewController {
    
    let setting = ["공지사항", "실험실", "버전 정보"]
    let personal = ["개인/보안", "알림", "채팅", "멀티프로필"]
    let remain = ["고객센터/도움말"]

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if section == 0 {
            return setting.count
        } else if section == 1 {
            return personal.count
        } else if section == 2 {
            return remain.count
        }
        
        return 0
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NnnCell")!
        
        if indexPath.section == 0 {
            
            cell.textLabel?.text = setting[indexPath.row]
            cell.textLabel?.textColor = .black
            cell.textLabel?.font = .boldSystemFont(ofSize: 15)
        } else if indexPath.section == 1 {
            
            cell.textLabel?.text = personal[indexPath.row]
            cell.textLabel?.textColor = .black
            cell.textLabel?.font = .boldSystemFont(ofSize: 15)
        } else if indexPath.section == 2 {
            
            cell.textLabel?.text = remain[indexPath.row]
            cell.textLabel?.textColor = .black
            cell.textLabel?.font = .boldSystemFont(ofSize: 15)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "전체 설정"
        } else if section == 1 {
            return "개인 설정"
        } else if section == 2 {
            return "기타 설정"
        }
        return ""
    }
    
}
