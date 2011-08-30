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
        doc = [[NSXMLDocument alloc] initWithXMLString:filename];
        [self processData];
    }
    return self;
}

-(void)processData:(NSString *) filename {
    doc = [[NSXMLDocument alloc] initWithXMLString:[NSString stringWithContentsOfFile:filename]];
    NSXMLElement *elem = [doc rootElement];
    if (elem == nil) {
        elem = nil;
    }
    
}


-(void)processData {
    NSXMLElement *elem = [doc rootElement];
    if (elem == nil) {
        elem = nil;
    }
    
}

@end
