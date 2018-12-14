//
//  CodeTextDemo
//
//  Created by 小侯爷 on 2018/9/20.
//  Copyright © 2018年 小侯爷. All rights reserved.
//

#import <UIKit/UIKit.h>

// 屏幕宽度高度
#define SW ([UIScreen mainScreen].bounds.size.width)
#define SH ([UIScreen mainScreen].bounds.size.height)

// 随机色
#define HWRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

@interface ViewController : UIViewController


@end

