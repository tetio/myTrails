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
    double desc;
    double maxVel;
}

- (id)initWithFilename:(NSString *)filename;
-(id)loadXml:(NSString *)filename;
- (void)processData;
@end
