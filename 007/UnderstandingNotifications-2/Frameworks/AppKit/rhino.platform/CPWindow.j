I;25;Foundation/CPCountedSet.jI;33;Foundation/CPNotificationCenter.jI;26;Foundation/CPUndoManager.ji;12;CGGeometry.ji;13;CPAnimation.ji;13;CPResponder.jc;43562;
CPBorderlessWindowMask = 0;
CPTitledWindowMask = 1 << 0;
CPClosableWindowMask = 1 << 1;
CPMiniaturizableWindowMask = 1 << 2;
CPResizableWindowMask = 1 << 3;
CPTexturedBackgroundWindowMask = 1 << 8;
CPBorderlessBridgeWindowMask = 1 << 20;
CPHUDBackgroundWindowMask = 1 << 21;
CPWindowNotSizable = 0;
CPWindowMinXMargin = 1;
CPWindowWidthSizable = 2;
CPWindowMaxXMargin = 4;
CPWindowMinYMargin = 8;
CPWindowHeightSizable = 16;
CPWindowMaxYMargin = 32;
CPBackgroundWindowLevel = -1;
CPNormalWindowLevel = 4;
CPFloatingWindowLevel = 5;
CPSubmenuWindowLevel = 6;
CPTornOffMenuWindowLevel = 6;
CPMainMenuWindowLevel = 8;
CPStatusWindowLevel = 9;
CPModalPanelWindowLevel = 10;
CPPopUpMenuWindowLevel = 11;
CPDraggingWindowLevel = 12;
CPScreenSaverWindowLevel = 13;
CPWindowOut = 0;
CPWindowAbove = 1;
CPWindowBelow = 2;
CPWindowWillCloseNotification = "CPWindowWillCloseNotification";
CPWindowDidBecomeMainNotification = "CPWindowDidBecomeMainNotification";
CPWindowDidResignMainNotification = "CPWindowDidResignMainNotification";
CPWindowDidMoveNotification = "CPWindowDidMoveNotification";
var SHADOW_MARGIN_LEFT = 20.0,
    SHADOW_MARGIN_RIGHT = 19.0,
    SHADOW_MARGIN_TOP = 10.0,
    SHADOW_MARGIN_BOTTOM = 10.0,
    SHADOW_DISTANCE = 5.0,
    _CPWindowShadowColor = nil;
var CPWindowSaveImage = nil,
    CPWindowSavingImage = nil;
{var the_class = objj_allocateClassPair(CPResponder, "CPWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_windowNumber"), new objj_ivar("_styleMask"), new objj_ivar("_frame"), new objj_ivar("_level"), new objj_ivar("_isVisible"), new objj_ivar("_isAnimating"), new objj_ivar("_hasShadow"), new objj_ivar("_isMovableByWindowBackground"), new objj_ivar("_isDocumentEdited"), new objj_ivar("_isDocumentSaving"), new objj_ivar("_shadowView"), new objj_ivar("_windowView"), new objj_ivar("_contentView"), new objj_ivar("_toolbarView"), new objj_ivar("_mouseOverView"), new objj_ivar("_leftMouseDownView"), new objj_ivar("_rightMouseDownView"), new objj_ivar("_toolbar"), new objj_ivar("_firstResponder"), new objj_ivar("_delegate"), new objj_ivar("_title"), new objj_ivar("_acceptsMouseMovedEvents"), new objj_ivar("_ignoresMouseEvents"), new objj_ivar("_windowController"), new objj_ivar("_minSize"), new objj_ivar("_maxSize"), new objj_ivar("_undoManager"), new objj_ivar("_representedURL"), new objj_ivar("_registeredDraggedTypes"), new objj_ivar("_registeredDraggedTypesArray"), new objj_ivar("_inclusiveRegisteredDraggedTypes"), new objj_ivar("_bridge"), new objj_ivar("_autoresizingMask"), new objj_ivar("_delegateRespondsToWindowWillReturnUndoManagerSelector"), new objj_ivar("_isFullBridge"), new objj_ivar("_fullBridgeSession")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentRect:styleMask:"), function(self, _cmd, aContentRect, aStyleMask)
{ with(self)
{
    return objj_msgSend(self, "initWithContentRect:styleMask:bridge:", aContentRect, aStyleMask, nil);
}
}), new objj_method(sel_getUid("initWithContentRect:styleMask:bridge:"), function(self, _cmd, aContentRect, aStyleMask, aBridge)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "init");
    if (self)
    {
        _isFullBridge = NO;
        _registeredDraggedTypes = objj_msgSend(CPSet, "set");
        _registeredDraggedTypesArray = [];
        _windowNumber = objj_msgSend(CPApp._windows, "count");
        CPApp._windows[_windowNumber] = self;
        _styleMask = aStyleMask;
        _level = CPNormalWindowLevel;
        _minSize = CGSizeMake(0.0, 0.0);
        _maxSize = CGSizeMake(1000000.0, 1000000.0);
        var windowViewClass = objj_msgSend(objj_msgSend(self, "class"), "_windowViewClassForStyleMask:", aStyleMask);
        _frame = objj_msgSend(windowViewClass, "frameRectForContentRect:", aContentRect);
        _windowView = objj_msgSend(objj_msgSend(windowViewClass, "alloc"), "initWithFrame:styleMask:", CGRectMake(0.0, 0.0, CGRectGetWidth(_frame), CGRectGetHeight(_frame)), aStyleMask);
        objj_msgSend(_windowView, "_setWindow:", self);
        objj_msgSend(_windowView, "setNextResponder:", self);
        objj_msgSend(self, "setMovableByWindowBackground:", aStyleMask & CPHUDBackgroundWindowMask);
        objj_msgSend(self, "setContentView:", objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero()));
        _firstResponder = self;
        objj_msgSend(self, "setBridge:", aBridge);
        objj_msgSend(self, "setNextResponder:", CPApp);
        objj_msgSend(self, "setHasShadow:", aStyleMask !== CPBorderlessWindowMask);
        if (aStyleMask & CPBorderlessBridgeWindowMask)
            objj_msgSend(self, "setFullBridge:", YES);
    }
    return self;
}
}), new objj_method(sel_getUid("_setWindowView:"), function(self, _cmd, aWindowView)
{ with(self)
{
    if (_windowView === aWindowView)
        return;
    var oldWindowView = _windowView;
    _windowView = aWindowView;
}
}), new objj_method(sel_getUid("setFullBridge:"), function(self, _cmd, shouldBeFullBridge)
{ with(self)
{
    shouldBeFullBridge = !!shouldBeFullBridge;
    if (_isFullBridge === shouldBeFullBridge)
        return;
    _isFullBridge = shouldBeFullBridge;
    if (_isFullBridge)
    {
        _fullBridgeSession = _CPWindowFullBridgeSessionMake(_windowView, objj_msgSend(self, "contentRectForFrameRect:", objj_msgSend(self, "frame")), objj_msgSend(self, "hasShadow"), objj_msgSend(self, "level"));
        var fullBridgeWindowViewClass = objj_msgSend(objj_msgSend(self, "class"), "_windowViewClassForFullBridgeStyleMask:", _styleMask),
            windowView = objj_msgSend(objj_msgSend(fullBridgeWindowViewClass, "alloc"), "initWithFrame:styleMask:", CGRectMakeZero(), _styleMask);
        objj_msgSend(self, "_setWindowView:", windowView);
        objj_msgSend(self, "setLevel:", CPBackgroundWindowLevel);
        objj_msgSend(self, "setHasShadow:", NO);
        objj_msgSend(self, "setAutoresizingMask:", CPWindowWidthSizable | CPWindowHeightSizable);
        objj_msgSend(self, "setFrame:", objj_msgSend(_bridge, "visibleFrame"));
    }
    else
    {
        var windowView = _fullBridgeSession.windowView;
        objj_msgSend(self, "_setWindowView:", windowView);
        objj_msgSend(self, "setLevel:", _fullBridgeSession.level);
        objj_msgSend(self, "setHasShadow:", _fullBridgeSession.hasShadow);
        objj_msgSend(self, "setAutoresizingMask:", CPWindowNotSizable);
        objj_msgSend(self, "setFrame:", objj_msgSend(windowView, "frameRectForContentRect:", _fullBridgeSession.contentRect));
    }
}
}), new objj_method(sel_getUid("isFullBridge"), function(self, _cmd)
{ with(self)
{
    return _isFullBridge;
}
}), new objj_method(sel_getUid("styleMask"), function(self, _cmd)
{ with(self)
{
    return _styleMask;
}
}), new objj_method(sel_getUid("contentRectForFrameRect:"), function(self, _cmd, aFrame)
{ with(self)
{
    return objj_msgSend(_windowView, "contentRectForFrameRect:", aFrame);
}
}), new objj_method(sel_getUid("frameRectForContentRect:"), function(self, _cmd, aContentRect)
{ with(self)
{
    return objj_msgSend(_windowView, "frameRectForContentRect:", aContentRect);
}
}), new objj_method(sel_getUid("frame"), function(self, _cmd)
{ with(self)
{
    return _frame;
}
}), new objj_method(sel_getUid("setFrame:display:animate:"), function(self, _cmd, aFrame, shouldDisplay, shouldAnimate)
{ with(self)
{
    if (shouldAnimate)
    {
        var animation = objj_msgSend(objj_msgSend(_CPWindowFrameAnimation, "alloc"), "initWithWindow:targetFrame:", self, aFrame);
        objj_msgSend(animation, "startAnimation");
    }
    else
    {
        objj_msgSend(self, "setFrameOrigin:", aFrame.origin);
        objj_msgSend(self, "setFrameSize:", aFrame.size);
    }
}
}), new objj_method(sel_getUid("setFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    objj_msgSend(self, "setFrame:display:animate:", aFrame, YES, NO);
}
}), new objj_method(sel_getUid("setFrameOrigin:"), function(self, _cmd, anOrigin)
{ with(self)
{
    var origin = _frame.origin;
    if ((origin.x == anOrigin.x && origin.y == anOrigin.y))
        return;
    origin.x = anOrigin.x;
    origin.y = anOrigin.y;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowDidMoveNotification, self);
}
}), new objj_method(sel_getUid("setFrameSize:"), function(self, _cmd, aSize)
{ with(self)
{
    aSize = { width:MIN(MAX(aSize.width, _minSize.width), _maxSize.width), height:MIN(MAX(aSize.height, _minSize.height), _maxSize.height) };
    if ((_frame.size.width == aSize.width && _frame.size.height == aSize.height))
        return;
    _frame.size = aSize;
    objj_msgSend(_windowView, "setFrameSize:", aSize);
    if (_hasShadow)
        objj_msgSend(_shadowView, "setFrameSize:", { width:SHADOW_MARGIN_LEFT + aSize.width + SHADOW_MARGIN_RIGHT, height:SHADOW_MARGIN_BOTTOM + aSize.height + SHADOW_MARGIN_TOP + SHADOW_DISTANCE });
    if (!_isAnimating && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowDidResize:")))
        objj_msgSend(_delegate, "windowDidResize:", self);
}
}), new objj_method(sel_getUid("orderFront:"), function(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(_bridge, "order:window:relativeTo:", CPWindowAbove, self, nil);
}
}), new objj_method(sel_getUid("orderBack:"), function(self, _cmd, aSender)
{ with(self)
{
}
}), new objj_method(sel_getUid("orderOut:"), function(self, _cmd, aSender)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowWillClose:")))
        objj_msgSend(_delegate, "windowWillClose:", self);
    objj_msgSend(_bridge, "order:window:relativeTo:", CPWindowOut, self, nil);
    if (objj_msgSend(CPApp, "keyWindow") == self)
    {
        objj_msgSend(self, "resignKeyWindow");
        CPApp._keyWindow = nil;
    }
}
}), new objj_method(sel_getUid("orderWindow:relativeTo:"), function(self, _cmd, aPlace, otherWindowNumber)
{ with(self)
{
    objj_msgSend(_bridge, "order:window:relativeTo:", aPlace, self, CPApp._windows[otherWindowNumber]);
}
}), new objj_method(sel_getUid("setLevel:"), function(self, _cmd, aLevel)
{ with(self)
{
    _level = aLevel;
}
}), new objj_method(sel_getUid("level"), function(self, _cmd)
{ with(self)
{
    return _level;
}
}), new objj_method(sel_getUid("isVisible"), function(self, _cmd)
{ with(self)
{
    return _isVisible;
}
}), new objj_method(sel_getUid("showsResizeIndicator"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_windowView, "showsResizeIndicator");
}
}), new objj_method(sel_getUid("setShowsResizeIndicator:"), function(self, _cmd, shouldShowResizeIndicator)
{ with(self)
{
    objj_msgSend(_windowView, "setShowsResizeIndicator:", shouldShowResizeIndicator);
}
}), new objj_method(sel_getUid("resizeIndicatorOffset"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_windowView, "resizeIndicatorOffset");
}
}), new objj_method(sel_getUid("setResizeIndicatorOffset:"), function(self, _cmd, anOffset)
{ with(self)
{
    objj_msgSend(_windowView, "setResizeIndicatorOffset:", anOffset);
}
}), new objj_method(sel_getUid("setContentView:"), function(self, _cmd, aView)
{ with(self)
{
    if (_contentView)
        objj_msgSend(_contentView, "removeFromSuperview");
    var bounds = CGRectMake(0.0, 0.0, CGRectGetWidth(_frame), CGRectGetHeight(_frame));
    _contentView = aView;
    objj_msgSend(_contentView, "setFrame:", objj_msgSend(self, "contentRectForFrameRect:", bounds));
    objj_msgSend(_contentView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    objj_msgSend(_windowView, "addSubview:", _contentView);
}
}), new objj_method(sel_getUid("contentView"), function(self, _cmd)
{ with(self)
{
    return _contentView;
}
}), new objj_method(sel_getUid("setBackgroundColor:"), function(self, _cmd, aColor)
{ with(self)
{
    objj_msgSend(_windowView, "setBackgroundColor:", aColor);
}
}), new objj_method(sel_getUid("backgroundColor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_windowView, "backgroundColor");
}
}), new objj_method(sel_getUid("setMinSize:"), function(self, _cmd, aSize)
{ with(self)
{
    if (CGSizeEqualToSize(_minSize, aSize))
        return;
    _minSize = CGSizeCreateCopy(aSize);
    var size = CGSizeMakeCopy(objj_msgSend(self, "frame").size),
        needsFrameChange = NO;
    if (size.width < _minSize.width)
    {
        size.width = _minSize.width;
        needsFrameChange = YES;
    }
    if (size.height < _minSize.height)
    {
        size.height = _minSize.height;
        needsFrameChange = YES;
    }
    if (needsFrameChange)
        objj_msgSend(self, "setFrameSize:", size);
}
}), new objj_method(sel_getUid("minSize"), function(self, _cmd)
{ with(self)
{
    return _minSize;
}
}), new objj_method(sel_getUid("setMaxSize:"), function(self, _cmd, aSize)
{ with(self)
{
    if (CGSizeEqualToSize(_maxSize, aSize))
        return;
    _maxSize = CGSizeCreateCopy(aSize);
    var size = CGSizeMakeCopy(objj_msgSend(self, "frame").size),
        needsFrameChange = NO;
    if (size.width > _maxSize.width)
    {
        size.width = _maxSize.width;
        needsFrameChange = YES;
    }
    if (size.height > _maxSize.height)
    {
        size.height = _maxSize.height;
        needsFrameChange = YES;
    }
    if (needsFrameChange)
        objj_msgSend(self, "setFrameSize:", size);
}
}), new objj_method(sel_getUid("maxSize"), function(self, _cmd)
{ with(self)
{
    return _maxSize;
}
}), new objj_method(sel_getUid("hasShadow"), function(self, _cmd)
{ with(self)
{
    return _hasShadow;
}
}), new objj_method(sel_getUid("setHasShadow:"), function(self, _cmd, shouldHaveShadow)
{ with(self)
{
    if (_hasShadow === shouldHaveShadow)
        return;
    _hasShadow = shouldHaveShadow;
    if (_hasShadow)
    {
        var bounds = objj_msgSend(_windowView, "bounds");
        _shadowView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(-SHADOW_MARGIN_LEFT, -SHADOW_MARGIN_TOP + SHADOW_DISTANCE,
            SHADOW_MARGIN_LEFT + CGRectGetWidth(bounds) + SHADOW_MARGIN_RIGHT, SHADOW_MARGIN_TOP + CGRectGetHeight(bounds) + SHADOW_MARGIN_BOTTOM));
        if (!_CPWindowShadowColor)
        {
            var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPWindow, "class"));
            _CPWindowShadowColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", 
                [
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow0.png"), CGSizeMake(20.0, 19.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow1.png"), CGSizeMake(1.0, 19.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow2.png"), CGSizeMake(19.0, 19.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow3.png"), CGSizeMake(20.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow4.png"), CGSizeMake(1.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow5.png"), CGSizeMake(19.0, 1.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow6.png"), CGSizeMake(20.0, 18.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow7.png"), CGSizeMake(1.0, 18.0)),
                    objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPWindow/CPWindowShadow8.png"), CGSizeMake(19.0, 18.0))
                ]));
        }
        objj_msgSend(_shadowView, "setBackgroundColor:", _CPWindowShadowColor);
        objj_msgSend(_shadowView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    }
    else if (_shadowView)
    {
        _shadowView = nil;
    }
}
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
    _delegateRespondsToWindowWillReturnUndoManagerSelector = objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowWillReturnUndoManager:"));
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowDidBecomeMain:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("windowDidBecomeMain:"), CPWindowDidBecomeMainNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowDidResignMain:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("windowDidResignMain:"), CPWindowDidResignMainNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowDidMove:")))
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("windowDidMove:"), CPWindowDidMoveNotification, self);
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("setWindowController:"), function(self, _cmd, aWindowController)
{ with(self)
{
    _windowController = aWindowController;
}
}), new objj_method(sel_getUid("windowController"), function(self, _cmd)
{ with(self)
{
    return _windowController;
}
}), new objj_method(sel_getUid("doCommandBySelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", aSelector))
        objj_msgSend(_delegate, "performSelector:", aSelector);
    else
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "doCommandBySelector:", aSelector);
}
}), new objj_method(sel_getUid("acceptsFirstResponder"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("makeFirstResponder:"), function(self, _cmd, aResponder)
{ with(self)
{
    if (_firstResponder == aResponder)
        return YES;
    if(!objj_msgSend(_firstResponder, "resignFirstResponder"))
        return NO;
    if(!aResponder || !objj_msgSend(aResponder, "acceptsFirstResponder") || !objj_msgSend(aResponder, "becomeFirstResponder"))
    {
        _firstResponder = self;
        return NO;
    }
    _firstResponder = aResponder;
    return YES;
}
}), new objj_method(sel_getUid("firstResponder"), function(self, _cmd)
{ with(self)
{
    return _firstResponder;
}
}), new objj_method(sel_getUid("acceptsMouseMovedEvents"), function(self, _cmd)
{ with(self)
{
    return _acceptsMouseMovedEvents;
}
}), new objj_method(sel_getUid("setAcceptsMouseMovedEvents:"), function(self, _cmd, shouldAcceptMouseMovedEvents)
{ with(self)
{
    _acceptsMouseMovedEvents = shouldAcceptMouseMovedEvents;
}
}), new objj_method(sel_getUid("ignoresMouseEvents"), function(self, _cmd)
{ with(self)
{
    return _ignoresMouseEvents;
}
}), new objj_method(sel_getUid("setIgnoresMouseEvents:"), function(self, _cmd, shouldIgnoreMouseEvents)
{ with(self)
{
    _ignoresMouseEvents = shouldIgnoreMouseEvents;
}
}), new objj_method(sel_getUid("title"), function(self, _cmd)
{ with(self)
{
    return _title;
}
}), new objj_method(sel_getUid("setTitle:"), function(self, _cmd, aTitle)
{ with(self)
{
    _title = aTitle;
    objj_msgSend(_windowView, "setTitle:", aTitle);
    objj_msgSend(self, "_synchronizeMenuBarTitleWithWindowTitle");
}
}), new objj_method(sel_getUid("setTitleWithRepresentedFilename:"), function(self, _cmd, aFilePath)
{ with(self)
{
    objj_msgSend(self, "setRepresentedFilename:", aFilePath);
    objj_msgSend(self, "setTitle:", objj_msgSend(aFilePath, "lastPathComponent"));
}
}), new objj_method(sel_getUid("setRepresentedFilename:"), function(self, _cmd, aFilePath)
{ with(self)
{
    objj_msgSend(self, "setRepresentedURL:", aFilePath);
}
}), new objj_method(sel_getUid("representedFilename"), function(self, _cmd)
{ with(self)
{
    return _representedURL;
}
}), new objj_method(sel_getUid("setRepresentedURL:"), function(self, _cmd, aURL)
{ with(self)
{
    _representedURL = aURL;
}
}), new objj_method(sel_getUid("representedURL"), function(self, _cmd)
{ with(self)
{
    return _representedURL;
}
}), new objj_method(sel_getUid("setMovableByWindowBackground:"), function(self, _cmd, shouldBeMovableByWindowBackground)
{ with(self)
{
    _isMovableByWindowBackground = shouldBeMovableByWindowBackground;
}
}), new objj_method(sel_getUid("isMovableByWindowBackground"), function(self, _cmd)
{ with(self)
{
    return _isMovableByWindowBackground;
}
}), new objj_method(sel_getUid("center"), function(self, _cmd)
{ with(self)
{
    var size = objj_msgSend(self, "frame").size,
        bridgeSize = objj_msgSend(_bridge, "contentBounds").size;
    objj_msgSend(self, "setFrameOrigin:", CGPointMake((bridgeSize.width - size.width) / 2.0, (bridgeSize.height - size.height) / 2.0));
}
}), new objj_method(sel_getUid("sendEvent:"), function(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type"),
        point = objj_msgSend(anEvent, "locationInWindow");
    switch (type)
    {
        case CPKeyUp: return objj_msgSend(objj_msgSend(self, "firstResponder"), "keyUp:", anEvent);
        case CPKeyDown: return objj_msgSend(objj_msgSend(self, "firstResponder"), "keyDown:", anEvent);
        case CPScrollWheel: return objj_msgSend(objj_msgSend(_windowView, "hitTest:", point), "scrollWheel:", anEvent);
        case CPLeftMouseUp: if (!_leftMouseDownView)
                                        return objj_msgSend(objj_msgSend(_windowView, "hitTest:", point), "mouseUp:", anEvent);
                                    objj_msgSend(_leftMouseDownView, "mouseUp:", anEvent)
                                    _leftMouseDownView = nil;
                                    return;
        case CPLeftMouseDown: _leftMouseDownView = objj_msgSend(_windowView, "hitTest:", point);
                                    if (_leftMouseDownView != _firstResponder && objj_msgSend(_leftMouseDownView, "acceptsFirstResponder"))
                                        objj_msgSend(self, "makeFirstResponder:", _leftMouseDownView);
                                    var theWindow = objj_msgSend(anEvent, "window");
                                    if (objj_msgSend(theWindow, "isKeyWindow") || objj_msgSend(theWindow, "becomesKeyOnlyIfNeeded"))
                                        return objj_msgSend(_leftMouseDownView, "mouseDown:", anEvent);
                                    else
                                    {
                                        objj_msgSend(self, "makeKeyAndOrderFront:", self);
                                        if (objj_msgSend(_leftMouseDownView, "acceptsFirstMouse:", anEvent))
                                            return objj_msgSend(_leftMouseDownView, "mouseDown:", anEvent)
                                    }
                                    break;
        case CPLeftMouseDragged: if (!_leftMouseDownView)
                                        return objj_msgSend(objj_msgSend(_windowView, "hitTest:", point), "mouseDragged:", anEvent);
                                    return objj_msgSend(_leftMouseDownView, "mouseDragged:", anEvent);
        case CPRightMouseUp: return objj_msgSend(_rightMouseDownView, "mouseUp:", anEvent);
        case CPRightMouseDown: _rightMouseDownView = objj_msgSend(_windowView, "hitTest:", point);
                                    return objj_msgSend(_rightMouseDownView, "mouseDown:", anEvent);
        case CPRightMouseDragged: return objj_msgSend(_rightMouseDownView, "mouseDragged:", anEvent);
        case CPMouseMoved: if (!_acceptsMouseMovedEvents)
                                        return;
                                    var hitTestView = objj_msgSend(_windowView, "hitTest:", point);
                                    if (hitTestView != _mouseOverView)
                                    {
                                        if (_mouseOverView)
                                            objj_msgSend(_mouseOverView, "mouseExited:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPMouseExited, point, objj_msgSend(anEvent, "modifierFlags"), objj_msgSend(anEvent, "timestamp"), _windowNumber, nil, -1, 1, 0));
                                        if (hitTestView)
                                            objj_msgSend(hitTestView, "mouseEntered:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPMouseEntered, point, objj_msgSend(anEvent, "modifierFlags"), objj_msgSend(anEvent, "timestamp"), _windowNumber, nil, -1, 1, 0));
                                        _mouseOverView = hitTestView;
                                    }
                                    objj_msgSend(_mouseOverView, "mouseMoved:", anEvent);
    }
}
}), new objj_method(sel_getUid("windowNumber"), function(self, _cmd)
{ with(self)
{
    return _windowNumber;
}
}), new objj_method(sel_getUid("becomeKeyWindow"), function(self, _cmd)
{ with(self)
{
    if (_firstResponder != self && objj_msgSend(_firstResponder, "respondsToSelector:", sel_getUid("becomeKeyWindow")))
        objj_msgSend(_firstResponder, "becomeKeyWindow");
}
}), new objj_method(sel_getUid("canBecomeKeyWindow"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("isKeyWindow"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPApp, "keyWindow") == self;
}
}), new objj_method(sel_getUid("makeKeyAndOrderFront:"), function(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "orderFront:", self);
    objj_msgSend(self, "makeKeyWindow");
    objj_msgSend(self, "makeMainWindow");
}
}), new objj_method(sel_getUid("makeKeyWindow"), function(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "canBecomeKeyWindow"))
        return;
    objj_msgSend(CPApp._keyWindow, "resignKeyWindow");
    CPApp._keyWindow = self;
    objj_msgSend(self, "becomeKeyWindow");
}
}), new objj_method(sel_getUid("resignKeyWindow"), function(self, _cmd)
{ with(self)
{
    if (_firstResponder != self && objj_msgSend(_firstResponder, "respondsToSelector:", sel_getUid("resignKeyWindow")))
        objj_msgSend(_firstResponder, "resignKeyWindow");
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowDidResignKey:")))
        objj_msgSend(_delegate, "windowDidResignKey:", self);
}
}), new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"), function(self, _cmd, anImage, imageLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:", anImage, self, objj_msgSend(self, "convertBaseToBridge:", imageLocation), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
}), new objj_method(sel_getUid("_noteRegisteredDraggedTypes:"), function(self, _cmd, pasteboardTypes)
{ with(self)
{
    if (!pasteboardTypes)
        return;
    if (!_inclusiveRegisteredDraggedTypes)
        _inclusiveRegisteredDraggedTypes = objj_msgSend(CPCountedSet, "set");
    objj_msgSend(_inclusiveRegisteredDraggedTypes, "unionSet:", pasteboardTypes);
}
}), new objj_method(sel_getUid("_noteUnregisteredDraggedTypes:"), function(self, _cmd, pasteboardTypes)
{ with(self)
{
    if (!pasteboardTypes)
        return;
    objj_msgSend(_inclusiveRegisteredDraggedTypes, "minusSet:", pasteboardTypes)
    if (objj_msgSend(_inclusiveRegisteredDraggedTypes, "count") === 0)
        _inclusiveRegisteredDraggedTypes = nil;
}
}), new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"), function(self, _cmd, aView, imageLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPDragServer, "sharedDragServer"), "dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:", aView, self, objj_msgSend(self, "convertBaseToBridge:", imageLocation), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
}), new objj_method(sel_getUid("registerForDraggedTypes:"), function(self, _cmd, pasteboardTypes)
{ with(self)
{
    if (!pasteboardTypes)
        return;
    objj_msgSend(self, "_noteUnregisteredDraggedTypes:", _registeredDraggedTypes);
    objj_msgSend(_registeredDraggedTypes, "addObjectsFromArray:", pasteboardTypes)
    objj_msgSend(self, "_noteRegisteredDraggedTypes:", _registeredDraggedTypes);
    _registeredDraggedTypesArray = nil;
}
}), new objj_method(sel_getUid("registeredDraggedTypes"), function(self, _cmd)
{ with(self)
{
    if (!_registeredDraggedTypesArray)
        _registeredDraggedTypesArray = objj_msgSend(_registeredDraggedTypes, "allObjects")
    return _registeredDraggedTypesArray;
}
}), new objj_method(sel_getUid("unregisterDraggedTypes"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_noteUnregisteredDraggedTypes:", _registeredDraggedTypes);
    _registeredDraggedTypes = objj_msgSend(CPSet, "set");
    _registeredDraggedTypesArray = [];
}
}), new objj_method(sel_getUid("setDocumentEdited:"), function(self, _cmd, isDocumentEdited)
{ with(self)
{
    if (_isDocumentEdited == isDocumentEdited)
        return;
    _isDocumentEdited = isDocumentEdited;
    objj_msgSend(CPMenu, "_setMenuBarIconImageAlphaValue:", _isDocumentEdited ? 0.5 : 1.0);
}
}), new objj_method(sel_getUid("isDocumentEdited"), function(self, _cmd)
{ with(self)
{
    return _isDocumentEdited;
}
}), new objj_method(sel_getUid("setDocumentSaving:"), function(self, _cmd, isDocumentSaving)
{ with(self)
{
    if (_isDocumentSaving == isDocumentSaving)
        return;
    _isDocumentSaving = isDocumentSaving;
    objj_msgSend(self, "_synchronizeSaveMenuWithDocumentSaving");
    objj_msgSend(_windowView, "windowDidChangeDocumentSaving");
}
}), new objj_method(sel_getUid("isDocumentSaving"), function(self, _cmd)
{ with(self)
{
    return _isDocumentSaving;
}
}), new objj_method(sel_getUid("_synchronizeSaveMenuWithDocumentSaving"), function(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "isMainWindow"))
        return;
    var mainMenu = objj_msgSend(CPApp, "mainMenu"),
        index = objj_msgSend(mainMenu, "indexOfItemWithTitle:", _isDocumentSaving ? "Save" : "Saving...");
    if (index == CPNotFound)
        return;
    var item = objj_msgSend(mainMenu, "itemAtIndex:", index);
    if (_isDocumentSaving)
    {
        CPWindowSaveImage = objj_msgSend(item, "image");
        objj_msgSend(item, "setTitle:", "Saving...");
        objj_msgSend(item, "setImage:", CPWindowSavingImage);
        objj_msgSend(item, "setEnabled:", NO);
    }
    else
    {
        objj_msgSend(item, "setTitle:", "Save");
        objj_msgSend(item, "setImage:", CPWindowSaveImage);
        objj_msgSend(item, "setEnabled:", YES);
    }
}
}), new objj_method(sel_getUid("performClose:"), function(self, _cmd, aSender)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("windowShouldClose:")))
    {
        if (!objj_msgSend(_delegate, "windowShouldClose:", self))
            return;
    }
    else if (objj_msgSend(self, "respondsToSelector:", sel_getUid("windowShouldClose:")) && !objj_msgSend(self, "windowShouldClose:", self))
        return;
    objj_msgSend(self, "close");
}
}), new objj_method(sel_getUid("close"), function(self, _cmd)
{ with(self)
{
   objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowWillCloseNotification, self);
   objj_msgSend(self, "orderOut:", nil);
}
}), new objj_method(sel_getUid("isMainWindow"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPApp, "mainWindow") == self;
}
}), new objj_method(sel_getUid("canBecomeMainWindow"), function(self, _cmd)
{ with(self)
{
    if (objj_msgSend(self, "isVisible"))
        return YES;
    return NO;
}
}), new objj_method(sel_getUid("makeMainWindow"), function(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "canBecomeMainWindow"))
        return;
    objj_msgSend(CPApp._mainWindow, "resignMainWindow");
    CPApp._mainWindow = self;
    objj_msgSend(self, "becomeMainWindow");
}
}), new objj_method(sel_getUid("becomeMainWindow"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "_synchronizeMenuBarTitleWithWindowTitle");
    objj_msgSend(self, "_synchronizeSaveMenuWithDocumentSaving");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowDidBecomeMainNotification, self);
}
}), new objj_method(sel_getUid("resignMainWindow"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPWindowDidResignMainNotification, self);
}
}), new objj_method(sel_getUid("toolbar"), function(self, _cmd)
{ with(self)
{
    return _toolbar;
}
}), new objj_method(sel_getUid("setToolbar:"), function(self, _cmd, aToolbar)
{ with(self)
{
    if (_toolbar === aToolbar)
        return;
    objj_msgSend(objj_msgSend(aToolbar, "_window"), "setToolbar:", nil);
    objj_msgSend(_toolbar, "_setWindow:", nil);
    _toolbar = aToolbar;
    objj_msgSend(_toolbar, "_setWindow:", self);
    objj_msgSend(self, "_noteToolbarChanged");
}
}), new objj_method(sel_getUid("toggleToolbarShown:"), function(self, _cmd, aSender)
{ with(self)
{
    var toolbar = objj_msgSend(self, "toolbar");
    objj_msgSend(toolbar, "setVisible:", !objj_msgSend(toolbar, "isVisible"));
}
}), new objj_method(sel_getUid("_noteToolbarChanged"), function(self, _cmd)
{ with(self)
{
    var frame = CGRectMakeCopy(objj_msgSend(self, "frame")),
        newFrame;
    objj_msgSend(_windowView, "noteToolbarChanged");
    if (_isFullBridge)
        newFrame = objj_msgSend(_bridge, "visibleFrame");
    else
    {
        newFrame = CGRectMakeCopy(objj_msgSend(self, "frame"));
        newFrame.origin = frame.origin;
    }
    objj_msgSend(self, "setFrame:", newFrame);
}
}), new objj_method(sel_getUid("_setAttachedSheetFrameOrigin"), function(self, _cmd)
{ with(self)
{
    var contentRect = objj_msgSend(objj_msgSend(self, "contentView"), "frame"),
        sheetFrame = CGRectMakeCopy(objj_msgSend(_attachedSheet, "frame"));
   sheetFrame.origin.y = CGRectGetMinY(_frame) + CGRectGetMinY(contentRect);
   sheetFrame.origin.x = CGRectGetMinX(_frame) + FLOOR((CGRectGetWidth(_frame) - CGRectGetWidth(sheetFrame)) / 2.0);
   objj_msgSend(_attachedSheet, "setFrameOrigin:", sheetFrame.origin);
}
}), new objj_method(sel_getUid("_animateAttachedSheet"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("_attachSheet:modalDelegate:didEndSelector:contextInfo:"), function(self, _cmd, aSheet, aModalDelegate, aDidEndSelector, aContextInfo)
{ with(self)
{
    _attachedSheet = aSheet;
    aSheet._isSheet = YES;
    objj_msgSend(self, "_setAttachedSheetFrameOrigin");
    objj_msgSend(_bridge, "order:window:relativeTo:", CPWindowAbove, aSheet, self);
}
}), new objj_method(sel_getUid("attachedSheet"), function(self, _cmd)
{ with(self)
{
    return _attachedSheet;
}
}), new objj_method(sel_getUid("isSheet"), function(self, _cmd)
{ with(self)
{
    return _isSheet;
}
}), new objj_method(sel_getUid("becomesKeyOnlyIfNeeded"), function(self, _cmd)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("worksWhenModal"), function(self, _cmd)
{ with(self)
{
    return NO;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPWindow, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(CPWindow, "class"));
    CPWindowSavingImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"), CGSizeMake(16.0, 16.0))
}
}), new objj_method(sel_getUid("_windowViewClassForStyleMask:"), function(self, _cmd, aStyleMask)
{ with(self)
{
    if (aStyleMask & CPHUDBackgroundWindowMask)
        return _CPHUDWindowView;
    else if (aStyleMask === CPBorderlessWindowMask)
        return _CPBorderlessWindowView;
    return _CPStandardWindowView;
}
}), new objj_method(sel_getUid("_windowViewClassForFullBridgeStyleMask:"), function(self, _cmd, aStyleMask)
{ with(self)
{
    return _CPBorderlessBridgeWindowView;
}
}), new objj_method(sel_getUid("frameRectForContentRect:styleMask:"), function(self, _cmd, aContentRect, aStyleMask)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "_windowViewClassForStyleMask:", _styleMask), "frameRectForContentRect:", aContentRect);
}
})]);
}
{
var the_class = objj_getClass("CPWindow")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPWindow\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_synchronizeMenuBarTitleWithWindowTitle"), function(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(_windowController, "document") || !objj_msgSend(self, "isMainWindow"))
        return;
    objj_msgSend(CPMenu, "setMenuBarTitle:", _title);
}
})]);
}
{
var the_class = objj_getClass("CPWindow")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPWindow\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setBridge:"), function(self, _cmd, aBridge)
{ with(self)
{
    if (_bridge == aBridge)
        return;
    if (_bridge)
    {
        objj_msgSend(self, "orderOut:", self);
    }
    _bridge = aBridge;
    if (objj_msgSend(self, "isFullBridge"))
        objj_msgSend(self, "setFrame:", objj_msgSend(aBridge, "contentBounds"));
}
}), new objj_method(sel_getUid("resizeWithOldBridgeSize:"), function(self, _cmd, aSize)
{ with(self)
{
    if (objj_msgSend(self, "isFullBridge"))
        return objj_msgSend(self, "setFrame:", objj_msgSend(_bridge, "visibleFrame"));
    if (_autoresizingMask == CPWindowNotSizable)
        return;
    var frame = objj_msgSend(_bridge, "contentBounds"),
        newFrame = CGRectMakeCopy(_frame),
        dX = (CGRectGetWidth(frame) - aSize.width) /
            (((_autoresizingMask & CPWindowMinXMargin) ? 1 : 0) + (_autoresizingMask & CPWindowWidthSizable ? 1 : 0) + (_autoresizingMask & CPWindowMaxXMargin ? 1 : 0)),
        dY = (CGRectGetHeight(frame) - aSize.height) /
            ((_autoresizingMask & CPWindowMinYMargin ? 1 : 0) + (_autoresizingMask & CPWindowHeightSizable ? 1 : 0) + (_autoresizingMask & CPWindowMaxYMargin ? 1 : 0));
    if (_autoresizingMask & CPWindowMinXMargin)
        newFrame.origin.x += dX;
    if (_autoresizingMask & CPWindowWidthSizable)
        newFrame.size.width += dX;
    if (_autoresizingMask & CPWindowMinYMargin)
        newFrame.origin.y += dY;
    if (_autoresizingMask & CPWindowHeightSizable)
        newFrame.size.height += dY;
    objj_msgSend(self, "setFrame:", newFrame);
}
}), new objj_method(sel_getUid("setAutoresizingMask:"), function(self, _cmd, anAutoresizingMask)
{ with(self)
{
    _autoresizingMask = anAutoresizingMask;
}
}), new objj_method(sel_getUid("autoresizingMask"), function(self, _cmd)
{ with(self)
{
    return _autoresizingMask;
}
}), new objj_method(sel_getUid("convertBaseToBridge:"), function(self, _cmd, aPoint)
{ with(self)
{
    var origin = objj_msgSend(self, "frame").origin;
    return CGPointMake(aPoint.x + origin.x, aPoint.y + origin.y);
}
}), new objj_method(sel_getUid("convertBridgeToBase:"), function(self, _cmd, aPoint)
{ with(self)
{
    var origin = objj_msgSend(self, "frame").origin;
    return CGPointMake(aPoint.x - origin.x, aPoint.y - origin.y);
}
}), new objj_method(sel_getUid("undoManager"), function(self, _cmd)
{ with(self)
{
    if (_delegateRespondsToWindowWillReturnUndoManagerSelector)
        return objj_msgSend(_delegate, "windowWillReturnUndoManager:", self);
    if (!_undoManager)
        _undoManager = objj_msgSend(objj_msgSend(CPUndoManager, "alloc"), "init");
    return _undoManager;
}
}), new objj_method(sel_getUid("undo:"), function(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "undoManager"), "undo");
}
}), new objj_method(sel_getUid("redo:"), function(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "undoManager"), "redo");
}
}), new objj_method(sel_getUid("containsPoint:"), function(self, _cmd, aPoint)
{ with(self)
{
    return CGRectContainsPoint(_frame, aPoint);
}
})]);
}
var interpolate = function(fromValue, toValue, progress)
{
    return fromValue + (toValue - fromValue) * progress;
}
{var the_class = objj_allocateClassPair(CPAnimation, "_CPWindowFrameAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_window"), new objj_ivar("_startFrame"), new objj_ivar("_targetFrame")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithWindow:targetFrame:"), function(self, _cmd, aWindow, aTargetFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPAnimation") }, "initWithDuration:animationCurve:", 0.2, CPAnimationLinear);
    if (self)
    {
        _window = aWindow;
        _targetFrame = CGRectMakeCopy(aTargetFrame);
        _startFrame = CGRectMakeCopy(objj_msgSend(_window, "frame"));
    }
    return self;
}
}), new objj_method(sel_getUid("startAnimation"), function(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPAnimation") }, "startAnimation");
    _window._isAnimating = YES;
}
}), new objj_method(sel_getUid("setCurrentProgress:"), function(self, _cmd, aProgress)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPAnimation") }, "setCurrentProgress:", aProgress);
    var value = objj_msgSend(self, "currentValue");
    if (value == 1.0)
        _window._isAnimating = NO;
    objj_msgSend(_window, "setFrameOrigin:", CGPointMake(interpolate(CGRectGetMinX(_startFrame), CGRectGetMinX(_targetFrame), value), interpolate(CGRectGetMinY(_startFrame), CGRectGetMinY(_targetFrame), value)));
    objj_msgSend(_window, "setFrameSize:", CGSizeMake(interpolate(CGRectGetWidth(_startFrame), CGRectGetWidth(_targetFrame), value), interpolate(CGRectGetHeight(_startFrame), CGRectGetHeight(_targetFrame), value)));
}
})]);
}
_CPWindowFullBridgeSessionMake= function(aWindowView, aContentRect, hasShadow, aLevel)
{
    return { windowView:aWindowView, contentRect:aContentRect, hasShadow:hasShadow, level:aLevel };
}
i;15;_CPWindowView.ji;23;_CPStandardWindowView.ji;18;_CPHUDWindowView.ji;25;_CPBorderlessWindowView.ji;31;_CPBorderlessBridgeWindowView.ji;14;CPDragServer.ji;19;CPDOMWindowBridge.ji;8;CPView.j