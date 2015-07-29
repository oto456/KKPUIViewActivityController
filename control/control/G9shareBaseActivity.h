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

#import <UIKit/UIKit.h>

//用来给G9ShareActivityViewController用的。
typedef void(^clickBlock)();

@interface G9shareBaseActivity : UIView

@property (nonatomic, copy) clickBlock block;

- (NSString *)activityTitle;
- (UIImage *)activityImage;
- (UIViewController *)activityViewController;
- (void)performActivity;

/**
 *  按钮是否可点击。默认YES
 *
 *  @return YES
 */
- (BOOL)buttonEnable;
@end


