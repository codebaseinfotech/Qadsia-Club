//
//  Constants.swift
//  Qadsia Club
//
//  Created by Kenil on 05/02/26.
//

import Foundation

enum AppEnviroment {
    case live
    case dev
}

let current: AppEnviroment = .live


// ************************* LIVE ***********************
let BASE_URL = current == .live ? "" : ""

enum APIEndPoint: String {
    case loginUser = ""
}
