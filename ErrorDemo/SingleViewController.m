//
//  SingleViewController.m
//  ErrorDemo
//
//  Created by Golden Compass on 11/30/14.
//  Copyright (c) 2014 Golden Compass. All rights reserved.
//

#import "SingleViewController.h"
#import <JVFloatLabeledTextField/JVFloatLabeledTextField.h>
#import <JVFloatLabeledTextField/JVFloatLabeledTextView.h>
#import <Masonry/Masonry.h>

@implementation SingleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setTintColor:[UIColor blueColor]];    // Float label when editing
    
    JVFloatLabeledTextField *textField = [self addLabeledTextFieldWithPlaceHolder:@"Text Field"];
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(40);
        make.left.equalTo(self.view.mas_left).with.offset(40);
        make.right.equalTo(self.view.mas_right).with.offset(40);
        make.height.mas_equalTo(40);
    }];
    
    JVFloatLabeledTextView *textView = [self addLabeledTextViewWithPlaceHolder:@"Text View"];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textField.mas_bottom).with.offset(40);
        make.left.equalTo(self.view.mas_left).with.offset(40);
        make.right.equalTo(self.view.mas_right).with.offset(40);
        make.height.mas_equalTo(200);
    }];
    
    
}


#pragma mark - Factory Methods
// Text size configuration
const static CGFloat kJVFieldFontSize = 20.0f;
const static CGFloat kJVFieldFloatingLabelFontSize = 12.0f;
- (JVFloatLabeledTextField *)addLabeledTextFieldWithPlaceHolder:(NSString *)string
{
    JVFloatLabeledTextField *textfield = [[JVFloatLabeledTextField alloc] init];
    textfield.attributedPlaceholder = [[NSAttributedString alloc]
                                       initWithString:NSLocalizedString(string, @"")
                                       attributes:@{
                                                    NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                                    }];
    //        self.entry_Email.textColor = [UIColor whiteColor];
    textfield.font = [UIFont systemFontOfSize:kJVFieldFontSize];
    textfield.floatingLabel.font = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    textfield.floatingLabelTextColor = [UIColor lightGrayColor];        // Label color when not editing
    textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    textfield.returnKeyType = UIReturnKeyNext;
    [self.view addSubview:textfield];
    return textfield;
}

- (JVFloatLabeledTextView *)addLabeledTextViewWithPlaceHolder:(NSString *)string
{
    //    JVFloatLabeledTextView *textView = [[JVFloatLabeledTextView alloc] init];
    JVFloatLabeledTextView *textView = [[JVFloatLabeledTextView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    textView.placeholder = NSLocalizedString(string, @"");
    textView.placeholderTextColor = [UIColor lightGrayColor];
    textView.font = [UIFont systemFontOfSize:kJVFieldFontSize];
    textView.floatingLabel.font = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    textView.floatingLabelTextColor = [UIColor lightGrayColor];        // Label color when not editing
    textView.clearsOnInsertion = NO;
    textView.returnKeyType = UIReturnKeyDefault;
    textView.placeholderYPadding = 0;
    textView.contentOffset = CGPointZero;
    [self.view addSubview:textView];
    return textView;
}


@end
