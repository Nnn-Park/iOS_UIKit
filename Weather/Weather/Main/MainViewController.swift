//
//  ViewController.swift
//  Weather
//
//  Created by 박재형 on 7/14/24.
//

import UIKit
import SnapKit

class MainViewController: BaseViewController {

    let viewModel = MainViewModel()
    
    private lazy var backgroundView = {
        let view = UIView()
        
        return view
    }()
    
    private lazy var weatherLabel = {
        let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: 40)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.inputWeather.value = ()
        viewModel.outputData.bind { weather in
            print("SUCCESS \(weather)")
        }
    }
    

    override func configureHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(weatherLabel)
    }
    
    override func configureConstraints() {
        
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        weatherLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(100)
//            make.width.equalTo(100)
        }
        
    }
    
    override func configureView() {
        backgroundView.backgroundColor = .blue
        weatherLabel.text = "afdfaf"
        
    }
    
}

extension MainViewController {
    
    
    
    
}
