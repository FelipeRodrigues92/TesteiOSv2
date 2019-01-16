//
//  AccontDetailViewController.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import UIKit
import SnapKit

class AccontDetailViewController : UIViewController, UITableViewDelegate, UITableViewDataSource , AccountDetailViewControllerProceed{

    
    
    var interactor : AccountDetailBussinessLogic?
    
    lazy var headView : HeadView = {
        let headView = HeadView()
        return headView
    }()
    
    
    lazy var tableViewHeader : AccountTableViewHeader = {
        let headView = AccountTableViewHeader()
        return headView
        }()
    
    
    lazy var tableView : UITableView = {
        let tableView = UITableView(frame: self.view.frame)
        tableView.register(AccontDetailTableViewCell.self, forCellReuseIdentifier: UPCOMING_STATEMENTTABLE_CELL)
        tableView.headerView(forSection: 1)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        return tableView
    }()
    
    var statementsList : [AccountStatementModel]?
    
    /**
     AccontDetailViewController init.
     
     - parameters:
     - user: UserAccount.
     */
    init(user: UserAccount){
        super.init(nibName: nil, bundle: nil)
        setup()
        self.callIteractor(user: user)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.setupView()
        setup()
    }

    /**
     Setup LoginViewController protocols.
     */
    private func setup()
    {
        let viewController = self
        let interactor = AccountDetailInteractor()
        let presenter = AccountDetailPresenter()
      //  let router = LoginRouter()
        viewController.interactor = interactor
      //  viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
      // router.viewController = viewController
       // router.dataStore = interactor
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let statements = self.statementsList else{return 0}
        print("count")
        return statements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let statementCell = tableView.dequeueReusableCell(withIdentifier: UPCOMING_STATEMENTTABLE_CELL) as? AccontDetailTableViewCell
        guard let statements = self.statementsList , let cell = statementCell else {return UITableViewCell()}
        cell.uploadCell(with: statements[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height : CGFloat = 100
        return height
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Resultados"
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let view = view as? UITableViewHeaderFooterView {
            view.backgroundView?.backgroundColor = UIColor.init(red: 254/255, green:  254/255, blue:  254/255, alpha: 1)
            view.textLabel!.backgroundColor = UIColor.clear
            view.textLabel!.textColor = UIColor.black
            view.textLabel!.font =  UIFont.init(name: "HelveticaNeue-Light", size: 17)
            view.textLabel!.text = ACCOUNT_TABLEVIEW_HEADER_TITTLE
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return ACCOUNT_TABLEVIEW_HEADER_HEIGHT
    }
    /**
     Set MovieDetailViewController interactor movie value.
     
     - parameters:
     - movie: Movie.
     */
    private func callIteractor(user: UserAccount){
        guard let interactor = self.interactor else{return}
        interactor.updateUserAccountDetail(user: user)
    }
    
    func updateHeader(account: AccountDetailHeaderModel) {
        self.headView.userName.text = account.name
        self.headView.accontNumberLabel.text = account.bankAccount
        self.headView.accontValueLabel.text = account.value
    }
    
    func updateAccountValue(value: String){
        self.headView.accontValueLabel.text = value
    }
    
    func updateTableView(statements: [AccountStatementModel]) {
        self.statementsList = statements
        self.tableView.reloadData()
    }
}

extension AccontDetailViewController : ViewCode{
    func buildViewHierarchy() {
        self.view.addSubview(headView)
        self.view.addSubview(tableView)
    }
    
    func setupConstraints() {
        self.headView.snp.makeConstraints{ make in
            make.top.right.left.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.347826)
        }
        self.tableView.snp.makeConstraints{ make in
            make.bottom.right.left.equalToSuperview()
            make.top.equalTo(self.headView.snp.bottom)
        }
    }
    
    func setupAdditionalConfigurations() {
        
    }
    
    
}
