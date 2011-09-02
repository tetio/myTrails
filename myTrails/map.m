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
    NSString *filename;
    GpxManager *gpxManager;
    
    NSOpenPanel *op = [NSOpenPanel openPanel];
    if ([op runModal] == NSOKButton) 
    {
        filename = [op filename];
    }
    gpxManager = [[GpxManager alloc] initWithFilename:filename];
    NSString *polyLine = [gpxManager processData];
    
    id map = [mapView windowScriptObject];
    NSString *jsCmd = @"map.addOverlay(new GPolyline([";
    jsCmd = [jsCmd stringByAppendingString:polyLine];
    jsCmd = [jsCmd stringByAppendingString:@"], '#0000FF', 3));"];
    [map evaluateWebScript:jsCmd];   
    
//    [gpxManager release];
}


-(void)dealloc {
}

/*
var polyline = new GPolyline([
                              new GLatLng(41.2426668, 1.7461682),
                              new GLatLng(41.2414942, 1.7468375),
                              new GLatLng(41.2446270, 1.7577317)
                              ], "#FF0000", 10);
map.addOverlay(new GPolyline([
                              new GLatLng(41.2426668, 1.7461682),
                              new GLatLng(41.2414942, 1.7468375),
                              new GLatLng(41.2446270, 1.7577317)
                              ], "#FF0000", 10););
 */
@end
