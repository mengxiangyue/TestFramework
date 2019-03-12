//
//  Crypto.m
//  CoreService
//
//  Created by Xiangyue Meng on 2019/3/10.
//  Copyright © 2019 GrabTaxi Pte Ltd. All rights reserved.
//

#import "Crypto.h"
#import <CoreService/CoreService-Swift.h>

@implementation Crypto
+(void)create {
    [CoreService sayToOC];
    NSLog(@"create Crypto");
}
    
+(void)sayToSwift {
    NSLog(@"hello swift");
}
@end
