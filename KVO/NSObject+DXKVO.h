

#import <Foundation/Foundation.h>

@interface NSObject (DXKVO)


- (void)dx_addObserver:(NSObject *_Nullable)observer forKeyPath:(NSString *_Nullable)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context callBack:(void (^_Nullable) (id _Nullable paramter))block;

@end
