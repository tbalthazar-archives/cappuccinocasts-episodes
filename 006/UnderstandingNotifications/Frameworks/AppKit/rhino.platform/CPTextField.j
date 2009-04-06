i;11;CPControl.ji;17;CPStringDrawing.jc;23326;
CGPointMake= function(x, y) { return { x:x, y:y }; }
CGPointMakeZero= function() { return { x:0.0, y:0.0 }; }
CGPointMakeCopy= function(aPoint) { return { x:aPoint.x, y:aPoint.y }; }
CGPointCreateCopy= function(aPoint) { return { x:aPoint.x, y:aPoint.y }; }
CGPointEqualToPoint= function(lhsPoint, rhsPoint) { return (lhsPoint.x == rhsPoint.x && lhsPoint.y == rhsPoint.y); }
CGStringFromPoint= function(aPoint) { return ("{" + aPoint.x + ", " + aPoint.y + "}"); }
CGSizeMake= function(width, height) { return { width:width, height:height }; }
CGSizeMakeZero= function() { return { width:0.0, height:0.0 }; }
CGSizeMakeCopy= function(aSize) { return { width:aSize.width, height:aSize.height }; }
CGSizeCreateCopy= function(aSize) { return { width:aSize.width, height:aSize.height }; }
CGSizeEqualToSize= function(lhsSize, rhsSize) { return (lhsSize.width == rhsSize.width && lhsSize.height == rhsSize.height); }
CGStringFromSize= function(aSize) { return ("{" + aSize.width + ", " + aSize.height + "}"); }
CGRectMake= function(x, y, width, height) { return { origin: { x:x, y:y }, size: { width:width, height:height } }; }
CGRectMakeZero= function() { return { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } }; }
CGRectMakeCopy= function(aRect) { return { origin: { x:aRect.origin.x, y:aRect.origin.y }, size: { width:aRect.size.width, height:aRect.size.height } }; }
CGRectCreateCopy= function(aRect) { return { origin: { x:aRect.origin.x, y:aRect.origin.y }, size: { width:aRect.size.width, height:aRect.size.height } }; }
CGRectEqualToRect= function(lhsRect, rhsRect) { return ((lhsRect.origin.x == rhsRect.origin.x && lhsRect.origin.y == rhsRect.origin.y) && (lhsRect.size.width == rhsRect.size.width && lhsRect.size.height == rhsRect.size.height)); }
CGStringFromRect= function(aRect) { return ("{" + ("{" + aRect.origin.x + ", " + aRect.origin.y + "}") + ", " + ("{" + aRect.size.width + ", " + aRect.size.height + "}") + "}"); }
CGRectOffset= function(aRect, dX, dY) { return { origin: { x:aRect.origin.x + dX, y:aRect.origin.y + dY }, size: { width:aRect.size.width, height:aRect.size.height } }; }
CGRectInset= function(aRect, dX, dY) { return { origin: { x:aRect.origin.x + dX, y:aRect.origin.y + dY }, size: { width:aRect.size.width - 2 * dX, height:aRect.size.height - 2 * dY } }; }
CGRectGetHeight= function(aRect) { return (aRect.size.height); }
CGRectGetMaxX= function(aRect) { return (aRect.origin.x + aRect.size.width); }
CGRectGetMaxY= function(aRect) { return (aRect.origin.y + aRect.size.height); }
CGRectGetMidX= function(aRect) { return (aRect.origin.x + (aRect.size.width) / 2.0); }
CGRectGetMidY= function(aRect) { return (aRect.origin.y + (aRect.size.height) / 2.0); }
CGRectGetMinX= function(aRect) { return (aRect.origin.x); }
CGRectGetMinY= function(aRect) { return (aRect.origin.y); }
CGRectGetWidth= function(aRect) { return (aRect.size.width); }
CGRectIsEmpty= function(aRect) { return (aRect.size.width <= 0.0 || aRect.size.height <= 0.0); }
CGRectIsNull= function(aRect) { return (aRect.size.width <= 0.0 || aRect.size.height <= 0.0); }
CGRectContainsPoint= function(aRect, aPoint) { return (aPoint.x >= (aRect.origin.x) && aPoint.y >= (aRect.origin.y) && aPoint.x < (aRect.origin.x + aRect.size.width) && aPoint.y < (aRect.origin.y + aRect.size.height)); }
CGInsetMake= function(top, left, bottom, right) { return { top:(top), left:(left), bottom:(bottom), right:(right) }; }
CGInsetMakeZero= function() { return { top:(0), left:(0), bottom:(0), right:(0) }; }
CGInsetMakeCopy= function(anInset) { return { top:(anInset.top), left:(anInset.left), bottom:(anInset.bottom), right:(anInset.right) }; }
CGInsetIsEmpty= function(anInset) { return ((anInset).left === 0 && (anInset).top === 0 && (anInset).right === 0 && (anInset).bottom === 0); }
CGRectContainsRect= function(lhsRect, rhsRect)
{
    var union = CGRectUnion(lhsRect, rhsRect);
    return ((union.origin.x == lhsRect.origin.x && union.origin.y == lhsRect.origin.y) && (union.size.width == lhsRect.size.width && union.size.height == lhsRect.size.height));
}
CGRectIntersectsRect= function(lhsRect, rhsRect)
{
    var intersection = CGRectIntersection(lhsRect, rhsRect);
    return !(intersection.size.width <= 0.0 || intersection.size.height <= 0.0);
}
CGRectIntegral= function(aRect)
{
    aRect = CGRectStandardize(aRect);
    var x = FLOOR((aRect.origin.x)),
        y = FLOOR((aRect.origin.y));
    aRect.size.width = CEIL((aRect.origin.x + aRect.size.width)) - x;
    aRect.size.height = CEIL((aRect.origin.y + aRect.size.height)) - y;
    aRect.origin.x = x;
    aRect.origin.y = y;
    return aRect;
}
CGRectIntersection= function(lhsRect, rhsRect)
{
    var intersection = { origin: { x:MAX((lhsRect.origin.x), (rhsRect.origin.x)), y:MAX((lhsRect.origin.y), (rhsRect.origin.y)) }, size: { width:0, height:0 } };
    intersection.size.width = MIN((lhsRect.origin.x + lhsRect.size.width), (rhsRect.origin.x + rhsRect.size.width)) - (intersection.origin.x);
    intersection.size.height = MIN((lhsRect.origin.y + lhsRect.size.height), (rhsRect.origin.y + rhsRect.size.height)) - (intersection.origin.y);
    return (intersection.size.width <= 0.0 || intersection.size.height <= 0.0) ? { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } } : intersection;
}
CGRectStandardize= function(aRect)
{
    var width = (aRect.size.width),
        height = (aRect.size.height),
        standardized = aRect;
    if (width < 0.0)
    {
        if (standardized == aRect)
            standardized = { origin: { x:aRect.origin.x, y:aRect.origin.y }, size: { width:aRect.size.width, height:aRect.size.height } };
        standardized.origin.x += width;
        standardized.size.width = -width;
    }
    if (height < 0.0)
    {
        if (standardized == aRect)
            standardized = { origin: { x:aRect.origin.x, y:aRect.origin.y }, size: { width:aRect.size.width, height:aRect.size.height } };
        standardized.origin.y += height;
        standardized.size.height = -height;
    }
    return standardized;
}
CGRectUnion= function(lhsRect, rhsRect)
{
    var minX = MIN((lhsRect.origin.x), (rhsRect.origin.x)),
        minY = MIN((lhsRect.origin.y), (rhsRect.origin.y)),
        maxX = MAX((lhsRect.origin.x + lhsRect.size.width), (rhsRect.origin.x + rhsRect.size.width)),
        maxY = MAX((lhsRect.origin.y + lhsRect.size.height), (rhsRect.origin.y + rhsRect.size.height));
    return { origin: { x:minX, y:minY }, size: { width:maxX - minX, height:maxY - minY } };
}
CGPointFromString= function(aString)
{
    var comma = aString.indexOf(',');
    return { x:parseInt(aString.substr(1, comma - 1)), y:parseInt(aString.substring(comma + 1, aString.length)) };
}
CGSizeFromString= function(aString)
{
    var comma = aString.indexOf(',');
    return { width:parseInt(aString.substr(1, comma - 1)), height:parseInt(aString.substring(comma + 1, aString.length)) };
}
CGRectFromString= function(aString)
{
    var comma = aString.indexOf(',', aString.indexOf(',') + 1);
    return { origin:CGPointFromString(aString.substr(1, comma - 1)), size:CGSizeFromString(aString.substring(comma + 2, aString.length)) };
}
CGPointFromEvent= function(anEvent)
{
    return { x:anEvent.clientX, y:anEvent.clientY };
}
CPLineBreakByWordWrapping = 0;
CPLineBreakByCharWrapping = 1;
CPLineBreakByClipping = 2;
CPLineBreakByTruncatingHead = 3;
CPLineBreakByTruncatingTail = 4;
CPLineBreakByTruncatingMiddle = 5;
CPTextFieldSquareBezel = 0;
CPTextFieldRoundedBezel = 1;
{
var the_class = objj_getClass("CPString")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPString\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("string"), function(self, _cmd)
{ with(self)
{
    return self;
}
})]);
}
CPTextFieldStateRounded = 1 << 12;
CPTextFieldStatePlaceholder = 1 << 13;
{var the_class = objj_allocateClassPair(CPControl, "CPTextField"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isEditable"), new objj_ivar("_isSelectable"), new objj_ivar("_drawsBackground"), new objj_ivar("_textFieldBackgroundColor"), new objj_ivar("_placeholderString"), new objj_ivar("_delegate"), new objj_ivar("_textDidChangeValue"), new objj_ivar("_bezelStyle"), new objj_ivar("_isBordered"), new objj_ivar("_controlSize")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);

    if (self)
    {
        objj_msgSend(self, "setStringValue:", "");
        objj_msgSend(self, "setPlaceholderString:", "");

        _sendActionOn = CPKeyUpMask | CPKeyDownMask;

        objj_msgSend(self, "setValue:forThemedAttributeName:", CPLeftTextAlignment, "alignment");
    }

    return self;
}
}), new objj_method(sel_getUid("setEditable:"), function(self, _cmd, shouldBeEditable)
{ with(self)
{
    _isEditable = shouldBeEditable;
}
}), new objj_method(sel_getUid("isEditable"), function(self, _cmd)
{ with(self)
{
    return _isEditable;
}
}), new objj_method(sel_getUid("setSelectable:"), function(self, _cmd, aFlag)
{ with(self)
{
    _isSelectable = aFlag;
}
}), new objj_method(sel_getUid("isSelectable"), function(self, _cmd)
{ with(self)
{
    return _isSelectable;
}
}), new objj_method(sel_getUid("setBezeled:"), function(self, _cmd, shouldBeBezeled)
{ with(self)
{
    if ((!!(_controlState & CPControlStateBezeled)) === shouldBeBezeled)
        return;

    if (shouldBeBezeled)
        _controlState |= CPControlStateBezeled;
    else
        _controlState &= ~CPControlStateBezeled;

    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("isBezeled"), function(self, _cmd)
{ with(self)
{
    return !!(_controlState & CPControlStateBezeled);
}
}), new objj_method(sel_getUid("setBezelStyle:"), function(self, _cmd, aBezelStyle)
{ with(self)
{
    var shouldBeRounded = aBezelStyle === CPTextFieldRoundedBezel;

    if ((!!(_controlState & CPTextFieldStateRounded)) === shouldBeRounded)
        return;

    if (shouldBeRounded)
        _controlState |= CPTextFieldStateRounded;
    else
        _controlState &= ~CPTextFieldStateRounded;

    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("bezelStyle"), function(self, _cmd)
{ with(self)
{
    if (_controlState & CPTextFieldStateRounded)
        return CPTextFieldRoundedBezel;

    return CPTextFieldSquareBezel;
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
}), new objj_method(sel_getUid("setDrawsBackground:"), function(self, _cmd, shouldDrawBackground)
{ with(self)
{
    if (_drawsBackground == shouldDrawBackground)
        return;

    _drawsBackground = shouldDrawBackground;

    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("drawsBackground"), function(self, _cmd)
{ with(self)
{
    return _drawsBackground;
}
}), new objj_method(sel_getUid("setTextFieldBackgroundColor:"), function(self, _cmd, aColor)
{ with(self)
{
    if (_textFieldBackgroundColor == aColor)
        return;

    _textFieldBackgroundColor = aColor;

    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("textFieldBackgroundColor"), function(self, _cmd)
{ with(self)
{
    return _textFieldBackgroundColor;
}
}), new objj_method(sel_getUid("acceptsFirstResponder"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "isEditable") && objj_msgSend(self, "isEnabled");
}
}), new objj_method(sel_getUid("becomeFirstResponder"), function(self, _cmd)
{ with(self)
{
    _controlState |= CPControlStateEditing;
    objj_msgSend(self, "setNeedsLayout");
    return YES;
}
}), new objj_method(sel_getUid("resignFirstResponder"), function(self, _cmd)
{ with(self)
{
    _controlState &= ~CPControlStateEditing;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "textDidEndEditing:", objj_msgSend(CPNotification, "notificationWithName:object:userInfo:", CPControlTextDidBeginEditingNotification, self, nil));
    return YES;
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(self, "isEditable") && objj_msgSend(self, "isEnabled"))
        return objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self);
    else
        return objj_msgSend(objj_msgSend(self, "nextResponder"), "mouseDown:", anEvent);
}
}), new objj_method(sel_getUid("objectValue"), function(self, _cmd)
{ with(self)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "objectValue");
}
}), new objj_method(sel_getUid("setObjectValue:"), function(self, _cmd, aValue)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setObjectValue:", aValue);
    var string = objj_msgSend(self, "stringValue");
    if (!string || objj_msgSend(string, "length") === 0)
        _controlState |= CPTextFieldStatePlaceholder;
    else
        _controlState &= ~CPTextFieldStatePlaceholder;
}
}), new objj_method(sel_getUid("setPlaceholderString:"), function(self, _cmd, aStringValue)
{ with(self)
{
    if (_placeholderString === aStringValue)
        return;
    _placeholderString = aStringValue;
    if (_controlState & CPTextFieldStatePlaceholder)
    {
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
}
}), new objj_method(sel_getUid("placeholderString"), function(self, _cmd)
{ with(self)
{
    return _placeholderString;
}
}), new objj_method(sel_getUid("sizeToFit"), function(self, _cmd)
{ with(self)
{
    var size = objj_msgSend((_value || " "), "sizeWithFont:", objj_msgSend(self, "font")),
        contentInset = objj_msgSend(self, "currentValueForThemedAttributeName:", "content-inset");
    objj_msgSend(self, "setFrameSize:", CGSizeMake(size.width + contentInset.left + contentInset.right, size.height + contentInset.top + contentInset.bottom));
}
}), new objj_method(sel_getUid("selectText:"), function(self, _cmd, sender)
{ with(self)
{
}
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_delegate)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", _delegate, CPControlTextDidBeginEditingNotification, self);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", _delegate, CPControlTextDidChangeNotification, self);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", _delegate, CPControlTextDidEndEditingNotification, self);
    }
    _delegate = aDelegate;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("controlTextDidBeginEditing:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("controlTextDidBeginEditing:"), CPControlTextDidBeginEditingNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("controlTextDidChange:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("controlTextDidChange:"), CPControlTextDidChangeNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("controlTextDidEndEditing:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("controlTextDidEndEditing:"), CPControlTextDidEndEditingNotification, self);
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("contentRectForBounds:"), function(self, _cmd, bounds)
{ with(self)
{
    var contentInset = objj_msgSend(self, "currentValueForThemedAttributeName:", "content-inset");
    if (!contentInset)
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
    var bezelInset = objj_msgSend(self, "currentValueForThemedAttributeName:", "bezel-inset");
    if (!((bezelInset).left === 0 && (bezelInset).top === 0 && (bezelInset).right === 0 && (bezelInset).bottom === 0))
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
    {
        var view = objj_msgSend(objj_msgSend(_CPImageAndTextView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
        return view;
    }
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
        objj_msgSend(contentView, "setHidden:", _controlState & CPControlStateEditing);
        if (_controlState & CPTextFieldStatePlaceholder)
            objj_msgSend(contentView, "setText:", objj_msgSend(self, "placeholderString"));
        else
            objj_msgSend(contentView, "setText:", objj_msgSend(self, "stringValue"));
        objj_msgSend(contentView, "setTextColor:", objj_msgSend(self, "currentValueForThemedAttributeName:", "text-color"));
        objj_msgSend(contentView, "setFont:", objj_msgSend(self, "currentValueForThemedAttributeName:", "font"));
        objj_msgSend(contentView, "setAlignment:", objj_msgSend(self, "currentValueForThemedAttributeName:", "alignment"));
        objj_msgSend(contentView, "setVerticalAlignment:", objj_msgSend(self, "currentValueForThemedAttributeName:", "vertical-alignment"));
        objj_msgSend(contentView, "setLineBreakMode:", objj_msgSend(self, "currentValueForThemedAttributeName:", "line-break-mode"));
        objj_msgSend(contentView, "setTextShadowColor:", objj_msgSend(self, "currentValueForThemedAttributeName:", "text-shadow-color"));
        objj_msgSend(contentView, "setTextShadowOffset:", objj_msgSend(self, "currentValueForThemedAttributeName:", "text-shadow-offset"));
    }
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themedAttributes"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [{ top:(0), left:(0), bottom:(0), right:(0) }, { top:(2.0), left:(2.0), bottom:(2.0), right:(2.0) }, { top:(2.0), left:(2.0), bottom:(2.0), right:(2.0) }, nil], ["bezel-inset", "content-inset", "bezeled-content-inset", "bezel-color"]);
}
})]);
}
var CPTextFieldIsEditableKey = "CPTextFieldIsEditableKey",
    CPTextFieldIsSelectableKey = "CPTextFieldIsSelectableKey",
    CPTextFieldIsBorderedKey = "CPTextFieldIsBorderedKey",
    CPTextFieldIsBezeledKey = "CPTextFieldIsBezeledKey",
    CPTextFieldBezelStyleKey = "CPTextFieldBezelStyleKey",
    CPTextFieldDrawsBackgroundKey = "CPTextFieldDrawsBackgroundKey",
    CPTextFieldLineBreakModeKey = "CPTextFieldLineBreakModeKey",
    CPTextFieldBackgroundColorKey = "CPTextFieldBackgroundColorKey",
    CPTextFieldPlaceholderStringKey = "CPTextFieldPlaceholderStringKey";
{
var the_class = objj_getClass("CPTextField")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPTextField\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder);
    if (self)
    {
        objj_msgSend(self, "setEditable:", objj_msgSend(aCoder, "decodeBoolForKey:", CPTextFieldIsEditableKey));
        objj_msgSend(self, "setSelectable:", objj_msgSend(aCoder, "decodeBoolForKey:", CPTextFieldIsSelectableKey));
        objj_msgSend(self, "setDrawsBackground:", objj_msgSend(aCoder, "decodeBoolForKey:", CPTextFieldDrawsBackgroundKey));
        objj_msgSend(self, "setTextFieldBackgroundColor:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTextFieldBackgroundColorKey));
        objj_msgSend(self, "setPlaceholderString:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTextFieldPlaceholderStringKey));
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isEditable, CPTextFieldIsEditableKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isSelectable, CPTextFieldIsSelectableKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _drawsBackground, CPTextFieldDrawsBackgroundKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _textFieldBackgroundColor, CPTextFieldBackgroundColorKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _placeholderString, CPTextFieldPlaceholderStringKey);
}
})]);
}

