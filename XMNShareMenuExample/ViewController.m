//
//  ViewController.m
//  XMNShareMenuExample
//
//  Created by XMFraker on 16/1/25.
//  Copyright © 2016年 XMFraker. All rights reserved.
//

#import "ViewController.h"

#import "XMNShareMenu.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"简单自定义分享界面";
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(100, 100, 150, 50);
    [button1 setTitle:@"新浪分享" forState:UIControlStateNormal];
    button1.tag = 1;
    [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Methods

/**
 *  仿新浪微博分享界面
 */
- (void)buttonAction:(UIButton *)button {
    //分享媒介数据源
    NSArray *shareAry = @[@{kXMNShareImage:@"more_chat",
                            kXMNShareHighlightImage:@"more_chat_highlighted",
                            kXMNShareTitle:@"私信和群"},
                          @{kXMNShareImage:@"more_weixin",
                            kXMNShareHighlightImage:@"more_weixin_highlighted",
                            kXMNShareTitle:@"微信好友"},
                          @{kXMNShareImage:@"more_circlefriends",
                         kXMNShareHighlightImage:@"more_circlefriends_highlighted",
                            kXMNShareTitle:@"朋友圈"},
                          @{kXMNShareImage:@"more_icon_zhifubao",
                            kXMNShareHighlightImage:@"more_icon_zhifubao_highlighted",
                            kXMNShareTitle:@"支付宝好友"},
                          @{kXMNShareImage:@"more_icon_zhifubao_friend",
                            kXMNShareHighlightImage:@"more_icon_zhifubao_friend_highlighted",
                            kXMNShareTitle:@"生活圈"},
                          @{kXMNShareImage:@"more_icon_qq",
                            kXMNShareHighlightImage:@"more_icon_qq_highlighted",
                            kXMNShareTitle:@"QQ"},
                          @{kXMNShareImage:@"more_icon_qzone",
                            kXMNShareHighlightImage:@"more_icon_qzone_highlighted",
                            kXMNShareTitle:@"QQ空间"},
                          @{kXMNShareImage:@"more_mms",
                            kXMNShareHighlightImage:@"more_mms_highlighted",
                            kXMNShareTitle:@"短信"},
                          @{kXMNShareImage:@"more_email",
                            kXMNShareHighlightImage:@"more_email_highlighted",
                            kXMNShareTitle:@"邮件分享"},
                          @{kXMNShareImage:@"more_icon_cardbackground",
                            kXMNShareHighlightImage:@"more_icon_cardbackground_highlighted",
                            kXMNShareTitle:@"设卡片背景"},
                          @{kXMNShareImage:@"more_icon_collection",
                            kXMNShareTitle:@"收藏"},
                          @{kXMNShareImage:@"more_icon_topline",
                            kXMNShareTitle:@"帮上头条"},
                          @{kXMNShareImage:@"more_icon_link",
                            kXMNShareTitle:@"复制链接"},
                          @{kXMNShareImage:@"more_icon_report",
                            kXMNShareTitle:@"举报"},
                          @{kXMNShareImage:@"more_icon_back",
                            kXMNShareTitle:@"返回首页"}];
    
    //自定义头部
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 36)];
    headerView.backgroundColor = [UIColor clearColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16, 21, headerView.frame.size.width-32, 15)];
    label.textColor = [UIColor colorWithRed:94/255.0 green:94/255.0 blue:94/255.0 alpha:1.0];;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:15];
    label.text = @"分享到";
    [headerView addSubview:label];
    
    XMNShareView *shareView = [[XMNShareView alloc] init];
    //设置头部View 如果不设置则不显示头部
    shareView.headerView = headerView;
    [shareView setSelectedBlock:^(NSUInteger tag, NSString *title) {
        NSLog(@"\ntag :%lu  \ntitle :%@",(unsigned long)tag,title);
        
    }];
    
    //计算高度 根据第一行显示的数量和总数,可以确定显示一行还是两行,最多显示2行
    [shareView setupShareViewWithItems:shareAry];
    
    [shareView showUseAnimated:YES];
}



@end
