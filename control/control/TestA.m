//
//  TestA.m
//  control
//
//  Created by kakapo on 15/7/21.
//  Copyright (c) 2015年 kakapo. All rights reserved.
//

#import "TestA.h"

@implementation TestA

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (NSString *)activityType
{
    return @"hehe";
}

- (NSString *)activityTitle
{
    return @"微信好友";
}

- (UIImage *)activityImage
{
    return [UIImage imageNamed:@"60pt_"];
}

- (BOOL) canPerformWithActivityItems:(NSArray *)activityItems
{
    if (activityItems.count) {
        return YES;
    }
    return NO;
}

- (UIViewController *) activityViewController {
    return nil;
}

- (void) performActivity {
    NSLog(@"weChatFriend click %@", self.description);

}


@end
