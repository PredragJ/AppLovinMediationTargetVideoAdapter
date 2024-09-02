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

#define ADAPTER_VERSION @"1.0.0.1"

@implementation TargetVideoAdViewAdapter

- (void)loadAdWithParameters:(id<MAAdapterResponseParameters>)parameters
                  andNotify:(id<MAAdViewAdapterDelegate>)delegate {
    
    NSString *adUnitID = parameters.thirdPartyAdPlacementIdentifier;
    UIView *bannerView = [[UIView alloc] init];
    self.player = [[BVPlayer alloc] initAdUnit:[adUnitID intValue] forView:bannerView];
    
    if (self.player) {
        [delegate didLoadAdForAdViewAdapter:self];
    } else {
        NSError *error = [NSError errorWithDomain:@"com.targetvideo.adapter"
                                             code:1001
                                         userInfo:@{NSLocalizedDescriptionKey: @"Ad failed to load"}];
        [delegate didFailToLoadAdForAdViewAdapter:self withError:error];
    }
}

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
