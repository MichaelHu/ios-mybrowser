//
//  WebViewUtils.h
//  MyBrowser
//
//  Created by hudamin on 15/3/23.
//  Copyright (c) 2015年 com.258i. All rights reserved.
//

#ifndef MyBrowser_WebViewUtils_h
#define MyBrowser_WebViewUtils_h

#import <UIKit/UIKit.h>

@interface WebViewUtils : NSObject

@property (retain) UIWebView *webview;

- (id) initWithWebView: (UIWebView *) webView;
- (NSString *) executeJS: (NSString *)js;

@end

#endif
