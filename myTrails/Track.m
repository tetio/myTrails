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
        jsPolyline = @"";
    }
    
    return self;
}

- (void)dealloc {
    [jsPolyline release];
    [super dealloc];
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

- (NSString *) getJsPolyline {
    return jsPolyline;
}

- (void) setMaxVel:(double)vel {
    maxVel = vel;
}



- (void)addPointToPolyline:(NSString *)lat lon:(NSString *)lon { 
    // new GLatLng(41.2426668, 1.7461682), new GLatLng(41.2414942, 1.7468375), new GLatLng(41.2446270, 1.7577317)
    NSString *s = @"new GLatLng(";
    s = [[[[s stringByAppendingString:lat] stringByAppendingString:@" ,"] stringByAppendingString:lon] stringByAppendingString:@")"];
    if ([jsPolyline length] == 0)
        jsPolyline = [jsPolyline stringByAppendingString:s];
    else
        jsPolyline = [[jsPolyline stringByAppendingString:@", "] stringByAppendingString:s];
        
}

@end
