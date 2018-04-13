# UIViewBlock
# 使用后效果
之前：  

- UIView添加事件  
>-(void)xxx {  
>    view.userInteractionEnabled = YES;  
>    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doSomething:)];  
>    [view addGestureRecognizer:tapGesture];  
>}  
 >-(void)doSomething {
 >   ...
>}

- UIButton添加事件
>-(void)xxx {
>    [btn addTarget:self action:@selector(doSomething:) forControlEvents:UIControlEventTouchUpInside];
>}
>-(void)doSomething {
>    ...
>}

使用后：  

- UIVIew添加事件
>-(void)xxx {
>    [view addTap:^(UITapGestureRecognizer *tap) {
>        ...
>    }];
>}
- UIButton添加事件
>-(void)xxx {  
>    [btn addTap:^(UIButton *btn) {  
>        ...  
>    }];  
>}
# 使用方法
直接拖入工程即可
# 使用建议
建议配合以下两个宏使用(借鉴自yykit)，防止循环引用
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif
#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif
宏可放入.pch或Global.h等文件, 并且宏配合xcode自动完成效果更佳。
宏搭配使用效果
- (void)xxx {
    @weakify(self)
    [btn addTap:^(UIButton *btn) {
        @strongify(self)
        ...
    }];
}

