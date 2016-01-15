//
//  File.swift
//  Tuister
//
//  Created by Pablo Bendersky on 1/15/16.
//  Copyright © 2016 Pablo Bendersky. All rights reserved.
//

import Foundation

import SwiftyJSON

public class User {
    
    public var profileImageURL: NSURL!
    public var screenName: String!
    public var name: String!
    
    init(json: JSON) {
        if let profileImageURL = json["profile_image_url"].string {
            self.profileImageURL = NSURL(string: profileImageURL)
        }
        if let screenName = json["screen_name"].string {
            self.screenName = screenName
        }
        if let name = json["name"].string {
            self.name = name
        }
    }
    
}