/*
 * AppController.j
 *
 * Created by __Me__ on __Date__.
 * Copyright 2008 __MyCompanyName__. All rights reserved.
 */

@import <Foundation/CPObject.j>


@implementation AppController : CPObject
{
    CPCollectionView listCollectionView ;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

    // create the button
    var searchButton = [[CPButton alloc] initWithFrame:CGRectMake(10, 10, 150, 18)] ;
    [searchButton setFont: [CPFont boldSystemFontOfSize: 12.0]] ;
    [searchButton setTitle: @"New Twitter search"] ;
    [searchButton setAction:@selector(newSearch:)] ;
    [contentView addSubview:searchButton] ;
    
    // create the search results area
    var searchResultsArea = [[CPScrollView alloc] initWithFrame:CGRectMake(0.0, 40.0, CGRectGetWidth([contentView bounds]), CGRectGetHeight([contentView bounds]) - 40.0)];
    [searchResultsArea setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable] ;
    [searchResultsArea setAutohidesScrollers:YES] ;
    
    var searchResultItem = [[CPCollectionViewItem alloc] init] ;
    [searchResultItem setView:[[SearchResultCell alloc] initWithFrame:CGRectMakeZero()]] ;
    
    listCollectionView = [[CPCollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([contentView bounds]), 60.0)];
    
    [listCollectionView setDelegate:self] ;
    [listCollectionView setItemPrototype:searchResultItem] ;
    
    [listCollectionView setMinItemSize:CGSizeMake(CGRectGetWidth([contentView bounds]) - 20.0, 60.0)] ;
    [listCollectionView setMaxItemSize:CGSizeMake(CGRectGetWidth([contentView bounds]) - 20.0, 60.0)] ;
    [listCollectionView setAutoresizingMask:CPViewWidthSizable] ;
    
    [searchResultsArea setDocumentView:listCollectionView] ;
    
    [contentView addSubview:searchResultsArea] ;
    
    [theWindow orderFront:self];
}

- (void)newSearch:(id)sender
{
    var userInput = prompt("Enter a search keyword") ;
    
    if (prompt) 
    {
        var request = [CPURLRequest requestWithURL:"http://search.twitter.com/search.json?q=" + encodeURIComponent(userInput)] ;
        twitterConnection = [CPJSONPConnection connectionWithRequest:request callback:"callback" delegate:self] ;
    }
}

- (void)connection:(CPJSONPConnection)aConnection didReceiveData:(CPString)data
{
    [self showSearchResults:data.results] ;
}

- (void)connection:(CPJSONPConnection)aConnection didFailWithError:(CPString)error
{
    alert(error) ;
}

- (void)showSearchResults:(CPArray)results
{
    [listCollectionView setContent:results] ;
}

@end

@implementation SearchResultCell : CPView
{
    CPTextField _label ;
}

- (void)setRepresentedObject:(JSObject)anObject
{
    if (!_label)
    {
        _label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()] ;
        [_label setFont:[CPFont systemFontOfSize:12.0]];
        [_label setTextColor:[CPColor blackColor]] ;
        [self addSubview:_label];
    }
    
    var stringValue = "@" + anObject.from_user + " : " ;
    stringValue+= anObject.text ;
    stringValue+= " (http://twitter.com/" + anObject.from_user + "/status/" + anObject.id + ")" ;
    
    [_label setStringValue:stringValue] ;
    [_label setFrameSize:CGSizeMake(600.0, 60.0)] ;
    [_label setFrameOrigin:CGPointMake(10, 0)] ;
    [_label setLineBreakMode:CPLineBreakByWordWrapping] ;
}

- (void)setSelected:(BOOL)isSelected
{
    [self setBackgroundColor:isSelected ? [CPColor blueColor] : nil] ;
    [_label setTextColor:isSelected ? [CPColor whiteColor] : [CPColor blackColor]] ;
}
@end