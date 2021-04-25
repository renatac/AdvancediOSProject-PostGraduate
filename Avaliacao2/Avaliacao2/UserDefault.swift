//
//  UserDefault.swift
//  Avaliacao2
//
//  Created by RENATA on 23/04/21.
//

import Foundation

class UserDefaultsOK {
    static var shared = UserDefaultsOK()
    private init() {}

    let defaults = UserDefaults.standard
}
