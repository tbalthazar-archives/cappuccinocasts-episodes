I;21;Foundation/CPObject.ji;23;CAMediaTimingFunction.jc;5335;
CPAnimationEaseInOut = 0;
CPAnimationEaseIn = 1;
CPAnimationEaseOut = 2;
CPAnimationLinear = 3;
ACTUAL_FRAME_RATE = 0;
{var the_class = objj_allocateClassPair(CPObject, "CPAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_lastTime"), new objj_ivar("_duration"), new objj_ivar("_animationCurve"), new objj_ivar("_timingFunction"), new objj_ivar("_frameRate"), new objj_ivar("_progress"), new objj_ivar("_delegate"), new objj_ivar("_timer")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithDuration:animationCurve:"), function(self, _cmd, aDuration, anAnimationCurve)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _progress = 0.0;
        _duration = MAX(0.0, aDuration);
        _animationCurve = anAnimationCurve;
        _frameRate = 60.0;
    }
    return self;
}
}), new objj_method(sel_getUid("setAnimationCurve:"), function(self, _cmd, anAnimationCurve)
{ with(self)
{
    switch (_animationCurve)
    {
        case CPAnimationEaseInOut: timingFunctionName = kCAMediaTimingFunctionEaseInEaseOut;
                                    break;
        case CPAnimationEaseIn: timingFunctionName = kCAMediaTimingFunctionEaseIn;
                                    break;
        case CPAnimationEaseOut: timingFunctionName = kCAMediaTimingFunctionEaseOut;
                                    break;
        case CPAnimationLinear: timingFunctionName = kCAMediaTimingFunctionLinear;
                                    break;
        default: objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Invalid value provided for animation curve");
                                    break;
    }
    _animationCurve = anAnimationCurve;
    _timingFunction = objj_msgSend(CAMediaTimingFunction, "functionWithName:", timingFunctionName);
}
}), new objj_method(sel_getUid("animationCurve"), function(self, _cmd)
{ with(self)
{
    return _animationCurve;
}
}), new objj_method(sel_getUid("setDuration:"), function(self, _cmd, aDuration)
{ with(self)
{
    if (aDuration < 0)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "aDuration can't be negative");
    _duration = aDuration;
}
}), new objj_method(sel_getUid("duration"), function(self, _cmd)
{ with(self)
{
    return _duration;
}
}), new objj_method(sel_getUid("setFrameRate:"), function(self, _cmd, frameRate)
{ with(self)
{
    if (frameRate < 0)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "frameRate can't be negative");
    _frameRate = frameRate;
}
}), new objj_method(sel_getUid("frameRate"), function(self, _cmd)
{ with(self)
{
    return _frameRate;
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
}
}), new objj_method(sel_getUid("startAnimation"), function(self, _cmd)
{ with(self)
{
    if (_timer || _delegate && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("animationShouldStart")) && !objj_msgSend(_delegate, "animationShouldStart:", self))
        return;
    if (_progress === 1.0)
        _progress = 0.0;
    ACTUAL_FRAME_RATE = 0;
    _lastTime = new Date();
    _timer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.0, self, sel_getUid("animationTimerDidFire:"), nil, YES);
}
}), new objj_method(sel_getUid("animationTimerDidFire:"), function(self, _cmd, aTimer)
{ with(self)
{
    var currentTime = new Date(),
        progress = MIN(1.0, objj_msgSend(self, "currentProgress") + (currentTime - _lastTime) / (_duration * 1000.0));
    _lastTime = currentTime;
    ++ACTUAL_FRAME_RATE;
    objj_msgSend(self, "setCurrentProgress:", progress);
    if (progress === 1.0)
    {
        objj_msgSend(_timer, "invalidate");
        _timer = nil;
        if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("animationDidEnd:")))
            objj_msgSend(_delegate, "animationDidEnd:", self);
    }
}
}), new objj_method(sel_getUid("stopAnimation"), function(self, _cmd)
{ with(self)
{
    if (!_timer)
        return;
    objj_msgSend(_timer, "invalidate");
    _timer = nil;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("animationDidStop:")))
        objj_msgSend(_delegate, "animationDidStop:", self);
}
}), new objj_method(sel_getUid("isAnimating"), function(self, _cmd)
{ with(self)
{
    return _timer;
}
}), new objj_method(sel_getUid("setCurrentProgress:"), function(self, _cmd, aProgress)
{ with(self)
{
    _progress = aProgress;
}
}), new objj_method(sel_getUid("currentProgress"), function(self, _cmd)
{ with(self)
{
    return _progress;
}
}), new objj_method(sel_getUid("currentValue"), function(self, _cmd)
{ with(self)
{
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("animation:valueForProgress:")))
        return objj_msgSend(_delegate, "animation:valueForProgress:", self, _progress);
    if (_animationCurve == CPAnimationLinear)
        return _progress;
    alert("IMPLEMENT ANIMATION CURVES!!!");
}
})]);
}

