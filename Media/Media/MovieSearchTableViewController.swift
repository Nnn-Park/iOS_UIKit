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
    
    private let movieURL = "https://api.themoviedb.org/3/trending/movie/week?api_key=4dbbc90704015bec654d418b7a57bba8"
    private let imageURL = "https://image.tmdb.org/t/p/w500"
    private var movieDB: [MovieDB] = []
    var page = 1
    
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
        fetchMovies()
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
    
    func fetchMovies() {
        
        let urlString = "\(movieURL)&page=\(page)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        AF.request(url, method: .get).responseDecodable(of: MovieDB.self) { response in
            switch response.result {
            case .success(let value):
                self.movieDB.append(value)
                self.collectionView.reloadData()
                
                self.page += 1
                
            case .failure(let error):
                print(error)
            }
            
            
        }
    }
    
}

extension MovieSearchTableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return movieDB.flatMap { $0.results }.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieSearchCollectionViewCell.identifier, for: indexPath) as! MovieSearchCollectionViewCell
        
        let results = movieDB.flatMap { $0.results }
        
        if let posterPath = results[indexPath.item].poster_path {
            let imageURL = "\(imageURL)\(posterPath)"
            cell.makeImage(data: imageURL)
        } else {
            cell.imageView.image = nil
        }
        
        return cell
    }
}


extension MovieSearchTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        page = 1
        fetchMovies()
        searchBar.resignFirstResponder()
    }
}

extension MovieSearchTableViewController: UICollectionViewDataSourcePrefetching {
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        let maxRow = indexPaths.map { $0.row }.max() ?? 0
        
        if maxRow > movieDB.flatMap({ $0.results }).count - 10 {
            page += 1
            fetchMovies()
        }
    }
    
}
