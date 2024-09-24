//
//  TargetVideoMediationAdapter.h
//  TargetVideoMediationAdapter
//
//  Created by Predrag Jevtic on 27.8.24..
//

#import <Foundation/Foundation.h>
#import <AppLovinSDK/AppLovinSDK.h>

@interface TargetVideoAdViewAdapter : ALMediationAdapter <MAAdViewAdapter>

@property (nonatomic, strong) BVPlayer *player;

@end
