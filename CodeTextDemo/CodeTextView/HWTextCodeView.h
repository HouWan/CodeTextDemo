//
//  CodeTextDemo
//
//  Created by 小侯爷 on 2018/9/20.
//  Copyright © 2018年 小侯爷. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * 完善版 - 加入动画 - 下划线
 */
@interface HWTextCodeView : UIView

/// 当前输入的内容
@property (nonatomic, copy, readonly) NSString *code;

- (instancetype)initWithCount:(NSInteger)count margin:(CGFloat)margin;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

@end



// ------------------------------------------------------------------------
// -----------------------------HWTC_lineView------------------------------
// ------------------------------------------------------------------------


@interface HWTC_lineView : UIView

@property (nonatomic, weak) UIView *colorView;

- (void)animation;

@end

NS_ASSUME_NONNULL_END
