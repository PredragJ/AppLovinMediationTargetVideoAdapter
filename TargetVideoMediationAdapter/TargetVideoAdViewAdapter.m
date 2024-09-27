#import "TargetVideoAdViewAdapter.h"
#import <DataseatSDK/Dataseat.h>
#import <DataseatSDK/DSErrorCode.h>
#import "Foundation/Foundation.h"
#import <BridSDK/BridSDK.h>
#import "UIKit/UIKit.h"

#define ADAPTER_VERSION @"1.0.0.2"

@implementation TargetVideoAdViewAdapter

#pragma mark - MAAdapter Methods

- (void)initializeWithParameters:(id<MAAdapterInitializationParameters>)parameters completionHandler:(void (^)(MAAdapterInitializationStatus, NSString * _Nullable))completionHandler
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[Dataseat shared] initializeSDK: self.router];
    });
    
    completionHandler(MAAdapterInitializationStatusDoesNotApply, nil);
}

- (NSString *)adapterVersion
{
    return ADAPTER_VERSION;
}

#pragma mark - MAAdViewAdapter Methods

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

#pragma mark - MANativeAdAdapter Methods

- (void)loadNativeAdForParameters:(id<MAAdapterResponseParameters>)parameters andNotify:(id<MANativeAdAdapterDelegate>)delegate
{
    NSString *adUnitID = parameters.thirdPartyAdPlacementIdentifier;
    NSLog(@"Peca Ucitava Native Ad za adUnitID: %@", adUnitID);
    
    MANativeAd *nativeAd = [[MANativeAd alloc] init];
    nativeAd.title = @"Native Ad Title";  
    nativeAd.body = @"Native Ad Body";
    
    if (nativeAd) {
        [delegate didLoadAdForNativeAd:nativeAd];
    } else {
        NSError *error = [NSError errorWithDomain:@"com.targetvideo.adapter"
                                             code:1002
                                         userInfo:@{NSLocalizedDescriptionKey: @"Native Ad failed to load"}];
        [delegate didFailToLoadNativeAdWithError:error];
    }
}

#pragma mark - Additional Native Ad Lifecycle Methods

- (void)didDisplayNativeAdWithExtraInfo:(NSDictionary *)extraInfo {
    NSLog(@"Peca prikazan Native Ad");
}

- (void)didClickNativeAd {
    NSLog(@"Peca kliknut Native Ad");
}

- (void)destroy {
    self.player = nil;
}

@end
