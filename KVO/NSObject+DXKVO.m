
#import <objc/message.h>
#import "NSObject+DXKVO.h"
static const char blockKey;
@implementation NSObject (DXKVO)

-(void)dx_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context callBack:(void (^)(id _Nullable))block{
    NSString *className = [@"dx_" stringByAppendingString:NSStringFromClass([self class])];
    Class newClass = objc_allocateClassPair([self class], className.UTF8String, 0);
    objc_registerClassPair(newClass);
    object_setClass(self, newClass);
    class_addMethod(newClass, @selector(setName:), (IMP)classSetName, "v@:@");
    objc_setAssociatedObject(self, &blockKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}


void classSetName(id self,SEL _cmd, NSString * newName){
    
    struct objc_super superClass = {
        .receiver = self,
        .super_class = class_getSuperclass(object_getClass(self))
    };
    
    // 调用原方法
    objc_msgSendSuper(&superClass,_cmd,newName);
    void(^block)(id paramter) = objc_getAssociatedObject(self, &blockKey);
    if (block) {
        block(newName);
    }
}


@end
