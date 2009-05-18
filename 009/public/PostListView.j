@import <AppKit/CPCollectionView.j>

@implementation PostListView : CPCollectionView
{
    CPCollectionViewItem itemPrototype;
}

- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];
    if (self)
    {
        [self setMinItemSize:CGSizeMake(CGRectGetWidth([self bounds]), 20)];
        [self setMaxItemSize:CGSizeMake(CGRectGetWidth([self bounds]), 20)];
    
        itemPrototype = [[CPCollectionViewItem alloc] init];
        [itemPrototype setView:[[PostItemView alloc] initWithFrame:CGRectMakeZero()]];
        [self setItemPrototype:itemPrototype];
    }

    return self;
}

- (id)getCurrentObject
{
    return [[self content] objectAtIndex:[self getSelectedIndex]] ;
}

- (int)getSelectedIndex
{
    return [[self selectionIndexes] firstIndex] ;
}

@end
