//
//  AccountData.swift
//  UnitTest
//
//  Created by Cheng-Hong on 2022/9/14.
//

import SwiftUI

class AccountData: ObservableObject {
    
    @Published var account: String = ""
    
    @Published var password: String = ""
    
    @Published var errorStr: String = ""
    
    /// 正確的密碼
    let correctPassword: String = "123"
}
