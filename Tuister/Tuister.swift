//
//  Tuister.swift
//  Tuister
//
//  Created by Pablo Bendersky on 1/11/16.
//  Copyright © 2016 Pablo Bendersky. All rights reserved.
//

import Accounts
import Social

import SwiftyJSON
import Alamofire

class Tuister {

    func ensureAccessToAccounts(completion: (Bool) -> Void) {
        let accountStore = ACAccountStore()
        let accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        
        accountStore.requestAccessToAccountsWithType(accountType, options: nil) { (granted: Bool, error: NSError!) -> Void in
            completion(granted)
        }
    }
    
    func accounts() -> [ACAccount] {
        let accountStore = ACAccountStore()
        let accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        
        return accountStore.accountsWithAccountType(accountType) as! [ACAccount]
    }
    
    func firstAccount() -> ACAccount? {
        return accounts().first
    }
    
    func search(account: ACAccount, term: String, completion: ([Tweet]) -> Void) {
        let url = NSURL(string: "https://api.twitter.com/1.1/search/tweets.json")
        let request = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: .GET, URL: url, parameters: ["q": term])
        request.account = account
        request.performRequestWithHandler { (data: NSData!, urlResponse: NSHTTPURLResponse!, error: NSError!) -> Void in
            if error == nil {
                let json = JSON(data: data)
                var tweets = [ Tweet ]()
                for status in json["statuses"] {
                    let tweet = Tweet(json: status.1)
                    tweets.append(tweet)
                }
                
                completion(tweets)
            } else {
                print("error: \(error)")
            }
        }
    }
    
}
