//
//  ViewTableViewCell.m
//  OKNetVideoPlayer
//
//  Created by 王朋 on 2019/12/30.
//  Copyright © 2019 smithgoo. All rights reserved.
//

#import "ViewTableViewCell.h"
#import "NetfrontPageReq.h"
#import <Masonry.h>
@interface ViewTableViewCell ()
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UILabel *utlLab;
@end

@implementation ViewTableViewCell
+ (instancetype)cellWithTableView:(UITableView*)tableView {
    // NSLog(@"cellForRowAtIndexPath");
    static NSString *identifier = @"status";
    // 1.缓存中取
    ViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[ViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setUPUI];
    }
    return self;
}

- (void)setUPUI {
    _titleLab =[ UILabel new];
    [self addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.equalTo(@120);
    }];
    
    _utlLab =[ UILabel new];
    [self addSubview:_utlLab];
    [_utlLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(self);
        make.left.equalTo(self.mas_left).offset(120);
    }];
    _titleLab.textColor = _utlLab.textColor =[UIColor blackColor];
    _titleLab.font = _utlLab.font =[UIFont systemFontOfSize:14];
    _titleLab.textAlignment =_utlLab.textAlignment =NSTextAlignmentLeft;
    _titleLab.numberOfLines = _utlLab.numberOfLines =0;
}

- (void)bdingModel:(VideoPlayModel*)model {
    _titleLab.text = model.videoName;
    _utlLab.text = model.videoPlayUrl;
}

@end
