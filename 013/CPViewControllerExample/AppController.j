/*
 * AppController.j
 * CPViewControllerExample
 *
 * Created by Thomas Balthazar on January 23, 2010.
 * Copyright 2010, Suit My Mind SPRL All rights reserved.
 */

@import <Foundation/CPObject.j>


@implementation AppController : CPObject
{
    @outlet CPWindow    theWindow; //this "outlet" is connected automatically by the Cib
    @outlet CPView      mainView;
    CPViewController    mainViewController;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things. 
}

- (@action)buttonClicked:(id)anObject
{
    console.log('-- button clicked : ' + [anObject tag]);

    var cibName;

    if ([mainViewController view])
        [[mainViewController view] removeFromSuperview];

    switch(parseInt([anObject tag]))
    {
        case 1:
            cibName = @"View1";
            break;

        case 2:
            cibName = @"View2";
            break;
    }

    mainViewController = [[CPViewController alloc] initWithCibName:cibName
                                                        bundle:nil];
    [[mainViewController view] setFrame:[mainView bounds]];
    [mainView addSubview:[mainViewController view]]; 
    console.log('-- nb subviews : ' + [[mainView subviews] count]);
}
@end