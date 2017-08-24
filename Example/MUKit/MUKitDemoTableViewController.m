//
//  MUKitDemoTableViewController.m
//  MUKit
//
//  Created by Jekity on 2017/8/17.
//  Copyright © 2017年 Jeykit. All rights reserved.
//

#import "MUKitDemoTableViewController.h"
#import <MUTableViewManager.h>
#import "MUKitSignalTableViewController.h"
#import "MUKitDemoMVVMTableViewController.h"
#import "MUKitDemoViewController.h"
#import "MUKitDemoMVVMColloectionController.h"
#import <objc/runtime.h>

@interface MUKitDemoTableViewController ()

@property(nonatomic, strong)MUTableViewManager *tableViewManger;
@end


static NSString *const cellReusedIndentifier = @"cell";
@implementation MUKitDemoTableViewController

+(void)load{
    
    Method  preDealloc = class_getInstanceMethod([[UIApplication sharedApplication].delegate class], NSSelectorFromString(@"application:didFinishLaunchingWithOptions:"));
    
    Method  newDealloc = class_getInstanceMethod([UIViewController class], @selector(mu_application:didFinishLaunchingWithOptions:));
    
    method_exchangeImplementations(preDealloc, newDealloc);
}

- (BOOL)mu_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSLog(@"项目启动了");
    return [self mu_application:application didFinishLaunchingWithOptions:launchOptions];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Demo";
//    self.view.backgroundColor = [UIColor lightGrayColor];
    [self configuredDataSource];
    
}
#pragma -mark init
-(void)configuredDataSource{
     self.tableViewManger = [[MUTableViewManager alloc]initWithTableView:self.tableView subKeyPath:nil];
    [self.tableViewManger registerCellClass:NSStringFromClass([UITableViewCell class]) cellReuseIdentifier:cellReusedIndentifier];
    self.tableViewManger.modelArray = [@[@"signal",@"MVVVTableView",@"MVVVCollectionView"] mutableCopy];
    
    
    self.tableViewManger.renderBlock = ^UITableViewCell *(UITableViewCell *cell, NSIndexPath *indexPath, id model, CGFloat *height) {
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@",model];
        return cell;
    };

   self.tableViewManger.headerViewBlock = ^UIView * (UITableView *  tableView, NSUInteger sections, NSString *__autoreleasing   *  title, id   model, CGFloat *  height) {
       *title  = @"Demo";
       
       return nil;
   };
    
   self.tableViewManger.footerViewBlock = ^UIView *(UITableView *tableView, NSUInteger sections, NSString *__autoreleasing *title, id model, CGFloat *height) {
       
       *title = @"我想写就写";
       return nil;
   };
    
    __weak typeof(self) weakSelf = self;
    
    self.tableViewManger.selectedCellBlock = ^(UITableView *  tableView, NSIndexPath *  indexPath, id  model, CGFloat *  height) {
        
        if (indexPath.row == 0) {
            
            MUKitDemoViewController  *controller = [MUKitDemoViewController new];
            [weakSelf.navigationController pushViewController:controller animated:YES];
            return ;
        }
        
        if (indexPath.row == 1) {
            
            MUKitDemoMVVMTableViewController  *controller = [MUKitDemoMVVMTableViewController new];
            [weakSelf.navigationController pushViewController:controller animated:YES];
            return ;
        }
        if (indexPath.row == 2) {
            
            MUKitDemoMVVMColloectionController  *controller = [MUKitDemoMVVMColloectionController new];
            [weakSelf.navigationController pushViewController:controller animated:YES];
            return ;
        }
    };
   

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
