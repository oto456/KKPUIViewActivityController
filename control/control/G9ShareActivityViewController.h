/*
 *****************************************************************************
 * Copyright (C) 2005-2014 UC Mobile Limited. All Rights Reserved
 * File			: G9ShareActivityViewController
 *
 * Description	: G9Share
 *
 * Author		: liutf@ucweb.com
 *
 * History		: Creation, 7/20/15, liutf@ucweb.com, Create the file
 ******************************************************************************
 **/

#import <UIKit/UIKit.h>

typedef void (^UIActivityViewControllerCompletionHandler)(NSString *activityType, BOOL completed);
typedef void (^UIActivityViewControllerCompletionWithItemsHandler)(NSString *activityType, BOOL completed, NSArray *returnedItems, NSError *activityError);

@interface G9ShareActivityViewController : UIWindow

/**
 *  注意：actionactivities不可为空。
 *
 *  @param shareActivity    分享组件若要有。在第一行
 *  @param actionActivities 行为。必须有。在下面那行
 *
 *  @return
 */
- (instancetype)initWithASharedActivity:(NSArray *)shareActivity actionActivities:(NSArray *)actionActivities;

- (void)show;


@end
