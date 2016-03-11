//
//  FakeTwitter.swift
//  Tuister
//
//  Created by Pablo Bendersky on 3/11/16.
//  Copyright © 2016 Pablo Bendersky. All rights reserved.
//

import Accounts
import Social

import SwiftyJSON

class FakeTwitter: Tuister {
    
    func ensureAccessToAccounts(completion: (Bool) -> Void) {
        completion(true)
    }
    
    func accounts() -> [ACAccount] {
        return []
    }
    
    func firstAccount() -> ACAccount? {
        return ACAccount()
    }
    
    func search(account: ACAccount, term: String, completion: ([Tweet]) -> Void) {
        let tweets = [
            Tweet(json: JSON.parse("{\"text\": \"@seppo0011 venís a la @nsconfarg?\", \"user\": { \"screen_name\": \"maro_beta\", \"name\": \"Mariano Abdala\", \"profile_image_url\": \"https://pbs.twimg.com/profile_images/659206915747139584/8TgE5G7N_bigger.jpg\" }}")),
            Tweet(json: JSON.parse("{\"text\": \"El miércoles que viene abrimos nuevamente la inscripción! Charlas técnicas en español para developers de iOS y Mac. http://nsconfarg.com\", \"user\": { \"screen_name\": \"nsconfarg\", \"name\": \"NSConf Argentina\", \"profile_image_url\": \"https://pbs.twimg.com/profile_images/704665105678606337/0nH6BHJW_bigger.jpg\" }}")),
            Tweet(json: JSON.parse("{\"text\": \"En el día internacional de la mujer no tenemos más que recordarles que buscamos oradoras, además de oradores, y que son muy bienvenidas.\", \"user\": { \"screen_name\": \"nsconfarg\", \"name\": \"NSConf Argentina\", \"profile_image_url\": \"https://pbs.twimg.com/profile_images/704665105678606337/0nH6BHJW_bigger.jpg\" }}")),
            Tweet(json: JSON.parse("{\"text\": \"@dev_jac @marianoabdala @nsconfarg ahora son todos dev rock stars🤘Grosos! Julito, vos estas en la primer parte de la serie de esos posts.\", \"user\": { \"screen_name\": \"ppacie\", \"name\": \"Pablo Paciello\", \"profile_image_url\": \"https://pbs.twimg.com/profile_images/1111324082/8f1f1945-4201-4a78-9e0c-f3e054b564ca_bigger.jpg\" }}")),
            Tweet(json: JSON.parse("{\"text\": \"@marianoabdala @nsconfarg keep searching in the article 😉\", \"user\": { \"screen_name\": \"dev_jac\", \"name\": \"Julio Carrettoni ()\", \"profile_image_url\": \"https://pbs.twimg.com/profile_images/607684631920377856/rK4685-Z_bigger.png\" }}")),
        ]
        
        completion(tweets)
    }
    
}
