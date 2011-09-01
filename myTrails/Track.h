//
//  Track.h
//  myTrails
//
//  Created by Sergi Maymi on 01/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Track : NSXMLDocument {
    double asc;
    double des;    
    double meanVel;
    double maxVel;
    double dist;    
}

-(id)init;
-(void) incAsc:(double)inc;
-(void) decDes:(double)desc;
-(void) incDist:(double)inc;
-(double) getDist;
-(double) getAsc;
-(double) getDes;
-(double) getMaxVel;

@end
