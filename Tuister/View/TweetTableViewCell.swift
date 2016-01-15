//
//  TweetTableViewCell.swift
//  Tuister
//
//  Created by Pablo Bendersky on 1/14/16.
//  Copyright © 2016 Pablo Bendersky. All rights reserved.
//

import UIKit

import AlamofireImage

class TweetTableViewCell: UITableViewCell {

    @IBOutlet weak var profileAvatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var tweetContentLabel: UILabel!

    func update(tweet: Tweet) {
        self.tweetContentLabel.text = tweet.text
        self.nameLabel.text = tweet.user.name
        self.screenNameLabel.text = tweet.user.screenName
        self.profileAvatarImageView.af_setImageWithURL(tweet.user.profileImageURL)
    }
    
}
