//
//  ViewController.swift
//  BoxOffice
//
//  Created by 박재형 on 6/12/24.
//

import UIKit

import Alamofire
import SnapKit

class BoxOfficeRankViewController: UIViewController {

    let tableView = UITableView()
    
    let searchBar = UISearchBar()
    
    var boxOfficeList: BoxOfficeResult = BoxOfficeResult(dailyBoxOfficeList: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        tableView.register(BoxOfficeRankTableViewCell.self, forCellReuseIdentifier: BoxOfficeRankTableViewCell.identifier)
        tableView.rowHeight = 50
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    
    func configureHierarchy() {
        
        view.addSubview(tableView)
        view.addSubview(searchBar)
    }
    
    func configureLayout() {
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.height.equalTo(50)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureUI() {
        
        view.backgroundColor = .black
        tableView.backgroundColor = .black
        searchBar.tintColor = .black
    }
    
    func fetchData(targetDt: String) {
        print(#function)
        let baseURL = MovieAPIKey.key
        
        let urlAdress = "\(baseURL)&targetDt=\(targetDt)&itemPerPage=10"
        print(urlAdress)
        
        AF.request(urlAdress, method: .get).responseDecodable(of: BoxOfficeResponse.self) { response in
            
            switch response.result {
                
            case .success(let value):
                print("Response JSON: \(value)")
                print("SUCESS")
                self.boxOfficeList.dailyBoxOfficeList = value.boxOfficeResult.dailyBoxOfficeList

                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
            
        }
    }


}

extension BoxOfficeRankViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boxOfficeList.dailyBoxOfficeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BoxOfficeRankTableViewCell.identifier, for: indexPath) as! BoxOfficeRankTableViewCell
        
        let result = boxOfficeList.dailyBoxOfficeList[indexPath.row]
        print(result)
        cell.rank.text = result.rank
        cell.movieTitle.text = result.movieNm
        cell.date.text = result.openDt
        
        return cell
    }
    
}

extension BoxOfficeRankViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        fetchData(targetDt: searchBar.text!)
        searchBar.resignFirstResponder()

    }
    
}
