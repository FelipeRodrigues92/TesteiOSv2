//
//  LoginViewController.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import UIKit

class LoginViewController : UIViewController, UITextFieldDelegate{
    
    ///This viewController interactor
    var interactor : LoginBussinessLogic?
    var router : (LoginRoutingLogic & LoginDataPassing)?
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    lazy var loadAlert : UIAlertController = {
        let alert = UIAlertController(title: nil, message: LOAD_MENSAGE, preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating()
        
        alert.view.addSubview(loadingIndicator)
        return alert
    }()
    
    lazy var errorAlert : UIAlertController = {
        let alert = UIAlertController(title: nil, message: "", preferredStyle: .alert)
        return alert
    }()

    override func viewDidLoad() {
        username.delegate = self
        password.delegate = self
        self.checkSavedUser()
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    /**
     Setup LoginViewController protocols.
     */
    private func setup()
    {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
        guard let usernameText = username.text, let passwordText = password.text else {
            return
        }
        self.lodingAlert()
        interactor?.login(user: usernameText, password: passwordText)
        
        self.dismissLoadAlert()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func lodingAlert(){
        self.present(loadAlert, animated: true, completion: nil)
    }
    func dismissLoadAlert(){
        self.loadAlert.dismiss(animated: false, completion: nil)
    }
    func checkSavedUser(){
        let keychain = LoginKeychain()
        guard let user = keychain.getUsername() else{return}
        self.username.text = user
    }
}

extension LoginViewController : LoginViewControllerProceed{
    func callALertController(alert: UIAlertController) {
        self.errorAlert = alert
        self.loadAlert.dismiss(animated: false){
            self.present(alert, animated: true)
        }
    }
    
    func goToNextViewController() {
        self.router?.routeToAccountDetail()
    }
    
    
}
