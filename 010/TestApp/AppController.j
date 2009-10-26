/*
 * AppController.j
 * TestApp
 *
 * Created by Thomas Balthazar on October 17, 2009.
 * Copyright 2009, Suit My Mind SPRL All rights reserved.
 */

@import <Foundation/CPObject.j>


@implementation AppController : CPObject
{
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    CPLogRegister(CPLogConsole); 
    
    var theWindow   = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() 
                                                  styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

    var label = [CPTextField textFieldWithStringValue:nil
                                          placeholder:@"a string"
                                                width:100];

    [label setCenter:[contentView center]];
    [label setTarget:self];
    [label setAction:@selector(alert:)];

    [contentView addSubview:label];
    [theWindow orderFront:self];
}

- (IBAction)alert:(id)sender
{
    CPLog.debug([sender stringValue]);
}

@end
