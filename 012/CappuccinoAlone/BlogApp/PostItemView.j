@import <AppKit/CPView.j>

@implementation PostItemView : CPView
{
    CPTextField title;
}

- (void)setRepresentedObject:(id)anObject
{    
    if (!title)
    {
        title = [[CPTextField alloc] initWithFrame:CGRectMake (0.0, 0.0, 150.0, 20.0)];
        
        [title setFont:[CPFont boldSystemFontOfSize:12.0]];
        [self addSubview:title];
    }
        
    [title setStringValue:[anObject title]];
}

- (void)setSelected:(BOOL)isSelected
{
    [self setBackgroundColor:isSelected ? [CPColor colorWithHexString:"3d80df"] : nil];
    [title setTextColor:isSelected ? [CPColor whiteColor] : [CPColor blackColor]];
}

@end
