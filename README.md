# XMNShareMenuExample
> 分享列表页面


-----

##预览

![](http://7xlt1j.com1.z0.glb.clouddn.com/XMNShareMenu.gif)

##功能

* 支持最多两行的分享列表显示
* 支持左右滑动,可以设置第一行显示多少个分享item
* 支持自定义tag设置,回调时返回自定的tag

##使用方法


1. ``` 
//分享媒介数据源,注意使用自定义tag时不要重复
    NSArray *shareAry = @[@{kXMNShareImage:@"more_chat",
                     kXMNShareHighlightImage:@"more_chat_highlighted",
                            kXMNShareTitle:@"私信和群",KXMNShareTag:@(1)},
                          @{kXMNShareImage:@"more_weixin",
                            kXMNShareHighlightImage:@"more_weixin_highlighted",
                            kXMNShareTitle:@"微信好友",,KXMNShareTag:@(2)},
	```
	
2. 如果需要头部view 配置头部 headView
3. 如果需要底部view 配置底部 footerView
4. 初始化XMNShareView  

```
XMNShareView *shareView = [[XMNShareView alloc] init];
    //设置头部View 如果不设置则不显示头部
    shareView.headerView = headerView;
    [shareView setSelectedBlock:^(NSUInteger tag, NSString *title) {
        NSLog(@"\ntag :%lu  \ntitle :%@",(unsigned long)tag,title);
        
    }];
    
    //计算高度 根据第一行显示的数量和总数,可以确定显示一行还是两行,最多显示2行
    [shareView setupShareViewWithItems:shareAry];
    
    [shareView showUseAnimated:YES];

```