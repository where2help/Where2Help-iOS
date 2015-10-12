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
    class func needsList(complete: (JSON)->()) {
        Alamofire.request(.GET, "https://where2help.herokuapp.com/api/v1/needs")
            .responseJSON { response in
                let json = JSON(response.result.value!)
                complete(json)
        }
    }
}
