//
//  gpxManager.h
//  myTrails
//
//  Created by Sergi Maymi on 26/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GpxManager : NSObject {
    NSXMLDocument *doc;
    double asc;
    double des;    
    double meanVel;
    double maxVel;
    double dist;
}

- (id)initWithFilename:(NSString *)filename;
- (id)loadXml:(NSString *)filename;
- (void)processData;
- (double)calculateDistance:(double)lastLon lastLat:(double)lastLat lon:(double)lon lat:(double)lat;

@end
