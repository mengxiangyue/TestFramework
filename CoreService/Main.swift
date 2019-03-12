//
//  Main.swift
//  CoreService
//
//  Created by Xiangyue Meng on 2019/2/28.
//  Copyright © 2019 GrabTaxi Pte Ltd. All rights reserved.
//

import Foundation
import Alamofire

public class CoreService: NSObject {
    @objc
    public class func sayToOC() {
        print("Hello oc")
    }
    
    func test() {
        Crypto.sayToSwift()
    }
}
public func sayHiInCore() {
    print("hello Core now hello4444")
    
    Alamofire.request("https://httpbin.org/get").responseJSON { response in
        print("Core response ----------")
    }
    Crypto.sayToSwift()
    
}
