//
//  map.h
//  myTrails
//
//  Created by Sergi Maymi on 26/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
#import "GpxManager.h"

@interface map : NSObject {
    IBOutlet WebView *mapView;
    IBOutlet NSButton *zoomIn;
    IBOutlet NSButton *zoomOut;
    IBOutlet NSButton *fileChooser;
    NSString *filename;
    GpxManager *gpxManager;
}

//@property (nonatomic, retain) GpxManager *gpxManager;

-(IBAction)zoomIn:(id)sender;
-(IBAction)zoomOut:(id)sender;
-(IBAction)fileChooser:(id)sender;

@end
