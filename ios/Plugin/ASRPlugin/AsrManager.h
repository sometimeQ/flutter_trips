
#import <Foundation/Foundation.h>

@interface AsrManager:NSObject

// block 回调方法
typedef void(^AsrCallback)(NSString* message);

+ (instancetype)initWith:(AsrCallback)success failure:(AsrCallback)failure;

// 开始录音
- (void)start;

// 停止录音
- (void)stop;

// 取消录音
- (void)cancel;

@end


