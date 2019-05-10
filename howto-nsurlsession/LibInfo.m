//
//  LibInfo.m
//  howto-nsurlsession
//
//  Created by José Silva on 08/05/2019.
//  Copyright © 2019 Codavel. All rights reserved.
//

#import "LibInfo.h"

@implementation LibInfo

-(id)initWithParameters:(NSString *)name_ total_downloads:(int)total_downloads_ total_apps:(int)total_apps_ n_stargazers:(int)n_stargazers_ {
    self = [super init];
    if (self) {
        self.name = name_;
        self.total_apps = total_apps_;
        self.total_downloads = total_downloads_;
    }
    return self;
}
@end
