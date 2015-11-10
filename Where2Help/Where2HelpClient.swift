//
//  Where2HelpClient.swift
//  Where2Help
//
//  Created by Aaron Cruz on 10/11/15.
//  Copyright © 2015 Aaron Cruz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Where2HelpClient {
//    static let kBaseURL = "https://staging-where2help.herokuapp.com/api/v1"
    
    static let kBaseURL = "http://localhost:3000/api/v1"
    
    class func needsList(complete: (JSON)->()) {
        let url = "\(kBaseURL)/needs"
        Alamofire.request(.GET, url)
            .responseJSON { response in
                let json = JSON(response.result.value!)
                complete(json)
        }
    }
    
    class func need(needID: Int, complete: (JSON)->()) {
        let url = "\(kBaseURL)/needs/\(needID)"
        Alamofire.request(.GET, url)
            .responseJSON { response in
                let json = JSON(response.result.value!)
                complete(json)
        }
    }
}
