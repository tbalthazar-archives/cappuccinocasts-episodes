@import <Foundation/CPObject.j>

var AddToolbarItemIdentifier    = "AddToolbarItemIdentifier",
    EditToolbarItemIdentifier   = "EditToolbarItemIdentifier",
    RemoveToolbarItemIdentifier = "RemoveToolbarItemIdentifier";

@implementation ToolbarDelegate : CPObject
{
}

- (CPArray)toolbarAllowedItemIdentifiers:(CPToolbar)aToolbar
{
    return [AddToolbarItemIdentifier, RemoveToolbarItemIdentifier, EditToolbarItemIdentifier];
}

- (CPArray)toolbarDefaultItemIdentifiers:(CPToolbar)aToolbar
{
   return [AddToolbarItemIdentifier, RemoveToolbarItemIdentifier, EditToolbarItemIdentifier];
}

- (CPToolbarItem)toolbar:(CPToolbar)aToolbar itemForItemIdentifier:(CPString)anItemIdentifier willBeInsertedIntoToolbar:(BOOL)aFlag
{
    var toolbarItem = [[CPToolbarItem alloc] initWithItemIdentifier:anItemIdentifier];
	var mainBundle = [CPBundle mainBundle];

    if (anItemIdentifier === AddToolbarItemIdentifier)
    {
    	var image = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"add.png"] size:CPSizeMake(30, 25)];
    	var highlighted = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"addHighlighted.png"] size:CPSizeMake(30, 25)];

    	[toolbarItem setImage:image];
    	[toolbarItem setAlternateImage:highlighted];

    	[toolbarItem setLabel:"Add blog post"];

    	[toolbarItem setMinSize:CGSizeMake(32, 32)];
    	[toolbarItem setMaxSize:CGSizeMake(32, 32)];
    }
    else if (anItemIdentifier === RemoveToolbarItemIdentifier)
    {
    	var image = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"remove.png"] size:CPSizeMake(30, 25)];
    	var highlighted = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"removeHighlighted.png"] size:CPSizeMake(30, 25)];

    	[toolbarItem setImage:image];
    	[toolbarItem setAlternateImage:highlighted];

    	[toolbarItem setLabel:"Remove blog post"];

    	[toolbarItem setMinSize:CGSizeMake(32, 32)];
    	[toolbarItem setMaxSize:CGSizeMake(32, 32)];
    }
    else if (anItemIdentifier === EditToolbarItemIdentifier)
    {
    	var image = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"edit.png"] size:CPSizeMake(30, 25)];
    	var highlighted = [[CPImage alloc] initWithContentsOfFile:[mainBundle pathForResource:@"editHighlighted.png"] size:CPSizeMake(30, 25)];

    	[toolbarItem setImage:image];
    	[toolbarItem setAlternateImage:highlighted];

    	[toolbarItem setLabel:"Edit blog post"];

    	[toolbarItem setMinSize:CGSizeMake(32, 32)];
    	[toolbarItem setMaxSize:CGSizeMake(32, 32)];
    }
    
    return toolbarItem;
}

@end