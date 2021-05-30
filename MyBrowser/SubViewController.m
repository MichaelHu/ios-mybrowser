//
//  SubViewController.m
//  MyBrowser
//
//  Created by hudamin on 15/3/13.
//  Copyright (c) 2015年 com.258i. All rights reserved.
//

#import "ViewController.h"
#import "SubViewController.h"
#import "WebViewUtils.h"

@interface SubViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (strong, nonatomic) UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *urlText;
@property (weak, nonatomic) IBOutlet UITextView *urlTextView;
@property (weak, nonatomic) IBOutlet UITextField *jsTextField;
@property (weak, nonatomic) IBOutlet UITextView *jsOutputTextView;
@property (strong) WebViewUtils *wvUtils;


@end

@implementation SubViewController

@synthesize jsString;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    
    [self.backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchDown];
    [self.jsTextField addTarget:self action:@selector(jsTextFieldEditingDidEnd:) forControlEvents:UIControlEventEditingDidEnd];
    
    self.webView = ((ViewController *)self.navigationController.viewControllers[0]).webView; // The MainViewController
    self.wvUtils = [[WebViewUtils alloc] initWithWebView:self.webView];
    self.jsTextField.delegate = self;
    self.jsOutputTextView.text = @"";
    
    self.urlText.text = [self.wvUtils executeJS:@"location.href"];
    self.urlTextView.text = [self.wvUtils executeJS:@"location.href"];
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

- (IBAction)jsTextFieldEditingDidEnd:(id)sender {
    [self executeJS];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


/*
- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"111222");
}
 */

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [self executeJS];
    return YES;
}





- (void) executeJS {
    self.jsString = self.jsTextField.text;
    /*
    self.jsOutputTextView.text =
        [NSString stringWithFormat:@"%@\n%@"
                , [self.wvUtils executeJS:self.jsString]
                , self.jsOutputTextView.text
         
        ];
     */
    self.jsOutputTextView.text = [self.wvUtils executeJS:self.jsString];
}






@end
