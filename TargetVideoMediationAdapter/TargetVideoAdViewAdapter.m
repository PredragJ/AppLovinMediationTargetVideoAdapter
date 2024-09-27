#import "TargetVideoAdViewAdapter.h"
#import <DataseatSDK/Dataseat.h>
#import <DataseatSDK/DSErrorCode.h>
#import "Foundation/Foundation.h"
#import <BridSDK/BridSDK.h>
#import "UIKit/UIKit.h"

#define ADAPTER_VERSION @"1.0.0.2"
#define SDK_VERSION @"1.4.0" // Primer verzije SDK-a

@implementation TargetVideoAdViewAdapter

#pragma mark - MAAdapter Methods

- (void)initializeWithParameters:(id<MAAdapterInitializationParameters>)parameters completionHandler:(void (^)(MAAdapterInitializationStatus, NSString * _Nullable))completionHandler
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"Peca onceToken adapter");
    });
    
    completionHandler(MAAdapterInitializationStatusInitializedSuccess, nil);
}

- (NSString *)adapterVersion
{
    return ADAPTER_VERSION;
}

- (NSString *)SDKVersion
{
    return SDK_VERSION;
}

- (void)destroy
{
    self.player = nil;
}

#pragma mark - MAAdViewAdapter Methods (Banner Ads)

- (void)loadAdViewAdForParameters:(id<MAAdapterResponseParameters>)parameters adFormat:(MAAdFormat *)adFormat andNotify:(id<MAAdViewAdapterDelegate>)delegate
{
    NSString *adUnitID = parameters.thirdPartyAdPlacementIdentifier;
    NSLog(@"Peca Usla cupi sa adUnitID: %@", adUnitID);
    
    UIView *bannerView = [[UIView alloc] init];
    self.player = [[BVPlayer alloc] initAdUnit:35590 forView:bannerView];
    
    if (self.player) {
        [delegate didLoadAdForAdViewAdapter:self]; // Oglas uspešno učitan
    } else {
        NSError *error = [NSError errorWithDomain:@"com.targetvideo.adapter"
                                             code:1001
                                         userInfo:@{NSLocalizedDescriptionKey: @"Ad failed to load"}];
        [delegate didFailToLoadAdForAdViewAdapter:self withError:error]; // Prijavi grešku
    }
}

#pragma mark - Optional Ad Lifecycle Methods

- (void)didDisplayAdViewAd {
    NSLog(@"Peca prikazan AD View");
}

- (void)didClickAdViewAd {
    NSLog(@"Peca kliknut AD View");
}

- (void)didHideAdViewAd {
    NSLog(@"Peca sakriven AD View");
}

- (void)didFailToDisplayAdViewAdWithError:(NSError *)error {
    NSLog(@"Peca error AD View: %@", error);
}

- (void)didCollapseAdViewAd {
    NSLog(@"Peca banner collapsed");
}

- (void)didExpandAdViewAd {
    NSLog(@"Peca banner expanded");
}

@end
