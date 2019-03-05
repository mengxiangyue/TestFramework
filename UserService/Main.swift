//
//  Main.swift
//  UserService
//
//  Created by Xiangyue Meng on 2019/2/28.
//  Copyright © 2019 GrabTaxi Pte Ltd. All rights reserved.
//

import Foundation
import CoreService
import Alamofire


public func sayHi() {
    print("hello User world")
    CoreService.sayHi()
    
    Alamofire.request("https://httpbin.org/get").responseJSON { response in
        print("User response ----------")
    }
    print("User end -----")
}
