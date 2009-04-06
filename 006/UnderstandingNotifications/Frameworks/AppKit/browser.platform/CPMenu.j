I;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPString.ji;15;CPApplication.ji;12;CPClipView.ji;12;CPMenuItem.ji;9;CPPanel.jc;57512;
CPMenuDidAddItemNotification = "CPMenuDidAddItemNotification";
CPMenuDidChangeItemNotification = "CPMenuDidChangeItemNotification";
CPMenuDidRemoveItemNotification = "CPMenuDidRemoveItemNotification";
CPMenuDidEndTrackingNotification = "CPMenuDidEndTrackingNotification";
var MENUBAR_HEIGHT = 19.0;
var _CPMenuBarVisible = NO,
    _CPMenuBarTitle = "",
    _CPMenuBarIconImage = nil,
    _CPMenuBarIconImageAlphaValue = 1.0,
    _CPMenuBarAttributes = nil,
    _CPMenuBarSharedWindow = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPMenu"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_supermenu"), new objj_ivar("_title"), new objj_ivar("_items"), new objj_ivar("_attachedMenu"), new objj_ivar("_autoenablesItems"), new objj_ivar("_showsStateColumn"), new objj_ivar("_delegate"), new objj_ivar("_highlightedIndex"), new objj_ivar("_menuWindow")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("menuBarHeight"), function(self, _cmd)
{ with(self)
{
    if (self == objj_msgSend(CPApp, "mainMenu"))
        return MENUBAR_HEIGHT;
    return 0.0;
}
}), new objj_method(sel_getUid("initWithTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _title = aTitle;
        _items = [];
        _autoenablesItems = YES;
        _showsStateColumn = YES;
    }
    return self;
}
}), new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "initWithTitle:", "");
}
}), new objj_method(sel_getUid("insertItem:atIndex:"), function(self, _cmd, aMenuItem, anIndex)
{ with(self)
{
    var menu = objj_msgSend(aMenuItem, "menu");
    if (menu)
        if (menu != self)
            objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Attempted to insert item into menu that was already in another menu.");
        else
            return;
    objj_msgSend(aMenuItem, "setMenu:", self);
    objj_msgSend(_items, "insertObject:atIndex:", aMenuItem, anIndex);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPMenuDidAddItemNotification, self, objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", anIndex, "CPMenuItemIndex"));
}
}), new objj_method(sel_getUid("insertItemWithTitle:action:keyEquivalent:atIndex:"), function(self, _cmd, aTitle, anAction, aKeyEquivalent, anIndex)
{ with(self)
{
    var item = objj_msgSend(objj_msgSend(CPMenuItem, "alloc"), "initWithTitle:action:keyEquivalent:", aTitle, anAction, aKeyEquivalent);
    objj_msgSend(self, "insertItem:atIndex:", item, anIndex);
    return item;
}
}), new objj_method(sel_getUid("addItem:"), function(self, _cmd, aMenuItem)
{ with(self)
{
    objj_msgSend(self, "insertItem:atIndex:", aMenuItem, objj_msgSend(_items, "count"));
}
}), new objj_method(sel_getUid("addItemWithTitle:action:keyEquivalent:"), function(self, _cmd, aTitle, anAction, aKeyEquivalent)
{ with(self)
{
    return objj_msgSend(self, "insertItemWithTitle:action:keyEquivalent:atIndex:", aTitle, anAction, aKeyEquivalent, objj_msgSend(_items, "count"));
}
}), new objj_method(sel_getUid("removeItem:"), function(self, _cmd, aMenuItem)
{ with(self)
{
    objj_msgSend(self, "removeItemAtIndex:", objj_msgSend(_items, "indexOfObjectIdenticalTo:", aMenuItem));
}
}), new objj_method(sel_getUid("removeItemAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    if (anIndex < 0 || anIndex >= _items.length)
        return;
    objj_msgSend(_items[anIndex], "setMenu:", nil);
    objj_msgSend(_items, "removeObjectAtIndex:", anIndex);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPMenuDidRemoveItemNotification, self, objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", anIndex, "CPMenuItemIndex"));
}
}), new objj_method(sel_getUid("itemChanged:"), function(self, _cmd, aMenuItem)
{ with(self)
{
    if (objj_msgSend(aMenuItem, "menu") != self)
        return;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPMenuDidChangeItemNotification, self, objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", objj_msgSend(_items, "indexOfObjectIdenticalTo:", aMenuItem), "CPMenuItemIndex"));
}
}), new objj_method(sel_getUid("menuWithTag:"), function(self, _cmd, aTag)
{ with(self)
{
    var index = objj_msgSend(self, "indexOfItemWithTag:", aTag);
    if (index == CPNotFound)
        return nil;
    return _items[index];
}
}), new objj_method(sel_getUid("menuWithTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    var index = objj_msgSend(self, "indexOfItemWithTitle:", aTitle);
    if (index == CPNotFound)
        return nil;
    return _items[index];
}
}), new objj_method(sel_getUid("itemAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(_items, "objectAtIndex:", anIndex);
}
}), new objj_method(sel_getUid("numberOfItems"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_items, "count");
}
}), new objj_method(sel_getUid("itemArray"), function(self, _cmd)
{ with(self)
{
    return _items;
}
}), new objj_method(sel_getUid("indexOfItem:"), function(self, _cmd, aMenuItem)
{ with(self)
{
    if (objj_msgSend(aMenuItem, "menu") != self)
        return CPNotFound;
    return objj_msgSend(_items, "indexOfObjectIdenticalTo:", aMenuItem);
}
}), new objj_method(sel_getUid("indexOfItemWithTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    var index = 0,
        count = _items.length;
    for (; index < count; ++index)
        if (objj_msgSend(_items[index], "title") === aTitle)
            return index;
    return CPNotFound;
}
}), new objj_method(sel_getUid("indexOfItemWithTag:"), function(self, _cmd, aTag)
{ with(self)
{
    var index = 0,
        count = _items.length;
    for (; index < count; ++index)
        if (objj_msgSend(_items[index], "tag") == aTag)
            return index;
    return CPNotFound;
}
}), new objj_method(sel_getUid("indexOfItemWithTarget:andAction:"), function(self, _cmd, aTarget, anAction)
{ with(self)
{
    var index = 0,
        count = _items.length;
    for (; index < count; ++index)
    {
        var item = _items[index];
        if (objj_msgSend(item, "target") == aTarget && (!anAction || objj_msgSend(item, "action") == anAction))
            return index;
    }
    return CPNotFound;
}
}), new objj_method(sel_getUid("indexOfItemWithRepresentedObject:"), function(self, _cmd, anObject)
{ with(self)
{
    var index = 0,
        count = _items.length;
    for (; index < count; ++index)
        if (objj_msgSend(objj_msgSend(_items[index], "representedObject"), "isEqual:", anObject))
            return index;
    return CPNotFound;
}
}), new objj_method(sel_getUid("indexOfItemWithSubmenu:"), function(self, _cmd, aMenu)
{ with(self)
{
    var index = 0,
        count = _items.length;
    for (; index < count; ++index)
        if (objj_msgSend(_items[index], "submenu") == aMenu)
            return index;
    return CPNotFound;
}
}), new objj_method(sel_getUid("setSubmenu:forItem:"), function(self, _cmd, aMenu, aMenuItem)
{ with(self)
{
    objj_msgSend(aMenuItem, "setTarget:", aMenuItem);
    objj_msgSend(aMenuItem, "setAction:", sel_getUid("submenuAction:"));
    objj_msgSend(aMenuItem, "setSubmenu:", aMenu);
}
}), new objj_method(sel_getUid("submenuAction:"), function(self, _cmd, aSender)
{ with(self)
{
}
}), new objj_method(sel_getUid("attachedMenu"), function(self, _cmd)
{ with(self)
{
    return _attachedMenu;
}
}), new objj_method(sel_getUid("isAttached"), function(self, _cmd)
{ with(self)
{
    return _isAttached;
}
}), new objj_method(sel_getUid("locationOfSubmenu:"), function(self, _cmd, aMenu)
{ with(self)
{
}
}), new objj_method(sel_getUid("supermenu"), function(self, _cmd)
{ with(self)
{
    return _supermenu;
}
}), new objj_method(sel_getUid("setSupermenu:"), function(self, _cmd, aMenu)
{ with(self)
{
    _supermenu = aMenu;
}
}), new objj_method(sel_getUid("isTornOff"), function(self, _cmd)
{ with(self)
{
    return !_supermenu || self == objj_msgSend(CPApp, "mainMenu");
}
}), new objj_method(sel_getUid("setAutoenablesItems:"), function(self, _cmd, aFlag)
{ with(self)
{
    _autoenablesItems = aFlag;
}
}), new objj_method(sel_getUid("autoenablesItems"), function(self, _cmd)
{ with(self)
{
    return _autoenablesItems;
}
}), new objj_method(sel_getUid("update"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("setTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    _title = aTitle;
}
}), new objj_method(sel_getUid("title"), function(self, _cmd)
{ with(self)
{
    return _title;
}
}), new objj_method(sel_getUid("setShowsStateColumn:"), function(self, _cmd, shouldShowStateColumn)
{ with(self)
{
    _showsStateColumn = shouldShowStateColumn;
}
}), new objj_method(sel_getUid("showsStateColumn"), function(self, _cmd)
{ with(self)
{
    return _showsStateColumn;
}
}), new objj_method(sel_getUid("highlightedItem"), function(self, _cmd)
{ with(self)
{
    return _highlightedIndex >= 0 ? _items[_highlightedIndex] : nil;
}
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("cancelTracking"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(_menuWindow, "cancelTracking");
}
}), new objj_method(sel_getUid("_setMenuWindow:"), function(self, _cmd, aMenuWindow)
{ with(self)
{
    _menuWindow = aMenuWindow;
}
}), new objj_method(sel_getUid("performKeyEquivalent:"), function(self, _cmd, anEvent)
{ with(self)
{
    if (_autoenablesItems)
        objj_msgSend(self, "update");
    var index = 0,
        count = _items.length,
        characters = objj_msgSend(anEvent, "charactersIgnoringModifiers"),
        modifierFlags = objj_msgSend(anEvent, "modifierFlags");
    for(; index < count; ++index)
    {
        var item = _items[index],
            modifierMask = objj_msgSend(item, "keyEquivalentModifierMask");
        if ((modifierFlags & (CPShiftKeyMask | CPAlternateKeyMask | CPCommandKeyMask | CPControlKeyMask)) == modifierMask &&
            objj_msgSend(characters, "caseInsensitiveCompare:", objj_msgSend(item, "keyEquivalent")) == CPOrderedSame)
        {
            if (objj_msgSend(item, "isEnabled"))
                objj_msgSend(self, "performActionForItemAtIndex:", index);
            else
            {
            }
            return YES;
        }
        if (objj_msgSend(objj_msgSend(item, "submenu"), "performKeyEquivalent:", anEvent))
            return YES;
   }
   return NO;
}
}), new objj_method(sel_getUid("performActionForItemAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    var item = _items[anIndex];
    objj_msgSend(CPApp, "sendAction:to:from:", objj_msgSend(item, "action"), objj_msgSend(item, "target"), item);
}
}), new objj_method(sel_getUid("_itemIsHighlighted:"), function(self, _cmd, aMenuItem)
{ with(self)
{
    return _items[_highlightedIndex] == aMenuItem;
}
}), new objj_method(sel_getUid("_highlightItemAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    var previousHighlightedIndex = _highlightedIndex;
    _highlightedIndex = anIndex;
    if (previousHighlightedIndex != CPNotFound)
        objj_msgSend(objj_msgSend(_items[previousHighlightedIndex], "_menuItemView"), "highlight:", NO);
    if (_highlightedIndex != CPNotFound)
        objj_msgSend(objj_msgSend(_items[_highlightedIndex], "_menuItemView"), "highlight:", YES);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("menuBarVisible"), function(self, _cmd)
{ with(self)
{
    return _CPMenuBarVisible;
}
}), new objj_method(sel_getUid("setMenuBarVisible:"), function(self, _cmd, menuBarShouldBeVisible)
{ with(self)
{
    if (_CPMenuBarVisible == menuBarShouldBeVisible)
        return;
    _CPMenuBarVisible = menuBarShouldBeVisible;
    if (menuBarShouldBeVisible)
    {
        if (!_CPMenuBarSharedWindow)
            _CPMenuBarSharedWindow = objj_msgSend(objj_msgSend(_CPMenuBarWindow, "alloc"), "init");
        objj_msgSend(_CPMenuBarSharedWindow, "setMenu:", objj_msgSend(CPApp, "mainMenu"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTitle:", _CPMenuBarTitle);
        objj_msgSend(_CPMenuBarSharedWindow, "setIconImage:", _CPMenuBarIconImage);
        objj_msgSend(_CPMenuBarSharedWindow, "setIconImageAlphaValue:", _CPMenuBarIconImageAlphaValue);
        objj_msgSend(_CPMenuBarSharedWindow, "setColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarBackgroundColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTextColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTextColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTitleColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTitleColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "orderFront:", self);
    }
    else
        objj_msgSend(_CPMenuBarSharedWindow, "orderOut:", self);
    objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "_bridgeResizeEvent:", nil);
}
}), new objj_method(sel_getUid("setMenuBarTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    _CPMenuBarTitle = aTitle;
    objj_msgSend(_CPMenuBarSharedWindow, "setTitle:", _CPMenuBarTitle);
}
}), new objj_method(sel_getUid("menuBarTitle"), function(self, _cmd)
{ with(self)
{
    return _CPMenuBarTitle;
}
}), new objj_method(sel_getUid("setMenuBarIconImage:"), function(self, _cmd, anImage)
{ with(self)
{
    _CPMenuBarImage = anImage;
    objj_msgSend(_CPMenuBarSharedWindow, "setIconImage:", anImage);
}
}), new objj_method(sel_getUid("menuBarIconImage"), function(self, _cmd)
{ with(self)
{
    return _CPMenuBarImage;
}
}), new objj_method(sel_getUid("setMenuBarAttributes:"), function(self, _cmd, attributes)
{ with(self)
{
    if (_CPMenuBarAttributes == attributes)
        return;
    _CPMenuBarAttributes = objj_msgSend(attributes, "copy");
    var textColor = objj_msgSend(attributes, "objectForKey:", "CPMenuBarTextColor"),
        titleColor = objj_msgSend(attributes, "objectForKey:", "CPMenuBarTitleColor");
    if (!textColor && titleColor)
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", titleColor, "CPMenuBarTextColor");
    else if (textColor && !titleColor)
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", textColor, "CPMenuBarTitleColor");
    else if (!textColor && !titleColor)
    {
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", objj_msgSend(CPColor, "blackColor"), "CPMenuBarTextColor");
        objj_msgSend(_CPMenuBarAttributes, "setObject:forKey:", objj_msgSend(CPColor, "blackColor"), "CPMenuBarTitleColor");
    }
    if (_CPMenuBarSharedWindow)
    {
        objj_msgSend(_CPMenuBarSharedWindow, "setColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarBackgroundColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTextColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTextColor"));
        objj_msgSend(_CPMenuBarSharedWindow, "setTitleColor:", objj_msgSend(_CPMenuBarAttributes, "objectForKey:", "CPMenuBarTitleColor"));
    }
}
}), new objj_method(sel_getUid("menuBarAttributes"), function(self, _cmd)
{ with(self)
{
    return _CPMenuBarAttributes;
}
}), new objj_method(sel_getUid("_setMenuBarIconImageAlphaValue:"), function(self, _cmd, anAlphaValue)
{ with(self)
{
    _CPMenuBarIconImageAlphaValue = anAlphaValue;
    objj_msgSend(_CPMenuBarSharedWindow, "setIconImageAlphaValue:", anAlphaValue);
}
}), new objj_method(sel_getUid("menuBarHeight"), function(self, _cmd)
{ with(self)
{
    return MENUBAR_HEIGHT;
}
}), new objj_method(sel_getUid("popUpContextMenu:withEvent:forView:"), function(self, _cmd, aMenu, anEvent, aView)
{ with(self)
{
    objj_msgSend(self, "popUpContextMenu:withEvent:forView:withFont:", aMenu, anEvent, aView, nil);
}
}), new objj_method(sel_getUid("popUpContextMenu:withEvent:forView:withFont:"), function(self, _cmd, aMenu, anEvent, aView, aFont)
{ with(self)
{
    objj_msgSend(self, "_popUpContextMenu:withEvent:forView:withFont:forMenuBar:", aMenu, anEvent, aView, aFont, NO);
}
}), new objj_method(sel_getUid("_popUpContextMenu:withEvent:forView:withFont:forMenuBar:"), function(self, _cmd, aMenu, anEvent, aView, aFont, isForMenuBar)
{ with(self)
{
    var delegate = objj_msgSend(aMenu, "delegate");
    if (objj_msgSend(delegate, "respondsToSelector:", sel_getUid("menuWillOpen:")))
        objj_msgSend(delegate, "menuWillOpen:", aMenu);
    if (!aFont)
        aFont = objj_msgSend(CPFont, "systemFontOfSize:", 12.0);
    var theWindow = objj_msgSend(aView, "window"),
        menuWindow = objj_msgSend(_CPMenuWindow, "menuWindowWithMenu:font:", aMenu, aFont);
    objj_msgSend(menuWindow, "setDelegate:", self);
    objj_msgSend(menuWindow, "setBackgroundStyle:", isForMenuBar ? _CPMenuWindowMenuBarBackgroundStyle : _CPMenuWindowPopUpBackgroundStyle);
    objj_msgSend(menuWindow, "setFrameOrigin:", objj_msgSend(objj_msgSend(anEvent, "window"), "convertBaseToBridge:", objj_msgSend(anEvent, "locationInWindow")));
    objj_msgSend(menuWindow, "orderFront:", self);
    objj_msgSend(menuWindow, "beginTrackingWithEvent:sessionDelegate:didEndSelector:", anEvent, self, sel_getUid("_menuWindowDidFinishTracking:highlightedItem:"));
}
}), new objj_method(sel_getUid("_menuWindowDidFinishTracking:highlightedItem:"), function(self, _cmd, aMenuWindow, aMenuItem)
{ with(self)
{
    var menu = objj_msgSend(aMenuWindow, "menu");
    objj_msgSend(_CPMenuWindow, "poolMenuWindow:", aMenuWindow);
    if(objj_msgSend(aMenuItem, "isEnabled"))
        objj_msgSend(CPApp, "sendAction:to:from:", objj_msgSend(aMenuItem, "action"), objj_msgSend(aMenuItem, "target"), aMenuItem);
    var delegate = objj_msgSend(menu, "delegate");
    if (objj_msgSend(delegate, "respondsToSelector:", sel_getUid("menuDidClose:")))
        objj_msgSend(delegate, "menuDidClose:", menu);
}
})]);
}
var CPMenuTitleKey = "CPMenuTitleKey",
    CPMenuItemsKey = "CPMenuItemsKey";
{
var the_class = objj_getClass("CPMenu")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPMenu\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _title = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuTitleKey);
        _items = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemsKey);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _title, CPMenuTitleKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _items, CPMenuItemsKey);
}
})]);
}
var _CPMenuWindowPool = [],
    _CPMenuWindowPoolCapacity = 5,
    _CPMenuWindowBackgroundColors = [],
    _CPMenuWindowScrollingStateUp = -1,
    _CPMenuWindowScrollingStateDown = 1,
    _CPMenuWindowScrollingStateNone = 0;
_CPMenuWindowMenuBarBackgroundStyle = 0;
_CPMenuWindowPopUpBackgroundStyle = 1;
_CPMenuWindowAttachedMenuBackgroundStyle = 2;
var STICKY_TIME_INTERVAL = 500,
    TOP_MARGIN = 5.0,
    LEFT_MARGIN = 1.0,
    RIGHT_MARGIN = 1.0,
    BOTTOM_MARGIN = 5.0,
    SCROLL_INDICATOR_HEIGHT = 16.0;
{var the_class = objj_allocateClassPair(CPWindow, "_CPMenuWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menuView"), new objj_ivar("_menuClipView"), new objj_ivar("_lastMouseOverMenuView"), new objj_ivar("_moreAboveView"), new objj_ivar("_moreBelowView"), new objj_ivar("_sessionDelegate"), new objj_ivar("_didEndSelector"), new objj_ivar("_startTime"), new objj_ivar("_scrollingState"), new objj_ivar("_lastScreenLocation"), new objj_ivar("_isShowingTopScrollIndicator"), new objj_ivar("_isShowingBottomScrollIndicator"), new objj_ivar("_trackingCanceled"), new objj_ivar("_unconstrainedFrame")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWindow") }, "initWithContentRect:styleMask:", CGRectMakeZero(), CPBorderlessWindowMask);
    if (self)
    {
        objj_msgSend(self, "setLevel:", CPPopUpMenuWindowLevel);
        objj_msgSend(self, "setHasShadow:", YES);
        objj_msgSend(self, "setAcceptsMouseMovedEvents:", YES);
        _unconstrainedFrame = CGRectMakeZero();
        var contentView = objj_msgSend(self, "contentView");
        _menuView = objj_msgSend(objj_msgSend(_CPMenuView, "alloc"), "initWithFrame:", CGRectMakeZero());
        _menuClipView = objj_msgSend(objj_msgSend(CPClipView, "alloc"), "initWithFrame:", CGRectMake(LEFT_MARGIN, TOP_MARGIN, 0.0, 0.0));
        objj_msgSend(_menuClipView, "setDocumentView:", _menuView);
        objj_msgSend(contentView, "addSubview:", _menuClipView);
        _moreAboveView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(_moreAboveView, "setImage:", _CPMenuWindowMoreAboveImage);
        objj_msgSend(_moreAboveView, "setFrameSize:", objj_msgSend(_CPMenuWindowMoreAboveImage, "size"));
        objj_msgSend(contentView, "addSubview:", _moreAboveView);
        _moreBelowView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(_moreBelowView, "setImage:", _CPMenuWindowMoreBelowImage);
        objj_msgSend(_moreBelowView, "setFrameSize:", objj_msgSend(_CPMenuWindowMoreBelowImage, "size"));
        objj_msgSend(contentView, "addSubview:", _moreBelowView);
    }
    return self;
}
}), new objj_method(sel_getUid("overlapOffsetWidth"), function(self, _cmd)
{ with(self)
{
    return LEFT_MARGIN;
}
}), new objj_method(sel_getUid("setFont:"), function(self, _cmd, aFont)
{ with(self)
{
    objj_msgSend(_menuView, "setFont:", aFont);
}
}), new objj_method(sel_getUid("setBackgroundStyle:"), function(self, _cmd, aBackgroundStyle)
{ with(self)
{
    var color = _CPMenuWindowBackgroundColors[aBackgroundStyle];
    if (!color)
    {
        var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(self, "class"));
        if (aBackgroundStyle == _CPMenuWindowPopUpBackgroundStyle)
            color = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", 
                [
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded0.png"), CGSizeMake(4.0, 4.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow1.png"), CGSizeMake(1.0, 4.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded2.png"), CGSizeMake(4.0, 4.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow3.png"), CGSizeMake(4.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow4.png"), CGSizeMake(1.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow5.png"), CGSizeMake(4.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded6.png"), CGSizeMake(4.0, 4.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow7.png"), CGSizeMake(1.0, 4.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded8.png"), CGSizeMake(4.0, 4.0))
                ]));
        else if (aBackgroundStyle == _CPMenuWindowMenuBarBackgroundStyle)
            color = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", 
                [
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow3.png"), CGSizeMake(4.0, 0.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow4.png"), CGSizeMake(1.0, 0.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow5.png"), CGSizeMake(4.0, 0.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow3.png"), CGSizeMake(4.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow4.png"), CGSizeMake(1.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow5.png"), CGSizeMake(4.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded6.png"), CGSizeMake(4.0, 4.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindow7.png"), CGSizeMake(1.0, 4.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowRounded8.png"), CGSizeMake(4.0, 4.0))
                ]));
        _CPMenuWindowBackgroundColors[aBackgroundStyle] = color;
    }
    objj_msgSend(self, "setBackgroundColor:", color);
}
}), new objj_method(sel_getUid("setMenu:"), function(self, _cmd, aMenu)
{ with(self)
{
    objj_msgSend(aMenu, "_setMenuWindow:", self);
    objj_msgSend(_menuView, "setMenu:", aMenu);
    var menuViewSize = objj_msgSend(_menuView, "frame").size;
    objj_msgSend(self, "setFrameSize:", CGSizeMake(LEFT_MARGIN + menuViewSize.width + RIGHT_MARGIN, TOP_MARGIN + menuViewSize.height + BOTTOM_MARGIN));
    objj_msgSend(_menuView, "scrollPoint:", CGPointMake(0.0, 0.0));
    objj_msgSend(_menuClipView, "setFrame:", CGRectMake(LEFT_MARGIN, TOP_MARGIN, menuViewSize.width, menuViewSize.height));
}
}), new objj_method(sel_getUid("setMinWidth:"), function(self, _cmd, aWidth)
{ with(self)
{
    var size = objj_msgSend(self, "frame").size;
    objj_msgSend(self, "setFrameSize:", CGSizeMake(MAX(size.width, aWidth), size.height));
}
}), new objj_method(sel_getUid("rectForItemAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(_menuView, "convertRect:toView:", objj_msgSend(_menuView, "rectForItemAtIndex:", anIndex), nil);
}
}), new objj_method(sel_getUid("orderFront:"), function(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "constrainToScreen");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWindow") }, "orderFront:", aSender);
}
}), new objj_method(sel_getUid("constrainToScreen"), function(self, _cmd)
{ with(self)
{
    _unconstrainedFrame = CGRectMakeCopy(objj_msgSend(self, "frame"));
    var screenBounds = CGRectInset(objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "contentBounds"), 5.0, 5.0),
        constrainedFrame = CGRectIntersection(_unconstrainedFrame, screenBounds),
        menuViewOrigin = objj_msgSend(self, "convertBaseToBridge:", CGPointMake(LEFT_MARGIN, TOP_MARGIN));
    constrainedFrame.origin.x = CGRectGetMinX(_unconstrainedFrame);
    constrainedFrame.size.width = CGRectGetWidth(_unconstrainedFrame);
    if (CGRectGetWidth(constrainedFrame) > CGRectGetWidth(screenBounds))
        constrainedFrame.size.width = CGRectGetWidth(screenBounds);
    if (CGRectGetMaxX(constrainedFrame) > CGRectGetMaxX(screenBounds))
        constrainedFrame.origin.x -= CGRectGetMaxX(constrainedFrame) - CGRectGetMaxX(screenBounds);
    if (CGRectGetMinX(constrainedFrame) < CGRectGetMinX(screenBounds))
        constrainedFrame.origin.x = CGRectGetMinX(screenBounds);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWindow") }, "setFrame:", constrainedFrame);
    var topMargin = TOP_MARGIN,
        bottomMargin = BOTTOM_MARGIN,
        contentView = objj_msgSend(self, "contentView"),
        bounds = objj_msgSend(contentView, "bounds");
    var moreAbove = menuViewOrigin.y < CGRectGetMinY(constrainedFrame) + TOP_MARGIN,
        moreBelow = menuViewOrigin.y + CGRectGetHeight(objj_msgSend(_menuView, "frame")) > CGRectGetMaxY(constrainedFrame) - BOTTOM_MARGIN;
    if (moreAbove)
    {
        topMargin += SCROLL_INDICATOR_HEIGHT;
        var frame = objj_msgSend(_moreAboveView, "frame");
        objj_msgSend(_moreAboveView, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - CGRectGetWidth(frame)) / 2.0, (TOP_MARGIN + SCROLL_INDICATOR_HEIGHT - CGRectGetHeight(frame)) / 2.0));
    }
    objj_msgSend(_moreAboveView, "setHidden:", !moreAbove);
    if (moreBelow)
    {
        bottomMargin += SCROLL_INDICATOR_HEIGHT;
        objj_msgSend(_moreBelowView, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - CGRectGetWidth(objj_msgSend(_moreBelowView, "frame"))) / 2.0, CGRectGetHeight(bounds) - SCROLL_INDICATOR_HEIGHT - BOTTOM_MARGIN));
    }
    objj_msgSend(_moreBelowView, "setHidden:", !moreBelow);
    var clipFrame = CGRectMake(LEFT_MARGIN, topMargin, CGRectGetWidth(constrainedFrame) - LEFT_MARGIN - RIGHT_MARGIN, CGRectGetHeight(constrainedFrame) - topMargin - bottomMargin)
    objj_msgSend(_menuClipView, "setFrame:", clipFrame);
    objj_msgSend(_menuView, "setFrameSize:", CGSizeMake(CGRectGetWidth(clipFrame), CGRectGetHeight(objj_msgSend(_menuView, "frame"))));
    objj_msgSend(_menuView, "scrollPoint:", CGPointMake(0.0, objj_msgSend(self, "convertBaseToBridge:", clipFrame.origin).y - menuViewOrigin.y));
}
}), new objj_method(sel_getUid("cancelTracking"), function(self, _cmd)
{ with(self)
{
    _trackingCanceled = YES;
}
}), new objj_method(sel_getUid("beginTrackingWithEvent:sessionDelegate:didEndSelector:"), function(self, _cmd, anEvent, aSessionDelegate, aDidEndSelector)
{ with(self)
{
    _startTime = objj_msgSend(anEvent, "timestamp");
    _scrollingState = _CPMenuWindowScrollingStateNone;
    _trackingCanceled = NO;
    _sessionDelegate = aSessionDelegate;
    _didEndSelector = aDidEndSelector;
    objj_msgSend(self, "trackEvent:", anEvent);
}
}), new objj_method(sel_getUid("trackEvent:"), function(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type"),
        theWindow = objj_msgSend(anEvent, "window"),
        screenLocation = theWindow ? objj_msgSend(theWindow, "convertBaseToBridge:", objj_msgSend(anEvent, "locationInWindow")) : objj_msgSend(anEvent, "locationInWindow");
    if (type == CPPeriodic)
    {
        var constrainedBounds = CGRectInset(objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "contentBounds"), 5.0, 5.0);
        if (_scrollingState == _CPMenuWindowScrollingStateUp)
        {
            if (CGRectGetMinY(_unconstrainedFrame) < CGRectGetMinY(constrainedBounds))
                _unconstrainedFrame.origin.y += 10;
        }
        else if (_scrollingState == _CPMenuWindowScrollingStateDown)
            if (CGRectGetMaxY(_unconstrainedFrame) > CGRectGetHeight(constrainedBounds))
                _unconstrainedFrame.origin.y -= 10;
        objj_msgSend(self, "setFrame:", _unconstrainedFrame);
        objj_msgSend(self, "constrainToScreen");
        screenLocation = _lastScreenLocation;
    }
    _lastScreenLocation = screenLocation;
    var menu = objj_msgSend(_menuView, "menu"),
        menuLocation = objj_msgSend(self, "convertBridgeToBase:", screenLocation),
        activeItemIndex = objj_msgSend(_menuView, "itemIndexAtPoint:", objj_msgSend(_menuView, "convertPoint:fromView:", menuLocation, nil)),
        mouseOverMenuView = objj_msgSend(objj_msgSend(menu, "itemAtIndex:", activeItemIndex), "view");
    if (mouseOverMenuView)
    {
        if (!_lastMouseOverMenuView)
            objj_msgSend(menu, "_highlightItemAtIndex:", CPNotFound);
        if (_lastMouseOverMenuView != mouseOverMenuView)
        {
            objj_msgSend(mouseOverMenuView, "mouseExited:", anEvent);
            objj_msgSend(_lastMouseOverMenuView, "mouseEntered:", anEvent);
            _lastMouseOverMenuView = mouseOverMenuView;
        }
        objj_msgSend(self, "sendEvent:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", type, menuLocation, objj_msgSend(anEvent, "modifierFlags"), objj_msgSend(anEvent, "timestamp"), objj_msgSend(self, "windowNumber"), nil, 0, objj_msgSend(anEvent, "clickCount"), objj_msgSend(anEvent, "pressure")));
    }
    else
    {
        if (_lastMouseOverMenuView)
        {
            objj_msgSend(_lastMouseOverMenuView, "mouseExited:", anEvent);
            _lastMouseOverMenuView = nil;
        }
        objj_msgSend(menu, "_highlightItemAtIndex:", objj_msgSend(_menuView, "itemIndexAtPoint:", objj_msgSend(_menuView, "convertPoint:fromView:", objj_msgSend(self, "convertBridgeToBase:", screenLocation), nil)));
        if (type == CPMouseMoved || type == CPLeftMouseDragged || type == CPLeftMouseDown)
        {
            var frame = objj_msgSend(self, "frame"),
                oldScrollingState = _scrollingState;
            _scrollingState = _CPMenuWindowScrollingStateNone;
            if (screenLocation.y < CGRectGetMinY(frame) + TOP_MARGIN + SCROLL_INDICATOR_HEIGHT)
                _scrollingState = _CPMenuWindowScrollingStateUp;
            else if (screenLocation.y > CGRectGetMaxY(frame) - BOTTOM_MARGIN - SCROLL_INDICATOR_HEIGHT)
                _scrollingState = _CPMenuWindowScrollingStateDown;
            if (_scrollingState != oldScrollingState)
                if (_scrollingState == _CPMenuWindowScrollingStateNone)
                    objj_msgSend(CPEvent, "stopPeriodicEvents");
                else if (oldScrollingState == _CPMenuWindowScrollingStateNone)
                    objj_msgSend(CPEvent, "startPeriodicEventsAfterDelay:withPeriod:", 0.0, 0.04);
        }
        else if (type == CPLeftMouseUp && (objj_msgSend(anEvent, "timestamp") - _startTime > STICKY_TIME_INTERVAL))
        {
            if (_scrollingState != _CPMenuWindowScrollingStateNone)
                objj_msgSend(CPEvent, "stopPeriodicEvents");
            objj_msgSend(self, "cancelTracking");
        }
    }
    if (_trackingCanceled)
    {
        objj_msgSend(CPEvent, "stopPeriodicEvents");
        var highlightedItem = objj_msgSend(objj_msgSend(_menuView, "menu"), "highlightedItem");
        objj_msgSend(menu, "_highlightItemAtIndex:", CPNotFound);
        objj_msgSend(_menuView, "setMenu:", nil);
        objj_msgSend(self, "orderOut:", self);
        if (_sessionDelegate && _didEndSelector)
            objj_msgSend(_sessionDelegate, _didEndSelector, self, highlightedItem);
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPMenuDidEndTrackingNotification, menu);
        var delegate = objj_msgSend(menu, "delegate");
        if (objj_msgSend(delegate, "respondsToSelector:", sel_getUid("menuDidClose:")))
            objj_msgSend(delegate, "menuDidClose:", menu);
        return;
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackEvent:"), CPPeriodicMask | CPMouseMovedMask | CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("menuWindowWithMenu:font:"), function(self, _cmd, aMenu, aFont)
{ with(self)
{
    var menuWindow = nil;
    if (_CPMenuWindowPool.length)
        menuWindow = _CPMenuWindowPool.pop();
    else
        menuWindow = objj_msgSend(objj_msgSend(_CPMenuWindow, "alloc"), "init");
    objj_msgSend(menuWindow, "setFont:", aFont);
    objj_msgSend(menuWindow, "setMenu:", aMenu);
    return menuWindow;
}
}), new objj_method(sel_getUid("poolMenuWindow:"), function(self, _cmd, aMenuWindow)
{ with(self)
{
    if (!aMenuWindow || _CPMenuWindowPool.length >= _CPMenuWindowPoolCapacity)
        return;
    _CPMenuWindowPool.push(aMenuWindow);
}
}), new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPMenuWindow, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPMenuWindowMoreAboveImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowMoreAbove.png"), CGSizeMake(38.0, 18.0));
    _CPMenuWindowMoreBelowImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "_CPMenuWindow/_CPMenuWindowMoreBelow.png"), CGSizeMake(38.0, 18.0));
}
})]);
}
{var the_class = objj_allocateClassPair(CPView, "_CPMenuView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menuItemViews"), new objj_ivar("_visibleMenuItemInfos"), new objj_ivar("_font")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("setFont:"), function(self, _cmd, aFont)
{ with(self)
{
    _font = aFont;
}
}), new objj_method(sel_getUid("rectForItemAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(_menuItemViews[anIndex == CPNotFound ? 0 : anIndex], "frame");
}
}), new objj_method(sel_getUid("itemIndexAtPoint:"), function(self, _cmd, aPoint)
{ with(self)
{
    var x = aPoint.x,
        bounds = objj_msgSend(self, "bounds");
    if (x < CGRectGetMinX(bounds) || x > CGRectGetMaxX(bounds))
        return CPNotFound;
    var y = aPoint.y,
        low = 0,
        high = _visibleMenuItemInfos.length - 1;
    while (low <= high)
    {
        var middle = FLOOR(low + (high - low) / 2),
            info = _visibleMenuItemInfos[middle]
            frame = objj_msgSend(info.view, "frame");
        if (y < CGRectGetMinY(frame))
            high = middle - 1;
        else if (y > CGRectGetMaxY(frame))
            low = middle + 1;
        else
            return info.index;
   }
   return CPNotFound;
}
}), new objj_method(sel_getUid("setMenu:"), function(self, _cmd, aMenu)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setMenu:", aMenu);
    objj_msgSend(_menuItemViews, "makeObjectsPerformSelector:", sel_getUid("removeFromSuperview"));
    _menuItemViews = [];
    _visibleMenuItemInfos = [];
    var menu = objj_msgSend(self, "menu");
    if (!menu)
        return;
    var items = objj_msgSend(menu, "itemArray"),
        index = 0,
        count = objj_msgSend(items, "count"),
        maxWidth = 0,
        y = 0,
        showsStateColumn = objj_msgSend(menu, "showsStateColumn");
    for (; index < count; ++index)
    {
        var item = items[index],
            view = objj_msgSend(item, "_menuItemView");
        _menuItemViews.push(view);
        if (objj_msgSend(item, "isHidden"))
            continue;
        _visibleMenuItemInfos.push({ view:view, index:index });
        objj_msgSend(view, "setFont:", _font);
        objj_msgSend(view, "setShowsStateColumn:", showsStateColumn);
        objj_msgSend(view, "synchronizeWithMenuItem");
        objj_msgSend(view, "setFrameOrigin:", CGPointMake(0.0, y));
        objj_msgSend(self, "addSubview:", view);
        var size = objj_msgSend(view, "minSize"),
            width = size.width;
        if (maxWidth < width)
            maxWidth = width;
        y += size.height;
    }
    for (index = 0; index < count; ++index)
    {
        var view = _menuItemViews[index];
        objj_msgSend(view, "setFrameSize:", CGSizeMake(maxWidth, CGRectGetHeight(objj_msgSend(view, "frame"))));
    }
    objj_msgSend(self, "setAutoresizesSubviews:", NO);
    objj_msgSend(self, "setFrameSize:", CGSizeMake(maxWidth, y));
    objj_msgSend(self, "setAutoresizesSubviews:", YES);
}
})]);
}
var MENUBAR_HEIGHT = 29.0,
    MENUBAR_MARGIN = 10.0,
    MENUBAR_LEFT_MARGIN = 10.0,
    MENUBAR_RIGHT_MARGIN = 10.0;
var _CPMenuBarWindowBackgroundColor = nil,
    _CPMenuBarWindowFont = nil;
{var the_class = objj_allocateClassPair(CPPanel, "_CPMenuBarWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menu"), new objj_ivar("_highlightView"), new objj_ivar("_menuItemViews"), new objj_ivar("_trackingMenuItem"), new objj_ivar("_iconImageView"), new objj_ivar("_titleField"), new objj_ivar("_textColor"), new objj_ivar("_titleColor")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    var bridgeWidth = CGRectGetWidth(objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "contentBounds"));
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPanel") }, "initWithContentRect:styleMask:", CGRectMake(0.0, 0.0, bridgeWidth, MENUBAR_HEIGHT), CPBorderlessWindowMask);
    if (self)
    {
        objj_msgSend(self, "setLevel:", -1);
        objj_msgSend(self, "setAutoresizingMask:", CPWindowWidthSizable);
        var contentView = objj_msgSend(self, "contentView");
        objj_msgSend(contentView, "setAutoresizesSubviews:", NO);
        objj_msgSend(self, "setBecomesKeyOnlyIfNeeded:", YES);
        _iconImageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 16.0, 16.0));
        objj_msgSend(contentView, "addSubview:", _iconImageView);
        _titleField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(_titleField, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 12.0));
        objj_msgSend(_titleField, "setAlignment:", CPCenterTextAlignment);
        objj_msgSend(contentView, "addSubview:", _titleField);
    }
    return self;
}
}), new objj_method(sel_getUid("setTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    var bundleName = objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "objectForInfoDictionaryKey:", "CPBundleName");
    if (!objj_msgSend(bundleName, "length"))
        document.title = aTitle;
    else if (objj_msgSend(aTitle, "length"))
        document.title = aTitle + " - " + bundleName;
    else
        document.title = bundleName;
    objj_msgSend(_titleField, "setStringValue:", aTitle);
    objj_msgSend(_titleField, "sizeToFit");
    objj_msgSend(self, "tile");
}
}), new objj_method(sel_getUid("setIconImage:"), function(self, _cmd, anImage)
{ with(self)
{
    objj_msgSend(_iconImageView, "setImage:", anImage);
    objj_msgSend(_iconImageView, "setHidden:", anImage == nil);
    objj_msgSend(self, "tile");
}
}), new objj_method(sel_getUid("setIconImageAlphaValue:"), function(self, _cmd, anAlphaValue)
{ with(self)
{
    objj_msgSend(_iconImageView, "setAlphaValue:", anAlphaValue);
}
}), new objj_method(sel_getUid("setColor:"), function(self, _cmd, aColor)
{ with(self)
{
    if (!aColor)
    {
        if (!_CPMenuBarWindowBackgroundColor)
            _CPMenuBarWindowBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(_CPMenuBarWindow, "class")), "pathForResource:", "_CPMenuBarWindow/_CPMenuBarWindowBackground.png"), CGSizeMake(1.0, 18.0)));
        objj_msgSend(objj_msgSend(self, "contentView"), "setBackgroundColor:", _CPMenuBarWindowBackgroundColor);
    }
    else
        objj_msgSend(objj_msgSend(self, "contentView"), "setBackgroundColor:", aColor);
}
}), new objj_method(sel_getUid("setTextColor:"), function(self, _cmd, aColor)
{ with(self)
{
    if (_textColor == aColor)
        return;
    _textColor = aColor;
    objj_msgSend(_menuItemViews, "makeObjectsPerformSelector:withObject:", sel_getUid("setTextColor:"), _textColor);
}
}), new objj_method(sel_getUid("setTitleColor:"), function(self, _cmd, aColor)
{ with(self)
{
    if (_titleColor == aColor)
        return;
    _titleColor = aColor;
    objj_msgSend(_titleField, "setTextColor:", aColor ? aColor : objj_msgSend(CPColor, "blackColor"));
}
}), new objj_method(sel_getUid("setMenu:"), function(self, _cmd, aMenu)
{ with(self)
{
    if (_menu == aMenu)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_menu)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPMenuDidAddItemNotification, _menu);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPMenuDidChangeItemNotification, _menu);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPMenuDidRemoveItemNotification, _menu);
        var items = objj_msgSend(_menu, "itemArray"),
            count = items.length;
        while (count--)
            objj_msgSend(objj_msgSend(items[count], "_menuItemView"), "removeFromSuperview");
    }
    _menu = aMenu;
    if (_menu)
    {
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidAddItem:"), CPMenuDidAddItemNotification, _menu);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidChangeItem:"), CPMenuDidChangeItemNotification, _menu);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("menuDidRemoveItem:"), CPMenuDidRemoveItemNotification, _menu);
    }
    _menuItemViews = [];
    var contentView = objj_msgSend(self, "contentView"),
        items = objj_msgSend(_menu, "itemArray"),
        count = items.length;
    for (index = 0; index < count; ++index)
    {
        var item = items[index],
            menuItemView = objj_msgSend(item, "_menuItemView");
        _menuItemViews.push(menuItemView);
        objj_msgSend(menuItemView, "setShowsStateColumn:", NO);
        objj_msgSend(menuItemView, "setBelongsToMenuBar:", YES);
        objj_msgSend(menuItemView, "setFont:", _CPMenuBarWindowFont);
        objj_msgSend(menuItemView, "setTextColor:", _textColor);
        objj_msgSend(menuItemView, "setHidden:", objj_msgSend(item, "isHidden"));
        objj_msgSend(menuItemView, "synchronizeWithMenuItem");
        objj_msgSend(contentView, "addSubview:", menuItemView);
    }
    objj_msgSend(self, "tile");
}
}), new objj_method(sel_getUid("menuDidChangeItem:"), function(self, _cmd, aNotification)
{ with(self)
{
    var menuItem = objj_msgSend(_menu, "itemAtIndex:", objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "CPMenuItemIndex")),
        menuItemView = objj_msgSend(menuItem, "_menuItemView");
    objj_msgSend(menuItemView, "setHidden:", objj_msgSend(menuItem, "isHidden"));
    objj_msgSend(menuItemView, "synchronizeWithMenuItem");
    objj_msgSend(self, "tile");
}
}), new objj_method(sel_getUid("menuDidAddItem:"), function(self, _cmd, aNotification)
{ with(self)
{
    var index = objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "CPMenuItemIndex"),
        menuItem = objj_msgSend(_menu, "itemAtIndex:", index),
        menuItemView = objj_msgSend(menuItem, "_menuItemView");
    objj_msgSend(_menuItemViews, "insertObject:atIndex:", menuItemView, index);
    objj_msgSend(menuItemView, "setShowsStateColumn:", NO);
    objj_msgSend(menuItemView, "setBelongsToMenuBar:", YES);
    objj_msgSend(menuItemView, "setFont:", _CPMenuBarWindowFont);
    objj_msgSend(menuItemView, "setTextColor:", _textColor);
    objj_msgSend(menuItemView, "setHidden:", objj_msgSend(menuItem, "isHidden"));
    objj_msgSend(menuItemView, "synchronizeWithMenuItem");
    objj_msgSend(objj_msgSend(self, "contentView"), "addSubview:", menuItemView);
    objj_msgSend(self, "tile");
}
}), new objj_method(sel_getUid("menuDidRemoveItem:"), function(self, _cmd, aNotification)
{ with(self)
{
    var index = objj_msgSend(objj_msgSend(aNotification, "userInfo"), "objectForKey:", "CPMenuItemIndex"),
        menuItemView = objj_msgSend(_menuItemViews, "objectAtIndex:", index);
    objj_msgSend(_menuItemViews, "removeObjectAtIndex:", index);
    objj_msgSend(menuItemView, "removeFromSuperview");
    objj_msgSend(self, "tile");
}
}), new objj_method(sel_getUid("frameForMenuItem:"), function(self, _cmd, aMenuItem)
{ with(self)
{
    var frame = objj_msgSend(objj_msgSend(aMenuItem, "_menuItemView"), "frame");
    frame.origin.x -= 5.0;
    frame.origin.y = 0;
    frame.size.width += 10.0;
    frame.size.height = MENUBAR_HEIGHT;
    return frame;
}
}), new objj_method(sel_getUid("menuItemAtPoint:"), function(self, _cmd, aPoint)
{ with(self)
{
    var items = objj_msgSend(_menu, "itemArray"),
        count = items.length;
    while (count--)
    {
        var item = items[count];
        if (objj_msgSend(item, "isHidden") || objj_msgSend(item, "isSeparatorItem"))
            continue;
        if (CGRectContainsPoint(objj_msgSend(self, "frameForMenuItem:", item), aPoint))
            return item;
    }
    return nil;
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    _trackingMenuItem = objj_msgSend(self, "menuItemAtPoint:", objj_msgSend(anEvent, "locationInWindow"));
    if (!objj_msgSend(_trackingMenuItem, "isEnabled"))
        return;
    if (objj_msgSend(objj_msgSend(_trackingMenuItem, "_menuItemView"), "eventOnSubmenu:", anEvent))
        return objj_msgSend(self, "showMenu:", anEvent);
    if (objj_msgSend(_trackingMenuItem, "isEnabled"))
        objj_msgSend(self, "trackEvent:", anEvent);
}
}), new objj_method(sel_getUid("trackEvent:"), function(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type");
    if (type === CPPeriodic)
        return objj_msgSend(self, "showMenu:", anEvent);
    var frame = objj_msgSend(self, "frameForMenuItem:", _trackingMenuItem),
        menuItemView = objj_msgSend(_trackingMenuItem, "_menuItemView"),
        onMenuItemView = CGRectContainsPoint(frame, objj_msgSend(anEvent, "locationInWindow"));
    if (type == CPLeftMouseDown)
    {
        if (objj_msgSend(_trackingMenuItem, "submenu") != nil)
        {
            if (!objj_msgSend(_trackingMenuItem, "action"))
                return objj_msgSend(self, "showMenu:", anEvent);
            objj_msgSend(CPEvent, "startPeriodicEventsAfterDelay:withPeriod:", 0.0, 0.5);
        }
        objj_msgSend(menuItemView, "highlight:", onMenuItemView);
    }
    else if (type == CPLeftMouseDragged)
    {
        if (!onMenuItemView && objj_msgSend(_trackingMenuItem, "submenu"))
            return objj_msgSend(self, "showMenu:", anEvent);
        objj_msgSend(menuItemView, "highlight:", onMenuItemView);
    }
    else
    {
        objj_msgSend(CPEvent, "stopPeriodicEvents");
        objj_msgSend(menuItemView, "highlight:", NO);
        if (onMenuItemView)
            objj_msgSend(CPApp, "sendAction:to:from:", objj_msgSend(_trackingMenuItem, "action"), objj_msgSend(_trackingMenuItem, "target"), _trackingMenuItem);
        return;
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackEvent:"), CPPeriodicMask | CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
}), new objj_method(sel_getUid("showMenu:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(CPEvent, "stopPeriodicEvents");
    var frame = objj_msgSend(self, "frameForMenuItem:", _trackingMenuItem),
        menuItemView = objj_msgSend(_trackingMenuItem, "_menuItemView");
    if (!_highlightView)
    {
        _highlightView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", frame);
        objj_msgSend(_highlightView, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 81.0 / 255.0, 83.0 / 255.0, 109.0 / 255.0, 1.0));
    }
    else
        objj_msgSend(_highlightView, "setFrame:", frame);
    objj_msgSend(objj_msgSend(self, "contentView"), "addSubview:positioned:relativeTo:", _highlightView, CPWindowBelow, menuItemView);
    objj_msgSend(menuItemView, "activate:", YES);
    var submenu = objj_msgSend(_trackingMenuItem, "submenu");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("menuDidEndTracking:"), CPMenuDidEndTrackingNotification, submenu);
    objj_msgSend(CPMenu, "_popUpContextMenu:withEvent:forView:withFont:forMenuBar:", submenu, objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseDown, CGPointMake(CGRectGetMinX(frame), CGRectGetMaxY(frame)), objj_msgSend(anEvent, "modifierFlags"), objj_msgSend(anEvent, "timestamp"), objj_msgSend(self, "windowNumber"), nil, 0, objj_msgSend(anEvent, "clickCount"), objj_msgSend(anEvent, "pressure")), objj_msgSend(self, "contentView"), nil, YES);
}
}), new objj_method(sel_getUid("menuDidEndTracking:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(_highlightView, "removeFromSuperview");
    objj_msgSend(objj_msgSend(_trackingMenuItem, "_menuItemView"), "activate:", NO);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, CPMenuDidEndTrackingNotification, objj_msgSend(aNotification, "object"));
}
}), new objj_method(sel_getUid("tile"), function(self, _cmd)
{ with(self)
{
    var items = objj_msgSend(_menu, "itemArray"),
        index = 0,
        count = items.length,
        x = MENUBAR_LEFT_MARGIN,
        y = 0.0,
        isLeftAligned = YES;
    for (; index < count; ++index)
    {
        var item = items[index];
        if (objj_msgSend(item, "isSeparatorItem"))
        {
            x = CGRectGetWidth(objj_msgSend(self, "frame")) - MENUBAR_RIGHT_MARGIN;
            isLeftAligned = NO;
            continue;
        }
         if (objj_msgSend(item, "isHidden"))
            continue;
        var menuItemView = objj_msgSend(item, "_menuItemView"),
            frame = objj_msgSend(menuItemView, "frame");
        if (isLeftAligned)
        {
            objj_msgSend(menuItemView, "setFrameOrigin:", CGPointMake(x, (MENUBAR_HEIGHT - 1.0 - CGRectGetHeight(frame)) / 2.0));
            x += CGRectGetWidth(objj_msgSend(menuItemView, "frame")) + MENUBAR_MARGIN;
        }
        else
        {
            objj_msgSend(menuItemView, "setFrameOrigin:", CGPointMake(x - CGRectGetWidth(frame), (MENUBAR_HEIGHT - 1.0 - CGRectGetHeight(frame)) / 2.0));
            x = CGRectGetMinX(objj_msgSend(menuItemView, "frame")) - MENUBAR_MARGIN;
        }
    }
    var bounds = objj_msgSend(objj_msgSend(self, "contentView"), "bounds"),
        titleFrame = objj_msgSend(_titleField, "frame");
    if (objj_msgSend(_iconImageView, "isHidden"))
        objj_msgSend(_titleField, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - CGRectGetWidth(titleFrame)) / 2.0, (CGRectGetHeight(bounds) - CGRectGetHeight(titleFrame)) / 2.0));
    else
    {
        var iconFrame = objj_msgSend(_iconImageView, "frame"),
            iconWidth = CGRectGetWidth(iconFrame),
            totalWidth = iconWidth + CGRectGetWidth(titleFrame);
        objj_msgSend(_iconImageView, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - totalWidth) / 2.0, (CGRectGetHeight(bounds) - CGRectGetHeight(iconFrame)) / 2.0));
        objj_msgSend(_titleField, "setFrameOrigin:", CGPointMake((CGRectGetWidth(bounds) - totalWidth) / 2.0 + iconWidth, (CGRectGetHeight(bounds) - CGRectGetHeight(titleFrame)) / 2.0));
    }
}
}), new objj_method(sel_getUid("setFrameSize:"), function(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPanel") }, "setFrameSize:", aSize);
    objj_msgSend(self, "tile");
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPMenuBarWindow, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPMenuBarWindowFont = objj_msgSend(CPFont, "systemFontOfSize:", 11.0);
}
})]);
}

