//
//  G9shareActivity.m
//  control
//
//  Created by kakapo on 15/7/20.
//  Copyright (c) 2015年 kakapo. All rights reserved.
//

#import "G9shareBaseActivity.h"

#define lableFont [UIFont systemFontOfSize:9.0]
#define LogoHeight (([UIScreen mainScreen].bounds.size.width - 60) / 5)
#define LableWidth ((([UIScreen mainScreen].bounds.size.width - 60) / 5) + 2)
#define ActivityHeight (LogoHeight + 25)
static const CGFloat LogoTitleSpace = 5;
static const CGFloat LableHeiht = 15;

@interface G9shareBaseActivity ()

@property (nonatomic, strong) UIButton *logo;
@property (nonatomic, strong) UILabel *title;

@end

@implementation G9shareBaseActivity

- (instancetype)init
{
    if (self = [super initWithFrame:(CGRect){0, 0, LableWidth, (LogoHeight + LogoTitleSpace + LableHeiht)}]) {
        [self configUI];
        self.title.text = [self activityTitle];
        if ([self activityImage]) {
            [self.logo setImage:[self activityImage] forState:UIControlStateNormal];
        }else{
        [self.logo setImage:[UIImage imageNamed:@"60pt_"] forState:UIControlStateNormal];
        }
    }
    return self;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)configUI
{
    _logo = [[UIButton alloc] initWithFrame:(CGRect){1, 0, LogoHeight, LogoHeight}];
    [_logo addTarget:self action:@selector(logoClick:) forControlEvents:UIControlEventTouchUpInside];
    _logo.layer.cornerRadius = 5.0;
    _logo.userInteractionEnabled = YES;
    _logo.clipsToBounds = YES;
    
    _title = [[UILabel alloc] initWithFrame:(CGRect){0, LogoHeight + LogoTitleSpace, LableWidth, LableHeiht}];
    _title.font = lableFont;
    _title.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:_logo];
    [self addSubview:_title];
}



                                
- (void)logoClick:(id)sender
{
    NSLog(@"click");
    [self performActivity];
    if (self.block) {
        self.block();
    }
}

- (NSString *)activityTitle
{
    return nil;
}

- (UIImage *)activityImage
{
    return nil;
}

- (BOOL) canPerformWithActivityItems:(NSArray *)activityItems
{
    return YES;
}

- (UIViewController *) activityViewController {
    return nil;
}

- (void) performActivity {
  
}



@end
