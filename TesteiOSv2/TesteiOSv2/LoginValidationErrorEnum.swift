//
//  ValidationErrorEnum.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation

enum LoginValidationErrorEnum : Int {
    case none = 0, username, password
    
    var errorMensage : String {
        let mensage = ["", LOGIN_ERROR_USERNAME, LOGIN_ERROR_PASSWORD]
        
        return mensage[rawValue]
    }
}
