i;10;CPButton.ji;12;CPGeometry.ji;8;CPMenu.ji;12;CPMenuItem.jc;16956;
var VISIBLE_MARGIN = 7.0;
CPPopUpButtonStatePullsDown = 1 << 12;
{var the_class = objj_allocateClassPair(CPButton, "CPPopUpButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_selectedIndex"), new objj_ivar("_preferredEdge"), new objj_ivar("_menu")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:pullsDown:"), function(self, _cmd, aFrame, shouldPullDown)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "initWithFrame:", aFrame);
    if (self)
    {
        _selectedIndex = CPNotFound;
        _preferredEdge = CPMaxYEdge;
        objj_msgSend(self, "setValue:forThemedAttributeName:", CPImageLeft, "image-position");
        objj_msgSend(self, "setValue:forThemedAttributeName:", CPLeftTextAlignment, "alignment");
        objj_msgSend(self, "setValue:forThemedAttributeName:", CPLineBreakByTruncatingTail, "line-break-mode");
        objj_msgSend(self, "setMenu:", objj_msgSend(objj_msgSend(CPMenu, "alloc"), "initWithTitle:", ""));
        objj_msgSend(self, "setPullsDown:", shouldPullDown);
    }
    return self;
}
}), new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    return objj_msgSend(self, "initWithFrame:pullsDown:", aFrame, NO);
}
}), new objj_method(sel_getUid("setPullsDown:"), function(self, _cmd, shouldPullDown)
{ with(self)
{
    if ((!!(_controlState & CPPopUpButtonStatePullsDown)) === shouldPullDown)
        return;
    if (shouldPullDown)
        _controlState |= CPPopUpButtonStatePullsDown;
    else
        _controlState &= ~CPPopUpButtonStatePullsDown;
    var items = objj_msgSend(_menu, "itemArray");
    if (objj_msgSend(items, "count") <= 0)
        return;
    objj_msgSend(items[0], "setHidden:", objj_msgSend(self, "pullsDown"));
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
}), new objj_method(sel_getUid("pullsDown"), function(self, _cmd)
{ with(self)
{
    return _controlState & CPPopUpButtonStatePullsDown;
}
}), new objj_method(sel_getUid("addItem:"), function(self, _cmd, anItem)
{ with(self)
{
    objj_msgSend(_menu, "addItem:", anItem);
}
}), new objj_method(sel_getUid("addItemWithTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    objj_msgSend(_menu, "addItemWithTitle:action:keyEquivalent:", aTitle, NULL, nil);
}
}), new objj_method(sel_getUid("addItemsWithTitles:"), function(self, _cmd, titles)
{ with(self)
{
    var index = 0,
        count = objj_msgSend(titles, "count");
    for (; index < count; ++index)
        objj_msgSend(self, "addItemWithTitle:", titles[index]);
}
}), new objj_method(sel_getUid("insertItemWithTitle:atIndex:"), function(self, _cmd, aTitle, anIndex)
{ with(self)
{
    var items = objj_msgSend(self, "itemArray"),
        count = objj_msgSend(items, "count");
    while (count--)
        if (objj_msgSend(items[count], "title") == aTitle)
            objj_msgSend(self, "removeItemAtIndex:", count);
    objj_msgSend(_menu, "insertItemWithTitle:action:keyEquivalent:atIndex:", aTitle, NULL, nil, anIndex);
}
}), new objj_method(sel_getUid("removeAllItems"), function(self, _cmd)
{ with(self)
{
    var count = objj_msgSend(_menu, "numberOfItems");
    while (count--)
        objj_msgSend(_menu, "removeItemAtIndex:", 0);
}
}), new objj_method(sel_getUid("removeItemWithTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    objj_msgSend(self, "removeItemAtIndex:", objj_msgSend(self, "indexOfItemWithTitle:", aTitle));
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
}), new objj_method(sel_getUid("removeItemAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    objj_msgSend(_menu, "removeItemAtIndex:", anIndex);
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
}), new objj_method(sel_getUid("selectedItem"), function(self, _cmd)
{ with(self)
{
    if (_selectedIndex < 0)
        return nil;
    return objj_msgSend(_menu, "itemAtIndex:", _selectedIndex);
}
}), new objj_method(sel_getUid("titleOfSelectedItem"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "selectedItem"), "title");
}
}), new objj_method(sel_getUid("indexOfSelectedItem"), function(self, _cmd)
{ with(self)
{
    return _selectedIndex;
}
}), new objj_method(sel_getUid("objectValue"), function(self, _cmd)
{ with(self)
{
    return _selectedIndex;
}
}), new objj_method(sel_getUid("selectItem:"), function(self, _cmd, aMenuItem)
{ with(self)
{
    objj_msgSend(self, "selectItemAtIndex:", objj_msgSend(self, "indexOfItem:", aMenuItem));
}
}), new objj_method(sel_getUid("selectItemAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    if (_selectedIndex == anIndex)
        return;
    if (_selectedIndex >= 0 && !objj_msgSend(self, "pullsDown"))
        objj_msgSend(objj_msgSend(self, "selectedItem"), "setState:", CPOffState);
    _selectedIndex = anIndex;
    if (_selectedIndex >= 0 && !objj_msgSend(self, "pullsDown"))
        objj_msgSend(objj_msgSend(self, "selectedItem"), "setState:", CPOnState);
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
}), new objj_method(sel_getUid("selectItemWithTag:"), function(self, _cmd, aTag)
{ with(self)
{
    objj_msgSend(self, "selectItemAtIndex:", objj_msgSend(self, "indexOfItemWithTag:", aTag));
}
}), new objj_method(sel_getUid("selectItemWithTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    objj_msgSend(self, "selectItemAtIndex:", objj_msgSend(self, "indexOfItemWithTitle:", aTitle));
}
}), new objj_method(sel_getUid("setObjectValue:"), function(self, _cmd, aValue)
{ with(self)
{
    objj_msgSend(self, "selectItemAtIndex:", objj_msgSend(aValue, "intValue"));
}
}), new objj_method(sel_getUid("menu"), function(self, _cmd)
{ with(self)
{
    return _menu;
}
}), new objj_method(sel_getUid("setMenu:"), function(self, _cmd, aMenu)
{ with(self)
{
    if (_menu === aMenu)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_menu)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPMenuDidAddItemNotification, _menu);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPMenuDidChangeItemNotification, _menu);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPMenuDidRemoveItemNotification, _menu);
    }
    _menu = aMenu;
    if (_menu)
    {
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidAddItem:"), CPMenuDidAddItemNotification, _menu);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidChangeItem:"), CPMenuDidChangeItemNotification, _menu);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidRemoveItem:"), CPMenuDidRemoveItemNotification, _menu);
    }
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
}), new objj_method(sel_getUid("numberOfItems"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_menu, "numberOfItems");
}
}), new objj_method(sel_getUid("itemArray"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_menu, "itemArray");
}
}), new objj_method(sel_getUid("itemAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(_menu, "itemAtIndex:", anIndex);
}
}), new objj_method(sel_getUid("itemTitleAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(objj_msgSend(_menu, "itemAtIndex:", anIndex), "title");
}
}), new objj_method(sel_getUid("itemTitles"), function(self, _cmd)
{ with(self)
{
    var titles = [],
        items = objj_msgSend(self, "itemArray"),
        index = 0,
        count = objj_msgSend(items, "count");
    for (; index < count; ++index)
        items.push(objj_msgSend(items[index], "title"));
}
}), new objj_method(sel_getUid("itemWithTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    return objj_msgSend(_menu, "itemAtIndex:", objj_msgSend(_menu, "indexOfItemWithTitle:", aTitle));
}
}), new objj_method(sel_getUid("lastItem"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(_menu, "itemArray"), "lastObject");
}
}), new objj_method(sel_getUid("indexOfItem:"), function(self, _cmd, aMenuItem)
{ with(self)
{
    return objj_msgSend(_menu, "indexOfItem:", aMenuItem);
}
}), new objj_method(sel_getUid("indexOfItemWithTag:"), function(self, _cmd, aTag)
{ with(self)
{
    return objj_msgSend(_menu, "indexOfItemWithTag:", aTag);
}
}), new objj_method(sel_getUid("indexOfItemWithTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    return objj_msgSend(_menu, "indexOfItemWithTitle:", aTitle);
}
}), new objj_method(sel_getUid("indexOfItemWithRepresentedObject:"), function(self, _cmd, anObject)
{ with(self)
{
    return objj_msgSend(_menu, "indexOfItemWithRepresentedObject:", anObject);
}
}), new objj_method(sel_getUid("indexOfItemWithTarget:action:"), function(self, _cmd, aTarget, anAction)
{ with(self)
{
    return objj_msgSend(_menu, "indexOfItemWithTarget:action:", aTarget, anAction);
}
}), new objj_method(sel_getUid("preferredEdge"), function(self, _cmd)
{ with(self)
{
    return _preferredEdge;
}
}), new objj_method(sel_getUid("setPreferredEdge:"), function(self, _cmd, aRectEdge)
{ with(self)
{
    _preferredEdge = aRectEdge;
}
}), new objj_method(sel_getUid("setTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    if (objj_msgSend(self, "title") === aTitle)
        return;
    if (objj_msgSend(self, "pullsDown"))
    {
        var items = objj_msgSend(_menu, "itemArray");
        if (objj_msgSend(items, "count") <= 0)
            objj_msgSend(self, "addItemWithTitle:", aTitle);
        else
        {
            objj_msgSend(items[0], "setTitle:", aTitle);
            objj_msgSend(self, "synchronizeTitleAndSelectedItem");
        }
    }
    else
    {
        var index = objj_msgSend(self, "indexOfItemWithTitle:", aTitle);
        if (index < 0)
        {
            objj_msgSend(self, "addItemWithTitle:", aTitle);
            index = objj_msgSend(self, "numberOfItems") - 1;
        }
        objj_msgSend(self, "selectItemAtIndex:", index);
    }
}
}), new objj_method(sel_getUid("setImage:"), function(self, _cmd, anImage)
{ with(self)
{
}
}), new objj_method(sel_getUid("synchronizeTitleAndSelectedItem"), function(self, _cmd)
{ with(self)
{
    var item = nil;
    if (objj_msgSend(self, "pullsDown"))
    {
        var items = objj_msgSend(_menu, "itemArray");
        if (objj_msgSend(items, "count") > 0)
            item = items[0];
    }
    else
        item = objj_msgSend(self, "selectedItem");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "setImage:", objj_msgSend(item, "image"));
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "setTitle:", objj_msgSend(item, "title"));
}
}), new objj_method(sel_getUid("menuDidAddItem:"), function(self, _cmd, aNotification)
{ with(self)
{
    var index = objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "CPMenuItemIndex");
    if (_selectedIndex < 0)
        objj_msgSend(self, "selectItemAtIndex:", 0);
    else if (index == _selectedIndex)
        objj_msgSend(self, "synchronizeTitleAndSelectedItem");
    else if (index < _selectedIndex)
        ++_selectedIndex;
    if (index == 0 && objj_msgSend(self, "pullsDown"))
    {
        var items = objj_msgSend(_menu, "itemArray");
        objj_msgSend(items[0], "setHidden:", YES);
        if (items.length > 0)
            objj_msgSend(items[1], "setHidden:", NO);
    }
    var item = objj_msgSend(_menu, "itemArray")[index],
        action = objj_msgSend(item, "action");
    if (!action || (action === sel_getUid("_popUpItemAction:")))
    {
        objj_msgSend(item, "setTarget:", self);
        objj_msgSend(item, "setAction:", sel_getUid("_popUpItemAction:"));
    }
}
}), new objj_method(sel_getUid("menuDidChangeItem:"), function(self, _cmd, aNotification)
{ with(self)
{
    var index = objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "CPMenuItemIndex");
    if (objj_msgSend(self, "pullsDown") && index != 0)
        return;
    if (!objj_msgSend(self, "pullsDown") && index != _selectedIndex)
        return;
    objj_msgSend(self, "synchronizeTitleAndSelectedItem");
}
}), new objj_method(sel_getUid("menuDidRemoveItem:"), function(self, _cmd, aNotification)
{ with(self)
{
    var numberOfItems = objj_msgSend(self, "numberOfItems");
    if (numberOfItems <= _selectedIndex)
        objj_msgSend(self, "selectItemAtIndex:", numberOfItems - 1);
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    if (!objj_msgSend(self, "isEnabled"))
        return;
    objj_msgSend(self, "highlight:", YES);
    var menu = objj_msgSend(self, "menu"),
        theWindow = objj_msgSend(self, "window"),
        menuWindow = objj_msgSend(_CPMenuWindow, "menuWindowWithMenu:font:", menu, objj_msgSend(self, "font"));
    objj_msgSend(menuWindow, "setDelegate:", self);
    objj_msgSend(menuWindow, "setBackgroundStyle:", _CPMenuWindowPopUpBackgroundStyle);
    if (objj_msgSend(self, "pullsDown"))
        var menuOrigin = objj_msgSend(theWindow, "convertBaseToBridge:", objj_msgSend(self, "convertPoint:toView:", CGPointMake(0.0, CGRectGetMaxY(objj_msgSend(self, "bounds"))), nil));
    else
    {
        var contentRect = objj_msgSend(self, "convertRect:toView:", objj_msgSend(self, "contentRectForBounds:", objj_msgSend(self, "bounds")), nil),
            menuOrigin = objj_msgSend(theWindow, "convertBaseToBridge:", contentRect.origin),
            menuItemRect = objj_msgSend(menuWindow, "rectForItemAtIndex:", _selectedIndex);
        menuOrigin.x -= CGRectGetMinX(menuItemRect) + objj_msgSend(menuWindow, "overlapOffsetWidth") + objj_msgSend(objj_msgSend(objj_msgSend(menu, "itemAtIndex:", _selectedIndex), "_menuItemView"), "overlapOffsetWidth");
        menuOrigin.y -= CGRectGetMinY(menuItemRect) + (CGRectGetHeight(menuItemRect) - CGRectGetHeight(contentRect)) / 2.0;
    }
    objj_msgSend(menuWindow, "setFrameOrigin:", menuOrigin);
    var menuMaxX = CGRectGetMaxX(objj_msgSend(menuWindow, "frame")),
        buttonMaxX = objj_msgSend(theWindow, "convertBaseToBridge:", CGPointMake(CGRectGetMaxX(objj_msgSend(self, "convertRect:toView:", objj_msgSend(self, "bounds"), nil)), 0.0)).x;
    if (menuMaxX < buttonMaxX)
        objj_msgSend(menuWindow, "setMinWidth:", CGRectGetWidth(objj_msgSend(menuWindow, "frame")) + buttonMaxX - menuMaxX - (objj_msgSend(self, "pullsDown") ? 0.0 : VISIBLE_MARGIN));
    objj_msgSend(menuWindow, "orderFront:", self);
    objj_msgSend(menuWindow, "beginTrackingWithEvent:sessionDelegate:didEndSelector:", anEvent, self, sel_getUid("menuWindowDidFinishTracking:highlightedItem:"));
}
}), new objj_method(sel_getUid("menuWindowDidFinishTracking:highlightedItem:"), function(self, _cmd, aMenuWindow, aMenuItem)
{ with(self)
{
    objj_msgSend(_CPMenuWindow, "poolMenuWindow:", aMenuWindow);
    objj_msgSend(self, "highlight:", NO);
    var index = objj_msgSend(_menu, "indexOfItem:", aMenuItem);
    if (index == CPNotFound)
        return;
    objj_msgSend(self, "selectItemAtIndex:", index);
    objj_msgSend(CPApp, "sendAction:to:from:", objj_msgSend(aMenuItem, "action"), objj_msgSend(aMenuItem, "target"), aMenuItem);
}
}), new objj_method(sel_getUid("_popUpItemAction:"), function(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
}
})]);
}
var CPPopUpButtonMenuKey = "CPPopUpButtonMenuKey",
    CPPopUpButtonSelectedIndexKey = "CPPopUpButtonSelectedIndexKey",
    CPPopUpButtonPullsDownKey = "CPPopUpButtonPullsDownKey";
{
var the_class = objj_getClass("CPPopUpButton")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPPopUpButton\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "initWithCoder:", aCoder);
    if (self)
    {
        _selectedIndex = -1;
        objj_msgSend(self, "setMenu:", objj_msgSend(aCoder, "decodeObjectForKey:", CPPopUpButtonMenuKey));
        objj_msgSend(self, "selectItemAtIndex:", objj_msgSend(aCoder, "decodeObjectForKey:", CPPopUpButtonSelectedIndexKey));
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPButton") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", _menu, CPPopUpButtonMenuKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _selectedIndex, CPPopUpButtonSelectedIndexKey);
}
})]);
}

