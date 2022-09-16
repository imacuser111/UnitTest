//
//  ContentViewModel.swift
//  UnitTest
//
//  Created by Cheng-Hong on 2022/9/14.
//

import Foundation

class ContentViewModel {
    
    enum FormatState: String {
        case success
        case accountEmpty
        case passwordEmpty
        case passwordError
        
        var isError: Bool {
            switch self {
            case .success:
                return false
            default:
                return true
            }
        }
    }
    
    func checkFormat(input: Input) -> Output {
        
        var state: FormatState = .success
        
        if input.accountData.account.isEmpty {
            state = .accountEmpty
        } else if input.accountData.password.isEmpty {
            state = .passwordEmpty
        } else if input.accountData.password != input.accountData.correctPassword {
            state = .passwordError
        } else if input.accountData.password == input.accountData.correctPassword {
            state = .success
        }
        
        return Output(state: state)
    }
    
}

extension ContentViewModel {
    struct Input {
        let accountData: AccountData
    }
    
    struct Output {
        let state: FormatState
    }
}
