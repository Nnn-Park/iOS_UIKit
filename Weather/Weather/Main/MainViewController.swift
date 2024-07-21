//
//  ViewController.swift
//  Weather
//
//  Created by 박재형 on 7/14/24.
//

import UIKit
import SnapKit

final class MainViewController: BaseViewController {
    
    let viewModel = MainViewModel()
    var list: [WeatherInfo] = []
    var city: City = City(name: "")
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewListCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.inputWeather.value = ()
        viewModel.outputData.bind { weather in
            //            print("SUCCESS \(weather)")
        }
        
        viewModel.outputWeatherInfo.bind { _ in
            self.list = self.viewModel.outputWeatherInfo.value
            print("\(self.list)")
            self.collectionView.reloadData()
        }
        
        viewModel.outputCityName.bind { cityName in
            self.weatherLabel.text = cityName
        }
        
        configureHierarchy()
        configureConstraints()
        configureView()
    }
    
    override func configureHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(weatherLabel)
        view.addSubview(collectionView)
    }
    
    override func configureConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        weatherLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-50)
            make.height.equalTo(100)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(weatherLabel.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    override func configureView() {
        backgroundView.backgroundColor = .systemGray6
        collectionView.backgroundColor = .clear
    }
    
    private func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.backgroundColor = .systemGray3
        configuration.showsSeparators = false
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .absolute(44))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
        return layout
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UICollectionViewListCell
        
        var content = UIListContentConfiguration.cell()
        let weatherInfo = list[indexPath.item]
        if let description = weatherInfo.weather.first?.description {
            content.text = description
        } else {
            content.text = "No description"
        }
        cell.contentConfiguration = content
        
        return cell
    }
}
