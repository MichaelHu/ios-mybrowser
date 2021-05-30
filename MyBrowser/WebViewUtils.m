//
//  WebViewUtils.m
//  MyBrowser
//
//  Created by hudamin on 15/3/23.
//  Copyright (c) 2015年 com.258i. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebViewUtils.h"

@implementation WebViewUtils

@synthesize webview;

- (id) initWithWebView: (UIWebView *) webView {
    self = [super init];
    if (self) {
        self.webview = webView;
    }
    return self;
}

- (NSString *) executeJS:(NSString *)js {
    return [self.webview stringByEvaluatingJavaScriptFromString:js];
}

@end
