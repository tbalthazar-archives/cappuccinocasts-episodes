I;21;Foundation/CPObject.ji;23;CAMediaTimingFunction.jc;7403;
CPAnimationEaseInOut = 0;
CPAnimationEaseIn = 1;
CPAnimationEaseOut = 2;
CPAnimationLinear = 3;
ACTUAL_FRAME_RATE = 0;
{var the_class = objj_allocateClassPair(CPObject, "CPAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_lastTime"), new objj_ivar("_duration"), new objj_ivar("_animationCurve"), new objj_ivar("_timingFunction"), new objj_ivar("_frameRate"), new objj_ivar("_progress"), new objj_ivar("_delegate"), new objj_ivar("_timer")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithDuration:animationCurve:"), function $CPAnimation__initWithDuration_animationCurve_(self, _cmd, aDuration, anAnimationCurve)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _progress = 0.0;
        _duration = MAX(0.0, aDuration);
        _frameRate = 60.0;
        objj_msgSend(self, "setAnimationCurve:", anAnimationCurve);
    }
    return self;
}
},["id","float","CPAnimationCurve"]), new objj_method(sel_getUid("setAnimationCurve:"), function $CPAnimation__setAnimationCurve_(self, _cmd, anAnimationCurve)
{ with(self)
{
    switch (anAnimationCurve)
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
},["void","CPAnimationCurve"]), new objj_method(sel_getUid("animationCurve"), function $CPAnimation__animationCurve(self, _cmd)
{ with(self)
{
    return _animationCurve;
}
},["CPAnimationCurve"]), new objj_method(sel_getUid("setDuration:"), function $CPAnimation__setDuration_(self, _cmd, aDuration)
{ with(self)
{
    if (aDuration < 0)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "aDuration can't be negative");
    _duration = aDuration;
}
},["void","CPTimeInterval"]), new objj_method(sel_getUid("duration"), function $CPAnimation__duration(self, _cmd)
{ with(self)
{
    return _duration;
}
},["CPTimeInterval"]), new objj_method(sel_getUid("setFrameRate:"), function $CPAnimation__setFrameRate_(self, _cmd, frameRate)
{ with(self)
{
    if (frameRate < 0)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "frameRate can't be negative");
    _frameRate = frameRate;
}
},["void","float"]), new objj_method(sel_getUid("frameRate"), function $CPAnimation__frameRate(self, _cmd)
{ with(self)
{
    return _frameRate;
}
},["float"]), new objj_method(sel_getUid("delegate"), function $CPAnimation__delegate(self, _cmd)
{ with(self)
{
    return _delegate;
}
},["id"]), new objj_method(sel_getUid("setDelegate:"), function $CPAnimation__setDelegate_(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
}
},["void","id"]), new objj_method(sel_getUid("startAnimation"), function $CPAnimation__startAnimation(self, _cmd)
{ with(self)
{
    if (_timer || _delegate && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("animationShouldStart:")) && !objj_msgSend(_delegate, "animationShouldStart:", self))
        return;
    if (_progress === 1.0)
        _progress = 0.0;
    ACTUAL_FRAME_RATE = 0;
    _lastTime = new Date();
    _timer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.0, self, sel_getUid("animationTimerDidFire:"), nil, YES);
}
},["void"]), new objj_method(sel_getUid("animationTimerDidFire:"), function $CPAnimation__animationTimerDidFire_(self, _cmd, aTimer)
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
},["void","CPTimer"]), new objj_method(sel_getUid("stopAnimation"), function $CPAnimation__stopAnimation(self, _cmd)
{ with(self)
{
    if (!_timer)
        return;
    objj_msgSend(_timer, "invalidate");
    _timer = nil;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("animationDidStop:")))
        objj_msgSend(_delegate, "animationDidStop:", self);
}
},["void"]), new objj_method(sel_getUid("isAnimating"), function $CPAnimation__isAnimating(self, _cmd)
{ with(self)
{
    return _timer;
}
},["BOOL"]), new objj_method(sel_getUid("setCurrentProgress:"), function $CPAnimation__setCurrentProgress_(self, _cmd, aProgress)
{ with(self)
{
    _progress = aProgress;
}
},["void","float"]), new objj_method(sel_getUid("currentProgress"), function $CPAnimation__currentProgress(self, _cmd)
{ with(self)
{
    return _progress;
}
},["float"]), new objj_method(sel_getUid("currentValue"), function $CPAnimation__currentValue(self, _cmd)
{ with(self)
{
    var t = objj_msgSend(self, "currentProgress");
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("animation:valueForProgress:")))
        return objj_msgSend(_delegate, "animation:valueForProgress:", self, t);
    var c1 = [],
        c2 = [];
    objj_msgSend(_timingFunction, "getControlPointAtIndex:values:", 1, c1);
    objj_msgSend(_timingFunction, "getControlPointAtIndex:values:", 2, c2);
    return CubicBezierAtTime(t,c1[0],c1[1],c2[0],c2[1],_duration);
}
},["float"])]);
}
var CubicBezierAtTime = CubicBezierAtTime= function(t,p1x,p1y,p2x,p2y,duration)
{
    var ax=0,bx=0,cx=0,ay=0,by=0,cy=0;
    sampleCurveX= function(t) {return ((ax*t+bx)*t+cx)*t;};
    sampleCurveY= function(t) {return ((ay*t+by)*t+cy)*t;};
    sampleCurveDerivativeX= function(t) {return (3.0*ax*t+2.0*bx)*t+cx;};
    solveEpsilon= function(duration) {return 1.0/(200.0*duration);};
    solve= function(x,epsilon) {return sampleCurveY(solveCurveX(x,epsilon));};
    solveCurveX= function(x,epsilon) {var t0,t1,t2,x2,d2,i;
        fabs= function(n) {if(n>=0) {return n;}else {return 0-n;}};
        for(t2=x, i=0; i<8; i++) {x2=sampleCurveX(t2)-x; if(fabs(x2)<epsilon) {return t2;} d2=sampleCurveDerivativeX(t2); if(fabs(d2)<1e-6) {break;} t2=t2-x2/d2;}
        t0=0.0; t1=1.0; t2=x; if(t2<t0) {return t0;} if(t2>t1) {return t1;}
        while(t0<t1) {x2=sampleCurveX(t2); if(fabs(x2-x)<epsilon) {return t2;} if(x>x2) {t0=t2;}else {t1=t2;} t2=(t1-t0)*.5+t0;}
        return t2;
    };
    cx=3.0*p1x; bx=3.0*(p2x-p1x)-cx; ax=1.0-cx-bx; cy=3.0*p1y; by=3.0*(p2y-p1y)-cy; ay=1.0-cy-by;
    return solve(t, solveEpsilon(duration));
};

