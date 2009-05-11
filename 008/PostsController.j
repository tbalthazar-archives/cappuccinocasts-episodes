@import <Foundation/CPObject.j>

@implementation PostsController : CPObject
{
    PostListView            postListView @accessors;
    PostDetailsView         postDetailsView @accessors ;
}

- (void)collectionViewDidChangeSelection:(CPCollectionView)collectionView
{
    var currentObject = [collectionView getCurrentObject] ;
    
    [postDetailsView setStringValue:[currentObject body]] ;
}

- (void)loadExamplePosts
{
    var posts = [Post getExamplePosts] ;
    [postListView setContent:posts] ;
}

@end
