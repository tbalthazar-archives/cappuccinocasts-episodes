@import <AppKit/CPTextField.j>

@implementation PostDetailsView : CPTextField
{
}

- (id)initWithFrame:(CGRect)aFrame 
{
    self = [super initWithFrame:aFrame];
    if(self)
    {
        [self setFont:[CPFont boldSystemFontOfSize:12.0]];
        [self setTextColor:[CPColor blackColor]];
        [self setLineBreakMode:CPLineBreakByWordWrapping];
        [self setAutoresizingMask:CPViewWidthSizable];
	}
	return self;
}
@end