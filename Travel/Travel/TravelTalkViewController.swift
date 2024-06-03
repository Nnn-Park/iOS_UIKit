//
//  TravelTalkViewController.swift
//  Travel
//
//  Created by 박재형 on 6/3/24.
//

import UIKit

class TravelTalkViewController: UIViewController, UITableViewDelegate {

    
    @IBOutlet var travelTalkFriendNameSearchTextField: UITextField!
    
    @IBOutlet var travelTalkTableView: UITableView!
    
    let chatData = mockChatList
    
    var cellId: Identifier = .TravelTalkViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        travelTalkTableView.rowHeight = 100

        travelTalkTableView.delegate = self
        travelTalkTableView.dataSource = self
        
        let xib = UINib(nibName: cellId.identifier, bundle: nil)
        travelTalkTableView.register(xib, forCellReuseIdentifier: cellId.identifier)
        
    }
    

   
    
    
}

extension TravelTalkViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let travelTalkCell = travelTalkTableView.dequeueReusableCell(withIdentifier: cellId.identifier, for: indexPath) as! TravelTalkTableViewCell
        
        travelTalkCell.configureUI(chatRoom: chatData[indexPath.row])
        
        return travelTalkCell
    }
    
    
}
