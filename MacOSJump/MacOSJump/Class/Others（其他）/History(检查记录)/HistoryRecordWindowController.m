//
//  HistoryRecordWindowController.m
//  MacOSJump
//
//  Created by jumpapp1 on 2019/3/15.
//  Copyright © 2019年 zb. All rights reserved.
//

#import "HistoryRecordWindowController.h"

@interface HistoryRecordWindowController ()<NSTableViewDelegate,NSTableViewDataSource>

@property (weak) IBOutlet NSTableView *tableView;

@property (strong,nonatomic) NSMutableArray *dataArray;


@end

@implementation HistoryRecordWindowController


-(NSMutableArray *)dataArray{
    
    if(!_dataArray){
        
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    NSDictionary *dict = @{@"time":@"2019-03-15 17:00",@"status":@"正常"};
    
    for (NSInteger i=0; i<8; i++) {
        
        [self.dataArray addObject:dict];

    }
    
    [self.tableView reloadData];
}



#pragma mark --- NSTableViewDelegate,NSTableViewDataSource


-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    
    return self.dataArray.count;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
    
    if([tableColumn.identifier isEqualToString:@"oneColumn"]){
        
        NSTableCellView *oneCell = [tableView makeViewWithIdentifier:@"oneCell" owner:self];
        
        oneCell.textField.stringValue = self.dataArray[row][@"time"];
        
        return oneCell;
        
    }else{
        
        NSTableCellView *twoCell = [tableView makeViewWithIdentifier:@"twoCell" owner:self];
        
        twoCell.textField.stringValue = self.dataArray[row][@"status"];
        
        return twoCell;
    }
}

@end
