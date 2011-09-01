//
//  Track.m
//  myTrails
//
//  Created by Sergi Maymi on 01/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Track.h"

@implementation Track

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}


- (void)incAsc:(double)inc {
    asc += inc;
}

- (void)decDes:(double)dec {
    des -= dec;
}

- (void)incDist:(double)inc {
    dist += inc;
}

- (double) getDist {
    return dist;
}

- (double) getAsc {
    return asc;
}

- (double) getDes {
    return des;
}

- (double) getMaxVel {
    return maxVel;
}

@end
