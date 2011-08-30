//
//  map.m
//  myTrails
//
//  Created by Sergi Maymi on 26/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "map.h"
#import <WebKit/WebKit.h>
#import "GpxManager.h"

@implementation map

-(void)awakeFromNib
{
	NSString *indexPath = [[NSBundle mainBundle] pathForResource:@"maps" ofType:@"html"];
    [[mapView mainFrame] loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:indexPath]]]; 
	[[[mapView mainFrame] frameView] setAllowsScrolling:NO];
	[mapView setNeedsDisplay:YES];
}

-(IBAction)zoomIn:sender{
    id map = [mapView windowScriptObject];
    NSString *jsCmd = @"map.zoomIn();";
    [map evaluateWebScript:jsCmd];
}

-(IBAction)zoomOut:sender{
    id map = [mapView windowScriptObject];
    NSString *jsCmd = @"map.zoomOut();";
    [map evaluateWebScript:jsCmd];
}

-(IBAction)fileChooser:sender {
    NSOpenPanel *op = [NSOpenPanel openPanel];
    if ([op runModal] == NSOKButton) 
    {
        filename = [op filename];
    }  
    gpxManager = [[GpxManager alloc] initWithFilename:filename];
}


-(void)dealloc {
    [gpxManager dealloc];
    gpxManager = nil;
}

@end
