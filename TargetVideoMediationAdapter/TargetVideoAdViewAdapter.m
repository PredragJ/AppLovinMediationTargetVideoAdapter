//
//  TargetVideoMediationAdapter.m
//  TargetVideoMediationAdapter
//
//  Created by Predrag Jevtic on 27.8.24..
//

#import "TargetVideoAdViewAdapter.h"
#import <DataseatSDK/Dataseat.h>
#import <DataseatSDK/DSErrorCode.h>
#import "Foundation/Foundation.h"
#import <BridSDK/BridSDK.h"
#import "UIKit/UIKit.h"

#define ADAPTER_VERSION @"1.0.0.2"

@implementation TargetVideoAdViewAdapter

#pragma mark - MAAdapter Methods

- (void)initializeWithParameters:(id<MAAdapterInitializationParameters>)parameters completionHandler:(void (^)(MAAdapterInitializationStatus, NSString * _Nullable))completionHandler
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self log: @"Initializing Dataseat SDK..."];
        [[Dataseat shared] initializeSDK: self.router];
    });
    
    completionHandler(MAAdapterInitializationStatusDoesNotApply, nil);
}

- (NSString *)adapterVersion
{
    return ADAPTER_VERSION;
}

- (void)loadAdViewAdForParameters:(id<MAAdapterResponseParameters>)parameters adFormat:(MAAdFormat *)adFormat andNotify:(id<MAAdViewAdapterDelegate>)delegate
{
    NSLog(@"Peca Usla cupi");
    NSString *adUnitID = parameters.thirdPartyAdPlacementIdentifier;
    UIView *bannerView = [[UIView alloc] init];
    self.player = [[BVPlayer alloc] initAdUnit:35590 forView:bannerView];
    
    if (self.player) {
        [delegate didLoadAdForAdViewAdapter:self];
    } else {
        NSError *error = [NSError errorWithDomain:@"com.targetvideo.adapter"
                                             code:1001
                                         userInfo:@{NSLocalizedDescriptionKey: @"Ad failed to load"}];
        [delegate didFailToLoadAdForAdViewAdapter:self withError:error];
    }
}
//- (void)loadAdWithParameters:(id<MAAdapterResponseParameters>)parameters
//                  andNotify:(id<MAAdViewAdapterDelegate>)delegate {
//    
//    NSString *adUnitID = parameters.thirdPartyAdPlacementIdentifier;
//    UIView *bannerView = [[UIView alloc] init];
//    self.player = [[BVPlayer alloc] initAdUnit:35590 forView:bannerView];
//    
//    if (self.player) {
//        [delegate didLoadAdForAdViewAdapter:self];
//    } else {
//        NSError *error = [NSError errorWithDomain:@"com.targetvideo.adapter"
//                                             code:1001
//                                         userInfo:@{NSLocalizedDescriptionKey: @"Ad failed to load"}];
//        [delegate didFailToLoadAdForAdViewAdapter:self withError:error];
//    }
//}

- (void)didDisplayAd {
    NSLog(@"Peca prikazan AD");
}

- (void)didClickAd {
    NSLog(@"Peca kliknut AD");
}

- (void)didHideAd {
    NSLog(@"Peca sakriven AD");
}

- (void)didFailToDisplayAdWithError:(NSError *)error {
    NSLog(@"Peca error AD: %@", error);
}

@end
