//
//  KeychainConstants.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2021/05/13.
//

import Foundation

struct KeychainConstants {

    // このアプリの「Bundle Indentifier」名
    static let bundleIdentifier = Bundle.main.bundleIdentifier!

    // keychainAccessのKey名
    static let keychainAccessKeyName = "jsonAccessToken"

    // JWTのprefix名
    static let jwtTokenPrefix = "Bearer "
}
