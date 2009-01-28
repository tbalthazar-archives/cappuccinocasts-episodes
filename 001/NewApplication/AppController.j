/*
 * AppController.j
 *
 * Created by __Me__ on __Date__.
 * Copyright 2008 __MyCompanyName__. All rights reserved.
 */

@import <Foundation/CPObject.j>


@implementation AppController : CPObject
{
    CPTextField label ;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

    label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];

    [label setAlignment:CPCenterTextAlignment] ;
    [label setStringValue:@"Hello World!"];
    [label setFont:[CPFont boldSystemFontOfSize:24.0]];

    [label sizeToFit];

    [label setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [label setFrameOrigin:CGPointMake((CGRectGetWidth([contentView bounds]) - CGRectGetWidth([label frame])) / 2.0, (CGRectGetHeight([contentView bounds]) - CGRectGetHeight([label frame])) / 2.0)];

    [contentView addSubview:label];
    
    var button = [[CPButton alloc] initWithFrame: CGRectMake(
                CGRectGetWidth([contentView bounds])/2.0 - 40,
                CGRectGetMaxY([label frame]) + 10,
                80, 18
        )] ;
        
    [button setAutoresizingMask:CPViewMinXMargin |
                                CPViewMaxXMargin |
                                CPViewMinYMargin |
                                CPViewMaxYMargin] ;
                                
    [button setTitle:"swap"] ;
    
    [button setTarget:self] ;
    [button setAction:@selector(swap:)];
        
    [contentView addSubview:button] ;

    [theWindow orderFront:self];

    // Uncomment the following line to turn on the standard menu bar.
    //[CPMenu setMenuBarVisible:YES];
}

- (void)swap:(id)sender
{
    if ([label stringValue] == "Hello World!")
        [label setStringValue:"Goodbye!"] ;
    else
        [label setStringValue:"Hello World!"] ;
}

@end
