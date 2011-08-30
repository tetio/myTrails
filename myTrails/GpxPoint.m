//
//  Point.m
//  myTrails
//
//  Created by Sergi Maymi on 29/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GpxPoint.h"

@implementation GpxPoint

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        lon = 0.0;
        lat = 0.0;        
    }
    
    return self;
}

-(id)init:(double)aLon:(double)aLat {
    lon = aLon;
    lat = aLat;  
    
    return self;
}

-(id)lon:(double) aLon {
    lon = aLon;
    return self;
}

-(id)lat:(double) aLat {
    lat = aLat;
    return self;
}

@end
