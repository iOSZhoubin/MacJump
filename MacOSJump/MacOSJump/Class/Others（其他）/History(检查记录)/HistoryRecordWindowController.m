//
//  HistoryRecordWindowController.m
//  MacOSJump
//
//  Created by jumpapp1 on 2019/3/15.
//  Copyright © 2019年 zb. All rights reserved.
//

#import "HistoryRecordWindowController.h"
#import "RecordRemarkController.h"

@interface HistoryRecordWindowController ()<NSTableViewDelegate,NSTableViewDataSource>

@property (weak) IBOutlet NSTableView *tableView;

@property (strong,nonatomic) NSMutableArray *dataArray;

@property(nonatomic,strong) NSPopover *firstPopover;

@property(nonatomic,strong) RecordRemarkController *recordVC;


@end

@implementation HistoryRecordWindowController


- (NSPopover *)firstPopover
{
    if(!_firstPopover)
    {
        _firstPopover=[[NSPopover alloc]init];
        
        _firstPopover.appearance = [NSAppearance appearanceNamed:NSAppearanceNameAqua];
        
        _firstPopover.contentViewController = self.recordVC;
        
        _firstPopover.behavior = NSPopoverBehaviorTransient;
        
        _firstPopover.contentSize = NSMakeSize(200, 80);

    }
    return _firstPopover;
}

- (RecordRemarkController *)recordVC
{
    if(!_recordVC)
    {
        _recordVC = [[RecordRemarkController alloc]init];
    }
    return _recordVC;
}


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

-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row{
    
    return 20;
}

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


#pragma mark --- NSOutlineViewDelegate

//单击某一行
- (void)tableViewSelectionDidChange:(NSNotification *)notification{
    
    NSTableView *tableView = notification.object;
    
    NSInteger selectRow = tableView.selectedRow;

    NSLog(@"1:点击了第%ld行",selectRow);

    [self.firstPopover showRelativeToRect:CGRectMake(0, 20*self.dataArray.count, 200, 80) ofView:self.window.contentView preferredEdge:NSRectEdgeMinX];

}



@end
