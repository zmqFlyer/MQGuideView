* 1.引入MQGuideView文件，根据需要修改引导页数量和图片名称

```
static const NSInteger NumberOfGuide = 3; //引导页数
```
```
 //修改图片名称
imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"default_%d",i+1]];

```

* 2.在首页进行登录判断，是否是第一次打开App，并存入本地。初始化MQGuideView，加到当前视图页面上。随个人喜好，具体在哪里添加，这里只做简单演示。

```
- (void)viewWillAppear:(BOOL)animated{
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"isFirstLaunch"]) {
        _isFirstLaunch = YES;
        [[NSUserDefaults standardUserDefaults] setBool:_isFirstLaunch forKey:@"isFirstLaunch"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        _guideView = [[MQGuideView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _guideView.delegate = self;
        [self.view addSubview:_guideView];
    }
}
```
* 3.添加代理事件，来控制引导页的跳转，这里做了个简单的动画

```
- (void)onPassButtonPressed{
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
       _guideView.alpha = 0;
    } completion:^(BOOL finished) {
        [_guideView removeFromSuperview];
    }];
}
```
