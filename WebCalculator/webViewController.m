//
//  webViewController.m
//  WebCalculator
//
//  Created by Gabriel Borri de Azevedo on 1/9/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

#import "WebViewController.h"
#import "RootViewController.h"

@interface WebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    self.navigationItem.title = [NSString stringWithFormat:@"%ld",(long)self.result];
    NSURL *urlString = [NSURL URLWithString:@"http://www.mobilemakers.co"];
    NSURLRequest *requestURL = [NSURLRequest requestWithURL:urlString];
    [self.webView loadRequest:requestURL];
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    self.spinner.hidden = FALSE;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.spinner.hidden = TRUE;
}

@end
