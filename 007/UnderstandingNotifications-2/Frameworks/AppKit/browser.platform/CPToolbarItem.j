I;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;16;AppKit/CPImage.jI;15;AppKit/CPView.jc;12179;
CPToolbarItemVisibilityPriorityStandard = 0;
CPToolbarItemVisibilityPriorityLow = -1000;
CPToolbarItemVisibilityPriorityHigh = 1000;
CPToolbarItemVisibilityPriorityUser = 2000;
CPToolbarSeparatorItemIdentifier = "CPToolbarSeparatorItemIdentifier";
CPToolbarSpaceItemIdentifier = "CPToolbarSpaceItemIdentifier";
CPToolbarFlexibleSpaceItemIdentifier = "CPToolbarFlexibleSpaceItemIdentifier";
CPToolbarShowColorsItemIdentifier = "CPToolbarShowColorsItemIdentifier";
CPToolbarShowFontsItemIdentifier = "CPToolbarShowFontsItemIdentifier";
CPToolbarCustomizeToolbarItemIdentifier = "CPToolbarCustomizeToolbarItemIdentifier";
CPToolbarPrintItemIdentifier = "CPToolbarPrintItemIdentifier";
{var the_class = objj_allocateClassPair(CPObject, "CPToolbarItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_itemIdentifier"), new objj_ivar("_toolbar"), new objj_ivar("_label"), new objj_ivar("_paletteLabel"), new objj_ivar("_toolTip"), new objj_ivar("_tag"), new objj_ivar("_target"), new objj_ivar("_action"), new objj_ivar("_isEnabled"), new objj_ivar("_image"), new objj_ivar("_alternateImage"), new objj_ivar("_view"), new objj_ivar("_minSize"), new objj_ivar("_maxSize"), new objj_ivar("_visibilityPriority")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithItemIdentifier:"), function(self, _cmd, anItemIdentifier)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _itemIdentifier = anItemIdentifier;
        _tag = 0;
        _isEnabled = YES;
        _minSize = CGSizeMakeZero();
        _maxSize = CGSizeMakeZero();
        _visibilityPriority = CPToolbarItemVisibilityPriorityStandard;
    }
    return self;
}
}), new objj_method(sel_getUid("itemIdentifier"), function(self, _cmd)
{ with(self)
{
    return _itemIdentifier;
}
}), new objj_method(sel_getUid("toolbar"), function(self, _cmd)
{ with(self)
{
    return _toolbar;
}
}), new objj_method(sel_getUid("label"), function(self, _cmd)
{ with(self)
{
    return _label;
}
}), new objj_method(sel_getUid("setLabel:"), function(self, _cmd, aLabel)
{ with(self)
{
    _label = aLabel;
}
}), new objj_method(sel_getUid("paletteLabel"), function(self, _cmd)
{ with(self)
{
    return _paletteLabel;
}
}), new objj_method(sel_getUid("setPaletteLabel:"), function(self, _cmd, aPaletteLabel)
{ with(self)
{
    _paletteLabel = aPaletteLabel;
}
}), new objj_method(sel_getUid("toolTip"), function(self, _cmd)
{ with(self)
{
    if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("toolTip")))
        return objj_msgSend(_view, "toolTip");
    return _toolTip;
}
}), new objj_method(sel_getUid("setToolTip:"), function(self, _cmd, aToolTip)
{ with(self)
{
    if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("setToolTip:")))
        objj_msgSend(view, "setToolTip:", aToolTip);
    _toolTip = aToolTip;
}
}), new objj_method(sel_getUid("tag"), function(self, _cmd)
{ with(self)
{
    if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("tag")))
        return objj_msgSend(_view, "tag");
    return _tag;
}
}), new objj_method(sel_getUid("setTag:"), function(self, _cmd, aTag)
{ with(self)
{
    if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("setTag:")))
        objj_msgSend(_view, "setTag:", aTag);
    _tag = aTag;
}
}), new objj_method(sel_getUid("target"), function(self, _cmd)
{ with(self)
{
    if (_view)
        return objj_msgSend(_view, "respondsToSelector:", sel_getUid("target")) ? objj_msgSend(_view, "target") : nil;
    return _target;
}
}), new objj_method(sel_getUid("setTarget:"), function(self, _cmd, aTarget)
{ with(self)
{
    if (!_view)
        _target = aTarget;
    else if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("setTarget:")))
        objj_msgSend(_view, "setTarget:", aTarget);
}
}), new objj_method(sel_getUid("action"), function(self, _cmd)
{ with(self)
{
    if (_view)
        return objj_msgSend(_view, "respondsToSelector:", sel_getUid("action")) ? objj_msgSend(_view, "action") : nil;
    return _action;
}
}), new objj_method(sel_getUid("setAction:"), function(self, _cmd, anAction)
{ with(self)
{
    if (!_view)
        _action = anAction;
    else if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("setAction:")))
        objj_msgSend(_view, "setAction:", anAction);
}
}), new objj_method(sel_getUid("isEnabled"), function(self, _cmd)
{ with(self)
{
    if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("isEnabled")))
        return objj_msgSend(_view, "isEnabled");
    return _isEnabled;
}
}), new objj_method(sel_getUid("setEnabled:"), function(self, _cmd, shouldBeEnabled)
{ with(self)
{
    if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("setEnabled:")))
        objj_msgSend(_view, "setEnabled:", shouldBeEnabled);
    _isEnabled = shouldBeEnabled;
}
}), new objj_method(sel_getUid("image"), function(self, _cmd)
{ with(self)
{
    if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("image")))
        return objj_msgSend(_view, "image");
    return _image;
}
}), new objj_method(sel_getUid("setImage:"), function(self, _cmd, anImage)
{ with(self)
{
    if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("setImage:")))
        objj_msgSend(_view, "setImage:", anImage);
    _image = anImage;
    if (!_image)
        return;
    if (_minSize.width == 0 && _minSize.height == 0 &&
        _maxSize.width == 0 && _maxSize.height == 0)
    {
        var imageSize = objj_msgSend(_image, "size");
        if (imageSize.width > 0 || imageSize.height > 0)
        {
            objj_msgSend(self, "setMinSize:", imageSize);
            objj_msgSend(self, "setMaxSize:", imageSize);
        }
    }
}
}), new objj_method(sel_getUid("setAlternateImage:"), function(self, _cmd, anImage)
{ with(self)
{
    if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("setAlternateImage:")))
        objj_msgSend(_view, "setAlternateImage:", anImage);
    _alternateImage = anImage;
}
}), new objj_method(sel_getUid("alternateImage"), function(self, _cmd)
{ with(self)
{
    if (objj_msgSend(_view, "respondsToSelector:", sel_getUid("alternateIamge")))
        return objj_msgSend(_view, "alternateImage");
    return _alternateImage;
}
}), new objj_method(sel_getUid("view"), function(self, _cmd)
{ with(self)
{
    return _view;
}
}), new objj_method(sel_getUid("setView:"), function(self, _cmd, aView)
{ with(self)
{
    if (_view == aView)
        return;
    _view = aView;
    if (_view)
    {
        if (_tag !== 0 && objj_msgSend(_view, "respondsToSelector:", sel_getUid("setTag:")))
            objj_msgSend(_view, "setTag:", _tag);
        _target = nil;
        _action = nil;
    }
}
}), new objj_method(sel_getUid("minSize"), function(self, _cmd)
{ with(self)
{
    return _minSize;
}
}), new objj_method(sel_getUid("setMinSize:"), function(self, _cmd, aMinSize)
{ with(self)
{
    _minSize = CGSizeMakeCopy(aMinSize);
    _maxSize = CGSizeMake(MAX(_minSize.width, _maxSize.width), MAX(_minSize.height, _maxSize.height));
}
}), new objj_method(sel_getUid("maxSize"), function(self, _cmd)
{ with(self)
{
    return _maxSize;
}
}), new objj_method(sel_getUid("setMaxSize:"), function(self, _cmd, aMaxSize)
{ with(self)
{
    _maxSize = CGSizeMakeCopy(aMaxSize);
    _minSize = CGSizeMake(MIN(_minSize.width, _maxSize.width), MIN(_minSize.height, _maxSize.height));
}
}), new objj_method(sel_getUid("visibilityPriority"), function(self, _cmd)
{ with(self)
{
    return _visibilityPriority;
}
}), new objj_method(sel_getUid("setVisibilityPriority:"), function(self, _cmd, aVisibilityPriority)
{ with(self)
{
    _visibilityPriority = aVisibilityPriority;
}
})]);
}
{
var the_class = objj_getClass("CPToolbarItem")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPToolbarItem\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("copy"), function(self, _cmd)
{ with(self)
{
    var copy = objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "initWithItemIdentifier:", _itemIdentifier);
    if (_view)
        objj_msgSend(copy, "setView:", objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", _view)));
    objj_msgSend(copy, "setLabel:", _label);
    objj_msgSend(copy, "setPaletteLabel:", _paletteLabel);
    objj_msgSend(copy, "setToolTip:", objj_msgSend(self, "toolTip"));
    objj_msgSend(copy, "setTag:", objj_msgSend(self, "tag"));
    objj_msgSend(copy, "setTarget:", objj_msgSend(self, "target"));
    objj_msgSend(copy, "setAction:", objj_msgSend(self, "action"));
    objj_msgSend(copy, "setEnabled:", objj_msgSend(self, "isEnabled"));
    objj_msgSend(copy, "setImage:", _image);
    objj_msgSend(copy, "setAlternateImage:", _alternateImage);
    objj_msgSend(copy, "setMinSize:", _minSize);
    objj_msgSend(copy, "setMaxSize:", _maxSize);
    objj_msgSend(copy, "setVisibilityPriority:", _visibilityPriority);
    return copy;
}
})]);
}
var _CPToolbarSeparatorItemView = nil,
    _CPToolbarSpaceItemView = nil;
{
var the_class = objj_getClass("CPToolbarItem")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPToolbarItem\""));
var meta_class = the_class.isa;class_addMethods(meta_class, [new objj_method(sel_getUid("_separatorItemView"), function(self, _cmd)
{ with(self)
{
    if (!_CPToolbarSeparatorItemView)
    {
        _CPToolbarSeparatorItemView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, 2.0, 32.0));
        sizes = {};
        sizes["CPToolbarItemSeparator"] = [CGSizeMake(2.0, 26.0), CGSizeMake(2.0, 1.0), CGSizeMake(2.0, 26.0)];
        objj_msgSend(_CPToolbarSeparatorItemView, "setBackgroundColor:", _CPControlThreePartImagePattern(YES, sizes, "CPToolbarItem", "Separator"));
    }
    return _CPToolbarSeparatorItemView;
}
}), new objj_method(sel_getUid("_spaceItemView"), function(self, _cmd)
{ with(self)
{
    if (!_CPToolbarSpaceItemView)
        _CPToolbarSpaceItemView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
    return _CPToolbarSpaceItemView;
}
}), new objj_method(sel_getUid("_standardItemWithItemIdentifier:"), function(self, _cmd, anItemIdentifier)
{ with(self)
{
    var item = objj_msgSend(objj_msgSend(CPToolbarItem, "alloc"), "initWithItemIdentifier:", anItemIdentifier);
    switch (anItemIdentifier)
    {
        case CPToolbarSeparatorItemIdentifier: objj_msgSend(item, "setView:", objj_msgSend(self, "_separatorItemView"));
                                                        objj_msgSend(item, "setMinSize:", CGSizeMake(2.0, 0.0));
                                                        objj_msgSend(item, "setMaxSize:", CGSizeMake(2.0, 100000.0));
                                                        return item;
        case CPToolbarSpaceItemIdentifier: objj_msgSend(item, "setView:", objj_msgSend(self, "_spaceItemView"));
                                                        objj_msgSend(item, "setMinSize:", CGSizeMake(32.0, 32.0));
                                                        objj_msgSend(item, "setMaxSize:", CGSizeMake(32.0, 32.0));
                                                        return item;
        case CPToolbarFlexibleSpaceItemIdentifier: objj_msgSend(item, "setView:", objj_msgSend(self, "_spaceItemView"));
                                                        objj_msgSend(item, "setMinSize:", CGSizeMake(32.0, 32.0));
                                                        objj_msgSend(item, "setMaxSize:", CGSizeMake(10000.0, 32.0));
                                                        return item;
        case CPToolbarShowColorsItemIdentifier: return nil;
        case CPToolbarShowFontsItemIdentifier: return nil;
        case CPToolbarCustomizeToolbarItemIdentifier: return nil;
        case CPToolbarPrintItemIdentifier: return nil;
    }
    return nil;
}
})]);
}

