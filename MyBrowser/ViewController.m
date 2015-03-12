//
//  ViewController.m
//  testWebView2
//
//  Created by hudamin on 15/3/10.
//  Copyright (c) 2015年 com.258i. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadURL];
    self.webView.delegate = self;
    
    [self.backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchDown];
    [self.nextBtn addTarget:self action:@selector(nextBtnClick:) forControlEvents:UIControlEventTouchDown];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeText:(id)sender {
    NSLog(@"change Text");
    [self loadURL];
}

- (IBAction)editingDidEnd:(id)sender {
    NSLog(@"Editing Did End");
    // [sender resignFirstResponder];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"Return");
    [self loadURL];
    return YES;
}




- (void) loadURL {
    self.text = self.textField.text;
    NSURL *url = [NSURL URLWithString:self.text];
    // Hide keyboard
    [self.textField resignFirstResponder];
    
    // Load
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void) updateURL:(NSTimer *)timer {
    self.textField.text = [self.webView stringByEvaluatingJavaScriptFromString:@"location.href"];
    NSLog(@"Update URL");
}



// Navigation buttons
- (IBAction)backBtnClick:(id)sender {
    NSLog(@"Back Button Click");
    [self.webView goBack];

    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateURL:) userInfo: nil repeats:NO];
}

- (IBAction)nextBtnClick:(id)sender {
    NSLog(@"Next Button Click");
    [self.webView goForward];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateURL:) userInfo: nil repeats:NO];
}





// UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSURL *url = request.mainDocumentURL;
    // NSLog(@"%@", url.absoluteString);
    NSLog(@"Start Load With Request");
    self.textField.text = url.absoluteString;
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"Finish Load");
}




@end
