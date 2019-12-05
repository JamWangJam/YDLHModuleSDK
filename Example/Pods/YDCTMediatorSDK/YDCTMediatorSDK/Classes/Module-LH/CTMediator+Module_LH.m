//
//  CTMediator+Module_LH.m
//  CTMediator
//
//  Created by Jam 王 on 2019/12/4.
//  Copyright © 2019 casa. All rights reserved.
//

#import "CTMediator+Module_LH.h"

NSString * const kCTMediatorTargetA = @"YDQSActions";

NSString * const kCTMediatorActionNativeFetchDetailViewController = @"nativeFetchDetailViewController";

NSString * const kCTMediatorActionShowAlert = @"backBlock";


@implementation CTMediator (Module_LH)
- (UIViewController *)CTMediator_viewControllerForDetail
{
    UIViewController *viewController = [self performTarget:kCTMediatorTargetA
                                                    action:kCTMediatorActionNativeFetchDetailViewController
                                                    params:@{@"key":@"value1"}
                                         shouldCacheTarget:NO
                                        ];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return viewController;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
- (void)CTMediator_showAlertWithMessage:(NSString *)message cancelAction:(void(^)(NSDictionary *info))cancelAction confirmAction:(void(^)(NSDictionary *info))confirmAction
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];
    if (message) {
        paramsToSend[@"message"] = message;
    }
    if (cancelAction) {
        paramsToSend[@"cancelAction"] = cancelAction;
    }
    if (confirmAction) {
        paramsToSend[@"confirmAction"] = confirmAction;
    }
    [self performTarget:kCTMediatorTargetA
                 action:kCTMediatorActionShowAlert
                 params:paramsToSend
      shouldCacheTarget:NO];
}

@end
