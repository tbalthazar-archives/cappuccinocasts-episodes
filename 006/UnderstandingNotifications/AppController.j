/*
 * AppController.j
 * 006
 *
 * Created by __Me__ on __Date__.
 * Copyright 2008 __MyCompanyName__. All rights reserved.
 */

@import <Foundation/CPObject.j>


@implementation AppController : CPObject
{
    CPView      _contentView ;
    CPSlider    _slider ;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        _contentView = [theWindow contentView];
    
    // slider
    _slider = [[CPSlider alloc] initWithFrame:CGRectMake((CGRectGetWidth([_contentView bounds]) - 100.0) / 2.0, 60.0, 100.0, 16.0)];
    [_slider setMinValue:50.0];
    [_slider setMaxValue:250.0];
    [_slider setValue:50.0] ;
    [_slider setTarget:self];
    [_slider setAction:@selector(sliderChangedValue:)];
    [_contentView addSubview:_slider];
    
    // button
    var button = [[CPButton alloc] initWithFrame:CGRectMake((CGRectGetWidth([_contentView bounds]) - 150.0) / 2.0, 20.0, 150.0, 24.0)] ;
    [button setTitle:@"Create a new Window"] ;
    [button setTarget:self] ;
    [button setAction:@selector(createNewWindow:)] ;
    [_contentView addSubview:button] ;
    
    [theWindow orderFront:self];
}

- (void)sliderChangedValue:(id)sender
{
    [[CPNotificationCenter defaultCenter]
        postNotificationName:@"MYSliderDidChangeValue" object:sender] ;
}

- (void)createNewWindow:(id)sender
{
    var widowSize = [_slider value] ;
    var window = [[MyWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPClosableWindowMask] ;
    [window setFrameOrigin:CGPointMake((CGRectGetWidth([_contentView bounds]) - widowSize) / 2.0, 120.0)] ;
    [window setFrameSize:CGSizeMake(widowSize, widowSize)] ;
    
    [window orderFront:self] ;
}

@end

@implementation MyWindow : CPWindow
{
}

- (id)initWithContentRect:(CGRect)aContentRect styleMask:(unsigned int)aStyleMask
{
    self = [super initWithContentRect:aContentRect styleMask:aStyleMask] ;
    
    if (self)
    {
        [[CPNotificationCenter defaultCenter ]
            addObserver:self
               selector:@selector(resizeWindow:)
                   name:@"MYSliderDidChangeValue" 
                 object:nil];
        
        return self ;
    }
}

- (void)resizeWindow:(CPNotification)aNotification
{
    var slider = [aNotification object] ;
    
    [self setFrameSize:CGSizeMake([slider value], [slider value])] ;
}


@end
