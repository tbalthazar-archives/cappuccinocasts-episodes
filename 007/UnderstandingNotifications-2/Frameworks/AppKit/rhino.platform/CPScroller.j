i;11;CPControl.jc;20770;
CPScrollerNoPart = 0;
CPScrollerDecrementPage = 1;
CPScrollerKnob = 2;
CPScrollerIncrementPage = 3;
CPScrollerDecrementLine = 4;
CPScrollerIncrementLine = 5;
CPScrollerKnobSlot = 6;
CPScrollerIncrementArrow = 0;
CPScrollerDecrementArrow = 1;
CPNoScrollerParts = 0;
CPOnlyScrollerArrows = 1;
CPAllScrollerParts = 2;
var PARTS_ARRANGEMENT = [CPScrollerKnobSlot, CPScrollerDecrementLine, CPScrollerIncrementLine, CPScrollerKnob],
    NAMES_FOR_PARTS = {},
    PARTS_FOR_NAMES = {};
NAMES_FOR_PARTS[CPScrollerDecrementLine] = "decrement-line";
NAMES_FOR_PARTS[CPScrollerIncrementLine] = "increment-line";
NAMES_FOR_PARTS[CPScrollerKnobSlot] = "knob-slot";
NAMES_FOR_PARTS[CPScrollerKnob] = "knob";
{var the_class = objj_allocateClassPair(CPControl, "CPScroller"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_controlSize"), new objj_ivar("_usableParts"), new objj_ivar("_partRects"), new objj_ivar("_isVertical"), new objj_ivar("_knobProportion"), new objj_ivar("_hitPart"), new objj_ivar("_trackingPart"), new objj_ivar("_trackingFloatValue"), new objj_ivar("_trackingStartPoint")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("isVertical"), function(self, _cmd)
{ with(self)
{
return _isVertical;
}
}), new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    if (self)
    {
        _controlSize = CPRegularControlSize;
        _partRects = [];
        objj_msgSend(self, "setFloatValue:knobProportion:", 0.0, 1.0);
        _hitPart = CPScrollerNoPart;
        objj_msgSend(self, "_recalculateIsVertical");
    }
    return self;
}
}), new objj_method(sel_getUid("setControlSize:"), function(self, _cmd, aControlSize)
{ with(self)
{
    if (_controlSize == aControlSize)
        return;
    _controlSize = aControlSize;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("controlSize"), function(self, _cmd)
{ with(self)
{
    return _controlSize;
}
}), new objj_method(sel_getUid("setFloatValue:"), function(self, _cmd, aValue)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setFloatValue:", MIN(1.0, MAX(0.0, aValue)));
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("setFloatValue:knobProportion:"), function(self, _cmd, aValue, aProportion)
{ with(self)
{
    _knobProportion = MIN(1.0, MAX(0.0001, aProportion));
    objj_msgSend(self, "setFloatValue:", aValue);
}
}), new objj_method(sel_getUid("knobProportion"), function(self, _cmd)
{ with(self)
{
    return _knobProportion;
}
}), new objj_method(sel_getUid("currentValueForThemedAttributeName:"), function(self, _cmd, anAttributeName)
{ with(self)
{
    var controlState = _controlState;
    if (NAMES_FOR_PARTS[_hitPart] + "-color" !== anAttributeName)
        controlState &= ~CPControlStateHighlighted;
    return objj_msgSend(self, "valueForThemedAttributeName:inControlState:", anAttributeName, controlState);
}
}), new objj_method(sel_getUid("rectForPart:"), function(self, _cmd, aPart)
{ with(self)
{
    if (aPart == CPScrollerNoPart)
        return { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
    return _partRects[aPart];
}
}), new objj_method(sel_getUid("testPart:"), function(self, _cmd, aPoint)
{ with(self)
{
    aPoint = objj_msgSend(self, "convertPoint:fromView:", aPoint, nil);
    if (CGRectContainsPoint(objj_msgSend(self, "rectForPart:", CPScrollerKnob), aPoint))
        return CPScrollerKnob;
    if (CGRectContainsPoint(objj_msgSend(self, "rectForPart:", CPScrollerDecrementPage), aPoint))
        return CPScrollerDecrementPage;
    if (CGRectContainsPoint(objj_msgSend(self, "rectForPart:", CPScrollerIncrementPage), aPoint))
        return CPScrollerIncrementPage;
    if (CGRectContainsPoint(objj_msgSend(self, "rectForPart:", CPScrollerDecrementLine), aPoint))
        return CPScrollerDecrementLine;
    if (CGRectContainsPoint(objj_msgSend(self, "rectForPart:", CPScrollerIncrementLine), aPoint))
        return CPScrollerIncrementLine;
    if (CGRectContainsPoint(objj_msgSend(self, "rectForPart:", CPScrollerKnobSlot), aPoint))
        return CPScrollerKnobSlot;
    return CPScrollerNoPart;
}
}), new objj_method(sel_getUid("checkSpaceForParts"), function(self, _cmd)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds");
    if (_knobProportion === 1.0)
    {
        _usableParts = CPNoScrollerParts;
        _partRects[CPScrollerDecrementPage] = { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
        _partRects[CPScrollerKnob] = { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
        _partRects[CPScrollerIncrementPage] = { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
        _partRects[CPScrollerDecrementLine] = { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
        _partRects[CPScrollerIncrementLine] = { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } };
        _partRects[CPScrollerKnobSlot] = { origin: { x:bounds.origin.x, y:bounds.origin.y }, size: { width:bounds.size.width, height:bounds.size.height } };
        return;
    }
    _usableParts = CPAllScrollerParts;
    var trackOverlapInset = objj_msgSend(self, "currentValueForThemedAttributeName:", "track-overlap-inset"),
        width = (bounds.size.width),
        height = (bounds.size.height);
    if (objj_msgSend(self, "isVertical"))
    {
        var decrementLineSize = objj_msgSend(self, "currentValueForThemedAttributeName:", "decrement-line-size"),
            incrementLineSize = objj_msgSend(self, "currentValueForThemedAttributeName:", "increment-line-size"),
            effectiveDecrementLineHeight = decrementLineSize.height - trackOverlapInset.top,
            effectiveIncrementLineHeight = incrementLineSize.height - trackOverlapInset.bottom,
            slotHeight = height - effectiveDecrementLineHeight - effectiveIncrementLineHeight,
            minimumKnobSize = objj_msgSend(self, "currentValueForThemedAttributeName:", "minimum-knob-size"),
            knobHeight = MAX(minimumKnobSize.height, (slotHeight * _knobProportion)),
            knobLocation = effectiveDecrementLineHeight + (slotHeight - knobHeight) * objj_msgSend(self, "floatValue");
        _partRects[CPScrollerDecrementPage] = { origin: { x:0.0, y:effectiveDecrementLineHeight }, size: { width:width, height:knobLocation - effectiveDecrementLineHeight } };
        _partRects[CPScrollerKnob] = { origin: { x:(width - minimumKnobSize.width) / 2.0, y:knobLocation }, size: { width:minimumKnobSize.width, height:knobHeight } };
        _partRects[CPScrollerIncrementPage] = { origin: { x:0.0, y:knobLocation + knobHeight }, size: { width:width, height:height - (knobLocation + knobHeight) - effectiveIncrementLineHeight } };
        _partRects[CPScrollerKnobSlot] = { origin: { x:0.0, y:effectiveDecrementLineHeight }, size: { width:width, height:slotHeight } };
        _partRects[CPScrollerDecrementLine] = { origin: { x:0.0, y:0.0 }, size: { width:decrementLineSize.width, height:decrementLineSize.height } };
        _partRects[CPScrollerIncrementLine] = { origin: { x:0.0, y:height - incrementLineSize.height }, size: { width:incrementLineSize.width, height:incrementLineSize.height } };
    }
    else
    {
        var decrementLineSize = objj_msgSend(self, "currentValueForThemedAttributeName:", "decrement-line-size"),
            incrementLineSize = objj_msgSend(self, "currentValueForThemedAttributeName:", "increment-line-size"),
            effectiveDecrementLineWidth = decrementLineSize.width - trackOverlapInset.left,
            effectiveIncrementLineWidth = incrementLineSize.width - trackOverlapInset.right;
            slotWidth = width - effectiveDecrementLineWidth - effectiveIncrementLineWidth,
            minimumKnobSize = objj_msgSend(self, "currentValueForThemedAttributeName:", "minimum-knob-size"),
            knobWidth = MAX(minimumKnobSize.width, (slotWidth * _knobProportion)),
            knobLocation = effectiveDecrementLineWidth + (slotWidth - knobWidth) * objj_msgSend(self, "floatValue");
        _partRects[CPScrollerDecrementPage] = { origin: { x:effectiveDecrementLineWidth, y:0.0 }, size: { width:knobLocation - effectiveDecrementLineWidth, height:height } };
        _partRects[CPScrollerKnob] = { origin: { x:knobLocation, y:0.0 }, size: { width:knobWidth, height:minimumKnobSize.height } };
        _partRects[CPScrollerIncrementPage] = { origin: { x:knobLocation + knobWidth, y:0.0 }, size: { width:width - (knobLocation + knobWidth) - effectiveIncrementLineWidth, height:height } };
        _partRects[CPScrollerKnobSlot] = { origin: { x:effectiveDecrementLineWidth, y:0.0 }, size: { width:slotWidth, height:height } };
        _partRects[CPScrollerDecrementLine] = { origin: { x:0.0, y:0.0 }, size: { width:decrementLineSize.width, height:decrementLineSize.height } };
        _partRects[CPScrollerIncrementLine] = { origin: { x:width - incrementLineSize.width, y:0.0 }, size: { width:incrementLineSize.width, height:incrementLineSize.height } };
    }
}
}), new objj_method(sel_getUid("usableParts"), function(self, _cmd)
{ with(self)
{
    return _usableParts;
}
}), new objj_method(sel_getUid("drawArrow:highlight:"), function(self, _cmd, anArrow, shouldHighlight)
{ with(self)
{
}
}), new objj_method(sel_getUid("drawKnob"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("drawKnobSlot"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("createViewForPart:"), function(self, _cmd, aPart)
{ with(self)
{
    var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
    objj_msgSend(view, "setHitTests:", NO);
    return view;
}
}), new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"), function(self, _cmd, aName)
{ with(self)
{
    return _partRects[aName];
}
}), new objj_method(sel_getUid("createEphemeralSubviewNamed:"), function(self, _cmd, aName)
{ with(self)
{
    var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", { origin: { x:0.0, y:0.0 }, size: { width:0.0, height:0.0 } });
    objj_msgSend(view, "setHitTests:", NO);
    return view;
}
}), new objj_method(sel_getUid("layoutSubviews"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "checkSpaceForParts");
    var index = 0,
        count = PARTS_ARRANGEMENT.length;
    for (; index < count; ++index)
    {
        var part = PARTS_ARRANGEMENT[index];
        if (index === 0)
            view = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", part, CPWindowBelow, PARTS_ARRANGEMENT[index + 1]);
        else
            view = objj_msgSend(self, "layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:", part, CPWindowAbove, PARTS_ARRANGEMENT[index - 1]);
        if (view)
            objj_msgSend(view, "setBackgroundColor:", objj_msgSend(self, "currentValueForThemedAttributeName:", NAMES_FOR_PARTS[part] + "-color"));
    }
}
}), new objj_method(sel_getUid("drawParts"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "drawKnobSlot");
    objj_msgSend(self, "drawKnob");
    objj_msgSend(self, "drawArrow:highlight:", CPScrollerDecrementArrow, NO);
    objj_msgSend(self, "drawArrow:highlight:", CPScrollerIncrementArrow, NO);
}
}), new objj_method(sel_getUid("hitPart"), function(self, _cmd)
{ with(self)
{
    return _hitPart;
}
}), new objj_method(sel_getUid("trackKnob:"), function(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type");
    if (type === CPLeftMouseUp)
    {
        _hitPart = CPScrollerNoPart;
        return;
    }
    if (type === CPLeftMouseDown)
    {
        _trackingFloatValue = objj_msgSend(self, "floatValue");
        _trackingStartPoint = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    }
    else if (type === CPLeftMouseDragged)
    {
        var knobRect = objj_msgSend(self, "rectForPart:", CPScrollerKnob),
            knobSlotRect = objj_msgSend(self, "rectForPart:", CPScrollerKnobSlot),
            remainder = !objj_msgSend(self, "isVertical") ? ((knobSlotRect.size.width) - (knobRect.size.width)) : ((knobSlotRect.size.height) - (knobRect.size.height));
        if (remainder <= 0)
            objj_msgSend(self, "setFloatValue:", 0.0);
        else
        {
            var location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
                delta = !objj_msgSend(self, "isVertical") ? location.x - _trackingStartPoint.x : location.y - _trackingStartPoint.y;
            objj_msgSend(self, "setFloatValue:", _trackingFloatValue + delta / remainder);
        }
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackKnob:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
    objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
}
}), new objj_method(sel_getUid("trackScrollButtons:"), function(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type");
    if (type === CPLeftMouseUp)
    {
        objj_msgSend(self, "highlight:", NO);
        objj_msgSend(CPEvent, "stopPeriodicEvents");
        _hitPart = CPScrollerNoPart;
        return;
    }
    if (type === CPLeftMouseDown)
    {
        _trackingPart = objj_msgSend(self, "hitPart");
        _trackingStartPoint = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
        if (objj_msgSend(anEvent, "modifierFlags") & CPAlternateKeyMask)
        {
            if (_trackingPart == CPScrollerDecrementLine)
                _hitPart = CPScrollerDecrementPage;
            else if (_trackingPart == CPScrollerIncrementLine)
                _hitPart = CPScrollerIncrementPage;
            else if (_trackingPart == CPScrollerDecrementPage || _trackingPart == CPScrollerIncrementPage)
            {
                var knobRect = objj_msgSend(self, "rectForPart:", CPScrollerKnob),
                    knobWidth = !objj_msgSend(self, "isVertical") ? (knobRect.size.width) : (knobRect.size.height),
                    knobSlotRect = objj_msgSend(self, "rectForPart:", CPScrollerKnobSlot),
                    remainder = (!objj_msgSend(self, "isVertical") ? (knobSlotRect.size.width) : (knobSlotRect.size.height)) - knobWidth;
                objj_msgSend(self, "setFloatValue:", ((!objj_msgSend(self, "isVertical") ? _trackingStartPoint.x - (knobSlotRect.origin.x) : _trackingStartPoint.y - (knobSlotRect.origin.y)) - knobWidth / 2.0) / remainder);
                _hitPart = CPScrollerKnob;
                objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
                return objj_msgSend(self, "trackKnob:", anEvent);
            }
        }
        objj_msgSend(self, "highlight:", YES);
        objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
        objj_msgSend(CPEvent, "startPeriodicEventsAfterDelay:withPeriod:", 0.5, 0.04);
    }
    else if (type === CPLeftMouseDragged)
    {
        _trackingStartPoint = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
        if (_trackingPart == CPScrollerDecrementPage || _trackingPart == CPScrollerIncrementPage)
        {
            var hitPart = objj_msgSend(self, "testPart:", objj_msgSend(anEvent, "locationInWindow"));
            if (hitPart == CPScrollerDecrementPage || hitPart == CPScrollerIncrementPage)
            {
                _trackingPart = hitPart;
                _hitPart = hitPart;
            }
        }
        objj_msgSend(self, "highlight:", CGRectContainsPoint(objj_msgSend(self, "rectForPart:", _trackingPart), _trackingStartPoint));
    }
    else if (type == CPPeriodic && CGRectContainsPoint(objj_msgSend(self, "rectForPart:", _trackingPart), _trackingStartPoint))
        objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackScrollButtons:"), CPPeriodicMask | CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
}), new objj_method(sel_getUid("_recalculateIsVertical"), function(self, _cmd)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds"),
        width = (bounds.size.width),
        height = (bounds.size.height);
    _isVertical = width < height ? 1 : (width > height ? 0 : -1);
    if (_isVertical === 1)
        _controlState |= CPControlStateVertical;
    else if (_isVertical === 0)
        _controlState &= ~CPControlStateVertical;
}
}), new objj_method(sel_getUid("setFrameSize:"), function(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setFrameSize:", aSize);
    objj_msgSend(self, "_recalculateIsVertical");
    objj_msgSend(self, "checkSpaceForParts");
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    if (!objj_msgSend(self, "isEnabled"))
        return;
    _hitPart = objj_msgSend(self, "testPart:", objj_msgSend(anEvent, "locationInWindow"));
    switch (_hitPart)
    {
        case CPScrollerKnob: return objj_msgSend(self, "trackKnob:", anEvent);
        case CPScrollerDecrementLine:
        case CPScrollerIncrementLine:
        case CPScrollerDecrementPage:
        case CPScrollerIncrementPage: return objj_msgSend(self, "trackScrollButtons:", anEvent);
    }
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themedAttributes"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [ { top:(0), left:(0), bottom:(0), right:(0) },
                                                    nil, nil, nil, nil,
                                                    { width:0.0, height:0.0 }, { width:0.0, height:0.0 }, { width:0.0, height:0.0 }], [ "track-overlap-inset",
                                                    "knob-slot-color",
                                                    "decrement-line-color",
                                                    "increment-line-color",
                                                    "knob-color",
                                                    "decrement-line-size",
                                                    "increment-line-size",
                                                    "minimum-knob-size"]);
}
}), new objj_method(sel_getUid("scrollerWidth"), function(self, _cmd)
{ with(self)
{
    return 17.0;
}
}), new objj_method(sel_getUid("scrollerWidthForControlSize:"), function(self, _cmd, aControlSize)
{ with(self)
{
    return 17.0;
}
})]);
}
var CPScrollerControlSizeKey = "CPScrollerControlSize",
    CPScrollerKnobProportionKey = "CPScrollerKnobProportion";
{
var the_class = objj_getClass("CPScroller")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPScroller\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder))
    {
        _controlSize = CPRegularControlSize;
        if (objj_msgSend(aCoder, "containsValueForKey:", CPScrollerControlSizeKey))
            _controlSize = objj_msgSend(aCoder, "decodeIntForKey:", CPScrollerControlSizeKey);
        _knobProportion = 1.0;
        if (objj_msgSend(aCoder, "containsValueForKey:", CPScrollerKnobProportionKey))
            _knobProportion = objj_msgSend(aCoder, "decodeFloatForKey:", CPScrollerKnobProportionKey);
        _partRects = [];
        _hitPart = CPScrollerNoPart;
        objj_msgSend(self, "_recalculateIsVertical");
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeInt:forKey:", _controlSize, CPScrollerControlSizeKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _knobProportion, CPScrollerKnobProportionKey);
}
})]);
}

