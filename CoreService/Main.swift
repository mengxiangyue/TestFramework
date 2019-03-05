//
//  Main.swift
//  CoreService
//
//  Created by Xiangyue Meng on 2019/2/28.
//  Copyright © 2019 GrabTaxi Pte Ltd. All rights reserved.
//

import Foundation
import Alamofire


public func sayHi() {
    print("hello Core now hello")
    
    Alamofire.request("https://httpbin.org/get").responseJSON { response in
        print("Core response ----------")
    }
    
}
