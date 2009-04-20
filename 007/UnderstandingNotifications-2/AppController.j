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
    // In the screencast, I renamed contentView -> _contentView and slider -> _slider.
    // It is a good guideline *not* to use the _ for the instance variables in your code
    // to avoid conflict with Cappuccino super class instance variables
    // Thanks to Ross for pointing this out.
    CPView      contentView ;
    CPSlider    slider ;
    CPSlider    right_slider ;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];
    
    // slider
    slider = [[CPSlider alloc] initWithFrame:CGRectMake((CGRectGetWidth([contentView bounds]) - 310.0) / 2.0, 60.0, 100.0, 16.0)];
    [slider setMinValue:50.0];
    [slider setMaxValue:250.0];
    [slider setValue:50.0] ;
    [slider setTarget:self];
    [slider setAction:@selector(sliderChangedValue:)];
    [contentView addSubview:slider];
    
    // right slider
    right_slider = [[CPSlider alloc] initWithFrame:CGRectMake((CGRectGetWidth([contentView bounds]) + 10.0) / 2.0, 60.0, 100.0, 16.0)];
    [right_slider setMinValue:50.0];
    [right_slider setMaxValue:250.0];
    [right_slider setValue:50.0] ;
    [right_slider setTarget:self];
    [right_slider setAction:@selector(sliderChangedValue:)];
    [contentView addSubview:right_slider];
    
    // button
    var button = [[CPButton alloc] initWithFrame:CGRectMake((CGRectGetWidth([contentView bounds]) - 310.0) / 2.0, 20.0, 150.0, 24.0)] ;
    [button setTitle:@"Create a new Window"] ;
    [button setTarget:self] ;
    [button setAction:@selector(createNewWindowLinkedToLeftSlider:)] ;
    [contentView addSubview:button] ;
    
    // right button
    var right_button = [[CPButton alloc] initWithFrame:CGRectMake((CGRectGetWidth([contentView bounds]) + 10.0) / 2.0, 20.0, 150.0, 24.0)] ;
    [right_button setTitle:@"Create a new Window"] ;
    [right_button setTarget:self] ;
    [right_button setAction:@selector(createNewWindowLinkedToRightSlider:)] ;
    [contentView addSubview:right_button] ;
    
    [theWindow orderFront:self];
}

- (void)sliderChangedValue:(id)sender
{
    [[CPNotificationCenter defaultCenter]
        postNotificationName:@"MYSliderDidChangeValue" object:sender] ;
}

- (void)createNewWindowLinkedToLeftSlider:(id)sender
{
    [self createNewWindow:sender linkedToSlider:slider] ;
}

- (void)createNewWindowLinkedToRightSlider:(id)sender
{
    [self createNewWindow:sender linkedToSlider:right_slider] ;
}

- (void)createNewWindow:(id)sender linkedToSlider:(CPSlider)aSlider
{
    var widowSize = [aSlider value] ;
    var window = [[MyWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPClosableWindowMask linkedToSlider:aSlider] ;
    [window setFrameOrigin:CGPointMake((CGRectGetWidth([contentView bounds]) - widowSize) / 2.0, 120.0)] ;
    [window setFrameSize:CGSizeMake(widowSize, widowSize)] ;
    
    [window orderFront:self] ;
}

@end

@implementation MyWindow : CPWindow
{
}

- (id)initWithContentRect:(CGRect)aContentRect styleMask:(unsigned int)aStyleMask linkedToSlider:(CPSlider)aSlider
{
    self = [super initWithContentRect:aContentRect styleMask:aStyleMask] ;
    
    if (self)
    {
        [[CPNotificationCenter defaultCenter ]
            addObserver:self
               selector:@selector(resizeWindow:)
                   name:@"MYSliderDidChangeValue" 
                 object:aSlider];
        
        return self ;
    }
}

- (void)resizeWindow:(CPNotification)aNotification
{
    var slider = [aNotification object] ;
    
    [self setFrameSize:CGSizeMake([slider value], [slider value])] ;
}


@end
