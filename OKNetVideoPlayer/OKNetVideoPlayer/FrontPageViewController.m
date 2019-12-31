//
//  FrontPageViewController.m
//  OKNetVideoPlayer
//
//  Created by 王朋 on 2019/12/31.
//  Copyright © 2019 smithgoo. All rights reserved.
//

#import "FrontPageViewController.h"
#import "NetfrontPageReq.h"
#import "ViewTableViewCell.h"
#import "OKVideoPlayerViewController.h"
#import <MJExtension.h>
@interface FrontPageViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *topTef;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArr;;
@end

@implementation FrontPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor =[UIColor whiteColor];
    _dataArr =[NSMutableArray arrayWithArray:@[@{@"videoPlayUrl":@ "https://youku.cdn4-okzy.com/20191126/2980_2373c5f5/index.m3u8", @"videoName":@ "庆余年第一季完结第1集"}, @{@"videoPlayUrl": @"https://iqiyi.cdn9-okzy.com/20191209/3271_380cbd53/index.m3u8", @"videoName":@ "庆余年第一季完结第2集"}]];
    _dataArr = [VideoPlayModel mj_objectArrayWithKeyValuesArray:_dataArr];
    _tableView.delegate =self;
    _tableView.dataSource =self;
}

- (IBAction)searchAction:(UIButton *)sender {
    [self.view endEditing:YES];
    
    [_tableView reloadData];
    
//     [NetfrontPageReq apiRequestSearch:@{@"kw":@"庆余年"} succ:^(id  _Nonnull result) {
//         [_dataArr addObjectsFromArray:result];
//         [_tableView reloadData];
//       } faliar:^(NSError * _Nonnull err) {
//
//       }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ViewTableViewCell *cell =[ViewTableViewCell cellWithTableView:tableView];
    [cell bdingModel:_dataArr[indexPath.row]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    OKVideoPlayerViewController *ok =[OKVideoPlayerViewController new];
    VideoPlayModel*model = _dataArr[indexPath.row];
    ok.titleStr = model.videoName;
    ok.url = model.videoPlayUrl;
    [self.navigationController pushViewController:ok animated:YES];

}



 

@end
