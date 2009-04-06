i;8;CPView.ji;13;CPImageView.jc;10453;
var _CPWindowViewResizeIndicatorImage = nil;
{var the_class = objj_allocateClassPair(CPView, "_CPWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_styleMask"), new objj_ivar("_resizeIndicator"), new objj_ivar("_resizeIndicatorOffset"), new objj_ivar("_toolbarView"), new objj_ivar("_resizeFrame"), new objj_ivar("_mouseDraggedPoint")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("contentRectForFrameRect:"), function(self, _cmd, aFrameRect)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "class"), "contentRectForFrameRect:", aFrameRect);
}
}), new objj_method(sel_getUid("frameRectForContentRect:"), function(self, _cmd, aContentRect)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "class"), "frameRectForContentRect:", aContentRect);
}
}), new objj_method(sel_getUid("initWithFrame:styleMask:"), function(self, _cmd, aFrame, aStyleMask)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _styleMask = aStyleMask;
        _resizeIndicatorOffset = CGSizeMake(0.0, 0.0);
        _toolbarOffset = CGSizeMake(0.0, 0.0);
        objj_msgSend(self, "setShowsResizeIndicator:", !(_styleMask & CPBorderlessBridgeWindowMask) && (_styleMask & CPResizableWindowMask));
    }
    return self;
}
}), new objj_method(sel_getUid("setTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
}
}), new objj_method(sel_getUid("acceptsFirstMouse:"), function(self, _cmd, anEvent)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    var theWindow = objj_msgSend(self, "window");
    if ((_styleMask & CPResizableWindowMask) && _resizeIndicator)
    {
        var frame = objj_msgSend(_resizeIndicator, "frame");
        if (CGRectContainsPoint(frame, objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil)))
            return objj_msgSend(self, "trackResizeWithEvent:", anEvent);
    }
    if (objj_msgSend(theWindow, "isMovableByWindowBackground"))
        objj_msgSend(self, "trackMoveWithEvent:", anEvent);
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "mouseDown:", anEvent);
}
}), new objj_method(sel_getUid("trackResizeWithEvent:"), function(self, _cmd, anEvent)
{ with(self)
{
    var location = objj_msgSend(anEvent, "locationInWindow"),
        type = objj_msgSend(anEvent, "type");
    if (type === CPLeftMouseUp)
        return;
    var theWindow = objj_msgSend(self, "window");
    if (type === CPLeftMouseDown)
    {
        var frame = objj_msgSend(theWindow, "frame");
        _resizeFrame = CGRectMake(location.x, location.y, CGRectGetWidth(frame), CGRectGetHeight(frame));
    }
    else if (type === CPLeftMouseDragged)
        objj_msgSend(theWindow, "setFrameSize:", CGSizeMake(CGRectGetWidth(_resizeFrame) + location.x - CGRectGetMinX(_resizeFrame), CGRectGetHeight(_resizeFrame) + location.y - CGRectGetMinY(_resizeFrame)));
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackResizeWithEvent:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
}), new objj_method(sel_getUid("trackMoveWithEvent:"), function(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type");
    if (type === CPLeftMouseUp)
        return;
    else if (type === CPLeftMouseDown)
        _mouseDraggedPoint = objj_msgSend(objj_msgSend(self, "window"), "convertBaseToBridge:", objj_msgSend(anEvent, "locationInWindow"));
    else if (type === CPLeftMouseDragged)
    {
        var theWindow = objj_msgSend(self, "window"),
            location = objj_msgSend(theWindow, "convertBaseToBridge:", objj_msgSend(anEvent, "locationInWindow")),
            frame = objj_msgSend(theWindow, "frame");
        objj_msgSend(theWindow, "setFrameOrigin:", CGPointMake((frame.origin.x) + (location.x - _mouseDraggedPoint.x), (frame.origin.y) + (location.y - _mouseDraggedPoint.y)));
        _mouseDraggedPoint = location;
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackMoveWithEvent:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
}), new objj_method(sel_getUid("setShowsResizeIndicator:"), function(self, _cmd, shouldShowResizeIndicator)
{ with(self)
{
    if (shouldShowResizeIndicator)
    {
        var size = objj_msgSend(_CPWindowViewResizeIndicatorImage, "size"),
            boundsSize = objj_msgSend(self, "frame").size;
        _resizeIndicator = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(boundsSize.width - size.width - _resizeIndicatorOffset.width, boundsSize.height - size.height - _resizeIndicatorOffset.height, size.width, size.height));
        objj_msgSend(_resizeIndicator, "setImage:", _CPWindowViewResizeIndicatorImage);
        objj_msgSend(_resizeIndicator, "setAutoresizingMask:", CPViewMinXMargin | CPViewMinYMargin);
        objj_msgSend(self, "addSubview:", _resizeIndicator);
    }
    else
    {
        objj_msgSend(_resizeIndicator, "removeFromSuperview");
        _resizeIndicator = nil;
    }
}
}), new objj_method(sel_getUid("showsResizeIndicator"), function(self, _cmd)
{ with(self)
{
    return _resizeIndicator !== nil;
}
}), new objj_method(sel_getUid("setResizeIndicatorOffset:"), function(self, _cmd, anOffset)
{ with(self)
{
    if (CGSizeEqualToSize(_resizeIndicatorOffset, anOffset))
        return;
    _resizeIndicatorOffset = anOffset;
    if (!_resizeIndicator)
        return;
    var size = objj_msgSend(_resizeIndicator, "frame").size,
        boundsSize = objj_msgSend(self, "frame").size;
    objj_msgSend(_resizeIndicator, "setFrameOrigin:", CGPointMake(boundsSize.width - size.width - anOffset.width, boundsSize.height - size.height - anOffset.height));
}
}), new objj_method(sel_getUid("resizeIndicatorOffset"), function(self, _cmd)
{ with(self)
{
    return _resizeIndicatorOffset;
}
}), new objj_method(sel_getUid("windowDidChangeDocumentEdited"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("windowDidChangeDocumentSaving"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("showsToolbar"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("toolbarOffset"), function(self, _cmd)
{ with(self)
{
    return CGSizeMakeZero();
}
}), new objj_method(sel_getUid("toolbarLabelColor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPColor, "blackColor");
}
}), new objj_method(sel_getUid("toolbarMaxY"), function(self, _cmd)
{ with(self)
{
    if (!_toolbarView || objj_msgSend(_toolbarView, "isHidden"))
        return objj_msgSend(self, "toolbarOffset").height;
    return CGRectGetMaxY(objj_msgSend(_toolbarView, "frame"));
}
}), new objj_method(sel_getUid("toolbarView"), function(self, _cmd)
{ with(self)
{
    return _toolbarView;
}
}), new objj_method(sel_getUid("tile"), function(self, _cmd)
{ with(self)
{
    var theWindow = objj_msgSend(self, "window"),
        bounds = objj_msgSend(self, "bounds"),
        width = CGRectGetWidth(bounds);
    if (objj_msgSend(objj_msgSend(theWindow, "toolbar"), "isVisible"))
    {
        var toolbarView = objj_msgSend(self, "toolbarView"),
            toolbarOffset = objj_msgSend(self, "toolbarOffset");
        objj_msgSend(toolbarView, "setFrame:", CGRectMake(toolbarOffset.width, toolbarOffset.height, width, CGRectGetHeight(objj_msgSend(toolbarView, "frame"))));
    }
    if (objj_msgSend(self, "showsResizeIndicator"))
    {
        var size = objj_msgSend(_resizeIndicator, "frame").size,
            boundsSize = objj_msgSend(self, "bounds").size;
        objj_msgSend(_resizeIndicator, "setFrameOrigin:", CGPointMake(boundsSize.width - size.width - _resizeIndicatorOffset.width, boundsSize.height - size.height - _resizeIndicatorOffset.height));
    }
}
}), new objj_method(sel_getUid("noteToolbarChanged"), function(self, _cmd)
{ with(self)
{
    var theWindow = objj_msgSend(self, "window"),
        toolbar = objj_msgSend(theWindow, "toolbar"),
        toolbarView = objj_msgSend(toolbar, "_toolbarView");
    if (_toolbarView !== toolbarView)
    {
        objj_msgSend(_toolbarView, "removeFromSuperview");
        if (toolbarView)
        {
            objj_msgSend(toolbarView, "removeFromSuperview");
            objj_msgSend(toolbarView, "setLabelColor:", objj_msgSend(self, "toolbarLabelColor"));
            objj_msgSend(self, "addSubview:", toolbarView);
        }
        _toolbarView = toolbarView;
    }
    objj_msgSend(toolbarView, "setHidden:", !objj_msgSend(self, "showsToolbar") || !objj_msgSend(toolbar, "isVisible"));
    if (theWindow)
    {
        var contentRect = objj_msgSend(self, "convertRect:toView:", objj_msgSend(objj_msgSend(theWindow, "contentView"), "frame"), nil);
        contentRect.origin = objj_msgSend(theWindow, "convertBaseToBridge:", contentRect.origin);
        objj_msgSend(self, "setAutoresizesSubviews:", NO);
        objj_msgSend(theWindow, "setFrame:", objj_msgSend(theWindow, "frameRectForContentRect:", contentRect));
        objj_msgSend(self, "setAutoresizesSubviews:", YES);
    }
    objj_msgSend(self, "tile");
}
}), new objj_method(sel_getUid("didAddSubview:"), function(self, _cmd, aView)
{ with(self)
{
    if (!_resizeIndicator || aView === _resizeIndicator)
        return;
    objj_msgSend(self, "addSubview:", _resizeIndicator);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPWindowView, "class"))
        return;
    _CPWindowViewResizeIndicatorImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPWindow, "class")), "pathForResource:", "_CPWindowView/_CPWindowViewResizeIndicator.png"), CGSizeMake(12.0, 12.0));
}
}), new objj_method(sel_getUid("contentRectForFrameRect:"), function(self, _cmd, aFrameRect)
{ with(self)
{
    return CGRectMakeCopy(aFrameRect);
}
}), new objj_method(sel_getUid("frameRectForContentRect:"), function(self, _cmd, aContentRect)
{ with(self)
{
    return CGRectMakeCopy(aContentRect);
}
})]);
}

