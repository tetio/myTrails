//
//  gpxManager.m
//  myTrails
//
//  Created by Sergi Maymi on 26/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "gpxManager.h"
#import "Track.h"

@implementation GpxManager

- (id)init
{
    self = [super init];
    if (self) {
       // aqui cal posar el que calgui  
    }
    
    return self;
}


- (id)initWithFilename:(NSString *)filename
{
    self = [super init];
    if (self) {
        [[self loadXml:filename] processData];
    }
    return self;
}

-(void)dealloc {
    [track dealloc];
    track = nil;
}


-(id)loadXml:(NSString *)filename {
    NSError *err = nil;
    NSString *xml = [NSString stringWithContentsOfFile:filename encoding:NSUTF8StringEncoding error:&err];
    track = [[Track alloc] initWithXMLString:xml options:NSXMLDocumentTidyXML error:&err];

    [err release];

    return self;
}




-(void)processData {
//    NSString *XPath = @"/gpx/trk/trkseg/trkpt";
    NSString *XPath = @"//trkpt";
    NSError *err = nil;
    double lat;
    double lon;
    double ele;
    NSString *time;
    NSDate *date;
    double lastLat;
    double lastLon;
    double lastEle;
    NSDate *lastDate;
    double incEle;
    NSXMLElement *trkpt;
    NSXMLElement *lastTrkpt;
    NSArray *nodes = [track nodesForXPath:XPath error:&err];
    
    
    if ([nodes count] > 0) {
        for (int i = 1; i < [nodes count]; i++) {
            lastTrkpt = [nodes objectAtIndex:i-1];
            trkpt = [nodes objectAtIndex:i];
            
            lastEle = [[[[lastTrkpt elementsForName:@"ele"] objectAtIndex:0] stringValue] doubleValue];
            time = [[[lastTrkpt elementsForName:@"time"] objectAtIndex:0] stringValue] ;
            lastLat = [[[lastTrkpt attributeForName:@"lat"] stringValue] doubleValue];
            lastLon = [[[lastTrkpt attributeForName:@"lon"] stringValue] doubleValue];
            time = [[[time stringByReplacingOccurrencesOfString:@"T" withString:@" "]  stringByReplacingOccurrencesOfString:@"Z" withString:@""] stringByAppendingString:@" +0000"];
            lastDate = [NSDate dateWithString:time];
            
            ele = [[[[trkpt elementsForName:@"ele"] objectAtIndex:0] stringValue] doubleValue];
            time = [[[trkpt elementsForName:@"time"] objectAtIndex:0] stringValue] ;
            lat = [[[trkpt attributeForName:@"lat"] stringValue] doubleValue];
            lon = [[[trkpt attributeForName:@"lon"] stringValue] doubleValue];
            time = [[[time stringByReplacingOccurrencesOfString:@"T" withString:@" "]  stringByReplacingOccurrencesOfString:@"Z" withString:@""] stringByAppendingString:@" +0000"];
            date = [NSDate dateWithString:time];
            
            incEle = lastEle - ele;
            if (incEle > 0) {
                [track incAsc:incEle];
            } else if (incEle < 0) {
                [track decDes:incEle];
            }
            [track incDist:[self calculateDistance:lastLon lastLat:lastLat lon:lon lat:lat]];
        }
    }

    // Xivatos
    NSLog(@"Total asc/desc[%g/%g]", [track getAsc], [track getDes]);
    NSLog(@"Distance: %g]", [track getDist]);
    
    [err release];
    // sembla que no cal        [track release];
}

- (double)calculateDistance:(double)lastLon lastLat:(double)lastLat lon:(double)lon lat:(double)lat  {
    // Haversine formula
    int R = 6371; // km
    double dLat = (lat-lastLat) * M_PI / 180;
    double dLon = (lon-lastLon) * M_PI / 180;
    double lat1 = lat * M_PI / 180;
    double lat2 = lastLat * M_PI / 180;    
    double a = sin(dLat/2) * sin(dLat/2) + sin(dLon/2) * sin(dLon/2) * cos(lat1) * cos(lat2); 
    double c = 2 * atan2(sqrt(a), sqrt(1-a)); 
    double d = R * c;
    
    return d;
}
@end
