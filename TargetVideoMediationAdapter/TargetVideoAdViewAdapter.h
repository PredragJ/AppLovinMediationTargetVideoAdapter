//
//  TargetVideoMediationAdapter.h
//  TargetVideoMediationAdapter
//
//  Created by Predrag Jevtic on 27.8.24..
//

#import <AppLovinSDK/AppLovinSDK.h>

@interface TargetVideoAdViewAdapter : NSObject <MAAdViewAdapter, MAAdViewAdapterDelegate>

@property (nonatomic, strong) BVPlayer *player;

@end
