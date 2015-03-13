//
//  SubViewController.m
//  MyBrowser
//
//  Created by hudamin on 15/3/13.
//  Copyright (c) 2015年 com.258i. All rights reserved.
//

#import "ViewController.h"
#import "SubViewController.h"

@interface SubViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (strong, nonatomic) UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *urlText;
@property (weak, nonatomic) IBOutlet UITextView *urlTextView;
@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    
    [self.backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchDown];
    
    self.webView = ((ViewController *)self.navigationController.viewControllers[0]).webView; // The MainViewController
    
    self.urlText.text = [self.webView stringByEvaluatingJavaScriptFromString:@"location.href"];
    self.urlTextView.text = [self.webView stringByEvaluatingJavaScriptFromString:@"location.href"];
}

- (void)viewWillAppear: (BOOL)animated {
    self.urlText.text = [self.webView stringByEvaluatingJavaScriptFromString:@"location.href"];
    self.urlTextView.text = [self.webView stringByEvaluatingJavaScriptFromString:@"location.href"];
    NSLog(@"viewWillAppear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backBtnClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
