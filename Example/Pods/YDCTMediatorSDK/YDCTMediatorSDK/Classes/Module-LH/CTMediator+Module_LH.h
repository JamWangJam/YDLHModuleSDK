//
//  CTMediator+Module_LH.h
//  CTMediator
//
//  Created by Jam 王 on 2019/12/4.
//  Copyright © 2019 casa. All rights reserved.
//


#import <UIKit/UIKit.h>

#import "CTMediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface CTMediator (Module_LH)
- (UIViewController *)CTMediator_viewControllerForDetail;
- (void)CTMediator_showAlertWithMessage:(NSString *)message cancelAction:(void(^)(NSDictionary *info))cancelAction confirmAction:(void(^)(NSDictionary *info))confirmAction;
@end

NS_ASSUME_NONNULL_END
