//
//  ViewController.m
//  SHESelectTableDemo
//
//  Created by xxx on 2018/3/12.
//  Copyright © 2018年 xxx. All rights reserved.
//

#import "ViewController.h"
#import "SHESelectTable.h"

#define KSW  [UIScreen mainScreen].bounds.size.width
#define KSH  [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
{
    int              selectIndex;/*选择的cell索引*/
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(200, 100, 100, 50);
    button.backgroundColor=[UIColor redColor];
    [button addTarget:self action:@selector(selectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"距离最近" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
}
-(void)selectButtonClick:(UIButton *)sender
{
    
    NSArray *seleArray=@[@"距离最近",@"价格最低",@"综合"];
    
    //获取某个控件在屏幕上的位置
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[sender convertRect: sender.bounds toView:window];
    
    SHESelectTable *sTable=[[SHESelectTable alloc]initWithFrame:CGRectMake(0, 0, KSW, KSH) withTableFrame:CGRectMake(KSW-12-210, rect.origin.y+sender.frame.size.height, 210, 44*seleArray.count) withDataArray:seleArray withSelectindex:selectIndex];
    sTable.selTable.frame=CGRectMake(KSW-12-210, rect.origin.y+sender.frame.size.height, 210, 44*seleArray.count);
    //block回调
    sTable.returnBlock=^(NSString *cityString)
    {
        if([cityString isEqualToString:@"距离最近"])
        {
            selectIndex=0;
        }
        if([cityString isEqualToString:@"价格最低"])
        {
            selectIndex=1;
        }
        if([cityString isEqualToString:@"综合"])
        {
            selectIndex=2;
        }
        [sender setTitle:cityString forState:UIControlStateNormal];
    };
    
    //弹出select table
    [[UIApplication sharedApplication].keyWindow addSubview:sTable];
    [UIView animateWithDuration:0.2 animations:^{
        
        sTable.selTable.alpha=1;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
