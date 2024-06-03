//
//  ChatRoomViewController.swift
//  Travel
//
//  Created by 박재형 on 6/4/24.
//

import UIKit

class ChatRoomViewController: UIViewController {
    
    var chatRoom: ChatRoom?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let chatRoom {
            navigationItem.title = chatRoom.chatroomName
        }
        
        
    }
    
    
    
    
}
