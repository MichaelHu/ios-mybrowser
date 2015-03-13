//
//  ViewController.h
//  testWebView2
//
//  Created by hudamin on 15/3/10.
//  Copyright (c) 2015年 com.258i. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate, UIWebViewDelegate>

@property NSString* text;
@property UIViewController *subViewController;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

