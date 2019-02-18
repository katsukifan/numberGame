//
//  ViewController.m
//  noGame
//
//  Created by 张岳涛 on 19/2/18.
//  Copyright © 2019年 张岳涛. All rights reserved.
//

#import "ViewController.h"
#import <EAIntroView/EAIntroView.h>
#import <MMNumberKeyboard.h>

@interface ViewController ()<EAIntroDelegate,MMNumberKeyboardDelegate>


@end

@implementation ViewController
{
    
    NSUserDefaults *ud;
    int question;
    int number;
    int result;
    
    __weak IBOutlet UITextField *textField1;
    
    __weak IBOutlet UITextField *textField2;
    
    __weak IBOutlet UILabel *resultLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ud = [NSUserDefaults standardUserDefaults];
    
    BOOL flag = [ud boolForKey:@"intro"];
    
    if (flag != YES) {
        [self showIntro];
        [ud setBool:YES forKey:@"intro"];
    }
    
    int question2 = 5.0 + arc4random() % 6; //5から10までの乱数を取得
    question = question2;
    
    
    resultLabel.text = [NSString stringWithFormat:@"%d",question];
    
    
    // Create and configure the keyboard.
    MMNumberKeyboard *keyboard = [[MMNumberKeyboard alloc] initWithFrame:CGRectZero];
    keyboard.allowsDecimalPoint = YES;
    keyboard.delegate = self;
    
    
    textField1.inputView = keyboard;
    textField1.text = @"";
    textField1.placeholder = @"数字1";
    textField1.font = [UIFont systemFontOfSize:24.0f];
    textField1.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    
    int number2 = rand()%3 + 1; //1から3までの乱数を取得
    number = number2;
    
    
    textField2.inputView = keyboard;
    textField2.text = [NSString stringWithFormat:@"%d",number];
    textField2.placeholder = @"数字2";
    textField2.font = [UIFont systemFontOfSize:24.0f];
    textField2.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    
}

- (IBAction)answer:(id)sender {
    
    NSLog(@"%@    %@",textField1.text,textField2.text);
    
    result = number + [textField1.text intValue];
    
    if (result == question) {
        resultLabel.text = @"正解！";
    }else{
        
        resultLabel.text = @"間違い！";
        
    }
    
}



- (IBAction)reset:(id)sender {
    
    int question2 = 5.0 + arc4random() % 6; //5から10までの乱数を取得
    question = question2;
    
    resultLabel.text = [NSString stringWithFormat:@"%d",question];
    
    int number2 = rand()%3 + 1; //1から3までの乱数を取得
    number = number2;
    textField1.text = @"";
    textField2.text = [NSString stringWithFormat:@"%d",number];
}


- (BOOL)numberKeyboardShouldReturn:(MMNumberKeyboard *)numberKeyboard
{
    // Do something with the done key if neeed. Return YES to dismiss the keyboard.
    return YES;
}


- (void)showIntro {
    
    // custom
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"这里是第一页";
    page1.titleFont = [UIFont fontWithName:@"Georgia-BoldItalic" size:20];
    page1.desc = @"这里大概是简介";
    page1.descFont = [UIFont fontWithName:@"Georgia-Italic" size:18];
    page1.bgImage = [UIImage imageNamed:@"intro1.jpg"];
    
    // custom
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"这里是第二页";
    page2.titleFont = [UIFont fontWithName:@"Georgia-BoldItalic" size:20];
    page2.desc = @"这里大概是第二页的简介";
    page2.descFont = [UIFont fontWithName:@"Georgia-Italic" size:18];
    page2.bgImage = [UIImage imageNamed:@"intro2.jpg"];
    
    
    // custom
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"这里是第三页";
    page3.titleFont = [UIFont fontWithName:@"Georgia-BoldItalic" size:20];
    page3.desc = @"这里大概是简介的第三页";
    page3.descFont = [UIFont fontWithName:@"Georgia-Italic" size:18];
    page3.bgImage = [UIImage imageNamed:@"intro3.jpg"];
    
    
    // custom
    EAIntroPage *page4 = [EAIntroPage page];
    page4.title = @"这里是第四页";
    page4.titleFont = [UIFont fontWithName:@"Georgia-BoldItalic" size:20];
    page4.desc = @"点击开始你的探险";
    page4.descFont = [UIFont fontWithName:@"Georgia-Italic" size:18];
    page4.bgImage = [UIImage imageNamed:@"intro4.jpg"];
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:@[page1,page2,page3,page4]];
    
    [intro setDelegate:self];
    
    [intro showInView:self.view animateDuration:0.0];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


