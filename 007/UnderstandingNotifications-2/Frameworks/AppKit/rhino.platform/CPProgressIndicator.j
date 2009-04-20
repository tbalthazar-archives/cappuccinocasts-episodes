I;19;AppKit/CGGeometry.jI;20;AppKit/CPImageView.jI;15;AppKit/CPView.jc;12084;
CPProgressIndicatorBarStyle = 0;
CPProgressIndicatorSpinningStyle = 1;
CPProgressIndicatorHUDBarStyle = 2;
var CPProgressIndicatorSpinningStyleColors = nil,
    CPProgressIndicatorClassName = nil,
    CPProgressIndicatorStyleIdentifiers = nil,
    CPProgressIndicatorStyleSizes = nil;
{var the_class = objj_allocateClassPair(CPView, "CPProgressIndicator"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_minValue"), new objj_ivar("_maxValue"), new objj_ivar("_doubleValue"), new objj_ivar("_controlSize"), new objj_ivar("_isIndeterminate"), new objj_ivar("_style"), new objj_ivar("_isAnimating"), new objj_ivar("_isDisplayedWhenStoppedSet"), new objj_ivar("_isDisplayedWhenStopped"), new objj_ivar("_barView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _minValue = 0.0;
        _maxValue = 100.0;
        _doubleValue = 0.0;
        _style = CPProgressIndicatorBarStyle;
        _isDisplayedWhenStoppedSet = NO;
        _controlSize = CPRegularControlSize;
        objj_msgSend(self, "updateBackgroundColor");
        objj_msgSend(self, "drawBar");
    }
    return self;
}
}), new objj_method(sel_getUid("setUsesThreadedAnimation:"), function(self, _cmd, aFlag)
{ with(self)
{
}
}), new objj_method(sel_getUid("startAnimation:"), function(self, _cmd, aSender)
{ with(self)
{
    _isAnimating = YES;
    objj_msgSend(self, "_hideOrDisplay");
}
}), new objj_method(sel_getUid("stopAnimation:"), function(self, _cmd, aSender)
{ with(self)
{
    _isAnimating = NO;
    objj_msgSend(self, "_hideOrDisplay");
}
}), new objj_method(sel_getUid("usesThreadedAnimation"), function(self, _cmd)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("incrementBy:"), function(self, _cmd, aValue)
{ with(self)
{
    objj_msgSend(self, "setDoubleValue:", _doubleValue + aValue);
}
}), new objj_method(sel_getUid("setDoubleValue:"), function(self, _cmd, aValue)
{ with(self)
{
    _doubleValue = MIN(MAX(aValue, _minValue), _maxValue);
    objj_msgSend(self, "drawBar");
}
}), new objj_method(sel_getUid("doubleValue"), function(self, _cmd)
{ with(self)
{
    return _doubleValue;
}
}), new objj_method(sel_getUid("setMinValue:"), function(self, _cmd, aValue)
{ with(self)
{
    _minValue = aValue;
}
}), new objj_method(sel_getUid("minValue"), function(self, _cmd)
{ with(self)
{
    return _minValue;
}
}), new objj_method(sel_getUid("setMaxValue:"), function(self, _cmd, aValue)
{ with(self)
{
    _maxValue = aValue;
}
}), new objj_method(sel_getUid("maxValue"), function(self, _cmd)
{ with(self)
{
    return _maxValue;
}
}), new objj_method(sel_getUid("setControlSize:"), function(self, _cmd, aControlSize)
{ with(self)
{
    if (_controlSize == aControlSize)
        return;
    _controlSize = aControlSize;
    objj_msgSend(self, "updateBackgroundColor");
}
}), new objj_method(sel_getUid("controlSize"), function(self, _cmd)
{ with(self)
{
    return _controlSize;
}
}), new objj_method(sel_getUid("setControlTint:"), function(self, _cmd, aControlTint)
{ with(self)
{
}
}), new objj_method(sel_getUid("controlTint"), function(self, _cmd)
{ with(self)
{
    return 0;
}
}), new objj_method(sel_getUid("setBezeled:"), function(self, _cmd, isBezeled)
{ with(self)
{
}
}), new objj_method(sel_getUid("isBezeled"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("setIndeterminate:"), function(self, _cmd, isIndeterminate)
{ with(self)
{
    if (_isIndeterminate == isIndeterminate)
        return;
    _isIndeterminate = isIndeterminate;
    objj_msgSend(self, "updateBackgroundColor");
}
}), new objj_method(sel_getUid("isIndeterminate"), function(self, _cmd)
{ with(self)
{
    return _isIndeterminate;
}
}), new objj_method(sel_getUid("setStyle:"), function(self, _cmd, aStyle)
{ with(self)
{
    if (_style == aStyle)
        return;
    _style = aStyle;
    objj_msgSend(self, "updateBackgroundColor");
}
}), new objj_method(sel_getUid("sizeToFit"), function(self, _cmd)
{ with(self)
{
    if (_style == CPProgressIndicatorSpinningStyle)
        objj_msgSend(self, "setFrameSize:", objj_msgSend(objj_msgSend(CPProgressIndicatorSpinningStyleColors[_controlSize], "patternImage"), "size"));
    else
        objj_msgSend(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(objj_msgSend(self, "frame")), CPProgressIndicatorStyleSizes[
            CPProgressIndicatorClassName + "BezelBorder" + CPProgressIndicatorStyleIdentifiers[CPProgressIndicatorBarStyle] +
            _CPControlIdentifierForControlSize(_controlSize)][0].height));
}
}), new objj_method(sel_getUid("setDisplayedWhenStopped:"), function(self, _cmd, isDisplayedWhenStopped)
{ with(self)
{
    if (_isDisplayedWhenStoppedSet && _isDisplayedWhenStopped == isDisplayedWhenStopped)
        return;
    _isDisplayedWhenStoppedSet = YES;
    _isDisplayedWhenStopped = isDisplayedWhenStopped;
    objj_msgSend(self, "_hideOrDisplay");
}
}), new objj_method(sel_getUid("isDisplayedWhenStopped"), function(self, _cmd)
{ with(self)
{
    if (_isDisplayedWhenStoppedSet)
        return _isDisplayedWhenStopped;
    if (_style == CPProgressIndicatorBarStyle || _style == CPProgressIndicatorHUDBarStyle)
        return YES;
    return NO;
}
}), new objj_method(sel_getUid("_hideOrDisplay"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "setHidden:", !_isAnimating && !objj_msgSend(self, "isDisplayedWhenStopped"));
}
}), new objj_method(sel_getUid("setFrameSize:"), function(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setFrameSize:", aSize);
    objj_msgSend(self, "drawBar");
}
}), new objj_method(sel_getUid("drawBar"), function(self, _cmd)
{ with(self)
{
    if (_style == CPProgressIndicatorSpinningStyle)
        return;
    if (!_barView)
    {
        _barView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(2.0, 2.0, 0.0, 9.0));
        objj_msgSend(_barView, "setBackgroundColor:", objj_msgSend(CPColor, "redColor"));
        objj_msgSend(self, "addSubview:", _barView);
    }
    objj_msgSend(_barView, "setBackgroundColor:", _CPControlColorWithPatternImage(
        CPProgressIndicatorStyleSizes,
        CPProgressIndicatorClassName,
        "Bar",
        CPProgressIndicatorStyleIdentifiers[_style],
        _CPControlIdentifierForControlSize(_controlSize)));
    objj_msgSend(_barView, "setFrameSize:", CGSizeMake(CGRectGetWidth(objj_msgSend(self, "bounds")) * (_doubleValue - _minValue) / (_maxValue - _minValue) - 4.0, 9.0));
}
}), new objj_method(sel_getUid("updateBackgroundColor"), function(self, _cmd)
{ with(self)
{
    if (YES)
    {
        if (_style == CPProgressIndicatorSpinningStyle)
        {
            objj_msgSend(_barView, "removeFromSuperview");
            _barView = nil;
            objj_msgSend(self, "setBackgroundColor:", CPProgressIndicatorSpinningStyleColors[_controlSize]);
        }
        else
        {
            objj_msgSend(self, "setBackgroundColor:", _CPControlThreePartImagePattern(
                NO,
                CPProgressIndicatorStyleSizes,
                CPProgressIndicatorClassName,
                "BezelBorder",
                CPProgressIndicatorStyleIdentifiers[_style],
                _CPControlIdentifierForControlSize(_controlSize)));
            objj_msgSend(self, "drawBar");
        }
    }
    else
        objj_msgSend(self, "setBackgroundColor:", nil);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPProgressIndicator, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    CPProgressIndicatorSpinningStyleColors = [];
    CPProgressIndicatorSpinningStyleColors[CPMiniControlSize] = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", 
        objj_msgSend(bundle, "pathForResource:", "CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"), CGSizeMake(64.0, 64.0)));
    CPProgressIndicatorSpinningStyleColors[CPSmallControlSize] = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", 
        objj_msgSend(bundle, "pathForResource:", "CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"), CGSizeMake(64.0, 64.0)));
    CPProgressIndicatorSpinningStyleColors[CPRegularControlSize] = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", 
        objj_msgSend(bundle, "pathForResource:", "CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"), CGSizeMake(64.0, 64.0)));
    CPProgressIndicatorBezelBorderViewPool = [];
    var start = CPProgressIndicatorBarStyle,
        end = CPProgressIndicatorHUDBarStyle;
    for (; start <= end; ++start)
    {
        CPProgressIndicatorBezelBorderViewPool[start] = [];
        CPProgressIndicatorBezelBorderViewPool[start][CPMiniControlSize] = [];
        CPProgressIndicatorBezelBorderViewPool[start][CPSmallControlSize] = [];
        CPProgressIndicatorBezelBorderViewPool[start][CPRegularControlSize] = [];
    }
    CPProgressIndicatorClassName = objj_msgSend(self, "className");
    CPProgressIndicatorStyleIdentifiers = [];
    CPProgressIndicatorStyleIdentifiers[CPProgressIndicatorBarStyle] = "Bar";
    CPProgressIndicatorStyleIdentifiers[CPProgressIndicatorSpinningStyle] = "Spinny";
    CPProgressIndicatorStyleIdentifiers[CPProgressIndicatorHUDBarStyle] = "HUDBar";
    var regularIdentifier = _CPControlIdentifierForControlSize(CPRegularControlSize),
        smallIdentifier = _CPControlIdentifierForControlSize(CPSmallControlSize),
        miniIdentifier = _CPControlIdentifierForControlSize(CPMiniControlSize);
    CPProgressIndicatorStyleSizes = [];
    var prefix = CPProgressIndicatorClassName + "BezelBorder" + CPProgressIndicatorStyleIdentifiers[CPProgressIndicatorBarStyle];
    CPProgressIndicatorStyleSizes[prefix + regularIdentifier] = [{ width:3.0, height:15.0 }, { width:1.0, height:15.0 }, { width:3.0, height:15.0 }];
    CPProgressIndicatorStyleSizes[prefix + smallIdentifier] = [{ width:3.0, height:15.0 }, { width:1.0, height:15.0 }, { width:3.0, height:15.0 }];
    CPProgressIndicatorStyleSizes[prefix + miniIdentifier] = [{ width:3.0, height:15.0 }, { width:1.0, height:15.0 }, { width:3.0, height:15.0 }];
    prefix = CPProgressIndicatorClassName + "Bar" + CPProgressIndicatorStyleIdentifiers[CPProgressIndicatorBarStyle];
    CPProgressIndicatorStyleSizes[prefix + regularIdentifier] = { width:1.0, height:9.0 };
    CPProgressIndicatorStyleSizes[prefix + smallIdentifier] = { width:1.0, height:9.0 };
    CPProgressIndicatorStyleSizes[prefix + miniIdentifier] = { width:1.0, height:9.0 };
    prefix = CPProgressIndicatorClassName + "BezelBorder" + CPProgressIndicatorStyleIdentifiers[CPProgressIndicatorHUDBarStyle];
    CPProgressIndicatorStyleSizes[prefix + regularIdentifier] = [{ width:3.0, height:15.0 }, { width:1.0, height:15.0 }, { width:3.0, height:15.0 }];
    CPProgressIndicatorStyleSizes[prefix + smallIdentifier] = [{ width:3.0, height:15.0 }, { width:1.0, height:15.0 }, { width:3.0, height:15.0 }];
    CPProgressIndicatorStyleSizes[prefix + miniIdentifier] = [{ width:3.0, height:15.0 }, { width:1.0, height:15.0 }, { width:3.0, height:15.0 }];
    prefix = CPProgressIndicatorClassName + "Bar" + CPProgressIndicatorStyleIdentifiers[CPProgressIndicatorHUDBarStyle];
    CPProgressIndicatorStyleSizes[prefix + regularIdentifier] = { width:1.0, height:9.0 };
    CPProgressIndicatorStyleSizes[prefix + smallIdentifier] = { width:1.0, height:9.0 };
    CPProgressIndicatorStyleSizes[prefix + miniIdentifier] = { width:1.0, height:9.0 };
}
})]);
}

