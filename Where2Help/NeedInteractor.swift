//
//  NeedInteractor.swift
//  Where2Help
//
//  Created by Aaron Cruz on 10/14/15.
//  Copyright © 2015 Aaron Cruz. All rights reserved.
//

import Foundation

class NeedInteractor {
    let handler: NeedHandler!
    
    init(handler: NeedHandler) {
        self.handler = handler
    }
    
    func load() {
        loadNeeds()
    }
    
    func loadNeeds() {
        NeedsStore.needs{ needs in
            self.handler.handleLoadNeeds(needs)
        }
    }
}