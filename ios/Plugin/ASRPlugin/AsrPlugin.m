
#import "AsrPlugin.h"
#import "AsrManager.h"

@interface AsrPlugin ()

// 定义的类
@property (strong, nonatomic) AsrManager *asrManager;

// 结果
@property (strong, nonatomic) FlutterResult result;

@end

@implementation AsrPlugin

// 注册插件 asr_plugin。名字与flutter 里面定义的一样
+ (void)registerWithRegistrar:(NSObject <FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"asr_plugin" binaryMessenger:[registrar messenger]];
    AsrPlugin *instance = [AsrPlugin new];
    [registrar addMethodCallDelegate:instance channel:channel];
}

//- (void)registerWithRegistrar:(NSObject <FlutterPluginRegistrar> *)registrar {
//    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"asr_plugin" binaryMessenger:[registrar messenger]];
//    AsrPlugin *instance = [AsrPlugin new];
//    [registrar addMethodCallDelegate:instance channel:channel];
//}

// flutter 与oc 方法主动交互 、 start、 stop、cancel 需要与flutter端一致
- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
//    NSLog(@"FlutterResult %@", result);
    NSLog(@"call %@", call.method);
    if ([@"start" isEqualToString:call.method]) {
        self.result = result;
        [[self _asrManager] start];
    }
    else if ([@"stop" isEqualToString:call.method]) {
        [[self _asrManager] stop];
    }
    else if ([@"cancel" isEqualToString:call.method]) {
        [[self _asrManager] cancel];
    }
    else{
        result(FlutterMethodNotImplemented);
    }
}

- (AsrManager *)_asrManager {
    if (!self.asrManager) {
        self.asrManager = [AsrManager initWith:^(NSString *message) {
            NSLog(@"录音结果 %@", message);
            if (self.result) {
                // 回调数据
                self.result(message);
                self.result = nil;
            }
        } failure:^(NSString *message) {
            if (self.result) {
                self.result([FlutterError errorWithCode:@"ASR fail" message:message details:nil]);
                self.result = nil;
            }
        }];
    }
    return self.asrManager;
}
@end
