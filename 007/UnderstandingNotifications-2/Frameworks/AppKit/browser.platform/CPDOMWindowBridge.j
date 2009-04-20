I;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.ji;9;CPEvent.ji;17;CPCompatibility.ji;18;CPDOMWindowLayer.jc;32427;
CPSharedDOMWindowBridge = nil;
var ExcludedDOMElements = [];
var CPDOMWindowGetFrame,
    CPDOMEventGetClickCount,
    CPDOMEventStop;
{var the_class = objj_allocateClassPair(CPObject, "CPDOMWindowBridge"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_orderedWindows"), new objj_ivar("_mouseDownWindow"), new objj_ivar("_DOMWindow"), new objj_ivar("_DOMBodyElement"), new objj_ivar("_DOMFocusElement"), new objj_ivar("_windowLevels"), new objj_ivar("_windowLayers"), new objj_ivar("_frame"), new objj_ivar("_contentBounds"), new objj_ivar("_mouseIsDown"), new objj_ivar("_lastMouseUp"), new objj_ivar("_lastMouseDown"), new objj_ivar("_charCodes"), new objj_ivar("_keyCode"), new objj_ivar("_DOMEventMode"), new objj_ivar("_DOMPasteboardElement"), new objj_ivar("_pasteboardKeyDownEvent"), new objj_ivar("_overriddenEventType")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    alert("unimplemented");
}
}), new objj_method(sel_getUid("_initWithDOMWindow:"), function(self, _cmd, aDOMWindow)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _DOMWindow = aDOMWindow;
        _windowLevels = [];
        _windowLayers = objj_msgSend(CPDictionary, "dictionary");
        _DOMBodyElement = document.getElementsByTagName("body")[0];
        _DOMBodyElement.innerHTML = "";
        _DOMBodyElement.style.overflow = "hidden";
        _DOMBodyElement.style.webkitTouchCallout = "none";
        if (document.documentElement)
            document.documentElement.style.overflow = "hidden";
        _frame = CPDOMWindowGetFrame(_DOMWindow);
        _contentBounds = CGRectMake(0.0, 0.0, CPRectGetWidth(_frame), CPRectGetHeight(_frame));
        _DOMFocusElement = document.createElement("input");
        _DOMFocusElement.style.position = "absolute";
        _DOMFocusElement.style.zIndex = "-1000";
        _DOMFocusElement.style.opacity = "0";
        _DOMFocusElement.style.filter = "alpha(opacity=0)";
        _DOMBodyElement.appendChild(_DOMFocusElement);
        _DOMPasteboardElement = document.createElement("input");
        _DOMPasteboardElement.style.position = "absolute";
        _DOMPasteboardElement.style.top = "-10000px";
        _DOMPasteboardElement.style.zIndex = "99";
        _DOMBodyElement.appendChild(_DOMPasteboardElement);
        _DOMPasteboardElement.blur();
        _charCodes = {};
        var theClass = objj_msgSend(self, "class"),
            keyEventSelector = sel_getUid("_bridgeKeyEvent:"),
            keyEventImplementation = class_getMethodImplementation(theClass, keyEventSelector),
            keyEventCallback = function (anEvent) { keyEventImplementation(self, nil, anEvent); },
            mouseEventSelector = sel_getUid("_bridgeMouseEvent:"),
            mouseEventImplementation = class_getMethodImplementation(theClass, mouseEventSelector),
            mouseEventCallback = function (anEvent) { mouseEventImplementation(self, nil, anEvent); },
            scrollEventSelector = sel_getUid("_bridgeScrollEvent:"),
            scrollEventImplementation = class_getMethodImplementation(theClass, scrollEventSelector),
            scrollEventCallback = function (anEvent) { scrollEventImplementation(self, nil, anEvent); },
            resizeEventSelector = sel_getUid("_bridgeResizeEvent:"),
            resizeEventImplementation = class_getMethodImplementation(theClass, resizeEventSelector),
            resizeEventCallback = function (anEvent) { resizeEventImplementation(self, nil, anEvent); },
            touchEventSelector = sel_getUid("_bridgeTouchEvent:"),
            touchEventImplementation = class_getMethodImplementation(theClass, touchEventSelector),
            touchEventCallback = function (anEvent) { touchEventImplementation(self, nil, anEvent); },
            theDocument = _DOMWindow.document;
        if (document.addEventListener)
        {
            _DOMWindow.addEventListener("resize", resizeEventCallback, NO);
            theDocument.addEventListener(CPDOMEventMouseUp, mouseEventCallback, NO);
            theDocument.addEventListener(CPDOMEventMouseDown, mouseEventCallback, NO);
            theDocument.addEventListener(CPDOMEventMouseMoved, mouseEventCallback, NO);
            theDocument.addEventListener(CPDOMEventKeyUp, keyEventCallback, NO);
            theDocument.addEventListener(CPDOMEventKeyDown, keyEventCallback, NO);
            theDocument.addEventListener(CPDOMEventKeyPress, keyEventCallback, NO);
            theDocument.addEventListener(CPDOMEventTouchStart, touchEventCallback, NO);
            theDocument.addEventListener(CPDOMEventTouchEnd, touchEventCallback, NO);
            theDocument.addEventListener(CPDOMEventTouchMove, touchEventCallback, NO);
            theDocument.addEventListener(CPDOMEventTouchCancel, touchEventCallback, NO);
            _DOMWindow.addEventListener("DOMMouseScroll", scrollEventCallback, NO);
            _DOMWindow.addEventListener(CPDOMEventScrollWheel, scrollEventCallback, NO);
        }
        else if(document.attachEvent)
        {
            _DOMWindow.attachEvent("onresize", resizeEventCallback);
            theDocument.attachEvent("on" + CPDOMEventMouseUp, mouseEventCallback);
            theDocument.attachEvent("on" + CPDOMEventMouseDown, mouseEventCallback);
            theDocument.attachEvent("on" + CPDOMEventMouseMoved, mouseEventCallback);
            theDocument.attachEvent("on" + CPDOMEventDoubleClick, mouseEventCallback);
            theDocument.attachEvent("on" + CPDOMEventKeyUp, keyEventCallback);
            theDocument.attachEvent("on" + CPDOMEventKeyDown, keyEventCallback);
            theDocument.attachEvent("on" + CPDOMEventKeyPress, keyEventCallback);
            _DOMWindow.onmousewheel = scrollEventCallback;
            theDocument.onmousewheel = scrollEventCallback;
            theDocument.body.ondrag = function () { return NO; };
            theDocument.body.onselectstart = function () { return window.event.srcElement == _DOMPasteboardElement; };
        }
        ExcludedDOMElements["INPUT"] = YES;
        ExcludedDOMElements["SELECT"] = YES;
        ExcludedDOMElements["TEXTAREA"] = YES;
        ExcludedDOMElements["OPTION"] = YES;
    }
    return self;
}
}), new objj_method(sel_getUid("frame"), function(self, _cmd)
{ with(self)
{
    return CGRectMakeCopy(_frame);
}
}), new objj_method(sel_getUid("visibleFrame"), function(self, _cmd)
{ with(self)
{
    var frame = objj_msgSend(self, "frame");
    frame.origin = CGPointMakeZero();
    if (objj_msgSend(CPMenu, "menuBarVisible"))
    {
        var menuBarHeight = objj_msgSend(objj_msgSend(CPApp, "mainMenu"), "menuBarHeight");
        frame.origin.y += menuBarHeight;
        frame.size.height -= menuBarHeight;
    }
    return frame;
}
}), new objj_method(sel_getUid("contentBounds"), function(self, _cmd)
{ with(self)
{
    return CPRectCreateCopy(_contentBounds);
}
}), new objj_method(sel_getUid("orderedWindowsAtLevel:"), function(self, _cmd, aLevel)
{ with(self)
{
    var layer = objj_msgSend(self, "layerAtLevel:create:", aLevel, NO);
    if (!layer)
        return [];
    return objj_msgSend(layer, "orderedWindows");
}
}), new objj_method(sel_getUid("layerAtLevel:create:"), function(self, _cmd, aLevel, aFlag)
{ with(self)
{
    var layer = objj_msgSend(_windowLayers, "objectForKey:", aLevel);
    if (!layer && aFlag)
    {
        layer = objj_msgSend(objj_msgSend(CPDOMWindowLayer, "alloc"), "initWithLevel:", aLevel);
        objj_msgSend(_windowLayers, "setObject:forKey:", layer, aLevel);
        var low = 0,
            high = _windowLevels.length - 1,
            middle;
        while (low <= high)
        {
            middle = FLOOR((low + high) / 2);
            if (_windowLevels[middle] > aLevel)
                high = middle - 1;
            else
                low = middle + 1;
        }
        objj_msgSend(_windowLevels, "insertObject:atIndex:", aLevel, _windowLevels[middle] > aLevel ? middle : middle + 1);
        layer._DOMElement.style.zIndex = aLevel;
        _DOMBodyElement.appendChild(layer._DOMElement);
    }
    return layer;
}
}), new objj_method(sel_getUid("order:window:relativeTo:"), function(self, _cmd, aPlace, aWindow, otherWindow)
{ with(self)
{
    var layer = objj_msgSend(self, "layerAtLevel:create:", objj_msgSend(aWindow, "level"), aPlace != CPWindowOut);
    if (aPlace == CPWindowOut)
        return objj_msgSend(layer, "removeWindow:", aWindow);
    objj_msgSend(layer, "insertWindow:atIndex:", aWindow, (otherWindow ? (aPlace == CPWindowAbove ? otherWindow._index + 1 : otherWindow._index) : CPNotFound));
}
}), new objj_method(sel_getUid("_dragHitTest:pasteboard:"), function(self, _cmd, aPoint, aPasteboard)
{ with(self)
{
    var levels = _windowLevels,
        layers = _windowLayers,
        levelCount = levels.length;
    while (levelCount--)
    {
        if (levels[levelCount] >= CPDraggingWindowLevel)
            continue;
        var windows = objj_msgSend(layers, "objectForKey:", levels[levelCount])._windows,
            windowCount = windows.length;
        while (windowCount--)
        {
            var theWindow = windows[windowCount];
            if (objj_msgSend(theWindow, "containsPoint:", aPoint))
                return objj_msgSend(theWindow, "_dragHitTest:pasteboard:", aPoint, aPasteboard);
        }
    }
    return nil;
}
}), new objj_method(sel_getUid("_propagateCurrentDOMEvent:"), function(self, _cmd, aFlag)
{ with(self)
{
    StopDOMEventPropagation = !aFlag;
}
}), new objj_method(sel_getUid("hitTest:"), function(self, _cmd, location)
{ with(self)
{
    var levels = _windowLevels,
        layers = _windowLayers,
        levelCount = levels.length,
        theWindow = nil;
    while (levelCount-- && !theWindow)
    {
        var windows = objj_msgSend(layers, "objectForKey:", levels[levelCount])._windows,
            windowCount = windows.length;
        while (windowCount-- && !theWindow)
        {
            var candidateWindow = windows[windowCount];
            if (!candidateWindow._ignoresMouseEvents && objj_msgSend(candidateWindow, "containsPoint:", location))
                theWindow = candidateWindow;
        }
    }
    return theWindow;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sharedDOMWindowBridge"), function(self, _cmd)
{ with(self)
{
    if (!CPSharedDOMWindowBridge)
        CPSharedDOMWindowBridge = objj_msgSend(objj_msgSend(CPDOMWindowBridge, "alloc"), "_initWithDOMWindow:", window);
    return CPSharedDOMWindowBridge;
}
})]);
}
var CPDOMWindowGetFrame = function(_DOMWindow)
{
    var frame = nil;
    if (_DOMWindow.outerWidth)
        frame = CGRectMake(0, 0, _DOMWindow.outerWidth, _DOMWindow.outerHeight);
    else
        frame = CGRectMake(0, 0, -1, -1);
    if (window.screenTop)
        frame.origin = CGPointMake(_DOMWindow.screenLeft, _DOMWindow.screenTop, 0);
    else if (window.screenX)
        frame.origin = CGPointMake(_DOMWindow.screenX, _DOMWindow.screenY, 0);
    if (_DOMWindow.innerWidth)
        frame.size = CGSizeMake(_DOMWindow.innerWidth, _DOMWindow.innerHeight);
    else if (document.documentElement && document.documentElement.clientWidth)
        frame.size = CGSizeMake(_DOMWindow.document.documentElement.clientWidth, _DOMWindow.document.documentElement.clientHeight);
    else
        frame.size = CGSizeMake(_DOMWindow.document.body.clientWidth, _DOMWindow.document.body.clientHeight);
    return frame;
}
var KeyCodesToPrevent = {},
    CharacterKeysToPrevent = {},
    KeyCodesWithoutKeyPressEvents = { '8':1, '9':1, '37':1, '38':1, '39':1, '40':1, '46':1, '33':1, '34':1 };
var CTRL_KEY_CODE = 17;
{
var the_class = objj_getClass("CPDOMWindowBridge")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPDOMWindowBridge\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("preventCharacterKeysFromPropagating:"), function(self, _cmd, characters)
{ with(self)
{
    for(var i=characters.length; i>0; i--)
        CharacterKeysToPrevent[""+characters[i-1].toLowerCase()] = YES;
}
}), new objj_method(sel_getUid("preventCharacterKeyFromPropagating:"), function(self, _cmd, character)
{ with(self)
{
    CharacterKeysToPrevent[character.toLowerCase()] = YES;
}
}), new objj_method(sel_getUid("clearCharacterKeysToPreventFromPropagating"), function(self, _cmd)
{ with(self)
{
    CharacterKeysToPrevent = {};
}
}), new objj_method(sel_getUid("preventKeyCodesFromPropagating:"), function(self, _cmd, keyCodes)
{ with(self)
{
    for(var i=keyCodes.length; i>0; i--)
        KeyCodesToPrevent[keyCodes[i-1]] = YES;
}
}), new objj_method(sel_getUid("preventKeyCodeFromPropagating:"), function(self, _cmd, keyCode)
{ with(self)
{
    KeyCodesToPrevent[keyCode] = YES;
}
}), new objj_method(sel_getUid("clearKeyCodesToPreventFromPropagating"), function(self, _cmd)
{ with(self)
{
    KeyCodesToPrevent = {};
}
}), new objj_method(sel_getUid("_bridgeMouseEvent:"), function(self, _cmd, aDOMEvent)
{ with(self)
{
    var theType = _overriddenEventType || aDOMEvent.type;
    if (theType == CPDOMEventDoubleClick)
    {
        _overriddenEventType = CPDOMEventMouseDown;
        objj_msgSend(self, "_bridgeMouseEvent:", aDOMEvent);
        _overriddenEventType = CPDOMEventMouseUp;
        objj_msgSend(self, "_bridgeMouseEvent:", aDOMEvent);
        _overriddenEventType = nil;
        return;
    }
    try
    {
        var event,
            location = { x:aDOMEvent.clientX, y:aDOMEvent.clientY },
            timestamp = aDOMEvent.timeStamp ? aDOMEvent.timeStamp : new Date(),
            sourceElement = (aDOMEvent.target || aDOMEvent.srcElement),
            windowNumber = 0,
            modifierFlags = (aDOMEvent.shiftKey ? CPShiftKeyMask : 0) |
                            (aDOMEvent.ctrlKey ? CPControlKeyMask : 0) |
                            (aDOMEvent.altKey ? CPAlternateKeyMask : 0) |
                            (aDOMEvent.metaKey ? CPCommandKeyMask : 0);
        StopDOMEventPropagation = YES;
        if (_mouseDownWindow)
            windowNumber = objj_msgSend(_mouseDownWindow, "windowNumber");
        else
        {
            var theWindow = objj_msgSend(self, "hitTest:", location);
            if (aDOMEvent.type == CPDOMEventMouseDown && theWindow)
                _mouseDownWindow = theWindow;
            windowNumber = objj_msgSend(theWindow, "windowNumber");
        }
        if (windowNumber)
        {
            var windowFrame = CPApp._windows[windowNumber]._frame;
            location.x -= (windowFrame.origin.x);
            location.y -= (windowFrame.origin.y);
        }
        switch (theType)
        {
            case CPDOMEventMouseUp: if(_mouseIsDown)
                                        {
                                            event = objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseUp, location, modifierFlags, timestamp, windowNumber, nil, -1, CPDOMEventGetClickCount(_lastMouseUp, timestamp, location), 0);
                                            _mouseIsDown = NO;
                                            _lastMouseUp = event;
                                            _mouseDownWindow = nil;
                                        }
                                        if(_DOMEventMode)
                                        {
                                            _DOMEventMode = NO;
                                            return;
                                        }
                                        break;
            case CPDOMEventMouseDown: if (ExcludedDOMElements[sourceElement.tagName] && sourceElement != _DOMFocusElement)
                                        {
                                            _DOMEventMode = YES;
                                            _mouseIsDown = YES;
                                            objj_msgSend(CPApp, "sendEvent:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseDown, location, modifierFlags, timestamp, windowNumber, nil, -1, CPDOMEventGetClickCount(_lastMouseDown, timestamp, location), 0));
                                            objj_msgSend(CPApp, "sendEvent:", objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseUp, location, modifierFlags, timestamp, windowNumber, nil, -1, CPDOMEventGetClickCount(_lastMouseDown, timestamp, location), 0));
                                            return;
                                        }
                                        event = objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPLeftMouseDown, location, modifierFlags, timestamp, windowNumber, nil, -1, CPDOMEventGetClickCount(_lastMouseDown, timestamp, location), 0);
                                        _mouseIsDown = YES;
                                        _lastMouseDown = event;
                                        break;
            case CPDOMEventMouseMoved: if (_DOMEventMode)
                                            return;
                                        event = objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", _mouseIsDown ? CPLeftMouseDragged : CPMouseMoved, location, modifierFlags, timestamp, windowNumber, nil, -1, 1, 0);
                                        break;
        }
        if (event)
        {
            event._DOMEvent = aDOMEvent;
            objj_msgSend(CPApp, "sendEvent:", event);
        }
        if (StopDOMEventPropagation)
            CPDOMEventStop(aDOMEvent);
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
    }
    catch (anException)
    {
        objj_exception_report(anException, {path:"CPDOMWindowBridge.j"});
    }
}
}), new objj_method(sel_getUid("_bridgeKeyEvent:"), function(self, _cmd, aDOMEvent)
{ with(self)
{
    try
    {
        var event,
            timestamp = aDOMEvent.timeStamp ? aDOMEvent.timeStamp : new Date(),
            sourceElement = (aDOMEvent.target || aDOMEvent.srcElement),
            windowNumber = objj_msgSend(objj_msgSend(CPApp, "keyWindow"), "windowNumber"),
            modifierFlags = (aDOMEvent.shiftKey ? CPShiftKeyMask : 0) |
                            (aDOMEvent.ctrlKey ? CPControlKeyMask : 0) |
                            (aDOMEvent.altKey ? CPAlternateKeyMask : 0) |
                            (aDOMEvent.metaKey ? CPCommandKeyMask : 0);
        if (ExcludedDOMElements[sourceElement.tagName] && sourceElement != _DOMFocusElement && sourceElement != _DOMPasteboardElement)
            return;
        StopDOMEventPropagation = !(modifierFlags & (CPControlKeyMask | CPCommandKeyMask)) ||
                                  CharacterKeysToPrevent[String.fromCharCode(aDOMEvent.keyCode || aDOMEvent.charCode).toLowerCase()] ||
                                  KeyCodesToPrevent[aDOMEvent.keyCode];
        var isNativePasteEvent = NO,
            isNativeCopyOrCutEvent = NO;
        switch (aDOMEvent.type)
        {
            case CPDOMEventKeyDown:
                                        _keyCode = aDOMEvent.keyCode;
                                        var characters = String.fromCharCode(_keyCode).toLowerCase();
                                        if (characters == "v" && (modifierFlags & CPPlatformActionKeyMask))
                                        {
                                            _DOMPasteboardElement.select();
                                            _DOMPasteboardElement.value = "";
                                            isNativePasteEvent = YES;
                                        }
                                        else if ((characters == "c" || characters == "x") && (modifierFlags & CPPlatformActionKeyMask))
                                            isNativeCopyOrCutEvent = YES;
                                        else if (!CPFeatureIsCompatible(CPJavascriptRemedialKeySupport))
                                            return;
                                        else if (!KeyCodesWithoutKeyPressEvents[_keyCode] && (_keyCode == CTRL_KEY_CODE || !(modifierFlags & CPControlKeyMask)))
                                            return;
            case CPDOMEventKeyPress:
                                        if ((aDOMEvent.target || aDOMEvent.srcElement) == _DOMPasteboardElement)
                                            return;
                                        var keyCode = _keyCode,
                                            charCode = aDOMEvent.keyCode || aDOMEvent.charCode,
                                            isARepeat = (_charCodes[keyCode] != nil);
                                        _charCodes[keyCode] = charCode;
                                        var characters = String.fromCharCode(charCode),
                                            charactersIgnoringModifiers = characters.toLowerCase();
                                        event = objj_msgSend(CPEvent, "keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:", CPKeyDown, location, modifierFlags, timestamp, windowNumber, nil, characters, charactersIgnoringModifiers, isARepeat, keyCode);
                                        if (isNativePasteEvent)
                                        {
                                            _pasteboardKeyDownEvent = event;
                                            window.setNativeTimeout(function () { objj_msgSend(self, "_checkPasteboardElement") }, 0);
                                            return;
                                        }
                                        break;
            case CPDOMEventKeyUp: var keyCode = aDOMEvent.keyCode,
                                            charCode = _charCodes[keyCode];
                                        _charCodes[keyCode] = nil;
                                        var characters = String.fromCharCode(charCode),
                                            charactersIgnoringModifiers = characters.toLowerCase();
                                        if (!(modifierFlags & CPShiftKeyMask))
                                            characters = charactersIgnoringModifiers;
                                        event = objj_msgSend(CPEvent, "keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:", CPKeyUp, location, modifierFlags,  timestamp, windowNumber, nil, characters, charactersIgnoringModifiers, NO, keyCode);
                                        break;
        }
        if (event)
        {
            event._DOMEvent = aDOMEvent;
            objj_msgSend(CPApp, "sendEvent:", event);
            if (isNativeCopyOrCutEvent)
            {
                var pasteboard = objj_msgSend(CPPasteboard, "generalPasteboard"),
                    types = objj_msgSend(pasteboard, "types");
                if (types.length)
                {
                    if (objj_msgSend(types, "indexOfObjectIdenticalTo:", CPStringPboardType) != CPNotFound)
                        _DOMPasteboardElement.value = objj_msgSend(pasteboard, "stringForType:", CPStringPboardType);
                    else
                        _DOMPasteboardElement.value = objj_msgSend(pasteboard, "_generateStateUID");
                    _DOMPasteboardElement.select();
                    window.setNativeTimeout(function() { objj_msgSend(self, "_clearPasteboardElement"); }, 0);
                }
                return;
            }
        }
        if (StopDOMEventPropagation)
            CPDOMEventStop(aDOMEvent);
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
    }
    catch (anException)
    {
        objj_exception_report(anException, {path:"CPDOMWindowBridge.j"});
    }
}
}), new objj_method(sel_getUid("_bridgeScrollEvent:"), function(self, _cmd, aDOMEvent)
{ with(self)
{
    if(!aDOMEvent)
        aDOMEvent = window.event;
    try
    {
        if (CPFeatureIsCompatible(CPJavaScriptMouseWheelValues_8_15))
        {
            var x = 0.0,
                y = 0.0,
                element = aDOMEvent.target;
            while (element.nodeType !== 1)
                element = element.parentNode;
            if (element.offsetParent)
            {
                do
                {
                    x += element.offsetLeft;
                    y += element.offsetTop;
                } while (element = element.offsetParent);
            }
            var location = { x:(x + ((aDOMEvent.clientX - 8) / 15)), y:(y + ((aDOMEvent.clientY - 8) / 15)) };}
        else
            var location = { x:aDOMEvent.clientX, y:aDOMEvent.clientY };
        var deltaX = 0.0,
            deltaY = 0.0,
            windowNumber = 0,
            timestamp = aDOMEvent.timeStamp ? aDOMEvent.timeStamp : new Date(),
            modifierFlags = (aDOMEvent.shiftKey ? CPShiftKeyMask : 0) |
                            (aDOMEvent.ctrlKey ? CPControlKeyMask : 0) |
                            (aDOMEvent.altKey ? CPAlternateKeyMask : 0) |
                            (aDOMEvent.metaKey ? CPCommandKeyMask : 0);
        StopDOMEventPropagation = YES;
        windowNumber = objj_msgSend(objj_msgSend(self, "hitTest:", location), "windowNumber");
        if (!windowNumber)
            return;
        var windowFrame = CPApp._windows[windowNumber]._frame;
        location.x -= CGRectGetMinX(windowFrame);
        location.y -= CGRectGetMinY(windowFrame);
        if(typeof aDOMEvent.wheelDeltaX != "undefined")
        {
            deltaX = aDOMEvent.wheelDeltaX / 120.0;
            deltaY = aDOMEvent.wheelDeltaY / 120.0;
        }
        else if (aDOMEvent.wheelDelta)
            deltaY = aDOMEvent.wheelDelta / 120.0;
        else if (aDOMEvent.detail)
            deltaY = -aDOMEvent.detail / 3.0;
        else
            return;
        if(!CPFeatureIsCompatible(CPJavaScriptNegativeMouseWheelValues))
        {
            deltaX = -deltaX;
            deltaY = -deltaY;
        }
        var event = objj_msgSend(CPEvent, "mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:", CPScrollWheel, location, modifierFlags, timestamp, windowNumber, nil, -1, 1, 0 );
        event._DOMEvent = aDOMEvent;
        event._deltaX = ROUND(deltaX * 1.5);
        event._deltaY = ROUND(deltaY * 1.5);
        objj_msgSend(CPApp, "sendEvent:", event);
        if (StopDOMEventPropagation)
            CPDOMEventStop(aDOMEvent);
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
    }
    catch (anException)
    {
        objj_exception_report(anException, {path:"CPDOMWindowBridge.j"});
    }
}
}), new objj_method(sel_getUid("_bridgeResizeEvent:"), function(self, _cmd, aDOMEvent)
{ with(self)
{
    try
    {
        var oldSize = _frame.size;
        _frame = CPDOMWindowGetFrame(_DOMWindow);
        _contentBounds.size = CGSizeCreateCopy(_frame.size);
        var levels = _windowLevels,
            layers = _windowLayers,
            levelCount = levels.length;
        while (levelCount--)
        {
            var windows = objj_msgSend(layers, "objectForKey:", levels[levelCount])._windows,
                windowCount = windows.length;
            while (windowCount--)
                objj_msgSend(windows[windowCount], "resizeWithOldBridgeSize:", oldSize);
        }
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
    }
    catch (anException)
    {
        objj_exception_report(anException, {path:"CPDOMWindowBridge.j"});
    }
}
}), new objj_method(sel_getUid("_bridgeTouchEvent:"), function(self, _cmd, aDOMEvent)
{ with(self)
{
    try
    {
        if (aDOMEvent.touches && (aDOMEvent.touches.length == 1 || (aDOMEvent.touches.length == 0 && aDOMEvent.changedTouches.length == 1)))
        {
            var newEvent = {};
            switch(aDOMEvent.type)
            {
                case CPDOMEventTouchStart: newEvent.type = CPDOMEventMouseDown;
                                            break;
                case CPDOMEventTouchEnd: newEvent.type = CPDOMEventMouseUp;
                                            break;
                case CPDOMEventTouchMove: newEvent.type = CPDOMEventMouseMoved;
                                            break;
                case CPDOMEventTouchCancel: newEvent.type = CPDOMEventMouseUp;
                                            break;
            }
            var touch = aDOMEvent.touches.length ? aDOMEvent.touches[0] : aDOMEvent.changedTouches[0];
            newEvent.clientX = touch.clientX;
            newEvent.clientY = touch.clientY;
            newEvent.timestamp = aDOMEvent.timestamp;
            newEvent.target = aDOMEvent.target;
            newEvent.shiftKey = newEvent.ctrlKey = newEvent.altKey = newEvent.metaKey = false;
                newEvent.preventDefault = function(){if(aDOMEvent.preventDefault) aDOMEvent.preventDefault()};
                newEvent.stopPropagation = function(){if(aDOMEvent.stopPropagation) aDOMEvent.stopPropagation()};
            objj_msgSend(self, "_bridgeMouseEvent:", newEvent);
            return;
        }
        else
        {
            if (aDOMEvent.preventDefault)
                aDOMEvent.preventDefault();
            if (aDOMEvent.stopPropagation)
                aDOMEvent.stopPropagation();
        }
    }
    catch(e)
    {
        objj_exception_report(e, {path:"CPDOMWindowBridge.j"});
    }
}
}), new objj_method(sel_getUid("_checkPasteboardElement"), function(self, _cmd)
{ with(self)
{
    try
    {
        var value = _DOMPasteboardElement.value;
        if (objj_msgSend(value, "length"))
        {
            var pasteboard = objj_msgSend(CPPasteboard, "generalPasteboard");
            if (objj_msgSend(pasteboard, "_stateUID") != value)
            {
                objj_msgSend(pasteboard, "declareTypes:owner:", [CPStringPboardType], self);
                objj_msgSend(pasteboard, "setString:forType:", value, CPStringPboardType);
            }
        }
        objj_msgSend(self, "_clearPasteboardElement");
        objj_msgSend(CPApp, "sendEvent:", _pasteboardKeyDownEvent);
        _pasteboardKeyDownEvent = nil;
        objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
    }
    catch (anException)
    {
        objj_exception_report(anException, {path:"CPDOMWindowBridge.j"});
    }
}
}), new objj_method(sel_getUid("_clearPasteboardElement"), function(self, _cmd)
{ with(self)
{
    _DOMPasteboardElement.value = "";
    _DOMPasteboardElement.blur();
}
})]);
}
var CLICK_SPACE_DELTA = 5.0,
    CLICK_TIME_DELTA = (typeof document != "undefined" && document.addEventListener) ? 350.0 : 1000.0;
var CPDOMEventGetClickCount = function(aComparisonEvent, aTimestamp, aLocation)
{
    if (!aComparisonEvent)
        return 1;
    var comparisonLocation = objj_msgSend(aComparisonEvent, "locationInWindow");
    return (aTimestamp - objj_msgSend(aComparisonEvent, "timestamp") < CLICK_TIME_DELTA &&
        ABS(comparisonLocation.x - aLocation.x) < CLICK_SPACE_DELTA &&
        ABS(comparisonLocation.y - aLocation.y) < CLICK_SPACE_DELTA) ? objj_msgSend(aComparisonEvent, "clickCount") + 1 : 1;
}
var CPDOMEventStop = function(aDOMEvent)
{
    aDOMEvent.cancelBubble = true;
    aDOMEvent.returnValue = false;
    if (aDOMEvent.preventDefault)
        aDOMEvent.preventDefault();
    if (aDOMEvent.stopPropagation)
        aDOMEvent.stopPropagation();
    if (aDOMEvent.type == CPDOMEventMouseDown)
    {
        CPSharedDOMWindowBridge._DOMFocusElement.focus();
        CPSharedDOMWindowBridge._DOMFocusElement.blur();
    }
}

