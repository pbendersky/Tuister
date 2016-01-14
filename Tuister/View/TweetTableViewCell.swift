//
//  TweetTableViewCell.swift
//  Tuister
//
//  Created by Pablo Bendersky on 1/14/16.
//  Copyright © 2016 Pablo Bendersky. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    @IBOutlet weak var profileAvatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userHandleLabel: UILabel!
    @IBOutlet weak var tweetContentLabel: UILabel!

    
    override func intrinsicContentSize() -> CGSize {
        return self.bounds.size
    }
}
