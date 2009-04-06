I;20;Foundation/CPCoder.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;16;AppKit/CPImage.jI;15;AppKit/CPMenu.jI;15;AppKit/CPView.jc;26583;
{var the_class = objj_allocateClassPair(CPObject, "CPMenuItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_title"), new objj_ivar("_font"), new objj_ivar("_target"), new objj_ivar("_action"), new objj_ivar("_isEnabled"), new objj_ivar("_isHidden"), new objj_ivar("_tag"), new objj_ivar("_state"), new objj_ivar("_image"), new objj_ivar("_alternateImage"), new objj_ivar("_onStateImage"), new objj_ivar("_offStateImage"), new objj_ivar("_mixedStateImage"), new objj_ivar("_submenu"), new objj_ivar("_menu"), new objj_ivar("_keyEquivalent"), new objj_ivar("_keyEquivalentModifierMask"), new objj_ivar("_mnemonicLocation"), new objj_ivar("_isAlternate"), new objj_ivar("_indentationLevel"), new objj_ivar("_toolTip"), new objj_ivar("_representedObject"), new objj_ivar("_view"), new objj_ivar("_menuItemView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithTitle:action:keyEquivalent:"), function(self, _cmd, aTitle, anAction, aKeyEquivalent)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _title = aTitle;
        _action = anAction;
        _isEnabled = YES;
        _tag = 0;
        _state = CPOffState;
        _keyEquivalent = aKeyEquivalent || "";
        _keyEquivalentModifierMask = CPPlatformActionKeyMask;
        _mnemonicLocation = CPNotFound;
    }
    return self;
}
}), new objj_method(sel_getUid("setEnabled:"), function(self, _cmd, isEnabled)
{ with(self)
{
    if (objj_msgSend(_menu, "autoenablesItems"))
        return;
    _isEnabled = isEnabled;
    objj_msgSend(_menuItemView, "setDirty");
    objj_msgSend(_menu, "itemChanged:", self);
}
}), new objj_method(sel_getUid("isEnabled"), function(self, _cmd)
{ with(self)
{
    return _isEnabled;
}
}), new objj_method(sel_getUid("setHidden:"), function(self, _cmd, isHidden)
{ with(self)
{
    if (_isHidden == isHidden)
        return;
    _isHidden = isHidden;
    objj_msgSend(_menu, "itemChanged:", self);
}
}), new objj_method(sel_getUid("isHidden"), function(self, _cmd)
{ with(self)
{
    return _isHidden;
}
}), new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"), function(self, _cmd)
{ with(self)
{
    if (_isHidden)
        return YES;
    var supermenu = objj_msgSend(_menu, "supermenu");
    if (objj_msgSend(objj_msgSend(supermenu, "itemAtIndex:", objj_msgSend(supermenu, "indexOfItemWithSubmenu:", _menu)), "isHiddenOrHasHiddenAncestor"))
        return YES;
    return NO;
}
}), new objj_method(sel_getUid("setTarget:"), function(self, _cmd, aTarget)
{ with(self)
{
    _target = aTarget;
}
}), new objj_method(sel_getUid("target"), function(self, _cmd)
{ with(self)
{
    return _target;
}
}), new objj_method(sel_getUid("setAction:"), function(self, _cmd, anAction)
{ with(self)
{
    _action = anAction;
}
}), new objj_method(sel_getUid("action"), function(self, _cmd)
{ with(self)
{
    return _action;
}
}), new objj_method(sel_getUid("setTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    _mnemonicLocation = CPNotFound;
    if (_title == aTitle)
        return;
    _title = aTitle;
    objj_msgSend(_menuItemView, "setDirty");
    objj_msgSend(_menu, "itemChanged:", self);
}
}), new objj_method(sel_getUid("title"), function(self, _cmd)
{ with(self)
{
    return _title;
}
}), new objj_method(sel_getUid("setTextColor:"), function(self, _cmd, aColor)
{ with(self)
{
}
}), new objj_method(sel_getUid("setFont:"), function(self, _cmd, aFont)
{ with(self)
{
    if (_font == aFont)
        return;
    _font = aFont;
    objj_msgSend(_menu, "itemChanged:", self);
    objj_msgSend(_menuItemView, "setDirty");
}
}), new objj_method(sel_getUid("font"), function(self, _cmd)
{ with(self)
{
    return _font;
}
}), new objj_method(sel_getUid("setTag:"), function(self, _cmd, aTag)
{ with(self)
{
    _tag = aTag;
}
}), new objj_method(sel_getUid("tag"), function(self, _cmd)
{ with(self)
{
    return _tag;
}
}), new objj_method(sel_getUid("setState:"), function(self, _cmd, aState)
{ with(self)
{
    if (_state == aState)
        return;
    _state = aState;
    objj_msgSend(_menu, "itemChanged:", self);
    objj_msgSend(_menuItemView, "setDirty");
}
}), new objj_method(sel_getUid("state"), function(self, _cmd)
{ with(self)
{
    return _state;
}
}), new objj_method(sel_getUid("setImage:"), function(self, _cmd, anImage)
{ with(self)
{
    if (_image == anImage)
        return;
    _image = anImage;
    objj_msgSend(_menuItemView, "setDirty");
    objj_msgSend(_menu, "itemChanged:", self);
}
}), new objj_method(sel_getUid("image"), function(self, _cmd)
{ with(self)
{
    return _image;
}
}), new objj_method(sel_getUid("setAlternateImage:"), function(self, _cmd, anImage)
{ with(self)
{
    _alternateImage = anImage;
}
}), new objj_method(sel_getUid("alternateImage"), function(self, _cmd)
{ with(self)
{
    return _alternateImage;
}
}), new objj_method(sel_getUid("setOnStateImage:"), function(self, _cmd, anImage)
{ with(self)
{
    if (_onStateImage == anImage)
        return;
    _onStateImage = anImage;
    objj_msgSend(_menu, "itemChanged:", self);
}
}), new objj_method(sel_getUid("onStateImage"), function(self, _cmd)
{ with(self)
{
    return _onStateImage;
}
}), new objj_method(sel_getUid("setOffStateImage:"), function(self, _cmd, anImage)
{ with(self)
{
    if (_offStateImage == anImage)
        return;
    _offStateImage = anImage;
    objj_msgSend(_menu, "itemChanged:", self);
}
}), new objj_method(sel_getUid("offStateImage"), function(self, _cmd)
{ with(self)
{
    return _offStateImage;
}
}), new objj_method(sel_getUid("setMixedStateImage:"), function(self, _cmd, anImage)
{ with(self)
{
    if (_mixedStateImage == anImage)
        return;
    _mixedStateImage = anImage;
    objj_msgSend(_menu, "itemChanged:", self);
}
}), new objj_method(sel_getUid("mixedStateImage"), function(self, _cmd)
{ with(self)
{
    return _mixedStateImage;
}
}), new objj_method(sel_getUid("setSubmenu:"), function(self, _cmd, aMenu)
{ with(self)
{
    var supermenu = objj_msgSend(_submenu, "supermenu");
    if (supermenu == self)
        return;
    if (supermenu)
        return alert("bad");
    objj_msgSend(_submenu, "setSupermenu:", _menu);
    _submenu = aMenu;
    objj_msgSend(_menuItemView, "setDirty");
    objj_msgSend(_menu, "itemChanged:", self);
}
}), new objj_method(sel_getUid("submenu"), function(self, _cmd)
{ with(self)
{
    return _submenu;
}
}), new objj_method(sel_getUid("hasSubmenu"), function(self, _cmd)
{ with(self)
{
    return _submenu ? YES : NO;
}
}), new objj_method(sel_getUid("isSeparatorItem"), function(self, _cmd)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("setMenu:"), function(self, _cmd, aMenu)
{ with(self)
{
    _menu = aMenu;
}
}), new objj_method(sel_getUid("menu"), function(self, _cmd)
{ with(self)
{
    return _menu;
}
}), new objj_method(sel_getUid("setKeyEquivalent:"), function(self, _cmd, aString)
{ with(self)
{
    _keyEquivalent = aString || "";
}
}), new objj_method(sel_getUid("keyEquivalent"), function(self, _cmd)
{ with(self)
{
    return _keyEquivalent;
}
}), new objj_method(sel_getUid("setKeyEquivalentModifierMask:"), function(self, _cmd, aMask)
{ with(self)
{
    _keyEquivalentModifierMask = aMask;
}
}), new objj_method(sel_getUid("keyEquivalentModifierMask"), function(self, _cmd)
{ with(self)
{
    return _keyEquivalentModifierMask;
}
}), new objj_method(sel_getUid("setMnemonicLocation:"), function(self, _cmd, aLocation)
{ with(self)
{
    _mnemonicLocation = aLocation;
}
}), new objj_method(sel_getUid("mnemonicLocation"), function(self, _cmd)
{ with(self)
{
    return _mnemonicLocation;
}
}), new objj_method(sel_getUid("setTitleWithMnemonicLocation:"), function(self, _cmd, aTitle)
{ with(self)
{
    var location = objj_msgSend(aTitle, "rangeOfString:", "&").location;
    if (location == CPNotFound)
        objj_msgSend(self, "setTitle:", aTitle);
    else
    {
        objj_msgSend(self, "setTitle:", objj_msgSend(aTitle, "substringToIndex:", location) + objj_msgSend(aTitle, "substringFromIndex:", location + 1));
        objj_msgSend(self, "setMnemonicLocation:", location);
    }
}
}), new objj_method(sel_getUid("mnemonic"), function(self, _cmd)
{ with(self)
{
    return _mnemonicLocation == CPNotFound ? "" : objj_msgSend(_title, "characterAtIndex:", _mnemonicLocation);
}
}), new objj_method(sel_getUid("setAlternate:"), function(self, _cmd, isAlternate)
{ with(self)
{
    _isAlternate = isAlternate;
}
}), new objj_method(sel_getUid("isAlternate"), function(self, _cmd)
{ with(self)
{
    return _isAlternate;
}
}), new objj_method(sel_getUid("setIndentationLevel:"), function(self, _cmd, aLevel)
{ with(self)
{
    if (aLevel < 0)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "setIndentationLevel: argument must be greater than 0.");
    _indentationLevel = MIN(15, aLevel);
}
}), new objj_method(sel_getUid("indentationLevel"), function(self, _cmd)
{ with(self)
{
    return _indentationLevel;
}
}), new objj_method(sel_getUid("setToolTip:"), function(self, _cmd, aToolTip)
{ with(self)
{
    _toolTip = aToolTip;
}
}), new objj_method(sel_getUid("toolTip"), function(self, _cmd)
{ with(self)
{
    return _toolTip;
}
}), new objj_method(sel_getUid("setRepresentedObject:"), function(self, _cmd, anObject)
{ with(self)
{
    _representedObject = anObject;
}
}), new objj_method(sel_getUid("representedObject"), function(self, _cmd)
{ with(self)
{
    return _representedObject;
}
}), new objj_method(sel_getUid("setView:"), function(self, _cmd, aView)
{ with(self)
{
    if (_view == aView)
        return;
    _view = aView;
    objj_msgSend(_menuItemView, "setDirty");
    objj_msgSend(_menu, "itemChanged:", self);
}
}), new objj_method(sel_getUid("view"), function(self, _cmd)
{ with(self)
{
    return _view;
}
}), new objj_method(sel_getUid("isHighlighted"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "menu"), "highlightedItem") == self;
}
}), new objj_method(sel_getUid("_menuItemView"), function(self, _cmd)
{ with(self)
{
    if (!_menuItemView)
        _menuItemView = objj_msgSend(objj_msgSend(_CPMenuItemView, "alloc"), "initWithFrame:forMenuItem:", CGRectMakeZero(), self);
    return _menuItemView;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("separatorItem"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(_CPMenuItemSeparator, "alloc"), "init");
}
})]);
}
{var the_class = objj_allocateClassPair(CPMenuItem, "_CPMenuItemSeparator"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPMenuItem") }, "initWithTitle:action:keyEquivalent:", "", nil, nil);
    if (self)
        objj_msgSend(self, "setEnabled:", NO);
    return self;
}
}), new objj_method(sel_getUid("isSeparatorItem"), function(self, _cmd)
{ with(self)
{
    return YES;
}
})]);
}
var CPMenuItemTitleKey = "CPMenuItemTitleKey",
    CPMenuItemTargetKey = "CPMenuItemTargetKey",
    CPMenuItemActionKey = "CPMenuItemActionKey",
    CPMenuItemIsEnabledKey = "CPMenuItemIsEnabledKey",
    CPMenuItemIsHiddenKey = "CPMenuItemIsHiddenKey",
    CPMenuItemTagKey = "CPMenuItemTagKey",
    CPMenuItemImageKey = "CPMenuItemImageKey",
    CPMenuItemAlternateImageKey = "CPMenuItemAlternateImageKey",
    CPMenuItemSubmenuKey = "CPMenuItemSubmenuKey",
    CPMenuItemMenuKey = "CPMenuItemMenuKey",
    CPMenuItemRepresentedObjectKey = "CPMenuItemRepresentedObjectKey";
{
var the_class = objj_getClass("CPMenuItem")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPMenuItem\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _title = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemTitleKey);
        _target = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemTargetKey);
        _action = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemActionKey);
        _isEnabled = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemIsEnabledKey);
        _isHidden = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemIsHiddenKey);
        _tag = objj_msgSend(aCoder, "containsValueForKey:", CPMenuItemTagKey) ? objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemTagKey) : 0;
        _image = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemImageKey);
        _alternateImage = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemAlternateImageKey);
        _submenu = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemSubmenuKey);
        _menu = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemMenuKey);
    _representedObject = objj_msgSend(aCoder, "decodeObjectForKey:", CPMenuItemRepresentedObjectKey);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _title, CPMenuItemTitleKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _target, CPMenuItemTargetKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _action, CPMenuItemActionKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _isEnabled, CPMenuItemIsEnabledKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _isHidden, CPMenuItemIsHiddenKey);
    if (_tag !== 0)
        objj_msgSend(aCoder, "encodeObject:forKey:", _tag, CPMenuItemTagKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _image, CPMenuItemImageKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _alternateImage, CPMenuItemAlternateImageKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _submenu, CPMenuItemSubmenuKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _menu, CPMenuItemMenuKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _representedObject, CPMenuItemRepresentedObjectKey);
}
})]);
}
var LEFT_MARGIN = 3.0,
    RIGHT_MARGIN = 16.0,
    STATE_COLUMN_WIDTH = 14.0,
    INDENTATION_WIDTH = 17.0,
    VERTICAL_MARGIN = 4.0;
var _CPMenuItemSelectionColor = nil,
    _CPMenuItemTextShadowColor = nil,
    _CPMenuItemDefaultStateImages = [],
    _CPMenuItemDefaultStateHighlightedImages = [];
{var the_class = objj_allocateClassPair(CPView, "_CPMenuItemView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menuItem"), new objj_ivar("_font"), new objj_ivar("_textColor"), new objj_ivar("_minSize"), new objj_ivar("_isDirty"), new objj_ivar("_showsStateColumn"), new objj_ivar("_belongsToMenuBar"), new objj_ivar("_stateView"), new objj_ivar("_imageAndTextView"), new objj_ivar("_submenuView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:forMenuItem:"), function(self, _cmd, aFrame, aMenuItem)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _menuItem = aMenuItem;
        _showsStateColumn = YES;
        _isDirty = YES;
        objj_msgSend(self, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(self, "synchronizeWithMenuItem");
    }
    return self;
}
}), new objj_method(sel_getUid("minSize"), function(self, _cmd)
{ with(self)
{
    return _minSize;
}
}), new objj_method(sel_getUid("setDirty"), function(self, _cmd)
{ with(self)
{
    _isDirty = YES;
}
}), new objj_method(sel_getUid("synchronizeWithMenuItem"), function(self, _cmd)
{ with(self)
{
    if (!_isDirty)
        return;
    _isDirty = NO;
    var view = objj_msgSend(_menuItem, "view");
    if (objj_msgSend(_menuItem, "isSeparatorItem"))
    {
        var line = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, 5.0, 10.0, 1.0));
        view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 0.0, 10.0));
        objj_msgSend(view, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(line, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(line, "setBackgroundColor:", objj_msgSend(CPColor, "lightGrayColor"));
        objj_msgSend(view, "addSubview:", line);
    }
    if (view)
    {
        objj_msgSend(_imageAndTextView, "removeFromSuperview");
        _imageAndTextView = nil;
        objj_msgSend(_stateView, "removeFromSuperview");
        _stateView = nil;
        objj_msgSend(_submenuView, "removeFromSuperview");
        _submenuView = nil;
        _minSize = objj_msgSend(view, "frame").size;
        objj_msgSend(self, "setFrameSize:", _minSize);
        objj_msgSend(self, "addSubview:", view);
        return;
    }
    var x = _belongsToMenuBar ? 0.0 : (LEFT_MARGIN + objj_msgSend(_menuItem, "indentationLevel") * INDENTATION_WIDTH);
    if (_showsStateColumn)
    {
        if (!_stateView)
        {
            _stateView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(x, (CGRectGetHeight(objj_msgSend(self, "frame")) - STATE_COLUMN_WIDTH) / 2.0, STATE_COLUMN_WIDTH, STATE_COLUMN_WIDTH));
            objj_msgSend(_stateView, "setAutoresizingMask:", CPViewMinYMargin | CPViewMaxYMargin);
            objj_msgSend(self, "addSubview:", _stateView);
        }
        var state = objj_msgSend(_menuItem, "state");
        switch (state)
        {
            case CPOffState:
            case CPOnState:
            case CPMixedState: objj_msgSend(_stateView, "setImage:", _CPMenuItemDefaultStateImages[state]);
                                break;
            default: objj_msgSend(_stateView, "setImage:", nil);
        }
        x += STATE_COLUMN_WIDTH;
    }
    else
    {
        objj_msgSend(_stateView, "removeFromSuperview");
        _stateView = nil;
    }
    if (!_imageAndTextView)
    {
        _imageAndTextView = objj_msgSend(objj_msgSend(_CPImageAndTextView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 0.0, 0.0));
        objj_msgSend(_imageAndTextView, "setImagePosition:", CPImageLeft);
        objj_msgSend(_imageAndTextView, "setTextShadowOffset:", CGSizeMake(0.0, 1.0));
        objj_msgSend(self, "addSubview:", _imageAndTextView);
    }
    var font = objj_msgSend(_menuItem, "font");
    if (!font)
        font = _font;
    objj_msgSend(_imageAndTextView, "setFont:", font);
    objj_msgSend(_imageAndTextView, "setVerticalAlignment:", CPCenterVerticalTextAlignment);
    objj_msgSend(_imageAndTextView, "setImage:", objj_msgSend(_menuItem, "image"));
    objj_msgSend(_imageAndTextView, "setText:", objj_msgSend(_menuItem, "title"));
    objj_msgSend(_imageAndTextView, "setTextColor:", objj_msgSend(self, "textColor"));
    objj_msgSend(_imageAndTextView, "setFrameOrigin:", CGPointMake(x, VERTICAL_MARGIN));
    objj_msgSend(_imageAndTextView, "sizeToFit");
    var frame = objj_msgSend(_imageAndTextView, "frame");
    frame.size.height += 2 * VERTICAL_MARGIN;
    x += CGRectGetWidth(frame);
    if (objj_msgSend(_menuItem, "hasSubmenu"))
    {
        x += 3.0;
        if (!_submenuView)
        {
            _submenuView = objj_msgSend(objj_msgSend(_CPMenuItemArrowView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 10.0, 10.0));
            objj_msgSend(self, "addSubview:", _submenuView);
        }
        objj_msgSend(_submenuView, "setHidden:", NO);
        objj_msgSend(_submenuView, "setColor:", _belongsToMenuBar ? objj_msgSend(self, "textColor") : nil);
        objj_msgSend(_submenuView, "setFrameOrigin:", CGPointMake(x, (CGRectGetHeight(frame) - 10.0) / 2.0));
        x += 10.0;
    }
    else
        objj_msgSend(_submenuView, "setHidden:", YES);
    _minSize = CGSizeMake(x + (_belongsToMenuBar ? 0.0 : RIGHT_MARGIN) + 3.0, CGRectGetHeight(frame));
    objj_msgSend(self, "setFrameSize:", _minSize);
}
}), new objj_method(sel_getUid("overlapOffsetWidth"), function(self, _cmd)
{ with(self)
{
    return LEFT_MARGIN + (objj_msgSend(objj_msgSend(_menuItem, "menu"), "showsStateColumn") ? STATE_COLUMN_WIDTH : 0.0);
}
}), new objj_method(sel_getUid("setShowsStateColumn:"), function(self, _cmd, shouldShowStateColumn)
{ with(self)
{
    _showsStateColumn = shouldShowStateColumn;
}
}), new objj_method(sel_getUid("setBelongsToMenuBar:"), function(self, _cmd, shouldBelongToMenuBar)
{ with(self)
{
    _belongsToMenuBar = shouldBelongToMenuBar;
}
}), new objj_method(sel_getUid("highlight:"), function(self, _cmd, shouldHighlight)
{ with(self)
{
    if (_belongsToMenuBar)
        objj_msgSend(_imageAndTextView, "setImage:", shouldHighlight ? objj_msgSend(_menuItem, "alternateImage") : objj_msgSend(_menuItem, "image"));
    else if (objj_msgSend(_menuItem, "isEnabled"))
    {
        if (shouldHighlight)
        {
            objj_msgSend(self, "setBackgroundColor:", _CPMenuItemSelectionColor);
            objj_msgSend(_imageAndTextView, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
            objj_msgSend(_imageAndTextView, "setTextShadowColor:", _CPMenuItemTextShadowColor);
        }
        else
        {
            objj_msgSend(self, "setBackgroundColor:", nil);
            objj_msgSend(_imageAndTextView, "setTextColor:", objj_msgSend(self, "textColor"));
            objj_msgSend(_imageAndTextView, "setTextShadowColor:", nil);
        }
        var state = objj_msgSend(_menuItem, "state");
        switch (state)
        {
            case CPOffState:
            case CPOnState:
            case CPMixedState: objj_msgSend(_stateView, "setImage:", shouldHighlight ? _CPMenuItemDefaultStateHighlightedImages[state] : _CPMenuItemDefaultStateImages[state]);
                            break;
            default: objj_msgSend(_stateView, "setImage:", nil);
        }
    }
}
}), new objj_method(sel_getUid("activate:"), function(self, _cmd, shouldActivate)
{ with(self)
{
    objj_msgSend(_imageAndTextView, "setImage:", objj_msgSend(_menuItem, "image"));
    if (shouldActivate)
    {
        objj_msgSend(_imageAndTextView, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(_submenuView, "setColor:", objj_msgSend(CPColor, "whiteColor"));
    }
    else
    {
        objj_msgSend(_imageAndTextView, "setTextColor:", objj_msgSend(self, "textColor"));
        objj_msgSend(_submenuView, "setColor:", objj_msgSend(self, "textColor"));
    }
}
}), new objj_method(sel_getUid("eventOnSubmenu:"), function(self, _cmd, anEvent)
{ with(self)
{
    if (!objj_msgSend(_menuItem, "hasSubmenu"))
        return NO;
    return CGRectContainsPoint(objj_msgSend(_submenuView, "frame"), objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil));
}
}), new objj_method(sel_getUid("isHidden"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_menuItem, "isHidden");
}
}), new objj_method(sel_getUid("menuItem"), function(self, _cmd)
{ with(self)
{
    return _menuItem;
}
}), new objj_method(sel_getUid("setFont:"), function(self, _cmd, aFont)
{ with(self)
{
    if (_font == aFont)
        return;
    _font = aFont;
    objj_msgSend(self, "setDirty");
}
}), new objj_method(sel_getUid("setTextColor:"), function(self, _cmd, aColor)
{ with(self)
{
    if (_textColor == aColor)
        return;
    _textColor = aColor;
    objj_msgSend(_imageAndTextView, "setTextColor:", objj_msgSend(self, "textColor"));
    objj_msgSend(_submenuView, "setColor:", objj_msgSend(self, "textColor"));
}
}), new objj_method(sel_getUid("textColor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_menuItem, "isEnabled") ? (_textColor ? _textColor : objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 70.0 / 255.0, 69.0 / 255.0, 69.0 / 255.0, 1.0)) : objj_msgSend(CPColor, "darkGrayColor");
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPMenuItemView, "class"))
        return;
    _CPMenuItemSelectionColor = objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 95.0 / 255.0, 131.0 / 255.0, 185.0 / 255.0, 1.0);
    _CPMenuItemTextShadowColor = objj_msgSend(CPColor, "colorWithCalibratedRed:green:blue:alpha:", 26.0 / 255.0,  73.0 / 255.0, 109.0 / 255.0, 1.0)
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPMenuItemDefaultStateImages[CPOffState] = nil;
    _CPMenuItemDefaultStateHighlightedImages[CPOffState] = nil;
    _CPMenuItemDefaultStateImages[CPOnState] = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPMenuItem/CPMenuItemOnState.png"), CGSizeMake(14.0, 14.0));
    _CPMenuItemDefaultStateHighlightedImages[CPOnState] = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPMenuItem/CPMenuItemOnStateHighlighted.png"), CGSizeMake(14.0, 14.0));
    _CPMenuItemDefaultStateImages[CPMixedState] = nil;
    _CPMenuItemDefaultStateHighlightedImages[CPMixedState] = nil;
}
}), new objj_method(sel_getUid("leftMargin"), function(self, _cmd)
{ with(self)
{
    return LEFT_MARGIN + STATE_COLUMN_WIDTH;
}
})]);
}
{var the_class = objj_allocateClassPair(CPView, "_CPMenuItemArrowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_color")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("setColor:"), function(self, _cmd, aColor)
{ with(self)
{
    if (_color == aColor)
        return;
    _color = aColor;
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("drawRect:"), function(self, _cmd, aRect)
{ with(self)
{
    var context = objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort");
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 1.0, 4.0);
    CGContextAddLineToPoint(context, 9.0, 4.0);
    CGContextAddLineToPoint(context, 5.0, 8.0);
    CGContextAddLineToPoint(context, 1.0, 4.0);
    CGContextClosePath(context);
    CGContextSetFillColor(context, _color);
    CGContextFillPath(context);
}
})]);
}

