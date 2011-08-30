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

-(id)loadXml:(NSString *)filename {
    NSError *err = nil;
    NSString *xml = [NSString stringWithContentsOfFile:filename encoding:NSUTF8StringEncoding error:&err];
    doc = [[NSXMLDocument alloc] initWithXMLString:xml options:NSXMLDocumentTidyXML error:&err];
    return self;
}




-(void)processData {
    NSXMLElement *elem = [doc rootElement];
    if (elem == nil) {
        elem = nil;
    }
    
}

@end
