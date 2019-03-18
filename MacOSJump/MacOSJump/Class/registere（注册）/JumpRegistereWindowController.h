//
//  JumpRegistereWindowController.h
//  MacOSJump
//
//  Created by jumpapp1 on 2019/1/14.
//  Copyright © 2019年 zb. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface JumpRegistereWindowController : NSWindowController

//IP地址
@property (copy,nonatomic) NSString *ipAddress;
//端口号
@property (copy,nonatomic) NSString *port;

@end
