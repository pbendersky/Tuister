//
//  Tuister.swift
//  Tuister
//
//  Created by Pablo Bendersky on 1/11/16.
//  Copyright © 2016 Pablo Bendersky. All rights reserved.
//

import Accounts
import Social

protocol Tuister {

    func ensureAccessToAccounts(completion: (Bool) -> Void)
    
    func accounts() -> [ACAccount]
    
    func firstAccount() -> ACAccount?
    
    func search(account: ACAccount, term: String, completion: ([Tweet]) -> Void)
    
}
