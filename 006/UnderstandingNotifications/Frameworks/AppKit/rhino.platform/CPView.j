I;20;Foundation/CPArray.jI;26;Foundation/CPObjJRuntime.ji;19;CGAffineTransform.ji;12;CGGeometry.ji;9;CPColor.ji;20;CPDOMDisplayServer.ji;12;CPGeometry.ji;19;CPGraphicsContext.ji;13;CPResponder.ji;9;CPTheme.jc;45009;
CPViewNotSizable = 0;
CPViewMinXMargin = 1;
CPViewWidthSizable = 2;
CPViewMaxXMargin = 4;
CPViewMinYMargin = 8;
CPViewHeightSizable = 16;
CPViewMaxYMargin = 32;
CPViewBoundsDidChangeNotification = "CPViewBoundsDidChangeNotification";
CPViewFrameDidChangeNotification = "CPViewFrameDidChangeNotification";
var _DOMOriginUpdateMask = 1 << 0,
    _DOMSizeUpdateMask = 1 << 1;
var _CPViewNotificationCenter = nil,
    _CachedThemedAttributes = nil;
{var the_class = objj_allocateClassPair(CPResponder, "CPView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_window"), new objj_ivar("_superview"), new objj_ivar("_subviews"), new objj_ivar("_graphicsContext"), new objj_ivar("_tag"), new objj_ivar("_frame"), new objj_ivar("_bounds"), new objj_ivar("_boundsTransform"), new objj_ivar("_inverseBoundsTransform"), new objj_ivar("_registeredDraggedTypes"), new objj_ivar("_registeredDraggedTypesArray"), new objj_ivar("_isHidden"), new objj_ivar("_hitTests"), new objj_ivar("_postsFrameChangedNotifications"), new objj_ivar("_postsBoundsChangedNotifications"), new objj_ivar("_inhibitFrameAndBoundsChangedNotifications"), new objj_ivar("_displayHash"), new objj_ivar("_dirtyRect"), new objj_ivar("_opacity"), new objj_ivar("_backgroundColor"), new objj_ivar("_autoresizesSubviews"), new objj_ivar("_autoresizingMask"), new objj_ivar("_layer"), new objj_ivar("_wantsLayer"), new objj_ivar("_isInFullScreenMode"), new objj_ivar("_fullScreenModeState"), new objj_ivar("_needsLayout"), new objj_ivar("_ephemeralSubviews"), new objj_ivar("_theme"), new objj_ivar("_themedAttributes")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "initWithFrame:", CGRectMakeZero());
}
}), new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "init");
    if (self)
    {
        var width = (aFrame.size.width),
            height = (aFrame.size.height);
        _subviews = [];
        _registeredDraggedTypes = objj_msgSend(CPSet, "set");
        _registeredDraggedTypesArray = [];
        _tag = -1;
        _frame = { origin: { x:aFrame.origin.x, y:aFrame.origin.y }, size: { width:aFrame.size.width, height:aFrame.size.height } };
        _bounds = { origin: { x:0.0, y:0.0 }, size: { width:width, height:height } };
        _autoresizingMask = CPViewNotSizable;
        _autoresizesSubviews = YES;
        _opacity = 1.0;
        _isHidden = NO;
        _hitTests = YES;
        _displayHash = objj_msgSend(self, "hash");
        _theme = objj_msgSend(CPTheme, "defaultTheme");
        _themedAttributes = {};
        objj_msgSend(self, "_loadThemedAttributes");
    }
    return self;
}
}), new objj_method(sel_getUid("superview"), function(self, _cmd)
{ with(self)
{
    return _superview;
}
}), new objj_method(sel_getUid("subviews"), function(self, _cmd)
{ with(self)
{
    return _subviews;
}
}), new objj_method(sel_getUid("window"), function(self, _cmd)
{ with(self)
{
    return _window;
}
}), new objj_method(sel_getUid("addSubview:"), function(self, _cmd, aSubview)
{ with(self)
{
    objj_msgSend(self, "_insertSubview:atIndex:", aSubview, CPNotFound);
}
}), new objj_method(sel_getUid("addSubview:positioned:relativeTo:"), function(self, _cmd, aSubview, anOrderingMode, anotherView)
{ with(self)
{
    var index = anotherView ? objj_msgSend(_subviews, "indexOfObjectIdenticalTo:", anotherView) : CPNotFound;
    if (index === CPNotFound)
        index = (anOrderingMode === CPWindowAbove) ? objj_msgSend(_subviews, "count") : 0;
    else if (anOrderingMode === CPWindowAbove)
        ++index;
    objj_msgSend(self, "_insertSubview:atIndex:", aSubview, index);
}
}), new objj_method(sel_getUid("_insertSubview:atIndex:"), function(self, _cmd, aSubview, anIndex)
{ with(self)
{
    var count = _subviews.length;
    if (aSubview._superview == self)
    {
        var index = objj_msgSend(_subviews, "indexOfObjectIdenticalTo:", aSubview);
        if (index === anIndex || index === count - 1 && anIndex === count)
            return;
        objj_msgSend(_subviews, "removeObjectAtIndex:", index);
        if (anIndex > index)
            --anIndex;
        --count;
    }
    else
    {
        objj_msgSend(aSubview, "removeFromSuperview");
        objj_msgSend(aSubview, "_setWindow:", _window);
        objj_msgSend(aSubview, "viewWillMoveToSuperview:", self);
        aSubview._superview = self;
    }
    if (anIndex === CPNotFound || anIndex >= count)
    {
        _subviews.push(aSubview);
    }
    else
    {
        _subviews.splice(anIndex, 0, aSubview);
    }
    objj_msgSend(aSubview, "setNextResponder:", self);
    objj_msgSend(aSubview, "viewDidMoveToSuperview");
    objj_msgSend(self, "didAddSubview:", aSubview);
}
}), new objj_method(sel_getUid("didAddSubview:"), function(self, _cmd, aSubview)
{ with(self)
{
}
}), new objj_method(sel_getUid("removeFromSuperview"), function(self, _cmd)
{ with(self)
{
    if (!_superview)
        return;
    objj_msgSend(_superview, "willRemoveSubview:", self);
    objj_msgSend(objj_msgSend(_superview, "subviews"), "removeObject:", self);
    _superview = nil;
    objj_msgSend(self, "_setWindow:", nil);
}
}), new objj_method(sel_getUid("replaceSubview:with:"), function(self, _cmd, aSubview, aView)
{ with(self)
{
    if (aSubview._superview != self)
        return;
    var index = objj_msgSend(_subviews, "indexOfObjectIdenticalTo:", aSubview);
    objj_msgSend(aSubview, "removeFromSuperview");
    objj_msgSend(self, "_insertSubview:atIndex:", aView, index);
}
}), new objj_method(sel_getUid("_setWindow:"), function(self, _cmd, aWindow)
{ with(self)
{
    if (_window === aWindow)
        return;
    if (objj_msgSend(_window, "firstResponder") === self)
        objj_msgSend(_window, "makeFirstResponder:", nil);
    objj_msgSend(self, "viewWillMoveToWindow:", aWindow);
    if (_registeredDraggedTypes)
    {
        objj_msgSend(_window, "_noteUnregisteredDraggedTypes:", _registeredDraggedTypes);
        objj_msgSend(aWindow, "_noteRegisteredDraggedTypes:", _registeredDraggedTypes);
    }
    _window = aWindow;
    var count = objj_msgSend(_subviews, "count");
    while (count--)
        objj_msgSend(_subviews[count], "_setWindow:", aWindow);
    objj_msgSend(self, "viewDidMoveToWindow");
}
}), new objj_method(sel_getUid("isDescendantOf:"), function(self, _cmd, aView)
{ with(self)
{
    var view = self;
    do
    {
        if (view == aView)
            return YES;
    } while(view = objj_msgSend(view, "superview"))
    return NO;
}
}), new objj_method(sel_getUid("viewDidMoveToSuperview"), function(self, _cmd)
{ with(self)
{
        objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("viewDidMoveToWindow"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("viewWillMoveToSuperview:"), function(self, _cmd, aView)
{ with(self)
{
}
}), new objj_method(sel_getUid("viewWillMoveToWindow:"), function(self, _cmd, aWindow)
{ with(self)
{
}
}), new objj_method(sel_getUid("willRemoveSubview:"), function(self, _cmd, aView)
{ with(self)
{
}
}), new objj_method(sel_getUid("enclosingMenuItem"), function(self, _cmd)
{ with(self)
{
    var view = self;
    while (!objj_msgSend(view, "isKindOfClass:", objj_msgSend(_CPMenuItemView, "class")))
        view = objj_msgSend(view, "superview");
    if (view)
        return view._menuItem;
    return nil;
}
}), new objj_method(sel_getUid("tag"), function(self, _cmd)
{ with(self)
{
    return _tag;
}
}), new objj_method(sel_getUid("isFlipped"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("setFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    if (((_frame.origin.x == aFrame.origin.x && _frame.origin.y == aFrame.origin.y) && (_frame.size.width == aFrame.size.width && _frame.size.height == aFrame.size.height)))
        return;
    _inhibitFrameAndBoundsChangedNotifications = YES;
    objj_msgSend(self, "setFrameOrigin:", aFrame.origin);
    objj_msgSend(self, "setFrameSize:", aFrame.size);
    _inhibitFrameAndBoundsChangedNotifications = NO;
    if (_postsFrameChangedNotifications)
        objj_msgSend(_CPViewNotificationCenter, "postNotificationName:object:", CPViewFrameDidChangeNotification, self);
}
}), new objj_method(sel_getUid("frame"), function(self, _cmd)
{ with(self)
{
    return { origin: { x:_frame.origin.x, y:_frame.origin.y }, size: { width:_frame.size.width, height:_frame.size.height } };
}
}), new objj_method(sel_getUid("setCenter:"), function(self, _cmd, aPoint)
{ with(self)
{
    objj_msgSend(self, "setFrameOrigin:", CGPointMake(aPoint.x - _frame.size.width / 2.0, aPoint.y - _frame.size.height / 2.0));
}
}), new objj_method(sel_getUid("center"), function(self, _cmd)
{ with(self)
{
    return CGPointMake(_frame.size.width / 2.0 + _frame.origin.x, _frame.size.height / 2.0 + _frame.origin.y);
}
}), new objj_method(sel_getUid("setFrameOrigin:"), function(self, _cmd, aPoint)
{ with(self)
{
    var origin = _frame.origin;
    if (!aPoint || (origin.x == aPoint.x && origin.y == aPoint.y))
        return;
    origin.x = aPoint.x;
    origin.y = aPoint.y;
    if (_postsFrameChangedNotifications && !_inhibitFrameAndBoundsChangedNotifications)
        objj_msgSend(_CPViewNotificationCenter, "postNotificationName:object:", CPViewFrameDidChangeNotification, self);
}
}), new objj_method(sel_getUid("setFrameSize:"), function(self, _cmd, aSize)
{ with(self)
{
    var size = _frame.size;
    if (!aSize || (size.width == aSize.width && size.height == aSize.height))
        return;
    var oldSize = { width:size.width, height:size.height };
    size.width = aSize.width;
    size.height = aSize.height;
    if (YES)
    {
        _bounds.size.width = aSize.width;
        _bounds.size.height = aSize.height;
    }
    if (_layer)
        objj_msgSend(_layer, "_owningViewBoundsChanged");
    if (_autoresizesSubviews)
        objj_msgSend(self, "resizeSubviewsWithOldSize:", oldSize);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
    if (_postsFrameChangedNotifications && !_inhibitFrameAndBoundsChangedNotifications)
        objj_msgSend(_CPViewNotificationCenter, "postNotificationName:object:", CPViewFrameDidChangeNotification, self);
}
}), new objj_method(sel_getUid("setBounds:"), function(self, _cmd, bounds)
{ with(self)
{
    if (((_bounds.origin.x == bounds.origin.x && _bounds.origin.y == bounds.origin.y) && (_bounds.size.width == bounds.size.width && _bounds.size.height == bounds.size.height)))
        return;
    _inhibitFrameAndBoundsChangedNotifications = YES;
    objj_msgSend(self, "setBoundsOrigin:", bounds.origin);
    objj_msgSend(self, "setBoundsSize:", bounds.size);
    _inhibitFrameAndBoundsChangedNotifications = NO;
    if (_postsBoundsChangedNotifications)
        objj_msgSend(_CPViewNotificationCenter, "postNotificationName:object:", CPViewBoundsDidChangeNotification, self);
}
}), new objj_method(sel_getUid("bounds"), function(self, _cmd)
{ with(self)
{
    return { origin: { x:_bounds.origin.x, y:_bounds.origin.y }, size: { width:_bounds.size.width, height:_bounds.size.height } };
}
}), new objj_method(sel_getUid("setBoundsOrigin:"), function(self, _cmd, aPoint)
{ with(self)
{
    var origin = _bounds.origin;
    if ((origin.x == aPoint.x && origin.y == aPoint.y))
        return;
    origin.x = aPoint.x;
    origin.y = aPoint.y;
    if (origin.x != 0 || origin.y != 0)
    {
        _boundsTransform = { a:1.0, b:0.0, c:0.0, d:1.0, tx:-origin.x, ty:-origin.y };
        _inverseBoundsTransform = CGAffineTransformInvert(_boundsTransform);
    }
    else
    {
        _boundsTransform = nil;
        _inverseBoundsTransform = nil;
    }
    if (_postsBoundsChangedNotifications && !_inhibitFrameAndBoundsChangedNotifications)
        objj_msgSend(_CPViewNotificationCenter, "postNotificationName:object:", CPViewBoundsDidChangeNotification, self);
}
}), new objj_method(sel_getUid("setBoundsSize:"), function(self, _cmd, aSize)
{ with(self)
{
    var size = _bounds.size;
    if ((size.width == aSize.width && size.height == aSize.height))
        return;
    var frameSize = _frame.size;
    if (!(size.width == frameSize.width && size.height == frameSize.height))
    {
        var origin = _bounds.origin;
        origin.x /= size.width / frameSize.width;
        origin.y /= size.height / frameSize.height;
    }
    size.width = aSize.width;
    size.height = aSize.height;
    if (!(size.width == frameSize.width && size.height == frameSize.height))
    {
        var origin = _bounds.origin;
        origin.x *= size.width / frameSize.width;
        origin.y *= size.height / frameSize.height;
    }
    if (_postsBoundsChangedNotifications && !_inhibitFrameAndBoundsChangedNotifications)
        objj_msgSend(_CPViewNotificationCenter, "postNotificationName:object:", CPViewBoundsDidChangeNotification, self);
}
}), new objj_method(sel_getUid("resizeWithOldSuperviewSize:"), function(self, _cmd, aSize)
{ with(self)
{
    var mask = objj_msgSend(self, "autoresizingMask");
    if(mask == CPViewNotSizable)
        return;
    var frame = _superview._frame,
        newFrame = { origin: { x:_frame.origin.x, y:_frame.origin.y }, size: { width:_frame.size.width, height:_frame.size.height } },
        dX = ((frame.size.width) - aSize.width) /
            (((mask & CPViewMinXMargin) ? 1 : 0) + (mask & CPViewWidthSizable ? 1 : 0) + (mask & CPViewMaxXMargin ? 1 : 0)),
        dY = ((frame.size.height) - aSize.height) /
            ((mask & CPViewMinYMargin ? 1 : 0) + (mask & CPViewHeightSizable ? 1 : 0) + (mask & CPViewMaxYMargin ? 1 : 0));
    if (mask & CPViewMinXMargin)
        newFrame.origin.x += dX;
    if (mask & CPViewWidthSizable)
        newFrame.size.width += dX;
    if (mask & CPViewMinYMargin)
        newFrame.origin.y += dY;
    if (mask & CPViewHeightSizable)
        newFrame.size.height += dY;
    objj_msgSend(self, "setFrame:", newFrame);
}
}), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function(self, _cmd, aSize)
{ with(self)
{
    var count = _subviews.length;
    while (count--)
        objj_msgSend(_subviews[count], "resizeWithOldSuperviewSize:", aSize);
}
}), new objj_method(sel_getUid("setAutoresizesSubviews:"), function(self, _cmd, aFlag)
{ with(self)
{
    _autoresizesSubviews = aFlag;
}
}), new objj_method(sel_getUid("autoresizesSubviews"), function(self, _cmd)
{ with(self)
{
    return _autoresizesSubviews;
}
}), new objj_method(sel_getUid("setAutoresizingMask:"), function(self, _cmd, aMask)
{ with(self)
{
    _autoresizingMask = aMask;
}
}), new objj_method(sel_getUid("autoresizingMask"), function(self, _cmd)
{ with(self)
{
    return _autoresizingMask;
}
}), new objj_method(sel_getUid("enterFullScreenMode"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "enterFullScreenMode:withOptions:", nil, nil);
}
}), new objj_method(sel_getUid("enterFullScreenMode:withOptions:"), function(self, _cmd, aScreen, options)
{ with(self)
{
    _fullScreenModeState = _CPViewFullScreenModeStateMake(self);
    var fullScreenWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "contentBounds"), CPBorderlessWindowMask);
    objj_msgSend(fullScreenWindow, "setLevel:", CPScreenSaverWindowLevel);
    objj_msgSend(fullScreenWindow, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    var contentView = objj_msgSend(fullScreenWindow, "contentView");
    objj_msgSend(contentView, "setBackgroundColor:", objj_msgSend(CPColor, "blackColor"));
    objj_msgSend(contentView, "addSubview:", self);
    objj_msgSend(self, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    objj_msgSend(self, "setFrame:", CGRectMakeCopy(objj_msgSend(contentView, "bounds")));
    objj_msgSend(fullScreenWindow, "makeKeyAndOrderFront:", self);
    objj_msgSend(fullScreenWindow, "makeFirstResponder:", self);
    _isInFullScreenMode = YES;
    return YES;
}
}), new objj_method(sel_getUid("exitFullScreenMode"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "exitFullScreenModeWithOptions:", nil);
}
}), new objj_method(sel_getUid("exitFullScreenModeWithOptions:"), function(self, _cmd, options)
{ with(self)
{
    if (!_isInFullScreenMode)
        return;
    _isInFullScreenMode = NO;
    objj_msgSend(self, "setFrame:", _fullScreenModeState.frame);
    objj_msgSend(self, "setAutoresizingMask:", _fullScreenModeState.autoresizingMask);
    objj_msgSend(_fullScreenModeState.superview, "_insertSubview:atIndex:", self, _fullScreenModeState.index);
    objj_msgSend(objj_msgSend(self, "window"), "orderOut:", self);
}
}), new objj_method(sel_getUid("isInFullScreenMode"), function(self, _cmd)
{ with(self)
{
    return _isInFullScreenMode;
}
}), new objj_method(sel_getUid("setHidden:"), function(self, _cmd, aFlag)
{ with(self)
{
    if(_isHidden == aFlag)
        return;
    _isHidden = aFlag;
}
}), new objj_method(sel_getUid("isHidden"), function(self, _cmd)
{ with(self)
{
    return _isHidden;
}
}), new objj_method(sel_getUid("setAlphaValue:"), function(self, _cmd, anAlphaValue)
{ with(self)
{
    if (_opacity == anAlphaValue)
        return;
    _opacity = anAlphaValue;
}
}), new objj_method(sel_getUid("alphaValue"), function(self, _cmd)
{ with(self)
{
    return _opacity;
}
}), new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"), function(self, _cmd)
{ with(self)
{
    var view = self;
    while (view && !objj_msgSend(view, "isHidden"))
        view = objj_msgSend(view, "superview");
    return view !== nil;
}
}), new objj_method(sel_getUid("acceptsFirstMouse:"), function(self, _cmd, anEvent)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("hitTests"), function(self, _cmd)
{ with(self)
{
    return _hitTests;
}
}), new objj_method(sel_getUid("setHitTests:"), function(self, _cmd, shouldHitTest)
{ with(self)
{
    _hitTests = shouldHitTest;
}
}), new objj_method(sel_getUid("hitTest:"), function(self, _cmd, aPoint)
{ with(self)
{
    if(_isHidden || !_hitTests || !CPRectContainsPoint(_frame, aPoint))
        return nil;
    var view = nil,
        i = _subviews.length,
        adjustedPoint = { x:aPoint.x - (_frame.origin.x), y:aPoint.y - (_frame.origin.y) };
    if (_inverseBoundsTransform)
        adjustedPoint = { x:adjustedPoint.x * _inverseBoundsTransform.a + adjustedPoint.y * _inverseBoundsTransform.c + _inverseBoundsTransform.tx, y:adjustedPoint.x * _inverseBoundsTransform.b + adjustedPoint.y * _inverseBoundsTransform.d + _inverseBoundsTransform.ty };
    while (i--)
        if (view = objj_msgSend(_subviews[i], "hitTest:", adjustedPoint))
            return view;
    return self;
}
}), new objj_method(sel_getUid("mouseDownCanMoveWindow"), function(self, _cmd)
{ with(self)
{
    return !objj_msgSend(self, "isOpaque");
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(self, "mouseDownCanMoveWindow"))
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "mouseDown:", anEvent);
}
}), new objj_method(sel_getUid("setBackgroundColor:"), function(self, _cmd, aColor)
{ with(self)
{
    if (_backgroundColor == aColor)
        return;
    _backgroundColor = aColor;
}
}), new objj_method(sel_getUid("backgroundColor"), function(self, _cmd)
{ with(self)
{
    return _backgroundColor;
}
}), new objj_method(sel_getUid("convertPoint:fromView:"), function(self, _cmd, aPoint, aView)
{ with(self)
{
    return CGPointApplyAffineTransform(aPoint, _CPViewGetTransform(aView, self));
}
}), new objj_method(sel_getUid("convertPoint:toView:"), function(self, _cmd, aPoint, aView)
{ with(self)
{
    return CGPointApplyAffineTransform(aPoint, _CPViewGetTransform(self, aView));
}
}), new objj_method(sel_getUid("convertSize:fromView:"), function(self, _cmd, aSize, aView)
{ with(self)
{
    return CGSizeApplyAffineTransform(aSize, _CPViewGetTransform(aView, self));
}
}), new objj_method(sel_getUid("convertSize:toView:"), function(self, _cmd, aSize, aView)
{ with(self)
{
    return CGSizeApplyAffineTransform(aSize, _CPViewGetTransform(self, aView));
}
}), new objj_method(sel_getUid("convertRect:fromView:"), function(self, _cmd, aRect, aView)
{ with(self)
{
    return CGRectApplyAffineTransform(aRect, _CPViewGetTransform(aView, self));
}
}), new objj_method(sel_getUid("convertRect:toView:"), function(self, _cmd, aRect, aView)
{ with(self)
{
    return CGRectApplyAffineTransform(aRect, _CPViewGetTransform(self, aView));
}
}), new objj_method(sel_getUid("setPostsFrameChangedNotifications:"), function(self, _cmd, shouldPostFrameChangedNotifications)
{ with(self)
{
    if (_postsFrameChangedNotifications == shouldPostFrameChangedNotifications)
        return;
    _postsFrameChangedNotifications = shouldPostFrameChangedNotifications;
    if (_postsFrameChangedNotifications)
        objj_msgSend(_CPViewNotificationCenter, "postNotificationName:object:", CPViewFrameDidChangeNotification, self);
}
}), new objj_method(sel_getUid("postsFrameChangedNotifications"), function(self, _cmd)
{ with(self)
{
    return _postsFrameChangedNotifications;
}
}), new objj_method(sel_getUid("setPostsBoundsChangedNotifications:"), function(self, _cmd, shouldPostBoundsChangedNotifications)
{ with(self)
{
    if (_postsBoundsChangedNotifications == shouldPostBoundsChangedNotifications)
        return;
    _postsBoundsChangedNotifications = shouldPostBoundsChangedNotifications;
    if (_postsBoundsChangedNotifications)
        objj_msgSend(_CPViewNotificationCenter, "postNotificationName:object:", CPViewBoundsDidChangeNotification, self);
}
}), new objj_method(sel_getUid("postsBoundsChangedNotifications"), function(self, _cmd)
{ with(self)
{
    return _postsBoundsChangedNotifications;
}
}), new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"), function(self, _cmd, anImage, aLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{ with(self)
{
    objj_msgSend(_window, "dragImage:at:offset:event:pasteboard:source:slideBack:", anImage, objj_msgSend(self, "convertPoint:toView:", aLocation, nil), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
}), new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"), function(self, _cmd, aView, aLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{ with(self)
{
    objj_msgSend(_window, "dragView:at:offset:event:pasteboard:source:slideBack:", aView, objj_msgSend(self, "convertPoint:toView:", aLocation, nil), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
}), new objj_method(sel_getUid("registerForDraggedTypes:"), function(self, _cmd, pasteboardTypes)
{ with(self)
{
    if (!pasteboardTypes)
        return;
    var theWindow = objj_msgSend(self, "window");
    objj_msgSend(theWindow, "_noteUnregisteredDraggedTypes:", _registeredDraggedTypes);
    objj_msgSend(_registeredDraggedTypes, "addObjectsFromArray:", pasteboardTypes)
    objj_msgSend(theWindow, "_noteRegisteredDraggedTypes:", _registeredDraggedTypes);
    _registeredDraggedTypesArray = nil;
}
}), new objj_method(sel_getUid("registeredDraggedTypes"), function(self, _cmd)
{ with(self)
{
    if (!_registeredDraggedTypesArray)
        _registeredDraggedTypesArray = objj_msgSend(_registeredDraggedTypes, "allObjects");
    return _registeredDraggedTypesArray;
}
}), new objj_method(sel_getUid("unregisterDraggedTypes"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "_noteUnregisteredDraggedTypes:", _registeredDraggedTypes);
    _registeredDraggedTypes = objj_msgSend(CPSet, "set");
    _registeredDraggedTypesArray = [];
}
}), new objj_method(sel_getUid("drawRect:"), function(self, _cmd, aRect)
{ with(self)
{
}
}), new objj_method(sel_getUid("setNeedsDisplay:"), function(self, _cmd, aFlag)
{ with(self)
{
    if (aFlag)
        objj_msgSend(self, "setNeedsDisplayInRect:", objj_msgSend(self, "bounds"));
}
}), new objj_method(sel_getUid("setNeedsDisplayInRect:"), function(self, _cmd, aRect)
{ with(self)
{
    if ((aRect.size.width <= 0.0 || aRect.size.height <= 0.0))
        return;
    if (_dirtyRect && !(_dirtyRect.size.width <= 0.0 || _dirtyRect.size.height <= 0.0))
        _dirtyRect = CGRectUnion(aRect, _dirtyRect);
    else
        _dirtyRect = { origin: { x:aRect.origin.x, y:aRect.origin.y }, size: { width:aRect.size.width, height:aRect.size.height } };
}
}), new objj_method(sel_getUid("needsDisplay"), function(self, _cmd)
{ with(self)
{
    return _dirtyRect && !(_dirtyRect.size.width <= 0.0 || _dirtyRect.size.height <= 0.0);
}
}), new objj_method(sel_getUid("displayIfNeeded"), function(self, _cmd)
{ with(self)
{
    if (objj_msgSend(self, "needsDisplay"))
        objj_msgSend(self, "displayRect:", _dirtyRect);
}
}), new objj_method(sel_getUid("display"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "displayRect:", objj_msgSend(self, "visibleRect"));
}
}), new objj_method(sel_getUid("displayIfNeededInRect:"), function(self, _cmd, aRect)
{ with(self)
{
    if (objj_msgSend(self, "needsDisplay"))
        objj_msgSend(self, "displayRect:", aRect);
}
}), new objj_method(sel_getUid("displayRect:"), function(self, _cmd, aRect)
{ with(self)
{
    objj_msgSend(self, "viewWillDraw");
    objj_msgSend(self, "displayRectIgnoringOpacity:inContext:", aRect, nil);
    _dirtyRect = NULL;
}
}), new objj_method(sel_getUid("displayRectIgnoringOpacity:inContext:"), function(self, _cmd, aRect, aGraphicsContext)
{ with(self)
{
    objj_msgSend(self, "lockFocus");
    CGContextClearRect(objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"), aRect);
    objj_msgSend(self, "drawRect:", aRect);
    objj_msgSend(self, "unlockFocus");
}
}), new objj_method(sel_getUid("viewWillDraw"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("lockFocus"), function(self, _cmd)
{ with(self)
{
    if (!_graphicsContext)
    {
        var graphicsPort = CGBitmapGraphicsContextCreate();
        _DOMContentsElement = graphicsPort.DOMElement;
        _DOMContentsElement.style.zIndex = -100;
        _DOMContentsElement.style.overflow = "hidden";
        _DOMContentsElement.style.position = "absolute";
        _DOMContentsElement.style.visibility = "visible";
        _DOMContentsElement.width = ROUND((_frame.size.width));
        _DOMContentsElement.height = ROUND((_frame.size.height));
        _DOMContentsElement.style.top = "0px";
        _DOMContentsElement.style.left = "0px";
        _DOMContentsElement.style.width = ROUND((_frame.size.width)) + "px";
        _DOMContentsElement.style.height = ROUND((_frame.size.height)) + "px";
        if (_DOMContentsElement.CPDOMDisplayContext) _DOMContentsElement.CPDOMDisplayContext[0] = -1; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = 6; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = _DOMElement; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = _DOMContentsElement;;
        _graphicsContext = objj_msgSend(CPGraphicsContext, "graphicsContextWithGraphicsPort:flipped:", graphicsPort, YES);
    }
    objj_msgSend(CPGraphicsContext, "setCurrentContext:", _graphicsContext);
    CGContextSaveGState(objj_msgSend(_graphicsContext, "graphicsPort"));
}
}), new objj_method(sel_getUid("unlockFocus"), function(self, _cmd)
{ with(self)
{
    CGContextRestoreGState(objj_msgSend(_graphicsContext, "graphicsPort"));
    objj_msgSend(CPGraphicsContext, "setCurrentContext:", nil);
}
}), new objj_method(sel_getUid("setNeedsLayout"), function(self, _cmd)
{ with(self)
{
    _needsLayout = YES;
}
}), new objj_method(sel_getUid("layoutIfNeeded"), function(self, _cmd)
{ with(self)
{
    if (_needsLayout)
    {
        _needsLayout = NO;
        objj_msgSend(self, "layoutSubviews");
    }
}
}), new objj_method(sel_getUid("layoutSubviews"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("isOpaque"), function(self, _cmd)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("visibleRect"), function(self, _cmd)
{ with(self)
{
    if (!_superview)
        return _bounds;
    return CGRectIntersection(objj_msgSend(self, "convertRect:fromView:", objj_msgSend(_superview, "visibleRect"), _superview), _bounds);
}
}), new objj_method(sel_getUid("_enclosingClipView"), function(self, _cmd)
{ with(self)
{
    var superview = _superview,
        clipViewClass = objj_msgSend(CPClipView, "class");
    while(superview && !objj_msgSend(superview, "isKindOfClass:", clipViewClass))
        superview = superview._superview;
    return superview;
}
}), new objj_method(sel_getUid("scrollPoint:"), function(self, _cmd, aPoint)
{ with(self)
{
    var clipView = objj_msgSend(self, "_enclosingClipView");
    if (!clipView)
        return;
    objj_msgSend(clipView, "scrollToPoint:", objj_msgSend(self, "convertPoint:toView:", aPoint, clipView));
}
}), new objj_method(sel_getUid("scrollRectToVisible:"), function(self, _cmd, aRect)
{ with(self)
{
    var visibleRect = objj_msgSend(self, "visibleRect");
    aRect = CGRectIntersection(aRect, _bounds);
    if ((aRect.size.width <= 0.0 || aRect.size.height <= 0.0) || CGRectContainsRect(visibleRect, aRect))
        return NO;
    var enclosingClipView = objj_msgSend(self, "_enclosingClipView");
    if (!enclosingClipView)
        return NO;
    var scrollPoint = { x:visibleRect.origin.x, y:visibleRect.origin.y };
    if ((aRect.origin.x) <= (visibleRect.origin.x))
        scrollPoint.x = (aRect.origin.x);
    else if ((aRect.origin.x + aRect.size.width) > (visibleRect.origin.x + visibleRect.size.width))
        scrollPoint.x += (aRect.origin.x + aRect.size.width) - (visibleRect.origin.x + visibleRect.size.width);
    if ((aRect.origin.y) <= (visibleRect.origin.y))
        scrollPoint.y = CGRectGetMinY(aRect);
    else if ((aRect.origin.y + aRect.size.height) > (visibleRect.origin.y + visibleRect.size.height))
        scrollPoint.y += (aRect.origin.y + aRect.size.height) - (visibleRect.origin.y + visibleRect.size.height);
    objj_msgSend(enclosingClipView, "scrollToPoint:", CGPointMake(scrollPoint.x, scrollPoint.y));
    return YES;
}
}), new objj_method(sel_getUid("autoscroll:"), function(self, _cmd, anEvent)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("adjustScroll:"), function(self, _cmd, proposedVisibleRect)
{ with(self)
{
    return proposedVisibleRect;
}
}), new objj_method(sel_getUid("scrollRect:by:"), function(self, _cmd, aRect, anAmount)
{ with(self)
{
}
}), new objj_method(sel_getUid("enclosingScrollView"), function(self, _cmd)
{ with(self)
{
    var superview = _superview,
        scrollViewClass = objj_msgSend(CPScrollView, "class");
    while(superview && !objj_msgSend(superview, "isKindOfClass:", scrollViewClass))
        superview = superview._superview;
    return superview;
}
}), new objj_method(sel_getUid("scrollClipView:toPoint:"), function(self, _cmd, aClipView, aPoint)
{ with(self)
{
    objj_msgSend(aClipView, "scrollToPoint:", aPoint);
}
}), new objj_method(sel_getUid("reflectScrolledClipView:"), function(self, _cmd, aClipView)
{ with(self)
{
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPView, "class"))
        return;
    _CPViewNotificationCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
}
})]);
}
{
var the_class = objj_getClass("CPView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setLayer:"), function(self, _cmd, aLayer)
{ with(self)
{
    if (_layer == aLayer)
        return;
    if (_layer)
    {
        _layer._owningView = nil;
    }
    _layer = aLayer;
    if (_layer)
    {
        var bounds = CGRectMakeCopy(objj_msgSend(self, "bounds"));
        objj_msgSend(_layer, "_setOwningView:", self);
    }
}
}), new objj_method(sel_getUid("layer"), function(self, _cmd)
{ with(self)
{
    return _layer;
}
}), new objj_method(sel_getUid("setWantsLayer:"), function(self, _cmd, aFlag)
{ with(self)
{
    _wantsLayer = aFlag;
}
}), new objj_method(sel_getUid("wantsLayer"), function(self, _cmd)
{ with(self)
{
    return _wantsLayer;
}
})]);
}
{
var the_class = objj_getClass("CPView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_loadThemedAttributes"), function(self, _cmd)
{ with(self)
{
    var theme = objj_msgSend(self, "theme"),
        theClass = objj_msgSend(self, "class"),
        attributes = objj_msgSend(theClass, "_themedAttributes");
        count = attributes.length;
    while (count--)
    {
        var attributeName = attributes[count--];
        _themedAttributes[attributeName] = CPThemedAttributeMake(attributeName, attributes[count], theme, theClass);
    }
}
}), new objj_method(sel_getUid("setTheme:"), function(self, _cmd, aTheme)
{ with(self)
{
    if (_theme === aTheme)
        return;
    _theme = aTheme;
    objj_msgSend(self, "viewDidChangeTheme");
}
}), new objj_method(sel_getUid("theme"), function(self, _cmd)
{ with(self)
{
    return _theme;
}
}), new objj_method(sel_getUid("viewDidChangeTheme"), function(self, _cmd)
{ with(self)
{
    var theme = objj_msgSend(self, "theme");
    for (var attributeName in _themedAttributes)
        if (_themedAttributes.hasOwnProperty(attributeName))
            objj_msgSend(_themedAttributes[attributeName], "setTheme:", theme);
}
}), new objj_method(sel_getUid("_themedAttributes"), function(self, _cmd)
{ with(self)
{
    var dictionary = objj_msgSend(CPDictionary, "dictionary");
    for (var attributeName in _themedAttributes)
        if (_themedAttributes.hasOwnProperty(attributeName))
            objj_msgSend(dictionary, "setObject:forKey:", _themedAttributes[attributeName], attributeName);
    return dictionary;
}
}), new objj_method(sel_getUid("setValue:forThemedAttributeName:inControlState:"), function(self, _cmd, aValue, aName, aControlState)
{ with(self)
{
    var attribute = _themedAttributes[aName];
    if (!attribute)
        return;
    var currentValue = objj_msgSend(self, "currentValueForThemedAttributeName:", aName);
    objj_msgSend(attribute, "setValue:forControlState:", aValue, aControlState);
    if (objj_msgSend(self, "currentValueForThemedAttributeName:", aName) === currentValue)
        return;
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("setValue:forThemedAttributeName:"), function(self, _cmd, aValue, aName)
{ with(self)
{
    var attribute = _themedAttributes[aName];
    if (!attribute)
        return;
    var currentValue = objj_msgSend(self, "currentValueForThemedAttributeName:", aName);
    objj_msgSend(attribute, "setValue:", aValue);
    if (objj_msgSend(self, "currentValueForThemedAttributeName:", aName) === currentValue)
        return;
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("valueForThemedAttributeName:inControlState:"), function(self, _cmd, aName, aControlState)
{ with(self)
{
    return objj_msgSend(_themedAttributes[aName], "valueForControlState:", aControlState);
}
}), new objj_method(sel_getUid("valueForThemedAttributeName:"), function(self, _cmd, aName)
{ with(self)
{
    return objj_msgSend(_themedAttributes[aName], "value");
}
}), new objj_method(sel_getUid("currentValueForThemedAttributeName:"), function(self, _cmd, aName)
{ with(self)
{
    return objj_msgSend(_themedAttributes[aName], "valueForControlState:", _controlState);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themedAttributes"), function(self, _cmd)
{ with(self)
{
    return nil;
}
}), new objj_method(sel_getUid("_themedAttributes"), function(self, _cmd)
{ with(self)
{
    if (!_CachedThemedAttributes)
        _CachedThemedAttributes = {};
    var theClass = objj_msgSend(self, "class"),
        CPViewClass = objj_msgSend(CPView, "class"),
        attributes = [];
    while (theClass && theClass !== CPViewClass)
    {
        var cachedAttributes = _CachedThemedAttributes[class_getName(theClass)];
        if (cachedAttributes)
        {
            attributes = attributes.length ? attributes.concat(cachedAttributes) : attributes;
            _CachedThemedAttributes[objj_msgSend(self, "className")] = attributes;
            break;
        }
        var attributeDictionary = objj_msgSend(theClass, "themedAttributes");
        if (attributeDictionary)
        {
            var attributeKeys = objj_msgSend(attributeDictionary, "allKeys"),
                attributeCount = attributeKeys.length;
            while (attributeCount--)
            {
                var attributeName = attributeKeys[attributeCount];
                attributes.push(objj_msgSend(attributeDictionary, "objectForKey:", attributeName));
                attributes.push(attributeName);
            }
        }
        theClass = objj_msgSend(theClass, "superclass");
    }
    return attributes;
}
})]);
}
var CPViewAutoresizingMaskKey = "CPViewAutoresizingMask",
    CPViewAutoresizesSubviewsKey = "CPViewAutoresizesSubviews",
    CPViewBackgroundColorKey = "CPViewBackgroundColor",
    CPViewBoundsKey = "CPViewBoundsKey",
    CPViewFrameKey = "CPViewFrameKey",
    CPViewHitTestsKey = "CPViewHitTestsKey",
    CPViewIsHiddenKey = "CPViewIsHiddenKey",
    CPViewOpacityKey = "CPViewOpacityKey",
    CPViewSubviewsKey = "CPViewSubviewsKey",
    CPViewSuperviewKey = "CPViewSuperviewKey",
    CPViewTagKey = "CPViewTagKey",
    CPViewWindowKey = "CPViewWindowKey";
{
var the_class = objj_getClass("CPView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    _frame = objj_msgSend(aCoder, "decodeRectForKey:", CPViewFrameKey);
    _bounds = objj_msgSend(aCoder, "decodeRectForKey:", CPViewBoundsKey);
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "initWithCoder:", aCoder);
    if (self)
    {
        _tag = -1;
        if (objj_msgSend(aCoder, "containsValueForKey:", CPViewTagKey))
            _tag = objj_msgSend(aCoder, "decodeIntForKey:", CPViewTagKey);
        _window = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewWindowKey);
        _subviews = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewSubviewsKey);
        _superview = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewSuperviewKey);
        _autoresizingMask = objj_msgSend(aCoder, "decodeIntForKey:", CPViewAutoresizingMaskKey) || 0;
        _autoresizesSubviews = objj_msgSend(aCoder, "decodeBoolForKey:", CPViewAutoresizesSubviewsKey);
        _hitTests = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewHitTestsKey);
        _isHidden = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewIsHiddenKey);
        _opacity = objj_msgSend(aCoder, "decodeIntForKey:", CPViewOpacityKey);
        _displayHash = objj_msgSend(self, "hash");
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(aCoder, "decodeObjectForKey:", CPViewBackgroundColorKey));
        _theme = objj_msgSend(CPTheme, "defaultTheme");
        _themedAttributes = {};
        var theClass = objj_msgSend(self, "class"),
            attributes = objj_msgSend(theClass, "_themedAttributes"),
            count = attributes.length;
        while (count--)
        {
            var attributeName = attributes[count--];
            _themedAttributes[attributeName] = CPThemedAttributeDecode(aCoder, attributeName, attributes[count], _theme, theClass);
        }
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "encodeWithCoder:", aCoder);
    if (_tag != -1)
        objj_msgSend(aCoder, "encodeInt:forKey:", _tag, CPViewTagKey);
    objj_msgSend(aCoder, "encodeRect:forKey:", _frame, CPViewFrameKey);
    objj_msgSend(aCoder, "encodeRect:forKey:", _bounds, CPViewBoundsKey);
    objj_msgSend(aCoder, "encodeConditionalObject:forKey:", _window, CPViewWindowKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _subviews, CPViewSubviewsKey);
    objj_msgSend(aCoder, "encodeConditionalObject:forKey:", _superview, CPViewSuperviewKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _autoresizingMask, CPViewAutoresizingMaskKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _autoresizesSubviews, CPViewAutoresizesSubviewsKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _backgroundColor, CPViewBackgroundColorKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _hitTests, CPViewHitTestsKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _isHidden, CPViewIsHiddenKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _opacity, CPViewOpacityKey);
    for (var attributeName in _themedAttributes)
        if (_themedAttributes.hasOwnProperty(attributeName))
            CPThemedAttributeEncode(aCoder, _themedAttributes[attributeName]);
}
})]);
}
var _CPViewFullScreenModeStateMake = function(aView)
{
    var superview = aView._superview;
    return { autoresizingMask:aView._autoresizingMask, frame:CGRectMakeCopy(aView._frame), index:(superview ? objj_msgSend(superview._subviews, "indexOfObjectIdenticalTo:", aView) : 0), superview:superview };
}
var _CPViewGetTransform = function( fromView, toView)
{
    var transform = CGAffineTransformMakeIdentity(),
        sameWindow = YES,
        fromWindow = nil,
        toWindow = nil;
    if (fromView)
    {
        var view = fromView;
        while (view && view != toView)
        {
            var frame = view._frame;
            transform.tx += (frame.origin.x);
            transform.ty += (frame.origin.y);
            if (view._boundsTransform)
            {
                var tx = transform.tx * view._boundsTransform.a + transform.ty * view._boundsTransform.c + view._boundsTransform.tx;transform.ty = transform.tx * view._boundsTransform.b + transform.ty * view._boundsTransform.d + view._boundsTransform.ty;transform.tx = tx;var a = transform.a * view._boundsTransform.a + transform.b * view._boundsTransform.c, b = transform.a * view._boundsTransform.b + transform.b * view._boundsTransform.d, c = transform.c * view._boundsTransform.a + transform.d * view._boundsTransform.c;transform.d = transform.c * view._boundsTransform.b + transform.d * view._boundsTransform.d;transform.a = a;transform.b = b;transform.c = c;;
            }
            view = view._superview;
        }
        if (view === toView)
            return transform;
        else if (fromView && toView)
        {
            fromWindow = objj_msgSend(fromView, "window");
            toWindow = objj_msgSend(toView, "window");
            if (fromWindow && toWindow && fromWindow !== toWindow)
            {
                sameWindow = NO;
                var frame = objj_msgSend(fromWindow, "frame");
                transform.tx += (frame.origin.x);
                transform.ty += (frame.origin.y);
            }
        }
    }
    var view = toView;
    while (view)
    {
        var frame = view._frame;
        transform.tx -= (frame.origin.x);
        transform.ty -= (frame.origin.y);
        if (view._boundsTransform)
        {
            var tx = transform.tx * view._inverseBoundsTransform.a + transform.ty * view._inverseBoundsTransform.c + view._inverseBoundsTransform.tx;transform.ty = transform.tx * view._inverseBoundsTransform.b + transform.ty * view._inverseBoundsTransform.d + view._inverseBoundsTransform.ty;transform.tx = tx;var a = transform.a * view._inverseBoundsTransform.a + transform.b * view._inverseBoundsTransform.c, b = transform.a * view._inverseBoundsTransform.b + transform.b * view._inverseBoundsTransform.d, c = transform.c * view._inverseBoundsTransform.a + transform.d * view._inverseBoundsTransform.c;transform.d = transform.c * view._inverseBoundsTransform.b + transform.d * view._inverseBoundsTransform.d;transform.a = a;transform.b = b;transform.c = c;;
        }
        view = view._superview;
    }
    if (!sameWindow)
    {
        var frame = objj_msgSend(toWindow, "frame");
        transform.tx -= (frame.origin.x);
        transform.ty -= (frame.origin.y);
    }
    return transform;
}

