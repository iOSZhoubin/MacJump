//
//  FirstPageWindowController.m
//  MacOSJump
//
//  Created by jumpapp1 on 2019/3/12.
//  Copyright © 2019年 zb. All rights reserved.
//

#import "FirstPageWindowController.h"
#import "ApplicitionWindowController.h"
#import "JumpRegistereWindowController.h"
#import "HistoryRecordWindowController.h"

@interface FirstPageWindowController ()

//检查项1
@property (weak) IBOutlet NSImageView *itemOne;
//检查项2
@property (weak) IBOutlet NSImageView *itemTwo;
//检查项3
@property (weak) IBOutlet NSImageView *itemThree;
//检查项4
@property (weak) IBOutlet NSImageView *itemFour;
//进度条
@property (weak) IBOutlet NSProgressIndicator *progress;
//检查内容
@property (weak) IBOutlet NSTextField *itemContent;
//重新检测按钮
@property (weak) IBOutlet NSButton *againBtn;
//定时器
@property (strong,nonatomic) NSTimer *timer;

@property (strong,nonatomic) ApplicitionWindowController *applicitionWd;

@property (strong,nonatomic) JumpRegistereWindowController *registereWindowC;

@property (strong,nonatomic) HistoryRecordWindowController *historyWindowC;

@end

@implementation FirstPageWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    self.applicitionWd = [[ApplicitionWindowController alloc]initWithWindowNibName:@"ApplicitionWindowController"];

    self.registereWindowC = [[JumpRegistereWindowController alloc]initWithWindowNibName:@"JumpRegistereWindowController"];

    self.historyWindowC = [[HistoryRecordWindowController alloc]initWithWindowNibName:@"HistoryRecordWindowController"];

}


- (IBAction)backAction:(NSButton *)sender {
    
    L2CWeakSelf(self);
    
    weakself.progress.doubleValue = 0;
    
    weakself.itemContent.stringValue = @"";
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5f repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        NSInteger progressV = weakself.progress.doubleValue;

        if(progressV >= 100){
            
            weakself.progress.doubleValue = 100;
            
            [weakself.progress stopAnimation:sender];
            
            [weakself.timer invalidate];

            weakself.timer = nil;
            
            self.againBtn.enabled = YES;
            
        }else{
            
            [weakself.progress startAnimation:sender];
            
            [weakself.progress incrementBy:1];
            
            self.againBtn.enabled = NO;
            
        }
        weakself.itemContent.stringValue = [self isgo:progressV];

        
    }];
}

#pragma mark --- 进度判断

-(NSString *)isgo:(NSInteger)progressV{
    
    NSMutableString *contentStr = [NSMutableString string];
    
    if(progressV > 0){
        
        [contentStr appendFormat:@"正在检测..."];
    }
    
    if(progressV >= 20){
        
        [contentStr appendFormat:@"\n检查项1正常..."];
    }
    
    if(progressV >= 45){
        
        [contentStr appendFormat:@"\n检查项2正常..."];
    }
    
    if(progressV >= 60){
        
        [contentStr appendFormat:@"\n检查项3正常..."];
    }
    
    if(progressV > 99){
        
        [contentStr appendFormat:@"\n检查项4正常..."];
    }
    
    return contentStr;
}


#pragma mark --- 查看进程

- (IBAction)runloopAction:(NSButton *)sender {
    
    [self.applicitionWd.window orderFront:nil];//显示要跳转的窗口
    
    [[self.applicitionWd window] center];//显示在屏幕中间
}



#pragma mark --- 查看进程

- (IBAction)lookApplication:(NSToolbarItem *)sender {
    
    [self.applicitionWd.window orderFront:nil];//显示要跳转的窗口
    
    [[self.applicitionWd window] center];//显示在屏幕中间
}


#pragma mark --- 状态

- (IBAction)stateAction:(NSToolbarItem *)sender {
    
    JumpLog(@"111");
}


#pragma mark --- 完善信息

- (IBAction)infomationAction:(NSToolbarItem *)sender {
        
    self.registereWindowC.ipAddress = self.ipAddress;
    
    self.registereWindowC.port = self.port;
    
    [self.registereWindowC.window orderFront:nil];//显示要跳转的窗口
    
    [[self.registereWindowC window] center];//显示在屏幕中间
}


#pragma mark --- 检测记录

- (IBAction)historyRecord:(NSToolbarItem *)sender {

    [self.historyWindowC.window orderFront:nil];//显示要跳转的窗口
    
    [[self.historyWindowC window] center];//显示在屏幕中间
}

@end
