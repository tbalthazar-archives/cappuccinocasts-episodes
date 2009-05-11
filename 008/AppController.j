/*
 * AppController.j
 * 008
 *
 * Created by __Me__ on __Date__.
 * Copyright 2008 __MyCompanyName__. All rights reserved.
 */

@import <Foundation/CPObject.j>
@import "ToolbarDelegate.j"
@import "PostListView.j"
@import "PostItemView.j"
@import "Post.j"
@import "PostsController.j"
@import "PostDetailsView.j"


@implementation AppController : CPObject
{
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

    // -- the posts controller
    var postsController  = [[PostsController alloc] init] ;

    // --- the toolbar
    var toolbar = [[CPToolbar alloc] initWithIdentifier:"Posts"] ;
    var toolbarDelegate = [[ToolbarDelegate alloc] init] ;
    [toolbar setDelegate:toolbarDelegate] ;
    [toolbar setVisible:YES] ;
    [theWindow setToolbar:toolbar] ;

    // -- the split view
    var splitView = [[CPSplitView alloc] initWithFrame:CGRectMake(0.0, 0.0, CGRectGetWidth([contentView bounds]), CGRectGetHeight([contentView bounds]))];
    [splitView setVertical:NO] ;
    [splitView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable ]; 
    [contentView addSubview:splitView] ;

    // --- the posts scroll view
    var postListScrollView = [[CPScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, CGRectGetWidth([contentView bounds]), 200.0)] ;
    [postListScrollView setHasHorizontalScroller:NO] ;
    [postListScrollView setAutohidesScrollers:YES] ;
    [splitView addSubview:postListScrollView] ;

    // --- the post details scroll view
    var postDetailsScrollView = [[CPScrollView alloc] initWithFrame:CGRectMake(0.0, 200.0, CGRectGetWidth([contentView bounds]), CGRectGetHeight([contentView bounds]) - 200.0)] ;
    [postDetailsScrollView setHasHorizontalScroller:NO] ;
    [postDetailsScrollView setAutohidesScrollers:YES] ;
    [splitView addSubview:postDetailsScrollView] ;

    // --- the posts collection view
    var postListView = [[PostListView alloc] initWithFrame:CGRectMake(0.0, 0.0, CGRectGetWidth([contentView bounds]), 200.0)] ;
    [postListView setDelegate:postsController] ;
    [postsController setPostListView:postListView] ;
    [postsController loadExamplePosts] ;
    [postListScrollView setDocumentView:postListView] ;

    // --- the post details view
    var detailsListView = [[PostDetailsView alloc] initWithFrame:CGRectMake(0.0, 0.0, CGRectGetWidth([contentView bounds]), CGRectGetHeight([contentView bounds]) - 200.0)] ;
    [postsController setPostDetailsView:detailsListView] ;
    [postDetailsScrollView setDocumentView:detailsListView] ;

    [theWindow orderFront:self];
}

@end
