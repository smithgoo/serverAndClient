//
//  ViewTableViewCell.h
//  OKNetVideoPlayer
//
//  Created by 王朋 on 2019/12/30.
//  Copyright © 2019 smithgoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetfrontPageReq.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewTableViewCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView*)tableView;

- (void)bdingModel:(VideoPlayModel*)model;
@end

NS_ASSUME_NONNULL_END
