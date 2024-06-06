//
//  TravelTalkTableViewCell.swift
//  Travel
//
//  Created by 박재형 on 6/3/24.
//

import UIKit

class TravelTalkTableViewCell: UITableViewCell {

    
    @IBOutlet var travelTalkImageView: UIImageView!
    
    @IBOutlet var travelTalkChatRoomNameLabel: UILabel!
    @IBOutlet var travelTalkChatMessageLabel: UILabel!
    
    @IBOutlet var travelTalkChatDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        
    }

    
    func configureChatRoomUI(chatRoom: ChatRoom) {
        
        if let firstImageName = chatRoom.chatroomImage.first {
                configureImageView(image: firstImageName)
            print(firstImageName)
            }
        configureRoomChatRoomLabel(user: chatRoom.chatroomName)
    }
 
    //TODO: - Image View 그리는 로직 설정하기
    private func configureImageView(image: String){
        
        travelTalkImageView.image = UIImage(named: image)
        travelTalkImageView.contentMode = .scaleAspectFill
        travelTalkImageView.layer.cornerRadius = travelTalkImageView.frame.height / 2
        travelTalkImageView.clipsToBounds = true
    }
    
    private func configureRoomChatRoomLabel(user: String) {
        
        travelTalkChatRoomNameLabel.text = user
        travelTalkChatRoomNameLabel.font = .systemFont(ofSize: 15, weight: .bold)
    }
    
    private func configureRoomChatMessageLabel(message: String) {
        
        travelTalkChatMessageLabel.text = message
        travelTalkChatMessageLabel.font = .systemFont(ofSize: 10)
        
    }
    
}

