/*
 * AppController.j
 * BlogApp
 *
 * Created by Thomas Balthazar on November 16, 2009.
 * Copyright 2009, Suit My Mind SPRL All rights reserved.
 */

@import <Foundation/CPObject.j>
@import "PostsController.j"
@import "Post.j"
@import "PostItemView.j"

@implementation AppController : CPObject
{
    @outlet CPWindow    theWindow; //this "outlet" is connected automatically by the Cib
    @outlet CPCollectionView    postListCollectionView;
    @outlet CPTextField         detailsView;
    @outlet PostsController     postsController;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    [postsController loadPosts] ;
}

- (void)awakeFromCib
{
    [postListCollectionView setSelectable:YES];
    [postListCollectionView setMinItemSize:CGSizeMake(CGRectGetWidth([postListCollectionView bounds]), 20)];
    [postListCollectionView setMaxItemSize:CGSizeMake(CGRectGetWidth([postListCollectionView bounds]), 20)];

    itemPrototype = [[CPCollectionViewItem alloc] init];
    [itemPrototype setView:[[PostItemView alloc] initWithFrame:CGRectMake(0.0, 0.0, CGRectGetWidth([postListCollectionView bounds]), 20)]];
    [postListCollectionView setItemPrototype:itemPrototype];

    [postsController setPostListCollectionView:postListCollectionView];
    [postsController setDetailsView:detailsView];
}

@end
