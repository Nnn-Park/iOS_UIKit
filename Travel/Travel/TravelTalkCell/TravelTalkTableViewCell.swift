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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        
    }

    func configureUI(chatRoom: ChatRoom) {
        
        if let firstImageName = chatRoom.chatroomImage.first {
                configureImageView(image: firstImageName)
            } else {
                configureImageView(image: "defaultImage")
            }
    }
    
    
    //TODO: - Image View 그리는 로직 설정하기
    func configureImageView(image: String){
        
        travelTalkImageView.image = UIImage(named: image)
        travelTalkImageView.contentMode = .scaleAspectFill
        travelTalkImageView.layer.cornerRadius = self.frame.height / 2
    }
    
//    private func configureRoomLabel() {
//        travelTalkChatRoomNameLabel.text = "dfafa"
//    }
    
    
    
    
    
    
    
}

