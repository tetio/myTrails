//
//  gpxManager.m
//  myTrails
//
//  Created by Sergi Maymi on 26/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "gpxManager.h"

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
    [doc dealloc];
    doc = nil;
}


-(id)loadXml:(NSString *)filename {
    NSError *err = nil;
    NSString *xml = [NSString stringWithContentsOfFile:filename encoding:NSUTF8StringEncoding error:&err];
    doc = [[NSXMLDocument alloc] initWithXMLString:xml options:NSXMLDocumentTidyXML error:&err];

    [err release];
    [xml release];

    return self;
}




-(void)processData {
    NSString *XPath = @"/gpx/trk/trkseg/trkpt";
    NSError *err = nil;
    NSString *lat;
    NSString *lon;
    NSString *ele;
    NSString *time;
    
    NSArray *nodes = [doc nodesForXPath:XPath error:&err];
    
    if ([nodes count] > 0) {
        for (NSXMLElement *trkpt in nodes) {
            ele = [[[trkpt elementsForName:@"ele"] objectAtIndex:0] XMLString];
            time = [[[trkpt elementsForName:@"time"] objectAtIndex:0] XMLString];
            lat = [[trkpt attributeForName:@"lat"] XMLString];
            lon = [[trkpt attributeForName:@"lon"] XMLString];
        }
    }

    [err release];
    [nodes release];
}

@end
