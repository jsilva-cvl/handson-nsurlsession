//
//  LibInfo.h
//  howto-nsurlsession
//
//  Created by José Silva on 08/05/2019.
//  Copyright © 2019 Codavel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LibInfo : NSObject

-(id)initWithParameters:(NSString *)name_ total_downloads:(int)total_downloads_ total_apps:(int)total_apps_ n_stargazers:(int)n_stargazers_;

@property NSString *name;
@property int total_downloads;
@property int n_stargazers;
@property int total_apps;

@end

NS_ASSUME_NONNULL_END
