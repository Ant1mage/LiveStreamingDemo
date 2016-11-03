//
//  AZPrepareViewController.m
//  LiveVideoDemo
//
//  Created by Alexander Zou on 2016/11/3.
//  Copyright © 2016年 Alexander Zou. All rights reserved.
//

#import "AZPrepareViewController.h"
#import "AZStartLiveVideo.h"

@interface AZPrepareViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backView;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
@property (weak, nonatomic) IBOutlet UIView *middleView;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation AZPrepareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    
    
    [self setupTextField];
    
    [self setupBackImage];
    
}

- (void)setupTextField {
    
    [_textField becomeFirstResponder];
    
    _textField.tintColor = [UIColor whiteColor];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
}

- (void)setupBackImage {
    
    UIImage * image = [UIImage imageNamed:@"bg_zbfx"];
    
    self.backView.image = image;
}

- (IBAction)closeVC:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)startLiveViedeo:(id)sender {
    
    [self.view endEditing:YES];
    
    AZStartLiveVideo *liveVieo = [[AZStartLiveVideo alloc]initWithFrame:self.view.bounds];
    
    [self.view addSubview:liveVieo];
    
    _closeBtn.hidden = YES;
    _middleView.hidden = YES;
}



@end
