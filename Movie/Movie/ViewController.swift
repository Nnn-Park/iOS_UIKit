//
//  ViewController.swift
//  Movie
//
//  Created by 박재형 on 6/7/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let MovieLoginMainLabel = UILabel()
    
    let MovieLoginEmailTextField = UITextField()
    let MovieLoginPasswordTextField = UITextField()
    let MovieLoginNicknameTextField = UITextField()
    let MovieLoginLocationTextField = UITextField()
    let MovieLoginRecommandCodeTextField = UITextField()
    
    let MovieIdRegisterButton = UIButton()
    let EnterAdditionalInformation = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHirerarchy()
        configureLayout()
        configureUI()
        
        
    }
    
    func configureHirerarchy() {
        
        view.addSubview(MovieLoginMainLabel)
        view.addSubview(MovieLoginEmailTextField)
        view.addSubview(MovieLoginPasswordTextField)
        view.addSubview(MovieLoginNicknameTextField)
        view.addSubview(MovieLoginLocationTextField)
        view.addSubview(MovieLoginRecommandCodeTextField)
        view.addSubview(MovieIdRegisterButton)
        view.addSubview(EnterAdditionalInformation)
    }
    
    func configureLayout() {
        
        MovieLoginMainLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.centerX.equalTo(view)
        }
        
        MovieLoginEmailTextField.snp.makeConstraints { make in
            make.top.equalTo(MovieLoginMainLabel.snp.bottom).offset(150)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(50)
        }
        
        MovieLoginPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(MovieLoginEmailTextField.snp.bottom).offset(15)
            make.left.right.height.equalTo(MovieLoginEmailTextField)
        }
        
        MovieLoginNicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(MovieLoginPasswordTextField.snp.bottom).offset(15)
            make.left.right.height.equalTo(MovieLoginEmailTextField)
        }
        
        MovieLoginLocationTextField.snp.makeConstraints { make in
            make.top.equalTo(MovieLoginNicknameTextField.snp.bottom).offset(15)
            make.left.right.height.equalTo(MovieLoginEmailTextField)
        }
        
        MovieLoginRecommandCodeTextField.snp.makeConstraints { make in
            make.top.equalTo(MovieLoginLocationTextField.snp.bottom).offset(15)
            make.left.right.height.equalTo(MovieLoginEmailTextField)
        }
        
        MovieIdRegisterButton.snp.makeConstraints { make in
            make.top.equalTo(MovieLoginRecommandCodeTextField.snp.bottom).offset(30)
            make.left.right.equalTo(MovieLoginEmailTextField)
            make.height.equalTo(50)
        }
        
        EnterAdditionalInformation.snp.makeConstraints { make in
            make.centerY.equalTo(MovieIdRegisterButton.snp.bottom).offset(30)
            make.left.equalTo(view).offset(20)
        }
    }
    
    func configureUI() {
        
        MovieLoginMainLabel.text = "JACKFLIX"
        MovieLoginMainLabel.textColor = .red
        MovieLoginMainLabel.font = UIFont.boldSystemFont(ofSize: 35)
        MovieLoginMainLabel.textAlignment = .center
        
        
        configureTextField(MovieLoginEmailTextField, placeholder: "이메일 주소 또는 전화번호")
        configureTextField(MovieLoginPasswordTextField, placeholder: "비밀번호")
        configureTextField(MovieLoginNicknameTextField, placeholder: "닉네임")
        configureTextField(MovieLoginLocationTextField, placeholder: "위치")
        configureTextField(MovieLoginRecommandCodeTextField, placeholder: "추천 코드 입력")
        
        
        MovieIdRegisterButton.setTitle("회원가입", for: .normal)
        MovieIdRegisterButton.setTitleColor(.black, for: .normal)
        MovieIdRegisterButton.backgroundColor = .white
        MovieIdRegisterButton.layer.cornerRadius = 5
        
    }
    
    func configureTextField(_ textField: UITextField, placeholder: String) {
        
        textField.placeholder = placeholder
        textField.textAlignment = .center
        textField.backgroundColor = .darkGray
        textField.textColor = .white
        textField.layer.cornerRadius = 5
        textField.clearButtonMode = .whileEditing
        textField.setLeftPaddingPoints(10)
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        view.addSubview(textField)
    }
    
}


extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
