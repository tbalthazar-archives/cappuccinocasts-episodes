I;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;23;CAMediaTimingFunction.jc;4561;
{var the_class = objj_allocateClassPair(CPObject, "CAAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isRemovedOnCompletion"), new objj_ivar("_delegate")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _isRemovedOnCompletion = YES;
    return self;
}
}), new objj_method(sel_getUid("shouldArchiveValueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("setRemovedOnCompletion:"), function(self, _cmd, isRemovedOnCompletion)
{ with(self)
{
    _isRemovedOnCompletion = isRemovedOnCompletion;
}
}), new objj_method(sel_getUid("removedOnCompletion"), function(self, _cmd)
{ with(self)
{
    return _isRemovedOnCompletion;
}
}), new objj_method(sel_getUid("isRemovedOnCompletion"), function(self, _cmd)
{ with(self)
{
    return _isRemovedOnCompletion;
}
}), new objj_method(sel_getUid("timingFunction"), function(self, _cmd)
{ with(self)
{
    return nil;
}
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("runActionForKey:object:arguments:"), function(self, _cmd, aKey, anObject, arguments)
{ with(self)
{
    objj_msgSend(anObject, "addAnimation:forKey:", self, aKey);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("animation"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
}), new objj_method(sel_getUid("defaultValueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    return nil;
}
})]);
}
{var the_class = objj_allocateClassPair(CAAnimation, "CAPropertyAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_keyPath"), new objj_ivar("_isCumulative"), new objj_ivar("_isAdditive")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("setKeyPath:"), function(self, _cmd, aKeyPath)
{ with(self)
{
    _keyPath = aKeyPath;
}
}), new objj_method(sel_getUid("keyPath"), function(self, _cmd)
{ with(self)
{
    return _keyPath;
}
}), new objj_method(sel_getUid("setCumulative:"), function(self, _cmd, isCumulative)
{ with(self)
{
    _isCumulative = isCumulative;
}
}), new objj_method(sel_getUid("cumulative"), function(self, _cmd)
{ with(self)
{
    return _isCumulative;
}
}), new objj_method(sel_getUid("isCumulative"), function(self, _cmd)
{ with(self)
{
    return _isCumulative;
}
}), new objj_method(sel_getUid("setAdditive:"), function(self, _cmd, isAdditive)
{ with(self)
{
    _isAdditive = isAdditive;
}
}), new objj_method(sel_getUid("additive"), function(self, _cmd)
{ with(self)
{
    return _isAdditive;
}
}), new objj_method(sel_getUid("isAdditive"), function(self, _cmd)
{ with(self)
{
    return _isAdditive;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("animationWithKeyPath:"), function(self, _cmd, aKeyPath)
{ with(self)
{
    var animation = objj_msgSend(self, "animation");
    objj_msgSend(animation, "setKeypath:", aKeyPath);
    return animation;
}
})]);
}
{var the_class = objj_allocateClassPair(CAPropertyAnimation, "CABasicAnimation"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_fromValue"), new objj_ivar("_toValue"), new objj_ivar("_byValue")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("setFromValue:"), function(self, _cmd, aValue)
{ with(self)
{
    _fromValue = aValue;
}
}), new objj_method(sel_getUid("fromValue"), function(self, _cmd)
{ with(self)
{
    return _fromValue;
}
}), new objj_method(sel_getUid("setToValue:"), function(self, _cmd, aValue)
{ with(self)
{
    _toValue = aValue;
}
}), new objj_method(sel_getUid("toValue"), function(self, _cmd)
{ with(self)
{
    return _toValue;
}
}), new objj_method(sel_getUid("setByValue:"), function(self, _cmd, aValue)
{ with(self)
{
    _byValue = aValue;
}
}), new objj_method(sel_getUid("byValue"), function(self, _cmd)
{ with(self)
{
    return _byValue;
}
})]);
}

