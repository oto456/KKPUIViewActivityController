//
//  G9shareActivity.h
//  control
//
//  Created by kakapo on 15/7/20.
//  Copyright (c) 2015年 kakapo. All rights reserved.
//

#import <UIKit/UIKit.h>

//用来给G9ShareActivityViewController用的。
typedef void(^clickBlock)();

@interface G9shareBaseActivity : UIView

@property (nonatomic, copy) clickBlock block;

- (NSString *)activityTitle;
- (UIImage *)activityImage;
- (BOOL) canPerformWithActivityItems:(NSArray *)activityItems;
- (UIViewController *) activityViewController;
- (void) performActivity;
@end
