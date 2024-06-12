//
//  MovieSearchViewController.swift
//  Media
//
//  Created by 박재형 on 6/11/24.
//

import UIKit

import Alamofire
import SnapKit
import Kingfisher

class MovieSearchTableViewController: UITableViewController {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    let searchBar = UISearchBar()
    
    private let movieURL = "https://api.themoviedb.org/3/search/movie?api_key=4dbbc90704015bec654d418b7a57bba8"
    private var movieDB: MovieDB = MovieDB(page: 1, results: [])
    var page = 1
    var search = ""
    
    static func collectionViewLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width - 40
        
        layout.itemSize = CGSize(width: width / 3, height: width / 2)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        return layout
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        collectionView.backgroundColor = .black
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieSearchCollectionViewCell.self, forCellWithReuseIdentifier: MovieSearchCollectionViewCell.identifier)
        searchBar.delegate = self
        
        view.addSubview(searchBar)
        view.addSubview(collectionView)
        
        configureLayout()
        configureUI()
    }
    
    func configureLayout() {
        
        searchBar.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(5)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-5)
            make.height.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureUI() {
        
        searchBar.placeholder = "영화 제목을 검색해보세요."
        searchBar.barTintColor = .black
        
    }
    
    func fetchMovies(query: String) {
        
        let urlString = "\(movieURL)&query=\(query)&page=\(page)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        AF.request(url, method: .get).responseDecodable(of: MovieDB.self) { response in
            switch response.result {
            case .success(let value):
                dump(value.results)
                if self.page == 1 {
                    self.movieDB.results = value.results
                } else {
                    self.movieDB.results.append(contentsOf: value.results)
                }
                self.collectionView.reloadData()
                
                self.page += 1
                print(self.page)
            case .failure(let error):
                print(error)
            }
            
            
        }
    }
    
}

extension MovieSearchTableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return movieDB.results.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieSearchCollectionViewCell.identifier, for: indexPath) as! MovieSearchCollectionViewCell
        
        
        
        let result = movieDB.results[indexPath.row]
        let imageString = "https://image.tmdb.org/t/p/w780" + (result.poster_path ?? "/pUd1FYQb5r55RqXpx08dnCbP1fs.jpg")
        
        cell.makeImage(data: imageString)
        
        
        
        return cell
    }
}


extension MovieSearchTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        page = 1
        fetchMovies(query: searchBar.text!)
        searchBar.resignFirstResponder()
    }
}

extension MovieSearchTableViewController: UICollectionViewDataSourcePrefetching {
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        for item in indexPaths {
            
            if movieDB.results.count - 2 == item.row {

                fetchMovies(query: searchBar.text!)
            }
            print(item.row)
            print(page)
        }
    }
    
}
