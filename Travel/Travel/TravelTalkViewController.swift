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
    
    let chatRoomData = mockChatList
    
    var cellId: Identifier = .TravelTalkViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "TRAVEL TALK"
        
        travelTalkTableView.rowHeight = 100

        travelTalkTableView.delegate = self
        travelTalkTableView.dataSource = self
        
        let xib = UINib(nibName: cellId.identifier, bundle: nil)
        travelTalkTableView.register(xib, forCellReuseIdentifier: cellId.identifier)
        
    }
    
    
}

extension TravelTalkViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatRoomData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let travelTalkCell = travelTalkTableView.dequeueReusableCell(withIdentifier: cellId.identifier, for: indexPath) as! TravelTalkTableViewCell
        
        let chatRoom = chatRoomData[indexPath.row]
        travelTalkCell.configureChatRoomUI(chatRoom: chatRoomData[indexPath.row])
        
        
        return travelTalkCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedChatRoomId = chatRoomData[indexPath.row].chatroomId
        
        let selectedChatRoom = chatRoomData.first { $0.chatroomId == selectedChatRoomId }
        
        guard let chatRoomViewController = storyboard?.instantiateViewController(withIdentifier: "ChatRoomViewController") as? ChatRoomViewController else { return }
        chatRoomViewController.chatRoom = selectedChatRoom
        navigationController?.pushViewController(chatRoomViewController, animated: true)
    }

}
