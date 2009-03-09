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

    var thePanel = [[CPPanel alloc] initWithContentRect:CGRectMake(10.0, 30.0, 225.0, 125.0) styleMask:CPHUDBackgroundWindowMask | CPClosableWindowMask],
        panelContentView = [thePanel contentView];

    [thePanel setDelegate:self];

    label = [[CPTextField alloc] initWithFrame:CGRectMake(75.0, 37.5, 75.0, 25.0)] ;
    [label setBezeled:YES];
    [label setBezelStyle:CPTextFieldSquareBezel];
    [label setPlaceholderString:@"Enter text"];
    [label setEditable:YES];

    [panelContentView addSubview:label];

    [theWindow orderFront:self];
    [thePanel orderFront:self];
}

-(BOOL)windowShouldClose:(id)window
{
    if ([label stringValue]==[label placeholderString])
    {
        return true;
    }
    else
    {
        return confirm('Are you sure?');
    }

}

@end
