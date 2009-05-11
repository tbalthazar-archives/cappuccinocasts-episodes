@import <Foundation/CPObject.j>

@implementation Post : CPObject
{
    CPString title @accessors;
    CPString body @accessors;
}

- (id)init
{
    self = [super init] ;
    
    if (self)
    {
        title   = @"" ;
        body    = @"" ;
    }
    
    return self ;
}

+ (CPArray)getExamplePosts
{
    var array   = [[CPArray alloc] init] ;
    var post    = [[Post alloc] init] ;
    
    [post setTitle:@"This is the first post"] ;
    [post setBody:@"This is the body of the first post"] ;
    [array addObject:post] ;
     
    post    = [[Post alloc] init] ;
    [post setTitle:@"This is the second post"] ;
    [post setBody:@"This is the body of the second post"] ;
    [array addObject:post] ;
    
    post    = [[Post alloc] init] ;
    [post setTitle:@"This is the third post"] ;
    [post setBody:@"This is the body of the third post"] ;
    [array addObject:post] ;
    
    post    = [[Post alloc] init] ;
    [post setTitle:@"This is the fourth post"] ;
    [post setBody:@"This is the body of the fourth post"] ;
    [array addObject:post] ;
    
    post    = [[Post alloc] init] ;
    [post setTitle:@"This is the fifth post"] ;
    [post setBody:@"This is the body of the fifth post"] ;
    [array addObject:post] ;
    
    post    = [[Post alloc] init] ;
    [post setTitle:@"This is the sixth post"] ;
    [post setBody:@"This is the body of the sixth post"] ;
    [array addObject:post] ;
            
    return array ;
}

@end
