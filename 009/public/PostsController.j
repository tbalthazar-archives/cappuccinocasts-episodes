@import <Foundation/CPObject.j>

@implementation PostsController : CPObject
{
    PostListView            postListView @accessors;
    PostDetailsView         postDetailsView @accessors;
    CPString                baseURL;
    CPCollectionViewItem    currentObject;
    CPURLConnection         listConnection;
    CPURLConnection         addConnection;
    CPURLConnection         updateConnection;
    CPURLConnection         deleteConnection;
}

- (id)init
{
    self = [super init] ;
    
    if (self)
    {
        baseURL = "http://0.0.0.0:3000" ;
    }
    
    return self ;
}

- (void)collectionViewDidChangeSelection:(CPCollectionView)collectionView
{
    currentObject = [collectionView getCurrentObject] ;
    
    [postDetailsView setStringValue:[currentObject body]] ;
}

- (void)loadExamplePosts
{
    var posts = [Post getExamplePosts] ;
    [postListView setContent:posts] ;
}

- (void)addItem:(id)sender
{
    var title = prompt("Enter the title") ;
    var body  = prompt("Enter the body") ;
    
    if (title!=="" && body!=="")
    {
        var JSONString = '{"post":{"title":"'+title+'","body":"'+body+'"}}'

        var request     = [CPURLRequest requestWithURL:baseURL + "/posts.json"];
        [request setHTTPMethod: "POST"];
        [request setHTTPBody: JSONString];
        [request setValue:"application/json" forHTTPHeaderField:"Accept"] ;
        [request setValue:"application/json" forHTTPHeaderField:"Content-Type"] ;
        addConnection  = [CPURLConnection connectionWithRequest:request delegate:self];
    }
    else
    {
        alert("Please provide a value for both title and body");
    }
}

- (void)editSelectedItem:(id)sender
{
    var title = prompt("Modify the title", [currentObject title]) ;
    var body  = prompt("Modify the body", [currentObject body]) ;

    if (title!=="" && body!=="")
    {
        var JSONString = '{"post":{"title":"'+title+'","body":"'+body+'"}}'
        var request     = [CPURLRequest requestWithURL:baseURL + "/posts/" + [currentObject id] + ".json"];
        [request setHTTPMethod: "PUT"];
        [request setHTTPBody: JSONString];
        [request setValue:"application/json" forHTTPHeaderField:"Accept"] ;
        [request setValue:"application/json" forHTTPHeaderField:"Content-Type"] ;
        updateConnection  = [CPURLConnection connectionWithRequest:request delegate:self];
    }
    else
    {
        alert("Please provide a value for both title and body");
    }
}

- (void)removeSelectedItem:(id)sender
{
    if (confirm('Are you sure?'))
    {
        var request     = [CPURLRequest requestWithURL:baseURL + "/posts/" + currentObject.id + ".json"];
        [request setHTTPMethod: "DELETE"];
        [request setValue:"application/json" forHTTPHeaderField:"Accept"] ;
        [request setValue:"application/json" forHTTPHeaderField:"Content-Type"] ;
        deleteConnection  = [CPURLConnection connectionWithRequest:request delegate:self];
    }
}

- (void)loadPosts
{
    var request     = [CPURLRequest requestWithURL:baseURL + "/posts.json"];
    [request setHTTPMethod: "GET"];
    listConnection  = [CPURLConnection connectionWithRequest:request delegate:self];
}

- (void)connection:(CPURLConnection)connection didReceiveData:(CPString)data
{
    if (connection===listConnection)
    {
        var results = CPJSObjectCreateWithJSON(data);
        var posts = [Post initFromJSONObjects:results] ;
        
        [postListView setContent:posts] ;
        [postListView setSelectionIndexes:[[CPIndexSet alloc] initWithIndex:0] ] ;
    }
    else if (connection===addConnection)
    {
        [self loadPosts] ;
    }
    else if (connection===updateConnection)
    {
        [self loadPosts] ;
    }
    else if (connection===deleteConnection)
    {
        [self loadPosts] ;
    }
}

- (void)connection:(CPURLConnection)connection didFailWithError:(CPString)error
{
    alert("Connection did fail with error : " + error) ;
}

- (void)connectionDidFinishLoading:(CPURLConnection)aConnection
{
    console.log("Connection did finish loading.") ;
}
@end
