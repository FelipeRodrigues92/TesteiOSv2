//
//  HeadView.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import UIKit
import SnapKit

class HeadView : UIView{
    
    lazy var userName : UILabel = {
        let userName = UILabel()
        userName.font = UIFont.init(name: "HelveticaNeue-Light", size: 25)
        userName.numberOfLines = 0
        userName.textAlignment = .center
        userName.textColor = .white//UIColor.init(displayP3Red: 168/255, green: 180/255, blue: 196/255, alpha: 1)
        userName.translatesAutoresizingMaskIntoConstraints = false
        return userName
    }()
    
    lazy var logoutButton : UIButton = {
        let logoutButton = UIButton()
        let img = UIImage(named: LOGOUT_IMAGE_NAME)
        logoutButton.setImage(img , for: .normal)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.addTarget(self, action: #selector(pressedAction), for: .touchUpInside)
        
        return logoutButton
    }()
    
    lazy var accontLabel : UILabel = {
        let accontLabel = UILabel()
        accontLabel.font = UIFont.init(name: "HelveticaNeue-Light", size: 12)
        accontLabel.numberOfLines = 0
        accontLabel.textAlignment = .center
        accontLabel.text = "Conta"
        accontLabel.textColor = .white
        accontLabel.translatesAutoresizingMaskIntoConstraints = false
        return accontLabel
    }()
    
    lazy var accontNumberLabel : UILabel = {
        let accontNumberLabel = UILabel()
        accontNumberLabel.font = UIFont.init(name: "HelveticaNeue-Light", size: 25)
        accontNumberLabel.numberOfLines = 0
        accontNumberLabel.textAlignment = .center
        accontNumberLabel.textColor = .white//UIColor.init(displayP3Red: 168/255, green: 180/255, blue: 196/255, alpha: 1)
        accontNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        return accontNumberLabel
    }()
    
    lazy var balanceLabel : UILabel = {
        let balanceLabel = UILabel()
        balanceLabel.font = UIFont.init(name: "HelveticaNeue-Light", size: 12)
        balanceLabel.numberOfLines = 0
        balanceLabel.textAlignment = .center
        balanceLabel.text = "Saldo"
        balanceLabel.textColor = .white//UIColor.init(displayP3Red: 168/255, green: 180/255, blue: 196/255, alpha: 1)
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        return balanceLabel
    }()
    
    lazy var accontValueLabel : UILabel = {
        let accontValueLabel = UILabel()
        accontValueLabel.font = UIFont.init(name: "HelveticaNeue-Light", size: 25)
        accontValueLabel.numberOfLines = 0
        accontValueLabel.textAlignment = .center
        accontValueLabel.textColor = .white//UIColor.init(displayP3Red: 168/255, green: 180/255, blue: 196/255, alpha: 1)
        accontValueLabel.translatesAutoresizingMaskIntoConstraints = false
        return accontValueLabel
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func pressedAction(sender: UIButton!) {
       print("logout")
    }
    
}
extension HeadView: ViewCode{
    func buildViewHierarchy() {
        self.addSubview(userName)
        self.addSubview(logoutButton)
        self.addSubview(accontLabel)
        self.addSubview(accontNumberLabel)
        self.addSubview(balanceLabel)
        self.addSubview(accontValueLabel)
    }
    
    func setupConstraints() {
        self.userName.snp.makeConstraints { make in
            make.top.equalTo(40)
            make.left.equalTo(18)
        }
        self.logoutButton.snp.makeConstraints { make in
            make.top.equalTo(40)
            make.right.equalToSuperview().inset(13)
        }
        
        self.accontLabel.snp.makeConstraints { make in
            make.top.equalTo(userName.snp.bottom).offset(28)
            make.left.equalTo(18)
        }
        
        self.accontNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(accontLabel.snp.bottom).offset(6)
            make.left.equalTo(18)
        }
        
        self.balanceLabel.snp.makeConstraints { make in
            make.top.equalTo(accontNumberLabel.snp.bottom).offset(21)
            make.left.equalTo(18)
        }
        
        self.accontValueLabel.snp.makeConstraints { make in
            make.top.equalTo(balanceLabel.snp.bottom).offset(7)
            make.left.equalTo(18)
        }
    }
    
    func setupAdditionalConfigurations() {
        self.backgroundColor = UIColor.init(displayP3Red: 59/255, green: 73/255, blue: 238/255, alpha: 1)
        userName.text = "asdkamsd"
        accontNumberLabel.text = "2050 / 01.111222-4"
        accontValueLabel.text = "R$1.000,00"
    }
    
    
}