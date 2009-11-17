@import <Foundation/CPObject.j>

@implementation Post : CPObject
{
    CPString title @accessors;
    CPString body @accessors;
    int      id @accessors;
}

- (id)init
{
    self = [super init] ;
    
    if (self)
    {
        id      = 0;
        title   = @"" ;
        body    = @"" ;
    }
    
    return self ;
}

- (id)initFromJSONObject:(CPString)aJSONObject
{
    self = [self init] ;
    
    if (self)
    {
        id      = aJSONObject.id ;
        title   = aJSONObject.title ;
        body    = aJSONObject.body ;
    }
    
    return self ;
}

+ (CPArray)initFromJSONObjects:(CPString)someJSONObjects
{
    var posts   = [[CPArray alloc] init] ;
    
    for (var i=0; i < someJSONObjects.length; i++) {
        var post    = [[Post alloc] initFromJSONObject:someJSONObjects[i].post] ;
        [posts addObject:post] ;
    };
    
    return posts ;
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
