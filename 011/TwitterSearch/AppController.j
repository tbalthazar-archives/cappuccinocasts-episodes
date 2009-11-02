/*
 * AppController.j
 * TwitterSearch
 *
 * Created by Thomas Balthazar on November 1, 2009.
 * Copyright 2009, Suit My Mind SPRL All rights reserved.
 */

@import <Foundation/CPObject.j>
@import "SMMTweet.j"


@implementation AppController : CPObject
{
    CPArray     tweets;
    CPTableView tableView;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

    // create the search field
    var searchField = [[CPSearchField alloc] initWithFrame:CGRectMake(0.0, 10.0, 200.0, 30.0)];
    [searchField setEditable:YES];
    [searchField setPlaceholderString:@"search and hit enter"];
    [searchField setBordered:YES];
    [searchField setBezeled:YES];
    [searchField setFont:[CPFont systemFontOfSize:12.0]];
    [searchField setTarget:self];
    [searchField setAction:@selector(performSearch:)];
    [searchField setSendsWholeSearchString:YES];
    

    // create a CPScrollView that will contain the CPTableView
    var scrollView = [[CPScrollView alloc] initWithFrame:CGRectMake(0.0, 50.0, 965.0, 200.0)];
    [scrollView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    
    // create the CPTableView
    tableView = [[CPTableView alloc] initWithFrame:[scrollView bounds]];
    [tableView setDataSource:self];
    [tableView setUsesAlternatingRowBackgroundColors:YES];
    
    // define the header color
    var headerColor = [CPColor colorWithPatternImage:[[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"button-bezel-center.png"]]];
    
    [[tableView cornerView] setBackgroundColor:headerColor];
    
    
    // add the first column
    var column = [[CPTableColumn alloc] initWithIdentifier:@"TwitterUserName"];
    [[column headerView] setStringValue:"Twitter User Name"];
    [[column headerView] setBackgroundColor:headerColor];
    [column setWidth:125.0];
    [tableView addTableColumn:column];

    // add the second column
    var column = [[CPTableColumn alloc] initWithIdentifier:@"Tweet"];
    [[column headerView] setStringValue:"Tweet"];
    [[column headerView] setBackgroundColor:headerColor];
    [column setWidth:825.0];
    [tableView addTableColumn:column];
    

    [scrollView setDocumentView:tableView];

    [contentView addSubview:searchField];
    [contentView addSubview:scrollView];
    [theWindow orderFront:self];
}


// ---
// CPTableView datasource methods
- (int)numberOfRowsInTableView:(CPTableView)tableView
{
    return [tweets count];
}

- (id)tableView:(CPTableView)tableView objectValueForTableColumn:(CPTableColumn)tableColumn row:(int)row
{
    if ([tableColumn identifier]===@"TwitterUserName")
        return @"@"+[tweets[row] fromUser];
    else
    	return [tweets[row] text];
}

// --- 
// Connection to Twitter
- (void)performSearch:(id)sender
{
    var userInput = [sender stringValue];
    
    if (userInput!=="") {
        var request = [CPURLRequest requestWithURL:"http://search.twitter.com/search.json?q=" + encodeURIComponent(userInput)] ;
        twitterConnection = [CPJSONPConnection connectionWithRequest:request callback:"callback" delegate:self] ;
    }
}

- (void)connection:(CPJSONPConnection)aConnection didReceiveData:(CPString)data
{
    tweets = [SMMTweet initWithJSONObjects:data.results];
    [tableView reloadData];    
}

- (void)connection:(CPJSONPConnection)aConnection didFailWithError:(CPString)error
{
    alert(error) ;
}


@end
