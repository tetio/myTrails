//
//  gpxManager.h
//  myTrails
//
//  Created by Sergi Maymi on 26/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Track.h"

@interface GpxManager : NSObject {
    Track *track;
}

- (id)initWithFilename:(NSString *)filename;
- (id)loadXml:(NSString *)filename;
- (void)processData;
- (double)calculateDistance:(double)lastLon lastLat:(double)lastLat lon:(double)lon lat:(double)lat;

@end
