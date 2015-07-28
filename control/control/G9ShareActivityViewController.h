//
//  G9ShareActivityViewController.h
//  control
//
//  Created by kakapo on 15/7/20.
//  Copyright (c) 2015年 kakapo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIActivityViewControllerCompletionHandler)(NSString *activityType, BOOL completed);
typedef void (^UIActivityViewControllerCompletionWithItemsHandler)(NSString *activityType, BOOL completed, NSArray *returnedItems, NSError *activityError);

@interface G9ShareActivityViewController : UIWindow

- (instancetype)initWithASharedActivity:(NSArray *)shareActivity actionActivities:(NSArray *)actionActivities;

- (void)show;


@end
