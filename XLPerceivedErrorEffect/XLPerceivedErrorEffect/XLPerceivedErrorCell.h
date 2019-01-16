//
//  XLPerceivedErrorCell.h
//  XLPerceivedErrorEffect
//
//  Created by Mac-Qke on 2019/1/16.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XLPerceivedErrorCell : UITableViewCell
/**
 *  背景图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

/**
 *  Xib创建Cell
 */
+ (instancetype)perceicedErrorCellFromXib:(UITableView *)tableView;
/**
 *  背景图片y值设置
 */
- (void)cellOnTableView:(UITableView *)tableView didScrollView:(UIView *)view;
@end

NS_ASSUME_NONNULL_END
