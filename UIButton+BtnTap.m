//
//  UIButton+BtnTap.m
//  cnd-mobile-iOS
//
//  Created by DuceShen on 2018/3/23.
//  Copyright © 2018年 chenengdai. All rights reserved.
//

#import "UIButton+BtnTap.h"
#import <objc/runtime.h>

@implementation UIButton (BtnTap)
static char SDCBtnBlockKey;

- (void)addTap:(void(^)(UIButton *btn))block {
    objc_setAssociatedObject(self, &SDCBtnBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(btnActionAfterBtnTap:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addBtnTap:(void(^)(UIButton *btn))block events:(UIControlEvents)controlEvents {
    objc_setAssociatedObject(self, &SDCBtnBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(btnActionAfterBtnTap:) forControlEvents:controlEvents];
}

- (void)btnActionAfterBtnTap:(id)sender {
    void(^tempBlock)(UIButton *btn) = objc_getAssociatedObject(self, &SDCBtnBlockKey);
    if (tempBlock) {
        tempBlock(self);
    }
}
@end
