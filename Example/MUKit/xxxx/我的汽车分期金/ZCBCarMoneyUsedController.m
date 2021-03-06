//
//  ZCBCarMoneyUsedController.m
//  MUKit_Example
//
//  Created by Jekity on 2017/12/27.
//  Copyright © 2017年 Jeykit. All rights reserved.
//

#import "ZCBCarMoneyUsedController.h"
#import "ZCBCarMoneyUsedHeaderView.h"
//#import "wxx_web_ViewController.h"
#import "ZCBCarMoneyUsedOrderController.h"


@interface ZCBCarMoneyUsedController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIButton *button;
@property(nonatomic, strong)ZCBCarMoneyUsedHeaderView *headerView;
@end

@implementation ZCBCarMoneyUsedController

- (void)viewDidLoad {
    [super viewDidLoad];
//
//    [self TTTitle:@"我的装修金使用" textColor:[UIColor whiteColor] isShimmering:NO];
//    self.headerView = [ZCBCarMoneyUsedHeaderView ViewFromXib];
//    self.headerView.AutoWidth = hScreenWidth;
//    self.tableView.tableHeaderView = self.headerView;
//    self.tableView.backgroundColor = TTGrayColor(245);
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.edgesForExtendedLayout = UIRectEdgeBottom;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
-(void)getData{
    [BSSCModel POSTResultWithPath:@"m=Api&c=Consumer&a=myapplyInfo" Params:^(BSSCParms *ParmsModel) {
        
        ParmsModel.id = self.model.id;
        ParmsModel.schedule_sataus = self.model.schedule_sataus;
    } success:^(BSSCModel *model, NSMutableArray<BSSCModel *> *modelArr, id responseObject) {
        
        self.headerView.model = model;
        
    } failure:^(NSError *error) {
        
    }];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self TTNVDefaultBarWithImg:[UIImage imageWithColor:TTZCBIconRed] bindScrollView:self.tableView];
    [self getData];
}
Click_signal(button){
    wxx_web_ViewController *controller = [wxx_web_ViewController new];
    controller.url_Link = self.headerView.model.contract_url;
    [self.navigationController WillPushViewController:@"wxx_web_ViewController" animated:YES SetupParms:^(UIViewController *vc, NSMutableDictionary *dict) {
        
        [dict addEntriesFromDictionary:@{@"url_Link":self.headerView.model.contract_url ,@"backIconName":@"nav_back03"}];
    } callback:nil jumpError:nil];
}
Click_signal(button1){
    [self showOrderController:0];
}
Click_signal(button2){
    [self showOrderController:1];
}
Click_signal(button3){
    [self showOrderController:2];
}
Click_signal(button4){
    [self showOrderController:3];
}

-(void)showOrderController:(NSUInteger)tag{
    ZCBCarMoneyUsedOrderController *invoice = [ZCBCarMoneyUsedOrderController new];
    invoice.model = self.headerView.model.project_step[tag];
    invoice.model.id = self.headerView.model.id;
    invoice.callbackblock = ^(id parameter) {
        [self.navigationController WillPushViewController:@"ZCBCarMoneyUsedSuccessController" animated:YES SetupParms:^(UIViewController *vc, NSMutableDictionary *dict) {
            [dict addEntriesFromDictionary:@{@"model":parameter}];
        } callback:^(id parameter) {
            
        } jumpError:nil];
        };
         
    [self presentViewController:invoice animated:YES frame:hScreenBounds style:(TTPresentStyleCustomModal_blackhud) completion:nil];
}
 */
@end
