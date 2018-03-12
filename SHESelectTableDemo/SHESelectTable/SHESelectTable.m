//
//  SHESelectTable.m
//  breeder
//
//  Created by xxx on 2017/11/21.
//  Copyright © 2017年 xxx. All rights reserved.
//

#import "SHESelectTable.h"
#import "SHESelectCell.h"

@implementation SHESelectTable
-(instancetype)initWithFrame:(CGRect)frame withTableFrame:(CGRect)tableFrame withDataArray:(NSArray *)dataArray withSelectindex:(NSInteger)selectinx
{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        [self creatView];
        /*title 数据源数组*/
        datArray=dataArray;
        /*table 的frame*/
        tFrame=tableFrame;
        /*被选中的cell索引*/
        selectIndex=selectinx;
    }
    return self;
}
/*点击任意一处 消失*/
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismiss];
}
- (void)dismiss{
    WS(weakSelf);
    [UIView animateWithDuration:0.2 animations:^{

        weakSelf.selTable.alpha=0;
        
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
    }];
}
-(void)creatView
{
    _selTable=[self creatTableViewWithCGRect:CGRectMake(tFrame.origin.x, tFrame.origin.y, tFrame.size.width, tFrame.size.height) withView:self];
    _selTable.delegate=self;
    _selTable.dataSource=self;
    _selTable.bounces=NO;
    _selTable.layer.borderColor=[UIColor lightGrayColor].CGColor;
    _selTable.layer.borderWidth=1.0;
    _selTable.backgroundColor=[UIColor clearColor];
    [_selTable registerClass:[SHESelectCell class] forCellReuseIdentifier:@"SHESelectCell"];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return datArray.count;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHESelectCell *cell=[tableView dequeueReusableCellWithIdentifier:@"SHESelectCell"];
    if (!cell) {
        cell=[[SHESelectCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SHESelectCell"];
    }
    cell.leftLab.text=datArray[indexPath.row];
    cell.selectBtn.frame=CGRectMake(_selTable.frame.size.width-6-22, 0, 22, cell.frame.size.height);
    
    if (selectIndex==indexPath.row) {
        cell.selectBtn.hidden=NO;
    }else{
        cell.selectBtn.hidden=YES;
    }
    
    if (indexPath.row!=0) {
        [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
       
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_returnBlock) {
        _returnBlock([datArray[indexPath.row] stringByReplacingOccurrencesOfString:@"市" withString:@""]);
        [self dismiss];
    }
}
-(UITableView *)creatTableViewWithCGRect:(CGRect)rect withView:(UIView *)view
{
    
    UITableView *tableView=[[UITableView alloc]initWithFrame:rect style:UITableViewStylePlain];
    tableView.backgroundColor=[UIColor whiteColor];
    tableView.showsVerticalScrollIndicator=NO;
    tableView.separatorColor=[UIColor clearColor];
    tableView.keyboardDismissMode=UIScrollViewKeyboardDismissModeOnDrag;
    tableView.estimatedRowHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
    [view addSubview:tableView];
    
    return tableView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
