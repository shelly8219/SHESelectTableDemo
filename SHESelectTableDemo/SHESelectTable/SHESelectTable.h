//
//  SHESelectTable.h
//  breeder
//
//  Created by xxx on 2017/11/21.
//  Copyright © 2017年 xxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHESelectCell.h"
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
@interface SHESelectTable : UIView<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *datArray; /*title 数据源数组*/
    CGRect tFrame;/*table 的frame*/
    NSInteger selectIndex;
}
- (instancetype)initWithFrame:(CGRect)frame withTableFrame:(CGRect)tableFrame withDataArray:(NSArray *)dataArray withSelectindex:(NSInteger)selectinx;
@property(nonatomic,strong)UITableView       *selTable;
@property(nonatomic,copy)void(^returnBlock)(NSString *inputStr);
@end
