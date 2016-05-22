//
//  ZHYMeWebController.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/23.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYMeWebController.h"
#import "ZHYMeSquare.h"

@interface ZHYMeWebController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *fowardButton;
@end

@implementation ZHYMeWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setupController];
}

- (void)setupController {

    self.navigationItem.title = self.squareModel.name;
    self.webView.backgroundColor = kCommonBgColor;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.squareModel.url]]];
    self.webView.scrollView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.webView.delegate = self;

}

- (IBAction)backButtonClick:(UIBarButtonItem *)button {
    
    [self.webView goBack];
}

- (IBAction)fowardButtonClick:(UIBarButtonItem *)button {
    
    [self.webView goForward];
}

- (IBAction)refresh:(UIBarButtonItem *)button {
    
    [self.webView reload];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {

    self.backButton.enabled = webView.canGoBack;
    self.fowardButton.enabled = webView.canGoForward;

}

@end
