# CodeTextDemo

## iOS验证码输入

> * Xcode 10.0 (10A255) 新建项目并编辑
> * 代码日期：2018年12月14日15:00
> * 代码语言：Objective-C
> * 加入光标小Demo(2018年12月14日)

![效果图](https://github.com/HouWan/CodeTextDemo/blob/master/Screen.png)

简书地址：[点我](https://www.jianshu.com/p/23f7be3677be)
简书地址：[点我](https://www.jianshu.com/p/23f7be3677be)


----

## 博客内容

![img_2299-qibot.cn.png](https://upload-images.jianshu.io/upload_images/855108-f5c9f906ea6467dd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

如图所示，现在很多App采用了类似下划线、方块等方式的验证码输入，直观美观！对于这种效果的实现方式，大概有以下几种方式：
##### 1.多个`UITextField`组成
这种方式好处是有光标闪烁、但是在处理删除和动画效果时，就会显得有点笨拙，OFO应该是这样实现的，要严格处理好每个`UITextField`的`FirstResponder`。
##### 2.一个`UITextField`组成，使用富文本
这个方式是可行的， 使用富文本设置每个字符的间距，允许编辑富文本，有光标闪烁，缺点应该也是不好处理动画效果。
##### 3.使用`UIView`绘制
这个是我在`GitHub`上看到的一个半成品Demo，利用一个`UIView`，使用`Quartz 2D`和`UIBezierPath`进行绘制文本和下划线，并处理输入事件和键盘事件，其实整体下来代码也不多，300行以内，但是需要较好的iOS绘制功底。
##### 4.一个`UITextField`和多个`UILabel`
这个是我接下来介绍的思路，这个思路的缺点应该是没有光标闪烁，其实也能伪实现，看是否必须要有这个需要了。这个思路比较简单，方便加入动画，纯粹下来就100多行，接下来看结构和代码：
![wx20180926_114423_2x-qibot.cn.png](https://upload-images.jianshu.io/upload_images/855108-1a2a12e3e3c0df88.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

新建一个`UIView`，初始化方法
```
- (instancetype)initWithCount:(NSInteger)count margin:(CGFloat)margin
{
    if (self = [super init]) {
        self.itemCount = count; // itemCount是验证码的个数，比如6个
        self.itemMargin = margin; // itemMargin是每个Label之间的间距
        [self configTextField];
    }
    return self;
}
```
添加内部子控件（演示）
```
- (void)configTextField
{
    UITextField *textField = [[UITextField alloc] init];
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.keyboardType = UIKeyboardTypeNumberPad;
    [textField addTarget:self action:@selector(tfEditingChanged:) forControlEvents:(UIControlEventEditingChanged)];
    
    // 小技巧：这个属性为YES，可以强制使用系统的数字键盘，缺点是重新输入时，会清空之前的内容
    // clearsOnBeginEditing 属性并不适用于 secureTextEntry = YES 时
    // textField.secureTextEntry = YES;
    
    [self addSubview:textField];
    self.textField = textField;
    
    // 小技巧：通过textField上层覆盖一个maskView，可以去掉textField的长按事件
    UIButton *maskView = [UIButton new];
    maskView.backgroundColor = [UIColor whiteColor];
    [maskView addTarget:self action:@selector(clickMaskView) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:maskView];
    self.maskView = maskView;
    
    for (NSInteger i = 0; i < self.itemCount; i++)
    {
        UILabel *label = [UILabel new];
        [self addSubview:label];
        [self.labels addObject:label];
    }
    
    for (NSInteger i = 0; i < self.itemCount; i++)
    {
        UIView *line = [UIView new];
        [self.lines addObject:line];
    }
}
```
这里可能对`maskView `有点费解，`maskView`主要是为了挡住下面的`UITextField `，使用类`UIButton `是为了挡住事件，因为如果使用类`UIView `，会将事件传递到`self`，进而影响到外面隐藏键盘的代码，你可以试试就知道了。

##### 主要处理业务逻辑的代码

```
#pragma mark - 编辑改变
- (void)tfEditingChanged:(UITextField *)textField
{
    if (textField.text.length > self.itemCount) {
        textField.text = [textField.text substringWithRange:NSMakeRange(0, self.itemCount)];
    }
    
    for (int i = 0; i < self.itemCount; i++)
    {
        UILabel *label = [self.labels objectAtIndex:i];
        
        if (i < textField.text.length) {
            label.text = [textField.text substringWithRange:NSMakeRange(i, 1)];
        } else {
            label.text = nil;
        }
    }
    
    // 输入完毕后，自动隐藏键盘
    if (textField.text.length >= self.itemCount) {
        [textField resignFirstResponder];
    }
}
```
这里没有使用`UITextField `的`delegate`，使用`UIControlEventEditingChanged`足以，但是如果你的需求能输入英文等其他字符，就需要实现`delegate`去限制。

至此，验证码输入的核心代码就***没有了***，是不是感觉这么少！！在此基础上，我用Demo实现了3个基本效果，如图所示：

![Screen.png](https://upload-images.jianshu.io/upload_images/855108-da661909e6280eb2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### Github代码地址：[点我](https://github.com/HouWan/CodeTextDemo)

#####小技巧Tip
当你不想让别人使用某个方法时，除了私有方法办法之外，还可以这么做：
```
- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;
```


## 有问题反馈
如果大家在使用过程中遇到其他问题，可以留言，我们共同解决。

**PS**:最近我有跳槽的想法，有工作机会的老板，欢迎骚扰哦！北京呦！

**END。**
*我是小侯爷。*
*在魔都艰苦奋斗，白天是上班族，晚上是知识服务工作者。*
*如果读完觉得有收获的话，记得关注和点赞哦。*
*非要打赏的话，我也是不会拒绝的。*
