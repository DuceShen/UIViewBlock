//
//  UIView+Gesture.m
//  cnd-mobile-iOS
//
//  Created by DuceShen on 2018/3/22.
//  Copyright © 2018年 chenengdai. All rights reserved.
//

#import "UIView+Gesture.h"
#import <objc/runtime.h>

@implementation UIView (Gesture)
static char SDCTapBlockKey;

- (void)addTap:(void(^)(UITapGestureRecognizer *tap))block {
    objc_setAssociatedObject(self, &SDCTapBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionAfterTap:)];
    [self addGestureRecognizer:tapGesture];
}

- (void)actionAfterTap:(UITapGestureRecognizer *)tapGesture {
    void(^tempBlock)(UITapGestureRecognizer *tap) = objc_getAssociatedObject(self, &SDCTapBlockKey);
    if (tempBlock) {
        tempBlock(tapGesture);
    }
}

@end
