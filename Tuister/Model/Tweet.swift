//
//  Tweet.swift
//  Tuister
//
//  Created by Pablo Bendersky on 1/13/16.
//  Copyright © 2016 Pablo Bendersky. All rights reserved.
//

import SwiftyJSON

public class Tweet: CustomStringConvertible {
    
    public var text: String!
    public var user: User!
    
    init(json: JSON) {
        if let text = json["text"].string {
            self.text = text
        }
        self.user = User(json: json["user"])
    }
    
    // MARK: - CustomStringConvertible Methods
    
    public var description: String {
        return "\(self.dynamicType) text: \(self.text)"
    }
    
}