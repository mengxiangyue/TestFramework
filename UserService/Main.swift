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
        print("Request: \(String(describing: response.request))")   // original url request
        print("Response: \(String(describing: response.response))") // http url response
        print("Result: \(response.result)")                         // response serialization result
        
        if let json = response.result.value {
            print("JSON: \(json)") // serialized json response
        }
        
        if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
            print("Data: \(utf8Text)") // original server data as UTF8 string
        }
    }
}
