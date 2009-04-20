i;10;CPObject.ji;14;CPInvocation.ji;8;CPDate.ji;11;CPRunLoop.jc;7042;
{var the_class = objj_allocateClassPair(CPObject, "CPTimer"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_timeInterval"), new objj_ivar("_invocation"), new objj_ivar("_callback"), new objj_ivar("_repeats"), new objj_ivar("_isValid"), new objj_ivar("_fireDate"), new objj_ivar("_userInfo")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFireDate:interval:invocation:repeats:"), function(self, _cmd, aDate, seconds, anInvocation, shouldRepeat)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _timeInterval = seconds;
        _invocation = anInvocation;
        _repeats = shouldRepeat;
        _isValid = YES;
        _fireDate = aDate;
    }
    return self;
}
}), new objj_method(sel_getUid("initWithFireDate:interval:target:selector:userInfo:repeats:"), function(self, _cmd, aDate, seconds, aTarget, aSelector, userInfo, shouldRepeat)
{ with(self)
{
    var invocation = objj_msgSend(CPInvocation, "invocationWithMethodSignature:", 1);
    objj_msgSend(invocation, "setTarget:", aTarget);
    objj_msgSend(invocation, "setSelector:", aSelector);
    objj_msgSend(invocation, "setArgument:atIndex:", self, 2);
    self = objj_msgSend(self, "initWithFireDate:interval:invocation:repeats:", aDate, seconds, invocation, shouldRepeat);
    if (self)
        _userInfo = userInfo;
    return self;
}
}), new objj_method(sel_getUid("initWithFireDate:interval:callback:repeats:"), function(self, _cmd, aDate, seconds, aFunction, shouldRepeat)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _timeInterval = seconds;
        _callback = aFunction;
        _repeats = shouldRepeat;
        _isValid = YES;
        _fireDate = aDate;
    }
    return self;
}
}), new objj_method(sel_getUid("timeInterval"), function(self, _cmd)
{ with(self)
{
   return _timeInterval;
}
}), new objj_method(sel_getUid("fireDate"), function(self, _cmd)
{ with(self)
{
   return _fireDate;
}
}), new objj_method(sel_getUid("setFireDate:"), function(self, _cmd, aDate)
{ with(self)
{
    _fireDate = aDate;
}
}), new objj_method(sel_getUid("fire"), function(self, _cmd)
{ with(self)
{
    if (!_isValid)
        return;
    if (_callback)
        _callback();
    else
        objj_msgSend(_invocation, "invoke");
    if (!_isValid)
        return;
    if (_repeats)
        _fireDate = objj_msgSend(CPDate, "dateWithTimeIntervalSinceNow:", _timeInterval);
    else
        objj_msgSend(self, "invalidate");
}
}), new objj_method(sel_getUid("isValid"), function(self, _cmd)
{ with(self)
{
   return _isValid;
}
}), new objj_method(sel_getUid("invalidate"), function(self, _cmd)
{ with(self)
{
   _isValid = NO;
   _userInfo = nil;
   _invocation = nil;
   _callback = nil;
}
}), new objj_method(sel_getUid("userInfo"), function(self, _cmd)
{ with(self)
{
   return _userInfo;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("scheduledTimerWithTimeInterval:invocation:repeats:"), function(self, _cmd, seconds, anInvocation, shouldRepeat)
{ with(self)
{
    var timer = objj_msgSend(objj_msgSend(self, "alloc"), "initWithFireDate:interval:invocation:repeats:", objj_msgSend(CPDate, "dateWithTimeIntervalSinceNow:", seconds), seconds, anInvocation, shouldRepeat);
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "addTimer:forMode:", timer, CPDefaultRunLoopMode);
    return timer;
}
}), new objj_method(sel_getUid("scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:"), function(self, _cmd, seconds, aTarget, aSelector, userInfo, shouldRepeat)
{ with(self)
{
    var timer = objj_msgSend(objj_msgSend(self, "alloc"), "initWithFireDate:interval:target:selector:userInfo:repeats:", objj_msgSend(CPDate, "dateWithTimeIntervalSinceNow:", seconds), seconds, aTarget, aSelector, userInfo, shouldRepeat)
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "addTimer:forMode:", timer, CPDefaultRunLoopMode);
    return timer;
}
}), new objj_method(sel_getUid("scheduledTimerWithTimeInterval:callback:repeats:"), function(self, _cmd, seconds, aFunction, shouldRepeat)
{ with(self)
{
    var timer = objj_msgSend(objj_msgSend(self, "alloc"), "initWithFireDate:interval:callback:repeats:", objj_msgSend(CPDate, "dateWithTimeIntervalSinceNow:", seconds), seconds, aFunction, shouldRepeat);
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "addTimer:forMode:", timer, CPDefaultRunLoopMode);
    return timer;
}
}), new objj_method(sel_getUid("timerWithTimeInterval:invocation:repeats:"), function(self, _cmd, seconds, anInvocation, shouldRepeat)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithFireDate:interval:invocation:repeats:", nil, seconds, anInvocation, shouldRepeat);
}
}), new objj_method(sel_getUid("timerWithTimeInterval:target:selector:userInfo:repeats:"), function(self, _cmd, seconds, aTarget, aSelector, userInfo, shouldRepeat)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithFireDate:interval:target:selector:userInfo:repeats:", nil, seconds, aTarget, aSelector, userInfo, shouldRepeat);
}
}), new objj_method(sel_getUid("timerWithTimeInterval:callback:repeats:"), function(self, _cmd, seconds, aFunction, shouldRepeat)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithFireDate:interval:callback:repeats:", nil, seconds, aFunction, shouldRepeat);
}
})]);
}
var CPTimersTimeoutID = 1000,
    CPTimersForTimeoutIDs = {};
var _CPTimerBridgeTimer = function(codeOrFunction, aDelay, shouldRepeat, functionArgs)
{
    var timeoutID = CPTimersTimeoutID++,
        theFunction = nil;
    if (typeof codeOrFunction === "string")
        theFunction = function() { new Function(codeOrFunction)(); if (!shouldRepeat) CPTimersForTimeoutIDs[timeoutID] = nil; }
    else
    {
        if (!functionArgs)
            functionArgs = [];
        theFunction = function() { codeOrFunction.apply(window, functionArgs); if (!shouldRepeat) CPTimersForTimeoutIDs[timeoutID] = nil; }
    }
    CPTimersForTimeoutIDs[timeoutID] = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:callback:repeats:", aDelay / 1000, theFunction, shouldRepeat);
    return timeoutID;
}
window.setTimeout = function(codeOrFunction, aDelay)
{
    return _CPTimerBridgeTimer(codeOrFunction, aDelay, NO, Array.prototype.slice.apply(arguments, [2]));
}
window.clearTimeout = function(aTimeoutID)
{
    var timer = CPTimersForTimeoutIDs[aTimeoutID];
    if (timer)
        objj_msgSend(timer, "invalidate");
    CPTimersForTimeoutIDs[aTimeoutID] = nil;
}
window.setInterval = function(codeOrFunction, aDelay, functionArgs)
{
    return _CPTimerBridgeTimer(codeOrFunction, aDelay, YES, Array.prototype.slice.apply(arguments, [2]));
}
window.clearInterval = function(aTimeoutID)
{
    window.clearTimeout(aTimeoutID);
}

