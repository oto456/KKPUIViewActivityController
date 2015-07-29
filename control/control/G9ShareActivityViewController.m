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



#import "G9ShareActivityViewController.h"
#import "G9shareBaseActivity.h"

#define headLabelFont [UIFont systemFontOfSize:9.0]


#define ActivityHeight (([UIScreen mainScreen].bounds.size.width - 60) / 5 + 25)
#define ActivityWeight (ActivityHeight - 20)
#define CellHeiht (ActivityHeight + 20)
static const CGFloat ActivitySpace = 10;
static const CGFloat HeadHeight = 15;
static const CGFloat CancelButtonHeight = 40;
//static const CGFloat CellHeiht = 100;



@interface G9ShareActivityViewController()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *shareActivities;
@property (nonatomic, strong) NSArray *actionActivities;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *btn_cancel;
@property (nonatomic, strong) NSMutableArray *scrollviewsArray;
@property (nonatomic, strong) UIView *interateView;

@end


@implementation G9ShareActivityViewController



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithASharedActivity:(NSArray *)shareActivity actionActivities:(NSArray *)actionActivities
{
    NSAssert(actionActivities, @"操作表不许为空");
    if (self = [self initWithFrame:[UIScreen mainScreen].bounds]){
        _shareActivities = shareActivity;
        _actionActivities = actionActivities;
        [self configAllUI];
    }
    return self;
}


- (void)show
{
    [self makeKeyAndVisible];
    [self showAnimaiton];
}

#pragma mark - private method

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // Initialization code
        self.windowLevel = UIWindowLevelAlert;
        // 这里，不能设置UIWindow的alpha属性，会影响里面的子view的透明度，这里我们用一张透明的图片
        // 设置背影半透明
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)configAllUI
{
    [self configInteratieView];
    [self configScrollview];
    
    int cellnum;
    if (_shareActivities) {
        cellnum = 2;
    }else{
        cellnum = 1;
    }
    self.tableView = [[UITableView alloc] initWithFrame:(CGRect){0, HeadHeight, self.bounds.size.width, cellnum * CellHeiht}];
    self.tableView.scrollEnabled = NO;
    self.tableView.userInteractionEnabled = YES;
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.containerView = [[UIView alloc] initWithFrame:(CGRect){0, self.bounds.size.height - CancelButtonHeight - _tableView.bounds.size.height - HeadHeight, self.bounds.size.width, self.tableView.bounds.size.height + CancelButtonHeight + HeadHeight }];
    self.containerView.backgroundColor = [UIColor colorWithRed:255.0 green:255.0 blue:255.0 alpha:0.9];
    [self.containerView addSubview:self.tableView];

    
    UIView *headView = [[UIView alloc] initWithFrame:(CGRect){0, 0, self.bounds.size.width, HeadHeight}];
    UILabel *title= [[UILabel alloc] initWithFrame:(CGRect){0, 0, self.bounds.size.width, HeadHeight}];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"以上内容由九游提供";
    title.font = headLabelFont;
    [headView addSubview:title];
    
    self.btn_cancel = [[UIButton alloc] initWithFrame:(CGRect){-1, self.containerView.bounds.size.height - CancelButtonHeight - 3, self.containerView.bounds.size.width + 3, CancelButtonHeight + 2}];
    [self.btn_cancel setTitle:@"取消" forState:UIControlStateNormal];
    self.btn_cancel.titleLabel.font = [UIFont systemFontOfSize:13.0];
    self.btn_cancel.opaque = NO;
    self.btn_cancel.backgroundColor = [UIColor whiteColor];
    [self.btn_cancel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btn_cancel addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.containerView addSubview:headView];
    [self.containerView addSubview:self.btn_cancel];
    
    [self addSubview:self.containerView];
}

- (void)configInteratieView
{
    self.interateView = [[UIView alloc] initWithFrame:self.bounds];
    [self.interateView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelButtonClick:)]];
    self.interateView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.2];
    [self addSubview:self.interateView];
}


- (void)configScrollview
{
    _scrollviewsArray = [[NSMutableArray alloc] initWithCapacity:2];
    
    if (_shareActivities) {
        UIScrollView *shareScrollView = [[UIScrollView alloc] initWithFrame:(CGRect){0, 0, self.bounds.size.width, CellHeiht}];
        CGFloat width = MAX(self.bounds.size.width + 1, _shareActivities.count * (ActivitySpace + ActivityWeight));
        shareScrollView.contentSize = (CGSize){width, CellHeiht};
        shareScrollView.showsHorizontalScrollIndicator = NO;
        shareScrollView.userInteractionEnabled = YES;
        for (int i = 0; i < _shareActivities.count; i++) {
            G9shareBaseActivity *activity = _shareActivities[i];
            activity.frame = (CGRect){ActivitySpace + i * (ActivitySpace + ActivityWeight), 10, activity.bounds.size.width, activity.bounds.size.height};
            activity.block = ^(){
                [self dismissWithAnimation];
            };
            [shareScrollView addSubview:activity];
        }
        [_scrollviewsArray addObject:shareScrollView];
    }
    
    UIScrollView *actionScrollView = [[UIScrollView alloc] initWithFrame:(CGRect){0, 0, self.bounds.size.width, CellHeiht}];
    CGFloat width = MAX(self.bounds.size.width + 1, _actionActivities.count * (ActivitySpace + ActivityWeight));
    actionScrollView.contentSize = (CGSize){width, CellHeiht};
    actionScrollView.showsHorizontalScrollIndicator = NO;
    actionScrollView.userInteractionEnabled = YES;
    for (int i = 0; i < _actionActivities.count; i++) {
        G9shareBaseActivity *activity = _actionActivities[i];
        activity.frame = (CGRect){ActivitySpace + i * (ActivitySpace + ActivityWeight), 10, activity.bounds.size.width, activity.bounds.size.height};
        activity.block = ^(){
            [self dismissWithAnimation];
        };
        [actionScrollView addSubview:activity];
    }
    [_scrollviewsArray addObject:actionScrollView];
    
}

- (void)showAnimaiton
{
    self.hidden = NO;
    CGFloat y = self.containerView.frame.origin.y;
    self.containerView.frame = (CGRect){0, self.bounds.size.height, self.containerView.bounds.size};
    [UIView animateWithDuration:0.5 delay:0
         usingSpringWithDamping:1.0
          initialSpringVelocity:1.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
        self.containerView.frame = (CGRect){0, y, self.containerView.bounds.size};
    } completion:^(BOOL finished) {
        self.userInteractionEnabled = YES;
    }];
}

- (void)dismissWithAnimation
{
    [UIView animateWithDuration:0.3
                          delay:0
         usingSpringWithDamping:0.9
          initialSpringVelocity:0.9
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
        self.containerView.frame = (CGRect){0, self.bounds.size.height, self.containerView.bounds.size};
        self.interateView.alpha = 0;
    } completion:^(BOOL finished) {
        self.userInteractionEnabled = YES;
        [self.btn_cancel removeFromSuperview];
        [self.tableView removeFromSuperview];
        [self.containerView removeFromSuperview];
        [self.interateView removeFromSuperview];
        [self resignKeyWindow];
        [self setHidden:YES];
        [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
    }];
}

- (void)cancelButtonClick:(id)sender
{
    [self dismissWithAnimation];
}

#pragma mark - TableViewDelegate 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger cellnum;
    if (_shareActivities) {
        cellnum = 2;
    }else{
        cellnum = 1;
    }
    return cellnum;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CellHeiht;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.backgroundColor = [UIColor clearColor];
    [cell.contentView addSubview:_scrollviewsArray[indexPath.row]];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

@end
