i;8;CPView.ji;12;CPClipView.ji;12;CPScroller.jc;20163;
{var the_class = objj_allocateClassPair(CPView, "CPScrollView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contentView"), new objj_ivar("_hasVerticalScroller"), new objj_ivar("_hasHorizontalScroller"), new objj_ivar("_autohidesScrollers"), new objj_ivar("_verticalScroller"), new objj_ivar("_horizontalScroller"), new objj_ivar("_recursionCount"), new objj_ivar("_verticalLineScroll"), new objj_ivar("_verticalPageScroll"), new objj_ivar("_horizontalLineScroll"), new objj_ivar("_horizontalPageScroll")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _verticalLineScroll = 10.0;
        _verticalPageScroll = 10.0;
        _horizontalLineScroll = 10.0;
        _horizontalPageScroll = 10.0;
        _contentView = objj_msgSend(objj_msgSend(CPClipView, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
        objj_msgSend(self, "addSubview:", _contentView);
        objj_msgSend(self, "setHasVerticalScroller:", YES);
        objj_msgSend(self, "setHasHorizontalScroller:", YES);
    }
    return self;
}
}), new objj_method(sel_getUid("contentSize"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_contentView, "frame").size;
}
}), new objj_method(sel_getUid("documentView"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_contentView, "documentView");
}
}), new objj_method(sel_getUid("setContentView:"), function(self, _cmd, aContentView)
{ with(self)
{
    if (!aContentView)
        return;
    var documentView = objj_msgSend(aContentView, "documentView");
    if (documentView)
        objj_msgSend(documentView, "removeFromSuperview");
    objj_msgSend(_contentView, "removeFromSuperview");
    var size = objj_msgSend(self, "contentSize");
    _contentView = aContentView;
    objj_msgSend(_contentView, "setFrame:", CGRectMake(0.0, 0.0, size.width, size.height));
    objj_msgSend(_contentView, "setDocumentView:", documentView);
    objj_msgSend(self, "addSubview:", _contentView);
}
}), new objj_method(sel_getUid("contentView"), function(self, _cmd)
{ with(self)
{
    return _contentView;
}
}), new objj_method(sel_getUid("setDocumentView:"), function(self, _cmd, aView)
{ with(self)
{
   objj_msgSend(_contentView, "setDocumentView:", aView);
   objj_msgSend(self, "reflectScrolledClipView:", _contentView);
}
}), new objj_method(sel_getUid("reflectScrolledClipView:"), function(self, _cmd, aClipView)
{ with(self)
{
    if(_contentView !== aClipView)
        return;
    if (_recursionCount > 5)
        return;
    ++_recursionCount;
    var documentView = objj_msgSend(self, "documentView");
    if (!documentView)
    {
        if (_autohidesScrollers)
        {
            objj_msgSend(_verticalScroller, "setHidden:", YES);
            objj_msgSend(_horizontalScroller, "setHidden:", YES);
        }
        else
        {
        }
        objj_msgSend(_contentView, "setFrame:", objj_msgSend(self, "bounds"));
        --_recursionCount;
        return;
    }
    var documentFrame = objj_msgSend(documentView, "frame"),
        contentViewFrame = objj_msgSend(self, "bounds"),
        scrollPoint = objj_msgSend(_contentView, "bounds").origin,
        difference = { width:CPRectGetWidth(documentFrame) - CPRectGetWidth(contentViewFrame), height:CPRectGetHeight(documentFrame) - CPRectGetHeight(contentViewFrame) },
        shouldShowVerticalScroller = (!_autohidesScrollers || difference.height > 0.0) && _hasVerticalScroller,
        shouldShowHorizontalScroller = (!_autohidesScrollers || difference.width > 0.0) && _hasHorizontalScroller,
        wasShowingVerticalScroller = !objj_msgSend(_verticalScroller, "isHidden"),
        wasShowingHorizontalScroller = !objj_msgSend(_horizontalScroller, "isHidden"),
        verticalScrollerWidth = (objj_msgSend(_verticalScroller, "frame").size.width);
        horizontalScrollerHeight = (objj_msgSend(_horizontalScroller, "frame").size.height);
    if (_autohidesScrollers)
    {
        if (shouldShowVerticalScroller)
            shouldShowHorizontalScroller = (!_autohidesScrollers || difference.width > -verticalScrollerWidth) && _hasHorizontalScroller;
        if (shouldShowHorizontalScroller)
            shouldShowVerticalScroller = (!_autohidesScrollers || difference.height > -horizontalScrollerHeight) && _hasVerticalScroller;
    }
    objj_msgSend(_verticalScroller, "setHidden:", !shouldShowVerticalScroller);
    objj_msgSend(_verticalScroller, "setEnabled:", difference.height > 0.0);
    objj_msgSend(_horizontalScroller, "setHidden:", !shouldShowHorizontalScroller);
    objj_msgSend(_horizontalScroller, "setEnabled:", difference.width > 0.0);
    if (shouldShowVerticalScroller)
    {
        var verticalScrollerHeight = CPRectGetHeight(contentViewFrame);
        if (shouldShowHorizontalScroller)
            verticalScrollerHeight -= horizontalScrollerHeight;
        difference.width += verticalScrollerWidth;
        contentViewFrame.size.width -= verticalScrollerWidth;
        objj_msgSend(_verticalScroller, "setFloatValue:knobProportion:", (difference.height <= 0.0) ? 0.0 : scrollPoint.y / difference.height, CPRectGetHeight(contentViewFrame) / CPRectGetHeight(documentFrame));
        objj_msgSend(_verticalScroller, "setFrame:", CPRectMake(CPRectGetMaxX(contentViewFrame), 0.0, verticalScrollerWidth, verticalScrollerHeight));
    }
    else if (wasShowingVerticalScroller)
        objj_msgSend(_verticalScroller, "setFloatValue:knobProportion:", 0.0, 1.0);
    if (shouldShowHorizontalScroller)
    {
        difference.height += horizontalScrollerHeight;
        contentViewFrame.size.height -= horizontalScrollerHeight;
        objj_msgSend(_horizontalScroller, "setFloatValue:knobProportion:", (difference.width <= 0.0) ? 0.0 : scrollPoint.x / difference.width, CPRectGetWidth(contentViewFrame) / CPRectGetWidth(documentFrame));
        objj_msgSend(_horizontalScroller, "setFrame:", CPRectMake(0.0, CPRectGetMaxY(contentViewFrame), CPRectGetWidth(contentViewFrame), horizontalScrollerHeight));
    }
    else if (wasShowingHorizontalScroller)
        objj_msgSend(_horizontalScroller, "setFloatValue:knobProportion:", 0.0, 1.0);
    objj_msgSend(_contentView, "setFrame:", contentViewFrame);
    --_recursionCount;
}
}), new objj_method(sel_getUid("setHorizontalScroller:"), function(self, _cmd, aScroller)
{ with(self)
{
    if (_horizontalScroller === aScroller)
        return;
    objj_msgSend(_horizontalScroller, "removeFromSuperview");
    objj_msgSend(_horizontalScroller, "setTarget:", nil);
    objj_msgSend(_horizontalScroller, "setAction:", nil);
    _horizontalScroller = aScroller;
    objj_msgSend(_horizontalScroller, "setTarget:", self);
    objj_msgSend(_horizontalScroller, "setAction:", sel_getUid("_horizontalScrollerDidScroll:"));
    objj_msgSend(self, "addSubview:", _horizontalScroller);
    objj_msgSend(self, "reflectScrolledClipView:", _contentView);
}
}), new objj_method(sel_getUid("horizontalScroller"), function(self, _cmd)
{ with(self)
{
    return _horizontalScroller;
}
}), new objj_method(sel_getUid("setHasHorizontalScroller:"), function(self, _cmd, shouldHaveHorizontalScroller)
{ with(self)
{
    if (_hasHorizontalScroller === shouldHaveHorizontalScroller)
        return;
    _hasHorizontalScroller = shouldHaveHorizontalScroller;
    if (_hasHorizontalScroller && !_horizontalScroller)
        objj_msgSend(self, "setHorizontalScroller:", objj_msgSend(objj_msgSend(CPScroller, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, CPRectGetWidth(objj_msgSend(self, "bounds")), objj_msgSend(CPScroller, "scrollerWidth"))));
    else if (!_hasHorizontalScroller && _horizontalScroller)
    {
        objj_msgSend(_horizontalScroller, "setHidden:", YES);
        objj_msgSend(self, "reflectScrolledClipView:", _contentView);
    }
}
}), new objj_method(sel_getUid("hasHorizontalScroller"), function(self, _cmd)
{ with(self)
{
    return _hasHorizontalScroller;
}
}), new objj_method(sel_getUid("setVerticalScroller:"), function(self, _cmd, aScroller)
{ with(self)
{
    if (_verticalScroller === aScroller)
        return;
    objj_msgSend(_verticalScroller, "removeFromSuperview");
    objj_msgSend(_verticalScroller, "setTarget:", nil);
    objj_msgSend(_verticalScroller, "setAction:", nil);
    _verticalScroller = aScroller;
    objj_msgSend(_verticalScroller, "setTarget:", self);
    objj_msgSend(_verticalScroller, "setAction:", sel_getUid("_verticalScrollerDidScroll:"));
    objj_msgSend(self, "addSubview:", _verticalScroller);
    objj_msgSend(self, "reflectScrolledClipView:", _contentView);
}
}), new objj_method(sel_getUid("verticalScroller"), function(self, _cmd)
{ with(self)
{
    return _verticalScroller;
}
}), new objj_method(sel_getUid("setHasVerticalScroller:"), function(self, _cmd, shouldHaveVerticalScroller)
{ with(self)
{
    if (_hasVerticalScroller === shouldHaveVerticalScroller)
        return;
    _hasVerticalScroller = shouldHaveVerticalScroller;
    if (_hasVerticalScroller && !_verticalScroller)
        objj_msgSend(self, "setVerticalScroller:", objj_msgSend(objj_msgSend(CPScroller, "alloc"), "initWithFrame:", CPRectMake(0.0, 0.0, objj_msgSend(CPScroller, "scrollerWidth"), CPRectGetHeight(objj_msgSend(self, "bounds")))));
    else if (!_hasVerticalScroller && _verticalScroller)
    {
        objj_msgSend(_verticalScroller, "setHidden:", YES);
        objj_msgSend(self, "reflectScrolledClipView:", _contentView);
    }
}
}), new objj_method(sel_getUid("hasHorizontalScroller"), function(self, _cmd)
{ with(self)
{
    return _hasHorizontalScroller;
}
}), new objj_method(sel_getUid("setAutohidesScrollers:"), function(self, _cmd, autohidesScrollers)
{ with(self)
{
    if (_autohidesScrollers == autohidesScrollers)
        return;
    _autohidesScrollers = autohidesScrollers;
    objj_msgSend(self, "reflectScrolledClipView:", _contentView);
}
}), new objj_method(sel_getUid("autohidesScrollers"), function(self, _cmd)
{ with(self)
{
    return _autohidesScrollers;
}
}), new objj_method(sel_getUid("_verticalScrollerDidScroll:"), function(self, _cmd, aScroller)
{ with(self)
{
   var value = objj_msgSend(aScroller, "floatValue"),
        documentFrame = objj_msgSend(objj_msgSend(_contentView, "documentView"), "frame");
        contentBounds = objj_msgSend(_contentView, "bounds");
    switch (objj_msgSend(_verticalScroller, "hitPart"))
    {
        case CPScrollerDecrementLine: contentBounds.origin.y -= _verticalLineScroll;
                                        break;
        case CPScrollerIncrementLine: contentBounds.origin.y += _verticalLineScroll;
                                        break;
        case CPScrollerDecrementPage: contentBounds.origin.y -= (contentBounds.size.height) - _verticalPageScroll;
                                        break;
        case CPScrollerIncrementPage: contentBounds.origin.y += (contentBounds.size.height) - _verticalPageScroll;
                                        break;
        case CPScrollerKnobSlot:
        case CPScrollerKnob:
        default: contentBounds.origin.y = value * ((documentFrame.size.height) - (contentBounds.size.height));
    }
    objj_msgSend(_contentView, "scrollToPoint:", contentBounds.origin);
}
}), new objj_method(sel_getUid("_horizontalScrollerDidScroll:"), function(self, _cmd, aScroller)
{ with(self)
{
   var value = objj_msgSend(aScroller, "floatValue"),
       documentFrame = objj_msgSend(objj_msgSend(self, "documentView"), "frame"),
       contentBounds = objj_msgSend(_contentView, "bounds");
    switch (objj_msgSend(_horizontalScroller, "hitPart"))
    {
        case CPScrollerDecrementLine: contentBounds.origin.x -= _horizontalLineScroll;
                                        break;
        case CPScrollerIncrementLine: contentBounds.origin.x += _horizontalLineScroll;
                                        break;
        case CPScrollerDecrementPage: contentBounds.origin.x -= (contentBounds.size.width) - _horizontalPageScroll;
                                        break;
        case CPScrollerIncrementPage: contentBounds.origin.x += (contentBounds.size.width) - _horizontalPageScroll;
                                        break;
        case CPScrollerKnobSlot:
        case CPScrollerKnob:
        default: contentBounds.origin.x = value * ((documentFrame.size.width) - (contentBounds.size.width));
    }
    objj_msgSend(_contentView, "scrollToPoint:", contentBounds.origin);
}
}), new objj_method(sel_getUid("tile"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function(self, _cmd, aSize)
{ with(self)
{
    objj_msgSend(self, "reflectScrolledClipView:", _contentView);
}
}), new objj_method(sel_getUid("setLineScroll:"), function(self, _cmd, aLineScroll)
{ with(self)
{
    objj_msgSend(self, "setHorizonalLineScroll:", aLineScroll);
    objj_msgSend(self, "setVerticalLineScroll:", aLineScroll);
}
}), new objj_method(sel_getUid("lineScroll"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "horizontalLineScroll");
}
}), new objj_method(sel_getUid("setHorizontalLineScroll:"), function(self, _cmd, aLineScroll)
{ with(self)
{
    _horizontalLineScroll = aLineScroll;
}
}), new objj_method(sel_getUid("horizontalLineScroll"), function(self, _cmd)
{ with(self)
{
    return _horizontalLineScroll;
}
}), new objj_method(sel_getUid("setVerticalLineScroll:"), function(self, _cmd, aLineScroll)
{ with(self)
{
    _verticalLineScroll = aLineScroll;
}
}), new objj_method(sel_getUid("verticalLineScroll"), function(self, _cmd)
{ with(self)
{
    return _verticalLineScroll;
}
}), new objj_method(sel_getUid("setPageScroll:"), function(self, _cmd, aPageScroll)
{ with(self)
{
    objj_msgSend(self, "setHorizontalPageScroll:", aPageScroll);
    objj_msgSend(self, "setVerticalPageScroll:", aPageScroll);
}
}), new objj_method(sel_getUid("pageScroll"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "horizontalPageScroll");
}
}), new objj_method(sel_getUid("setHorizontalPageScroll:"), function(self, _cmd, aPageScroll)
{ with(self)
{
    _horizontalPageScroll = aPageScroll;
}
}), new objj_method(sel_getUid("horizontalPageScroll"), function(self, _cmd)
{ with(self)
{
    return _horizontalPageScroll;
}
}), new objj_method(sel_getUid("setVerticalPageScroll:"), function(self, _cmd, aPageScroll)
{ with(self)
{
    _verticalPageScroll = aPageScroll;
}
}), new objj_method(sel_getUid("verticalPageScroll"), function(self, _cmd)
{ with(self)
{
    return _verticalPageScroll;
}
}), new objj_method(sel_getUid("scrollWheel:"), function(self, _cmd, anEvent)
{ with(self)
{
   var value = objj_msgSend(_verticalScroller, "floatValue"),
       documentFrame = objj_msgSend(objj_msgSend(self, "documentView"), "frame"),
       contentBounds = objj_msgSend(_contentView, "bounds");
    contentBounds.origin.x += objj_msgSend(anEvent, "deltaX") * _horizontalLineScroll;
    contentBounds.origin.y += objj_msgSend(anEvent, "deltaY") * _verticalLineScroll;
    objj_msgSend(_contentView, "scrollToPoint:", contentBounds.origin);
}
}), new objj_method(sel_getUid("keyDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    var keyCode = objj_msgSend(anEvent, "keyCode"),
        value = objj_msgSend(_verticalScroller, "floatValue"),
        documentFrame = objj_msgSend(objj_msgSend(self, "documentView"), "frame"),
        contentBounds = objj_msgSend(_contentView, "bounds");
    switch (keyCode)
    {
        case 33:
                    contentBounds.origin.y -= (contentBounds.size.height) - _verticalPageScroll;
                    break;
        case 34:
                    contentBounds.origin.y += (contentBounds.size.height) - _verticalPageScroll;
                    break;
        case 38:
                    contentBounds.origin.y -= _verticalLineScroll;
                    break;
        case 40:
                    contentBounds.origin.y += _verticalLineScroll;
                    break;
        case 37:
                    contentBounds.origin.x -= _horizontalLineScroll;
                    break;
        case 49:
                    contentBounds.origin.x += _horizontalLineScroll;
                    break;
        default: return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "keyDown:", anEvent);
    }
    objj_msgSend(_contentView, "scrollToPoint:", contentBounds.origin);
}
})]);
}
var CPScrollViewContentViewKey = "CPScrollViewContentView",
    CPScrollViewVLineScrollKey = "CPScrollViewVLineScroll",
    CPScrollViewHLineScrollKey = "CPScrollViewHLineScroll",
    CPScrollViewVPageScrollKey = "CPScrollViewVPageScroll",
    CPScrollViewHPageScrollKey = "CPScrollViewHPageScroll",
    CPScrollViewHasVScrollerKey = "CPScrollViewHasVScroller",
    CPScrollViewHasHScrollerKey = "CPScrollViewHasHScroller",
    CPScrollViewVScrollerKey = "CPScrollViewVScroller",
    CPScrollViewHScrollerKey = "CPScrollViewHScroller",
    CPScrollViewAutohidesScrollerKey = "CPScrollViewAutohidesScroller";
{
var the_class = objj_getClass("CPScrollView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPScrollView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithCoder:", aCoder))
    {
        _verticalLineScroll = objj_msgSend(aCoder, "decodeFloatForKey:", CPScrollViewVLineScrollKey);
        _verticalPageScroll = objj_msgSend(aCoder, "decodeFloatForKey:", CPScrollViewVPageScrollKey);
        _horizontalLineScroll = objj_msgSend(aCoder, "decodeFloatForKey:", CPScrollViewHLineScrollKey);
        _horizontalPageScroll = objj_msgSend(aCoder, "decodeFloatForKey:", CPScrollViewHPageScrollKey);
        _contentView = objj_msgSend(aCoder, "decodeObjectForKey:", CPScrollViewContentViewKey);
        _verticalScroller = objj_msgSend(aCoder, "decodeObjectForKey:", CPScrollViewVScrollerKey);
        _horizontalScroller = objj_msgSend(aCoder, "decodeObjectForKey:", CPScrollViewHScrollerKey);
        _hasVerticalScroller = objj_msgSend(aCoder, "decodeBoolForKey:", CPScrollViewHasVScrollerKey);
        _hasHorizontalScroller = objj_msgSend(aCoder, "decodeBoolForKey:", CPScrollViewHasHScrollerKey);
        _autohidesScrollers = objj_msgSend(aCoder, "decodeBoolForKey:", CPScrollViewAutohidesScrollerKey);
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelector:target:argument:order:modes:", sel_getUid("reflectScrolledClipView:"), self, _contentView, 0, [CPDefaultRunLoopMode]);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", _contentView, CPScrollViewContentViewKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _verticalScroller, CPScrollViewVScrollerKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _horizontalScroller, CPScrollViewHScrollerKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _verticalLineScroll, CPScrollViewVLineScrollKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _verticalPageScroll, CPScrollViewVPageScrollKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _horizontalLineScroll, CPScrollViewHLineScrollKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _horizontalPageScroll, CPScrollViewHPageScrollKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _hasVerticalScroller, CPScrollViewHasVScrollerKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _hasHorizontalScroller, CPScrollViewHasHScrollerKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _autohidesScrollers, CPScrollViewAutohidesScrollerKey);
}
})]);
}

