//
//  TravelTalkViewController.swift
//  Travel
//
//  Created by 박재형 on 6/3/24.
//

import UIKit

class TravelTalkViewController: UIViewController, UITableViewDelegate {

    
    @IBOutlet var travelTalkSearchBar: UISearchBar!
    
    @IBOutlet var travelTalkTableView: UITableView!
    
    var chatRoomData = mockChatList
    var filteredChatRoomData: [ChatRoom] = []
    
    var cellId: Identifier = .TravelTalkViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "TRAVEL TALK"
        
        travelTalkTableView.rowHeight = 100

        travelTalkTableView.delegate = self
        travelTalkTableView.dataSource = self
        travelTalkSearchBar.delegate = self
        
        let xib = UINib(nibName: cellId.identifier, bundle: nil)
        travelTalkTableView.register(xib, forCellReuseIdentifier: cellId.identifier)
        
    }
    
    
}

extension TravelTalkViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // 검색어에 따라 필터링된 데이터 업데이트
        filteredChatRoomData = chatRoomData.filter { chatRoom in
            // 여기서 사용자 이름이 검색어와 일치하는지 확인
            return chatRoom.chatroomName.lowercased().contains(searchText.lowercased())
        }
        
        // 테이블 뷰 업데이트
        travelTalkTableView.reloadData()
    }
}

extension TravelTalkViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatRoomData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let travelTalkCell = travelTalkTableView.dequeueReusableCell(withIdentifier: cellId.identifier, for: indexPath) as! TravelTalkTableViewCell
        
        let chatRoom = chatRoomData[indexPath.row]
        travelTalkCell.configureChatRoomUI(chatRoom: chatRoom)
        
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
