//
//  ViewController.m
//  OKNetVideoPlayer
//
//  Created by 王朋 on 2019/12/29.
//  Copyright © 2019 smithgoo. All rights reserved.
//

#import "ViewController.h"
#import "NetfrontPageReq.h"
#import "ViewTableViewCell.h"
#import "OKVideoPlayerViewController.h"
@interface ViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *topTef;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArr;;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    _dataArr =[NSMutableArray array];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    // Do any additional setup after loading the view.
  
    
}

- (IBAction)searchAction:(UIButton *)sender {
    [self.view endEditing:YES];
    
     [NetfrontPageReq apiRequestSearch:@{@"kw":@"庆余年"} succ:^(id  _Nonnull result) {
         [_dataArr addObjectsFromArray:result];
         [_tableView reloadData];
       } faliar:^(NSError * _Nonnull err) {
           
       }];
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
    [self presentViewController:ok animated:YES completion:nil];

}



@end
