//
//  TargetVideoMediationAdapter.m
//  TargetVideoMediationAdapter
//
//  Created by Predrag Jevtic on 27.8.24..
//

#import "TargetVideoAdapter.h"
#import <DataseatSDK/Dataseat.h>
#import <DataseatSDK/DSErrorCode.h>
#import "Foundation/Foundation.h"
#import <BridSDK/BridSDK.h"

#define ADAPTER_VERSION @"1.0.0.0"

@interface TargetVideoAdapter()

@property (nonatomic, strong, readonly) TargetVideoAdapter *router;
@property (nonatomic, copy) NSString *routerPlacementIdentifer;
@property (nonatomic) BVPlayer *player;

@end

@implementation TargetVideoAdapter
@dynamic router;

- (void)initializeWithParameters:(id<MAAdapterInitializationParameters>)parameters completionHandler:(void (^)(MAAdapterInitializationStatus, NSString * _Nullable))completionHandler
{
    [self log: @"Peca Usao"];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self log: @"Initializing SDK..."];
    });
    
    completionHandler(MAAdapterInitializationStatusDoesNotApply, nil);
}

- (NSString *)SDKVersion
{
    return @"1.4.0";
}

- (NSString *)adapterVersion
{
    return ADAPTER_VERSION;
}

- (void)destroy
{
    [self.router removeAdapter: self forPlacementIdentifier: self.routerPlacementIdentifer];
}

#pragma mark - MABannerAdapter Methods

- (void)loadBannerAdForParameters:(id<MAAdapterResponseParameters>)parameters adFormat:(MAAdFormat *)adFormat andNotify:(id<MABannerAdapterDelegate>)delegate
{
    self.routerPlacementIdentifer = parameters.thirdPartyAdPlacementIdentifier;
    [self log: @"Peca Usao 2"];
    [self log: @"Loading banner ad for tag: %@", self.routerPlacementIdentifer];
    
    UIView *bannerView = [[UIView alloc] init]; // Placeholder za vaš banner view
//    _player = [[BVPlayer alloc] initAdUnit:35590 forView:bannerView];

    // Učitajte baner koristeći odgovarajući SDK i metode
    bannerView.backgroundColor = [UIColor whiteColor];
    [delegate didLoadAdForAdView:bannerView];
}

- (void)log:(NSString *)format, ...
{
    va_list args;
    va_start(args, format);
    NSLogv(format, args);
    va_end(args);
}

- (void)removeAdapter:(id)adapter forPlacementIdentifier:(NSString *)placementIdentifier
{
    [self log: @"Peca Usao 3"];
}

@end
