//
//  TuisterStrategy.swift
//  Tuister
//
//  Created by Pablo Bendersky on 3/11/16.
//  Copyright © 2016 Pablo Bendersky. All rights reserved.
//

enum TuisterStrategy {
    
    case StrategyTwitter
    case StrategyFakeTwitter
    
    func newTuisterInstance() -> Tuister {
        switch self {
        case .StrategyTwitter:
            return Twitter()
        case .StrategyFakeTwitter:
            return FakeTwitter()
        }
    }
}
