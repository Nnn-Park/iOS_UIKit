//
//  ViewController.swift
//  Media
//
//  Created by 박재형 on 6/10/24.
//

import UIKit

import SnapKit
import Alamofire
import Kingfisher

struct MovieResult: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    
    let poster_path: String
    let title: String
    let genre_ids: [Int]
    let release_date: String
}


class MovieVeiwController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    private let tableView = UITableView()
    
    
    
    private var movies: [Movie] = []
    
    private let movieURL = "https://api.themoviedb.org/3/trending/movie/week?api_key=4dbbc90704015bec654d418b7a57bba8"
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tableView.register(MediaCell.self, forCellReuseIdentifier: MediaCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 500
        configureHierarchy()
        configureLayout()
        configureUI()
        
        fetchMovies()
    }
    
    func configureHierarchy() {
        
        view.addSubview(tableView)
    }
    
    func configureLayout() {
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureUI() {
        
        tableView.backgroundColor = .gray
        view.backgroundColor = .white
    }
    
    
    
    func fetchMovies() {
        let urlString = "\(movieURL)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        AF.request(url, method: .get).responseDecodable(of: MovieResult.self) { response in
            switch response.result {
            case .success(let value):
                self.movies = value.results
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MediaCell.identifier, for: indexPath) as! MediaCell
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        
        return cell
    }
    
}

class MediaCell: UITableViewCell {
    
    static let identifier = "mediaCell"
    
    let mediaView = UIView()
    
    let dateLabel = UILabel()
    let hashTagLabel = UILabel()
    
    let mediaImageView = UIImageView()
    
    let mediaTitleLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        
        contentView.addSubview(mediaView)
        contentView.addSubview(dateLabel)
        contentView.addSubview(hashTagLabel)
        contentView.addSubview(mediaImageView)
        contentView.addSubview(mediaTitleLabel)
    }
    
    func configureLayout() {
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(30)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(30)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).offset(-30)
        }
        
        hashTagLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(5)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(30)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).offset(-30)
        }
        
        mediaView.snp.makeConstraints { make in
            make.top.equalTo(hashTagLabel.snp.bottom).offset(20)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(30)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).offset(-30)
            make.height.equalTo(400)
        }
        
        mediaImageView.snp.makeConstraints { make in
            make.top.equalTo(mediaView.snp.top)
            make.leading.equalTo(mediaView.snp.leading)
            make.trailing.equalTo(mediaView.snp.trailing)
            make.height.equalTo(300)
        }
        
        mediaTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(mediaImageView.snp.bottom).offset(20)
            make.leading.equalTo(mediaImageView.snp.leading).offset(15)
            make.trailing.equalTo(mediaImageView.snp.trailing).offset(-15)
            
        }
    }
    
    func configureUI() {
        
        hashTagLabel.text = "#aaaa"
        mediaView.backgroundColor = .white
    }
    
    func configure(with movie: Movie) {
        
        mediaView.layer.cornerRadius = 10
        mediaView.layer.borderWidth = 1
        mediaView.layer.shadowColor = UIColor.lightGray.cgColor
        mediaView.layer.shadowOpacity = 1
        
        dateLabel.text = movie.release_date
        dateLabel.font = UIFont.systemFont(ofSize: 14)
        dateLabel.textColor = .lightGray
        
        mediaTitleLabel.text = movie.title
        mediaTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        mediaImageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)"))
    }
    
}
