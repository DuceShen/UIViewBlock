//
//  UIView+Gesture.h
//  cnd-mobile-iOS
//
//  Created by DuceShen on 2018/3/22.
//  Copyright © 2018年 chenengdai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Gesture)
- (void)addTap:(void(^)(UITapGestureRecognizer *tap))block;
@end
