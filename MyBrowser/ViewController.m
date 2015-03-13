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
    
    [self initRecognizers];
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




// Util methods


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

- (void) goBack {
    [self.webView goBack];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateURL:) userInfo: nil repeats:NO];
}

- (void) goForward {
    [self.webView goForward];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateURL:) userInfo: nil repeats:NO];
}

- (void) initRecognizers {
    UISwipeGestureRecognizer *swipeRightRecognizer
    = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(webViewSwipeRight:)];
    
    // Take no effects
    // self.view.gestureRecognizers = [self.view.gestureRecognizers arrayByAddingObject:swipeRightRecognizer];
    // The right way to add a new recognizer
    [self.webView addGestureRecognizer:swipeRightRecognizer];
    
    [swipeRightRecognizer setNumberOfTouchesRequired:1];
    [swipeRightRecognizer setDirection:UISwipeGestureRecognizerDirectionRight];
    
    UISwipeGestureRecognizer *swipeLeftRecognizer
    = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(webViewSwipeLeft:)];
    
    [self.webView addGestureRecognizer:swipeLeftRecognizer];
    
    [swipeLeftRecognizer setNumberOfTouchesRequired:1];
    [swipeLeftRecognizer setDirection:UISwipeGestureRecognizerDirectionLeft];
}








// Navigation buttons' Actions
- (IBAction)backBtnClick:(id)sender {
    [self goBack];
}

- (IBAction)nextBtnClick:(id)sender {
    [self goForward];
}





// WebView Swipe Handler

- (void) webViewSwipeRight:(UIGestureRecognizer *)gestureRecognizer {
    NSLog(@"right");
    [self goBack];
}

- (void) webViewSwipeLeft:(UIGestureRecognizer *)gestureRecognizer {
    NSLog(@"left");
    [self goForward];
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
