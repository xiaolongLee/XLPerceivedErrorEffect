//
//  ViewController.m
//  XLPerceivedErrorEffect
//
//  Created by Mac-Qke on 2019/1/16.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import "ViewController.h"
#import "XLPerceivedErrorCell.h"

#define XLRowHeight 200

#define XLCount 10

#define XLGetImage(row) [UIImage imageNamed:[NSString stringWithFormat:@"%zd",row]]
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (nonatomic, weak) UITableView *perceivedErrorTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupTableView];
}

- (void)setupTableView {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.rowHeight = XLRowHeight;
    
    tableView.showsVerticalScrollIndicator = NO;
    tableView.delegate =self;
    tableView.dataSource =self;
    tableView.backgroundColor = [UIColor blackColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.perceivedErrorTableView = tableView;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return XLCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XLPerceivedErrorCell *cell = [XLPerceivedErrorCell perceicedErrorCellFromXib:tableView];
    cell.backgroundImage.image = XLGetImage(indexPath.row + 1);
    return cell;
}

//滚动监听
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 获取表视图的可见单元格。(可见的视图)
    NSArray *visibleCells = [self.perceivedErrorTableView visibleCells];
    for (XLPerceivedErrorCell *cell in visibleCells) {
        //可见视图设置->背景图片y值
        [cell cellOnTableView:self.perceivedErrorTableView didScrollView:self.view];
    }
}

//视图加载完在调用scrollViewDidScroll方法
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self scrollViewDidScroll:[[UIScrollView alloc] init]];
}

@end
