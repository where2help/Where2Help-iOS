//
//  NeedAnnotationPresenter.swift
//  Where2Help
//
//  Created by Aaron Cruz on 10/19/15.
//  Copyright © 2015 Aaron Cruz. All rights reserved.
//

import Foundation

class NeedAnnotationPresenter {
    let need: Need!
    
    init(need: Need) {
        self.need = need
    }
    
    func title() -> String {
        return ""
    }
    
    func subtitle() -> String {
        return ""
    }
    
    func locationName() -> String {
        return ""
    }
}