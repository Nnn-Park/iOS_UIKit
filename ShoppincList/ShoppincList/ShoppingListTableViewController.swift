//
//  ShoppingListTableViewController.swift
//  ShoppincList
//
//  Created by 박재형 on 5/24/24.
//

import UIKit

struct ShoppingList {
    
    var listTitle: String
    var finishTodo: Bool
    var favorite: Bool
}



class ShoppingListTableViewController: UITableViewController {
    
    
    @IBOutlet var searchView: UIView!
    
    @IBOutlet var searchProductTextField: UITextField!
    
    @IBOutlet var searchProductButton: UIButton!
    
    
    
    var list = [
        ShoppingList(listTitle: "그립톡 구매하기", finishTodo: true, favorite: true),
        ShoppingList(listTitle: "사이다 구매", finishTodo: false, favorite: false),
        ShoppingList(listTitle: "아이패드 케이스 최저가 알아보기", finishTodo: false, favorite: true),
        ShoppingList(listTitle: "양말", finishTodo: false, favorite: true)
    
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchView.backgroundColor = .white
        searchView.layer.cornerRadius = 10
        searchView.backgroundColor = .white
        
        tableView.rowHeight = 70
        tableView.backgroundColor = .white
        
        searchProductTextField.placeholder = "무엇을 구매하실 건가요?"
        
        
        searchProductButton.setTitle("추가", for: .normal)
        searchProductButton.setTitleColor(.black, for: .normal)
        searchProductButton.backgroundColor = .systemGray3
        searchProductButton.layer.cornerRadius = 10
        
    }
    
    
    @IBAction func textAppend(_ sender: UIButton) {
        
        guard let text = searchProductTextField.text, text.count > 1 else {
            print("두글자 이상 입력해주세요.")
            return
        }
        
        list.append(ShoppingList(listTitle: searchProductTextField.text ?? "", finishTodo: false, favorite: false))
        
        tableView.reloadData()
    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingListTableViewCell", for: indexPath) as! ShoppingListTableViewCell

        
        cell.selectionStyle = .default
        cell.backgroundColor = .white
        cell.tintColor = .black
        cell.layer.cornerRadius = 5
        
        cell.cellView.backgroundColor = .systemGray6
        cell.cellView.layer.cornerRadius = 10
        
        
        let data = list[indexPath.row]
        
        cell.mainCellLabel.text = data.listTitle
        cell.mainCellLabel.font = .systemFont(ofSize: 15)
        
        
        data.finishTodo ? cell.checkButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        : cell.checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        
        data.favorite ? cell.likeButton.setImage(UIImage(systemName: "star.fill"), for: .normal) : cell.likeButton.setImage(UIImage(systemName: "star"), for: .normal)
        
        cell.checkButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        
        return cell
    }
    
    @objc func checkButtonTapped(sender: UIButton) {
        
        list[sender.tag].finishTodo.toggle()

        tableView.reloadData()
        
    }
    
    @objc func likeButtonTapped(sender: UIButton) {
        list[sender.tag].favorite.toggle()
        
        tableView.reloadData()
    }
    

}
