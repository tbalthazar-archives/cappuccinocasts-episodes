i;21;_CPImageAndTextView.ji;12;CGGeometry.ji;11;CPControl.jc;14976;
CPScaleProportionally = 0;
CPScaleToFit = 1;
CPScaleNone = 2;
CPNoImage = 0;
CPImageOnly = 1;
CPImageLeft = 2;
CPImageRight = 3;
CPImageBelow = 4;
CPImageAbove = 5;
CPImageOverlaps = 6;
CPOnState = 1;
CPOffState = 0;
CPMixedState = -1;
CPRoundedBezelStyle = 1;
CPRegularSquareBezelStyle = 2;
CPThickSquareBezelStyle = 3;
CPThickerSquareBezelStyle = 4;
CPDisclosureBezelStyle = 5;
CPShadowlessSquareBezelStyle = 6;
CPCircularBezelStyle = 7;
CPTexturedSquareBezelStyle = 8;
CPHelpButtonBezelStyle = 9;
CPSmallSquareBezelStyle = 10;
CPTexturedRoundedBezelStyle = 11;
CPRoundRectBezelStyle = 12;
CPRecessedBezelStyle = 13;
CPRoundedDisclosureBezelStyle = 14;
CPHUDBezelStyle = -1;
CPMomentaryLightButton = 0;
CPPushOnPushOffButton = 1;
CPToggleButton = 2;
CPSwitchButton = 3;
CPRadioButton = 4;
CPMomentaryChangeButton = 5;
CPOnOffButton = 6;
CPMomentaryPushInButton = 7;
CPMomentaryPushButton = 0;
CPMomentaryLight = 7;
var CPHUDBezelStyleTextColor = nil;
var _CPButtonClassName = nil,
    _CPButtonBezelStyleSizes = {},
    _CPButtonBezelStyleIdentifiers = {},
    _CPButtonBezelStyleHighlightedIdentifier = "Highlighted";
{var the_class = objj_allocateClassPair(CPControl, "CPButton"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_tag"), new objj_ivar("_state"), new objj_ivar("_allowsMixedState"), new objj_ivar("_title"), new objj_ivar("_alternateTitle"), new objj_ivar("_image"), new objj_ivar("_alternateImage"), new objj_ivar("_bezelInset"), new objj_ivar("_contentInset"), new objj_ivar("_bezelColor"), new objj_ivar("_bezelView"), new objj_ivar("_contentView"), new objj_ivar("_bezelStyle"), new objj_ivar("_isBordered"), new objj_ivar("_controlSize")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    if (self)
    {
        objj_msgSend(self, "setValue:forThemedAttributeName:", CPCenterTextAlignment, "alignment");
        objj_msgSend(self, "setValue:forThemedAttributeName:", CPCenterVerticalTextAlignment, "vertical-alignment");
        objj_msgSend(self, "setValue:forThemedAttributeName:", CPImageLeft, "image-position");
        objj_msgSend(self, "setValue:forThemedAttributeName:", CPScaleNone, "image-scaling");
        _controlSize = CPRegularControlSize;
        objj_msgSend(self, "setBordered:", YES);
    }
    return self;
}
}), new objj_method(sel_getUid("allowsMixedState"), function(self, _cmd)
{ with(self)
{
    return _allowsMixedState;
}
}), new objj_method(sel_getUid("setAllowsMixedState:"), function(self, _cmd, aFlag)
{ with(self)
{
    _allowsMixedState = aFlag;
}
}), new objj_method(sel_getUid("setNextState"), function(self, _cmd)
{ with(self)
{
    if (_state == CPOffState)
        _state = CPOnState;
    else
        _state = (_state >= CPOnState && _allowsMixedState) ? CPMixedState : CPOffState;
}
}), new objj_method(sel_getUid("setState:"), function(self, _cmd, aState)
{ with(self)
{
    _state = aState;
}
}), new objj_method(sel_getUid("state"), function(self, _cmd)
{ with(self)
{
    return _state;
}
}), new objj_method(sel_getUid("setTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    if (_title === aTitle)
        return;
    _title = aTitle;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("title"), function(self, _cmd)
{ with(self)
{
    return _title;
}
}), new objj_method(sel_getUid("setAlternateTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    if (_alternateTitle === aTitle)
        return;
    _alternateTitle = aTitle;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("alternateTitle"), function(self, _cmd)
{ with(self)
{
    return _alternateTitle;
}
}), new objj_method(sel_getUid("setImage:"), function(self, _cmd, anImage)
{ with(self)
{
    if (_image === anImage)
        return;
    _image = anImage;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("image"), function(self, _cmd)
{ with(self)
{
    return _image;
}
}), new objj_method(sel_getUid("setAlternateImage:"), function(self, _cmd, anImage)
{ with(self)
{
    if (_alternateImage === anImage)
        return;
    _alternateImage = anImage;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("alternateImage"), function(self, _cmd)
{ with(self)
{
    return _alternateImage;
}
}), new objj_method(sel_getUid("highlight:"), function(self, _cmd, aFlag)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "highlight:", aFlag);
    objj_msgSend(self, "drawBezelWithHighlight:", aFlag);
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
}), new objj_method(sel_getUid("startTrackingAt:"), function(self, _cmd, aPoint)
{ with(self)
{
    objj_msgSend(self, "highlight:", YES);
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "startTrackingAt:", aPoint);
}
}), new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"), function(self, _cmd, lastPoint, aPoint, mouseIsUp)
{ with(self)
{
    objj_msgSend(self, "highlight:", NO);
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "stopTracking:at:mouseIsUp:", lastPoint, aPoint, mouseIsUp);
}
}), new objj_method(sel_getUid("drawBezelWithHighlight:"), function(self, _cmd, shouldHighlight)
{ with(self)
{ return;
    _bezelBorderNeedsUpdate = !objj_msgSend(self, "window");
    if (_bezelBorderNeedsUpdate)
        return;
    objj_msgSend(self, "setBackgroundColorWithName:", shouldHighlight ? CPControlHighlightedBackgroundColor : CPControlNormalBackgroundColor);
}
}), new objj_method(sel_getUid("createBezelView"), function(self, _cmd)
{ with(self)
{
    var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
    objj_msgSend(view, "setHitTests:", NO);
    return view;
}
}), new objj_method(sel_getUid("createContentView"), function(self, _cmd)
{ with(self)
{
    var view = objj_msgSend(objj_msgSend(_CPImageAndTextView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
    return view;
}
}), new objj_method(sel_getUid("contentRectForBounds:"), function(self, _cmd, bounds)
{ with(self)
{
    var contentInset = objj_msgSend(self, "currentValueForThemedAttributeName:", "content-inset");
    if (((contentInset).left === 0 && (contentInset).top === 0 && (contentInset).right === 0 && (contentInset).bottom === 0))
        return bounds;
    bounds.origin.x += contentInset.left;
    bounds.origin.y += contentInset.top;
    bounds.size.width -= contentInset.left + contentInset.right;
    bounds.size.height -= contentInset.top + contentInset.bottom;
    return bounds;
}
}), new objj_method(sel_getUid("bezelRectForBounds:"), function(self, _cmd, bounds)
{ with(self)
{
    if (!objj_msgSend(self, "isBordered"))
        return { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
    var bezelInset = objj_msgSend(self, "currentValueForThemedAttributeName:", "bezel-inset");
    if (((bezelInset).left === 0 && (bezelInset).top === 0 && (bezelInset).right === 0 && (bezelInset).bottom === 0))
        return bounds;
    bounds.origin.x += bezelInset.left;
    bounds.origin.y += bezelInset.top;
    bounds.size.width -= bezelInset.left + bezelInset.right;
    bounds.size.height -= bezelInset.top + bezelInset.bottom;
    return bounds;
}
}), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function(self, _cmd, aName)
{ with(self)
{
    if (aName === "bezel-view")
        return objj_msgSend(self, "bezelRectForBounds:", objj_msgSend(self, "bounds"));
    else if (aName === "content-view")
        return objj_msgSend(self, "contentRectForBounds:", objj_msgSend(self, "bounds"));
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "rectForEphemeralSubviewNamed:", aName);
}
}), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function(self, _cmd, aName)
{ with(self)
{
    if (aName === "bezel-view")
    {
        var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
        objj_msgSend(view, "setHitTests:", NO);
        return view;
    }
    else
        return objj_msgSend(objj_msgSend(_CPImageAndTextView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "createEphemeralSubviewNamed:", aName);
}
}), new objj_method(sel_getUid("layoutSubviews"), function(self, _cmd)
{ with(self)
{
    var bezelView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "bezel-view", CPWindowBelow, "content-view");
    if (bezelView)
        objj_msgSend(bezelView, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemedAttributeName:", "bezel-color"));
    var contentView = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", "content-view", CPWindowAbove, "bezel-view");
    if (contentView)
    {
        objj_msgSend(contentView, "setText:", ((_controlState & CPControlStateHighlighted) && _alternateTitle) ? _alternateTitle : _title);
        objj_msgSend(contentView, "setImage:", ((_controlState & CPControlStateHighlighted) && _alternateImage) ? _alternateImage : _image);
        objj_msgSend(contentView, "setFont:", objj_msgSend(self, "currentValueForThemedAttributeName:", "font"));
        objj_msgSend(contentView, "setTextColor:", objj_msgSend(self, "currentValueForThemedAttributeName:", "text-color"));
        objj_msgSend(contentView, "setAlignment:", objj_msgSend(self, "currentValueForThemedAttributeName:", "alignment"));
        objj_msgSend(contentView, "setVerticalAlignment:", objj_msgSend(self, "currentValueForThemedAttributeName:", "vertical-alignment"));
        objj_msgSend(contentView, "setLineBreakMode:", objj_msgSend(self, "currentValueForThemedAttributeName:", "line-break-mode"));
        objj_msgSend(contentView, "setTextShadowColor:", objj_msgSend(self, "currentValueForThemedAttributeName:", "text-shadow-color"));
        objj_msgSend(contentView, "setTextShadowOffset:", objj_msgSend(self, "currentValueForThemedAttributeName:", "text-shadow-offset"));
        objj_msgSend(contentView, "setImagePosition:", objj_msgSend(self, "currentValueForThemedAttributeName:", "image-position"));
        objj_msgSend(contentView, "setImageScaling:", objj_msgSend(self, "currentValueForThemedAttributeName:", "image-scaling"));
    }
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themedAttributes"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [{ top:(0), left:(0), bottom:(0), right:(0) }, { top:(0), left:(0), bottom:(0), right:(0) }, nil], ["bezel-inset", "content-inset", "bezel-color"]);
}
})]);
}
{
var the_class = objj_getClass("CPButton")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPButton\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setBezelStyle:"), function(self, _cmd, aBezelStyle)
{ with(self)
{
}
}), new objj_method(sel_getUid("bezelStyle"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("setBordered:"), function(self, _cmd, shouldBeBordered)
{ with(self)
{
    if ((!!(_controlState & CPControlStateBordered)) === shouldBeBordered)
        return;
    if (shouldBeBordered)
        _controlState |= CPControlStateBordered;
    else
        _controlState &= ~CPControlStateBordered;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("isBordered"), function(self, _cmd)
{ with(self)
{
    return !!(_controlState & CPControlStateBordered);
}
})]);
}
var CPButtonImageKey = "CPButtonImageKey",
    CPButtonAlternateImageKey = "CPButtonAlternateImageKey",
    CPButtonTitleKey = "CPButtonTitleKey",
    CPButtonAlternateTitleKey = "CPButtonAlternateTitleKey",
    CPButtonContentInsetKey = "CPButtonContentInsetKey",
    CPButtonBezelInsetKey = "CPButtonBezelInsetKey",
    CPButtonBezelColorKey = "CPButtonBezelColorKey",
    CPButtonImageAndTitleViewKey = "CPButtonImageAndTitleViewKey",
    CPButtonImagePositionKey = "CPButtonImagePositionKey",
    CPButtonImageScalingKey = "CPButtonImageScalingKey",
    CPButtonIsBorderedKey = "CPButtonIsBorderedKey",
    CPButtonBezelStyleKey = "CPButtonBezelStyleKey",
    CPButtonImageAndTitleViewKey = "CPButtonImageAndTitleViewKey";
{
var the_class = objj_getClass("CPButton")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPButton\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder);
    if (self)
    {
        _controlSize = CPRegularControlSize;
        objj_msgSend(self, "setImage:", objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonImageKey));
        objj_msgSend(self, "setAlternateImage:", objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonAlternateImageKey));
        objj_msgSend(self, "setTitle:", objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonTitleKey));
        objj_msgSend(self, "setAlternateTitle:", objj_msgSend(aCoder, "decodeObjectForKey:", CPButtonAlternateTitleKey));
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", _image, CPButtonImageKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _alternateImage, CPButtonAlternateImageKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _title, CPButtonTitleKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _alternateTitle, CPButtonAlternateTitleKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _bezelStyle, CPButtonBezelStyleKey);
}
})]);
}

