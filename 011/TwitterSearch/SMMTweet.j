@import <Foundation/CPObject.j>


@implementation SMMTweet : CPObject
{
    CPString fromUser   @accessors;
    CPString text       @accessors;
}

- (id)initWithJSONObject:(JSObject)anObject
{
    self = [super init] ;
    
    if (self) 
    {
        fromUser    = anObject.from_user;
        text        = anObject.text;
    }

    return self;
}

+ (CPArray)initWithJSONObjects:(CPArray)someJSONObjects
{
    var tweets   = [[CPArray alloc] init];
    
    for (var i=0; i < someJSONObjects.length; i++) {
        var tweet = [[SMMTweet alloc] initWithJSONObject:someJSONObjects[i]] ;
        [tweets addObject:tweet] ;
    };
    
    return tweets ;
}



@end