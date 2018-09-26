//
//  CodeTextDemo
//
//  Created by 小侯爷 on 2018/9/20.
//  Copyright © 2018年 小侯爷. All rights reserved.
//

#import "ViewController.h"

#import "HWTFCodeView.h"
#import "HWTFCodeBView.h"
#import "HWTextCodeView.h"


@interface ViewController ()

@property (nonatomic, weak) HWTFCodeView *code1View;

@property (nonatomic, weak) HWTFCodeBView *code2View;

@property (nonatomic, weak) HWTextCodeView *code3View;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGFloat x = 30;
    CGFloat w = self.view.bounds.size.width - x * 2;
    CGFloat h = 50;
    CGFloat y = 100;
    
    // --------------------------------------------------------------------
    
    UILabel *labA = [UILabel new];
    labA.textColor = [UIColor orangeColor];
    labA.font = [UIFont systemFontOfSize:13];
    labA.text = @"基本实现原理 - 下划线";
    labA.frame = CGRectMake(x, y, 200, 15);
    [self.view addSubview:labA];
    
    y = CGRectGetMaxY(labA.frame) + 10;
    
    HWTFCodeView *code1View = [[HWTFCodeView alloc] initWithCount:6 margin:20];
    code1View.frame = CGRectMake(x, y, w, h);
    [self.view addSubview:code1View];
    self.code1View = code1View;
    
    
    // --------------------------------------------------------------------
    
    y = CGRectGetMaxY(code1View.frame) + 80;
    
    UILabel *labB = [UILabel new];
    labB.textColor = [UIColor orangeColor];
    labB.font = [UIFont systemFontOfSize:13];
    labB.text = @"基本实现原理 - 方块";
    labB.frame = CGRectMake(x, y, 200, 15);
    [self.view addSubview:labB];
    
    y = CGRectGetMaxY(labB.frame) + 30;
    
    HWTFCodeBView *code2View = [[HWTFCodeBView alloc] initWithCount:6 margin:20];
    code2View.frame = CGRectMake(x, y, w, h);
    [self.view addSubview:code2View];
    self.code2View = code2View;
    
    
    // --------------------------------------------------------------------
    
    y = CGRectGetMaxY(code2View.frame) + 80;
    
    UILabel *labC = [UILabel new];
    labC.textColor = [UIColor orangeColor];
    labC.font = [UIFont systemFontOfSize:13];
    labC.text = @"完善版 - 加入动画 - 下划线";
    labC.frame = CGRectMake(x, y, 200, 15);
    [self.view addSubview:labC];
    
    y = CGRectGetMaxY(labC.frame) + 30;
    
    HWTextCodeView *code3View = [[HWTextCodeView alloc] initWithCount:6 margin:20];
    code3View.frame = CGRectMake(x, y, w, h);
    [self.view addSubview:code3View];
    self.code3View = code3View;
    
    
    // --------------------------------------------------------------------
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
}


- (void)tap
{
    [self.code1View endEditing:YES];
    [self.code2View endEditing:YES];
    [self.code3View endEditing:YES];
}


@end
