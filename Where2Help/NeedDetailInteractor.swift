//
//  NeedDetailInteractor.swift
//  Where2Help
//
//  Created by Aaron Cruz on 10/14/15.
//  Copyright © 2015 Aaron Cruz. All rights reserved.
//

import Foundation

class NeedDetailInteractor {
    let need: Need!
    let handler: NeedDetailHandler!
    
    init(handler: NeedDetailHandler, need: Need) {
        self.handler = handler
        self.need = need
    }
    
    func setup() {
        let pres = NeedPresenter(need: need)
        handler.handleLoadNeed(pres)
    }
    
    func loadNeed() {
    }
}