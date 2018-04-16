//
//  UIButton+BtnTap.h
//  cnd-mobile-iOS
//
//  Created by DuceShen on 2018/3/23.
//  Copyright © 2018年 chenengdai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BtnTap)
- (void)addTap:(void(^)(UIButton *btn))block;
- (void)addBtnTap:(void(^)(UIButton *btn))block events:(UIControlEvents)controlEvents;
@end
