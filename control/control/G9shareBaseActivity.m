/*
 *****************************************************************************
 * Copyright (C) 2005-2014 UC Mobile Limited. All Rights Reserved
 * File			: G9shareBaseActivity
 *
 * Description	: G9Share
 *
 * Author		: liutf@ucweb.com
 *
 * History		: Creation, 7/20/15, liutf@ucweb.com, Create the file
 ******************************************************************************
 **/

#import "G9shareBaseActivity.h"

#define lableFont [UIFont systemFontOfSize:9.0]
#define LogoHeight (([UIScreen mainScreen].bounds.size.width - 80) / 5)
#define LableWidth ((([UIScreen mainScreen].bounds.size.width - 80) / 5) + 2)
#define ActivityHeight (LogoHeight + 35)
static const CGFloat LogoTitleSpace = 3;
static const CGFloat LableHeiht = 30;

@interface G9shareBaseActivity ()

@property (nonatomic, strong) UIButton *logo;
@property (nonatomic, strong) UILabel *title;

@end

@implementation G9shareBaseActivity

- (instancetype)init
{
    if (self = [super initWithFrame:(CGRect){0, 0, LableWidth, (LogoHeight + LogoTitleSpace + LableHeiht)}]) {
        [self configUI];
        if ([self activityImage]) {
            [self.logo setBackgroundImage:[self activityImage] forState:UIControlStateNormal];
        }else{
        [self.logo setBackgroundImage:[UIImage imageNamed:@"about_ico"] forState:UIControlStateNormal];
        }
        self.logo.enabled = [self buttonEnable];
        [self.title setText:[self activityTitle]];
        self.title.textAlignment = NSTextAlignmentCenter;
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
    
    _title = [[UILabel alloc] initWithFrame:(CGRect){0, LogoHeight + LogoTitleSpace, LableWidth, LableHeiht}];
    _title.font = lableFont;
    _title.textAlignment = NSTextAlignmentCenter;
    _title.numberOfLines = 2;
    
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

- (UIViewController *) activityViewController {
    return nil;
}

- (void) performActivity {
  
}

- (BOOL)buttonEnable
{
    return YES;
}

@end





