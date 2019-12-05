//
//  YDLHViewController.m
//  iOSProduct
//
//  Created by Jam 王 on 2019/12/4.
//  Copyright © 2019 Jam 王. All rights reserved.
//

#import "YDLHViewController.h"
#import <YDCTMediatorSDK/CTMediator.h>
#import <YDCTMediatorSDK/CTMediator+Module_LH.h>
NSString * const kCellIdentifier = @"kCellIdentifier";
@interface YDLHViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation YDLHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"揽货组件";
     [self.view addSubview:self.tableView];
    
    
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        UIViewController *viewController = [[CTMediator sharedInstance] CTMediator_viewControllerForDetail];

        // 获得view controller之后，在这种场景下，到底push还是present，其实是要由使用者决定的，mediator只要给出view controller的实例就好了
       // viewController.view.backgroundColor = [UIColor yellowColor];
    [self.navigationController pushViewController:viewController animated:YES];
        
    } else if (indexPath.row == 1) {
        
        
         __weak __typeof__(self) weakSelf = self;
        
        UIViewController * viewController = (UIViewController *)[[CTMediator sharedInstance]CTMediator_showAlertWithMessage:@"casa" cancelAction:^(NSDictionary * _Nonnull info) {
            
        } confirmAction:^(NSDictionary * _Nonnull info) {
             weakSelf.view.backgroundColor = [UIColor blueColor];
            weakSelf.navigationItem.title  = [NSString stringWithFormat:@"回调传值%@",[info objectForKey:@"alertAction"]];
            
        }];
        

        viewController.view.backgroundColor = [UIColor orangeColor];
        [self.navigationController pushViewController:viewController animated:YES];
         
    }
    
    
}
#pragma mark - getters and setters
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.frame = self.view.frame;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    }
    return _tableView;
}

- (NSArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = @[@"present detail view controller",
                        @"push detail view controller",
                       
                        ];
    }
    return _dataSource;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
