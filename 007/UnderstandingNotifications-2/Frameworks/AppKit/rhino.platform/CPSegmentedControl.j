I;20;Foundation/CPArray.ji;11;CPControl.jc;20294;
CPSegmentSwitchTrackingSelectOne = 0;
CPSegmentSwitchTrackingSelectAny = 1;
CPSegmentSwitchTrackingMomentary = 2;
{var the_class = objj_allocateClassPair(CPControl, "CPSegmentedControl"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_segments"), new objj_ivar("_selectedSegment"), new objj_ivar("_segmentStyle"), new objj_ivar("_trackingMode"), new objj_ivar("_trackingSegment"), new objj_ivar("_trackingHighlighted")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aRect)
{ with(self)
{
    _segments = [];
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aRect);
    if (self)
    {
        _selectedSegment = -1;
        _trackingMode = CPSegmentSwitchTrackingSelectOne;
    }
    return self;
}
}), new objj_method(sel_getUid("selectedTag"), function(self, _cmd)
{ with(self)
{
    return _segments[_selectedSegment].tag;
}
}), new objj_method(sel_getUid("setSegmentCount:"), function(self, _cmd, aCount)
{ with(self)
{
    if (_segments.length == aCount)
        return;
    var height = CGRectGetHeight(objj_msgSend(self, "bounds"));
    if (_segments.length < aCount)
    {
        var index = _segments.length;
        for (; index < aCount; ++index)
        {
            _segments[index] = objj_msgSend(objj_msgSend(_CPSegmentItem, "alloc"), "init");
            _segments[index].frame.size.height = height;
        }
    }
    else if (aCount < _segments.length)
    {
        var index = aCount;
        for (; index < _segments.length; ++index)
        {
            objj_msgSend(_segments[index].imageView, "removeFromSuperview");
            objj_msgSend(_segments[index].labelView, "removeFromSuperview");
            _segments[index] = nil;
        }
    }
    if (_selectedSegment < _segments.length)
        _selectedSegment = -1;
    objj_msgSend(self, "tileWithChangedSegment:", 0);
}
}), new objj_method(sel_getUid("segmentCount"), function(self, _cmd)
{ with(self)
{
    return _segments.length;
}
}), new objj_method(sel_getUid("setSelectedSegment:"), function(self, _cmd, aSegment)
{ with(self)
{
    objj_msgSend(self, "setSelected:forSegment:", YES, aSegment);
}
}), new objj_method(sel_getUid("selectedSegment"), function(self, _cmd)
{ with(self)
{
    return _selectedSegment;
}
}), new objj_method(sel_getUid("selectSegmentWithTag:"), function(self, _cmd, aTag)
{ with(self)
{
    var index = 0;
    for (; index < _segments.length; ++index)
        if (_segments[index].tag == aTag)
        {
            objj_msgSend(self, "setSelectedSegment:", index);
            return YES;
        }
    return NO;
}
}), new objj_method(sel_getUid("isTracking"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("setTrackingMode:"), function(self, _cmd, aTrackingMode)
{ with(self)
{
    if (_trackingMode == aTrackingMode)
        return;
    _trackingMode = aTrackingMode;
    if (_trackingMode == CPSegmentSwitchTrackingSelectOne)
    {
        var index = 0,
            selected = NO;
        for (; index < _segments.length; ++index)
            if (_segments[index].selected)
                if (selected)
                    objj_msgSend(self, "setSelected:forSegment:", NO, index);
                else
                    selected = YES;
    }
    else if (_trackingMode == CPSegmentSwitchTrackingMomentary)
    {
        var index = 0;
        for (; index < _segments.length; ++index)
            if (_segments[index].selected)
                objj_msgSend(self, "setSelected:forSegment:", NO, index);
    }
}
}), new objj_method(sel_getUid("trackingMode"), function(self, _cmd)
{ with(self)
{
    return _trackingMode;
}
}), new objj_method(sel_getUid("setWidth:forSegment:"), function(self, _cmd, aWidth, aSegment)
{ with(self)
{
    _segments[aSegment].width = aWidth;
    objj_msgSend(self, "tileWithChangedSegment:", aSegment);
}
}), new objj_method(sel_getUid("widthForSegment:"), function(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].width;
}
}), new objj_method(sel_getUid("setImage:forSegment:"), function(self, _cmd, anImage, aSegment)
{ with(self)
{
    var segment = _segments[aSegment];
    if (!anImage)
    {
        objj_msgSend(segment.imageView, "removeFromSuperview");
        segment.imageView = nil;
    }
    else
    {
        if (!segment.imageView)
        {
            segment.imageView = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMakeZero());
            objj_msgSend(self, "addSubview:", segment.imageView);
        }
        objj_msgSend(segment.imageView, "setImage:", anImage);
        objj_msgSend(segment.imageView, "setFrameSize:", CGSizeMakeCopy(objj_msgSend(anImage, "size")));
    }
    segment.image = anImage;
    if (segment.width)
        objj_msgSend(self, "drawSegment:highlight:", aSegment, NO);
    else
        objj_msgSend(self, "tileWithChangedSegment:", aSegment);
}
}), new objj_method(sel_getUid("imageForSegment:"), function(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].image;
}
}), new objj_method(sel_getUid("setLabel:forSegment:"), function(self, _cmd, aLabel, aSegment)
{ with(self)
{
    var segment = _segments[aSegment];
    if (!aLabel || !aLabel.length)
    {
        objj_msgSend(segment.labelView, "removeFromSuperview");
        segment.labelView = nil;
    }
    else
    {
        if (!segment.labelView)
        {
            segment.labelView = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
            objj_msgSend(segment.labelView, "setFont:", objj_msgSend(self, "font"));
            objj_msgSend(self, "addSubview:", segment.labelView);
        }
        objj_msgSend(segment.labelView, "setStringValue:", aLabel);
        objj_msgSend(segment.labelView, "sizeToFit");
    }
    _segments[aSegment].label = aLabel;
    if (segment.width)
        objj_msgSend(self, "drawSegment:highlight:", aSegment, NO);
    else
        objj_msgSend(self, "tileWithChangedSegment:", aSegment);
}
}), new objj_method(sel_getUid("labelForSegment:"), function(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].label;
}
}), new objj_method(sel_getUid("setMenu:forSegment:"), function(self, _cmd, aMenu, aSegment)
{ with(self)
{
    _segments[aSegment].menu = aMenu;
}
}), new objj_method(sel_getUid("menuForSegment:"), function(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].menu;
}
}), new objj_method(sel_getUid("setSelected:forSegment:"), function(self, _cmd, isSelected, aSegment)
{ with(self)
{
    var segment = _segments[aSegment];
    if (segment.selected == isSelected)
        return;
    segment.selected = isSelected;
    if (isSelected)
    {
        var oldSelectedSegment = _selectedSegment;
        _selectedSegment = aSegment;
        if (_trackingMode == CPSegmentSwitchTrackingSelectOne && oldSelectedSegment != aSegment && oldSelectedSegment != -1)
        {
            _segments[oldSelectedSegment].selected = NO;
            objj_msgSend(self, "drawSegmentBezel:highlight:", oldSelectedSegment, NO);
        }
    }
    if (_trackingMode != CPSegmentSwitchTrackingMomentary)
        objj_msgSend(self, "drawSegmentBezel:highlight:", aSegment, NO);
}
}), new objj_method(sel_getUid("isSelectedForSegment:"), function(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].selected;
}
}), new objj_method(sel_getUid("setEnabled:forSegment:"), function(self, _cmd, isEnabled, aSegment)
{ with(self)
{
    _segments[aSegment].enabled = isEnabled;
}
}), new objj_method(sel_getUid("isEnabledForSegment:"), function(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].enabled;
}
}), new objj_method(sel_getUid("setTag:forSegment:"), function(self, _cmd, aTag, aSegment)
{ with(self)
{
    _segments[aSegment].tag = aTag;
}
}), new objj_method(sel_getUid("tagForSegment:"), function(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].tag;
}
}), new objj_method(sel_getUid("drawSegmentBezel:highlight:"), function(self, _cmd, aSegment, shouldHighlight)
{ with(self)
{
}
}), new objj_method(sel_getUid("drawSegment:highlight:"), function(self, _cmd, aSegment, shouldHighlight)
{ with(self)
{
    var segment = _segments[aSegment],
        imageView = segment.imageView,
        labelView = segment.labelView,
        frame = segment.frame,
        segmentX = CGRectGetMinX(frame),
        segmentWidth = CGRectGetWidth(frame),
        segmentHeight = CGRectGetHeight(frame) - 1.0;
    if (imageView && labelView)
    {
        var imageViewSize = objj_msgSend(imageView, "frame").size,
            labelViewSize = objj_msgSend(labelView, "frame").size,
            totalHeight = imageViewSize.height + labelViewSize.height,
            labelWidth = MIN(labelViewSize.width, width),
            y = (segmentHeight - totalHeight) / 2.0;
        objj_msgSend(imageView, "setFrameOrigin:", CGPointMake(segmentX + (segmentWidth - imageViewSize.width) / 2.0, y));
        if (labelWidth < labelViewSize.width)
            objj_msgSend(labelView, "setFrameSize:", CGSizeMake(labelWidth, labelViewSize.height));
        objj_msgSend(labelView, "setFrameOrigin:", CGPointMake(segmentX + (segmentWidth - labelWidth) / 2.0, y + imageViewSize.height));
    }
    else if (imageView)
    {
        var imageViewSize = objj_msgSend(imageView, "frame").size;
        objj_msgSend(imageView, "setFrameOrigin:", CGPointMake(segmentX + (segmentWidth - imageViewSize.width) / 2.0, (segmentHeight - imageViewSize.height) / 2.0));
    }
    else if (labelView)
    {
        var labelViewSize = objj_msgSend(labelView, "frame").size,
            labelWidth = MIN(labelViewSize.width, segmentWidth);
        if (labelWidth < labelViewSize.width)
            objj_msgSend(labelView, "setFrameSize:", CGSizeMake(labelWidth, labelViewSize.height));
        objj_msgSend(labelView, "setFrameOrigin:", CGPointMake(segmentX + (segmentWidth - labelWidth) / 2.0, (segmentHeight - labelViewSize.height) / 2.0));
    }
}
}), new objj_method(sel_getUid("tileWithChangedSegment:"), function(self, _cmd, aSegment)
{ with(self)
{
    var segment = _segments[aSegment],
        segmentWidth = segment.width;
    if (!segmentWidth)
    {
        if (segment.labelView && segment.imageView)
            segmentWidth = MAX(CGRectGetWidth(objj_msgSend(segment.labelView, "frame")) , CGRectGetWidth(objj_msgSend(segment.imageView, "frame")));
        else if (segment.labelView)
            segmentWidth = CGRectGetWidth(objj_msgSend(segment.labelView, "frame"));
        else if (segment.imageView)
            segmentWidth = CGRectGetWidth(objj_msgSend(segment.imageView, "frame"));
    }
    var delta = segmentWidth - CGRectGetWidth(segment.frame);
    if (!delta)
        return;
    var frame = objj_msgSend(self, "frame");
    objj_msgSend(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(frame) + delta, CGRectGetHeight(frame)));
    segment.frame.size.width = segmentWidth;
    var index = aSegment + 1;
    for (; index < _segments.length; ++index)
    {
        _segments[index].frame.origin.x += delta;
        objj_msgSend(self, "drawSegmentBezel:highlight:", index, NO);
        objj_msgSend(self, "drawSegment:highlight:", index, NO);
    }
    objj_msgSend(self, "drawSegmentBezel:highlight:", aSegment, NO);
    objj_msgSend(self, "drawSegment:highlight:", aSegment, NO);
}
}), new objj_method(sel_getUid("frameForSegment:"), function(self, _cmd, aSegment)
{ with(self)
{
    return _segments[aSegment].frame;
}
}), new objj_method(sel_getUid("testSegment:"), function(self, _cmd, aPoint)
{ with(self)
{
    var location = objj_msgSend(self, "convertPoint:fromView:", aPoint, nil),
        count = _segments.length;
    while (count--)
        if (CGRectContainsPoint(_segments[count].frame, aPoint))
            return count;
    return -1;
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    if (!objj_msgSend(self, "isEnabled"))
        return;
    objj_msgSend(self, "trackSegment:", anEvent);
}
}), new objj_method(sel_getUid("mouseUp:"), function(self, _cmd, anEvent)
{ with(self)
{
}
}), new objj_method(sel_getUid("trackSegment:"), function(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type"),
        location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    if (type == CPLeftMouseUp)
    {
        if (CGRectContainsPoint(_segments[_trackingSegment].frame, location))
        {
            if (_trackingMode == CPSegmentSwitchTrackingSelectAny)
            {
                objj_msgSend(self, "setSelected:forSegment:", !objj_msgSend(self, "isSelectedForSegment:", _trackingSegment), _trackingSegment);
                _selectedSegment = _trackingSegment;
            }
            else
                objj_msgSend(self, "setSelected:forSegment:", YES, _trackingSegment);
            objj_msgSend(self, "sendAction:to:", objj_msgSend(self, "action"), objj_msgSend(self, "target"));
            if (_trackingMode == CPSegmentSwitchTrackingMomentary)
            {
                objj_msgSend(self, "setSelected:forSegment:", NO, _trackingSegment);
                _selectedSegment = -1;
            }
        }
        objj_msgSend(self, "drawSegmentBezel:highlight:", _trackingSegment, NO);
        _trackingSegment = -1;
        return;
    }
    if (type == CPLeftMouseDown)
    {
        _trackingHighlighted = YES;
        _trackingSegment = objj_msgSend(self, "testSegment:", location);
        CPLog.error("_trackingSegment="+_trackingSegment);
        objj_msgSend(self, "drawSegmentBezel:highlight:", _trackingSegment, YES);
    }
    else if (type == CPLeftMouseDragged)
    {
        var highlighted = CGRectContainsPoint(_segments[_trackingSegment].frame, location);
        if (highlighted != _trackingHighlighted)
        {
            _trackingHighlighted = highlighted;
            objj_msgSend(self, "drawSegmentBezel:highlight:", _trackingSegment, _trackingHighlighted);
        }
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackSegment:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
}), new objj_method(sel_getUid("setFont:"), function(self, _cmd, aFont)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setFont:", aFont);
    var count = _segments.length;
    if (!count)
        return;
    while (count--)
        objj_msgSend(_segments[count].labelView, "setFont:", aFont);
    objj_msgSend(self, "tileWithChangedSegment:", 0);
}
})]);
}
var CPSegmentedControlSegmentsKey = "CPSegmentedControlSegmentsKey",
    CPSegmentedControlSelectedKey = "CPSegmentedControlSelectedKey",
    CPSegmentedControlSegmentStyleKey = "CPSegmentedControlSegmentStyleKey",
    CPSegmentedControlTrackingModeKey = "CPSegmentedControlTrackingModeKey";
{
var the_class = objj_getClass("CPSegmentedControl")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPSegmentedControl\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder);
    if (self)
    {
        _segments = objj_msgSend(aCoder, "decodeObjectForKey:", CPSegmentedControlSegmentsKey);
        _segmentStyle = objj_msgSend(aCoder, "decodeIntForKey:", CPSegmentedControlSegmentStyleKey);
        if (objj_msgSend(aCoder, "containsValueForKey:", CPSegmentedControlSelectedKey))
            _selectedSegment = objj_msgSend(aCoder, "decodeIntForKey:", CPSegmentedControlSelectedKey);
        else
            _selectedSegment = -1;
        if (objj_msgSend(aCoder, "containsValueForKey:", CPSegmentedControlTrackingModeKey))
            _trackingMode = objj_msgSend(aCoder, "decodeIntForKey:", CPSegmentedControlTrackingModeKey);
        else
            _trackingMode = CPSegmentSwitchTrackingSelectOne;
        for (var i = 0; i < _segments.length; i++)
        {
            if (_segments[i].image != undefined)
                objj_msgSend(self, "setImage:forSegment:", _segments[i].image, i);
            if (_segments[i].label != undefined)
                objj_msgSend(self, "setLabel:forSegment:", _segments[i].label, i);
        }
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    var actualSubviews = _subviews;
    _subviews = [];
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    _subviews = actualSubviews;
    objj_msgSend(aCoder, "encodeObject:forKey:", _segments, CPSegmentedControlSegmentsKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _selectedSegment, CPSegmentedControlSelectedKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _segmentStyle, CPSegmentedControlSegmentStyleKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _trackingMode, CPSegmentedControlTrackingModeKey);
}
})]);
}
{var the_class = objj_allocateClassPair(CPObject, "_CPSegmentItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("image"), new objj_ivar("label"), new objj_ivar("menu"), new objj_ivar("selected"), new objj_ivar("enabled"), new objj_ivar("tag"), new objj_ivar("width"), new objj_ivar("labelView"), new objj_ivar("imageView"), new objj_ivar("frame")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init"))
    {
        image = nil;
        label = "";
        menu = nil;
        selected = NO;
        enabled = NO;
        tag = 0;
        labelView = nil;
        imageView = nil;
        width = 0;
        frame = CGRectMakeZero();
    }
    return self;
}
})]);
}
var CPSegmentItemImageKey = "CPSegmentItemImageKey",
    CPSegmentItemLabelKey = "CPSegmentItemLabelKey",
    CPSegmentItemMenuKey = "CPSegmentItemMenuKey",
    CPSegmentItemSelectedKey = "CPSegmentItemSelectedKey",
    CPSegmentItemEnabledKey = "CPSegmentItemEnabledKey",
    CPSegmentItemTagKey = "CPSegmentItemTagKey";
{
var the_class = objj_getClass("_CPSegmentItem")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"_CPSegmentItem\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        image = objj_msgSend(aCoder, "decodeObjectForKey:", CPSegmentItemImageKey);
        label = objj_msgSend(aCoder, "decodeObjectForKey:", CPSegmentItemLabelKey);
        menu = objj_msgSend(aCoder, "decodeObjectForKey:", CPSegmentItemMenuKey);
        selected = objj_msgSend(aCoder, "decodeBoolForKey:", CPSegmentItemSelectedKey);
        enabled = objj_msgSend(aCoder, "decodeBoolForKey:", CPSegmentItemEnabledKey);
        tag = objj_msgSend(aCoder, "decodeIntForKey:", CPSegmentItemTagKey);
        labelView = nil;
        imageView = nil;
        width = 0;
        frame = CGRectMakeZero();
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", image, CPSegmentItemImageKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", label, CPSegmentItemLabelKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", menu, CPSegmentItemMenuKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", selected, CPSegmentItemSelectedKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", enabled, CPSegmentItemEnabledKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", tag, CPSegmentItemTagKey);
}
})]);
}

