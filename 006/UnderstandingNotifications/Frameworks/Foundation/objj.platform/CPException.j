i;9;CPCoder.ji;10;CPObject.ji;10;CPString.jc;4011;
CPInvalidArgumentException = "CPInvalidArgumentException";
CPUnsupportedMethodException = "CPUnsupportedMethodException";
CPRangeException = "CPRangeException";
CPInternalInconsistencyException = "CPInternalInconsistencyException";
{var the_class = objj_allocateClassPair(CPObject, "CPException"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithName:reason:userInfo:"), function(self, _cmd, aName, aReason, aUserInfo)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        name = aName;
        reason = aReason;
        userInfo = aUserInfo;
    }
    return self;
}
}), new objj_method(sel_getUid("name"), function(self, _cmd)
{ with(self)
{
    return name;
}
}), new objj_method(sel_getUid("reason"), function(self, _cmd)
{ with(self)
{
    return reason;
}
}), new objj_method(sel_getUid("userInfo"), function(self, _cmd)
{ with(self)
{
    return userInfo;
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    return reason;
}
}), new objj_method(sel_getUid("raise"), function(self, _cmd)
{ with(self)
{
    objj_exception_throw(self);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function(self, _cmd)
{ with(self)
{
    return new objj_exception();
}
}), new objj_method(sel_getUid("raise:reason:"), function(self, _cmd, aName, aReason)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "exceptionWithName:reason:userInfo:", aName, aReason, nil), "raise");
}
}), new objj_method(sel_getUid("exceptionWithName:reason:userInfo:"), function(self, _cmd, aName, aReason, aUserInfo)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithName:reason:userInfo:", aName, aReason, aUserInfo);
}
})]);
}
{
var the_class = objj_getClass("CPException")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPException\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("copy"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "class"), "exceptionWithName:reason:userInfo:", name, reason, userInfo);
}
})]);
}
var CPExceptionNameKey = "CPExceptionNameKey",
    CPExceptionReasonKey = "CPExceptionReasonKey",
    CPExceptionUserInfoKey = "CPExceptionUserInfoKey";
{
var the_class = objj_getClass("CPException")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPException\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        name = objj_msgSend(aCoder, "decodeObjectForKey:", CPExceptionNameKey);
        reason = objj_msgSend(aCoder, "decodeObjectForKey:", CPExceptionReasonKey);
        userInfo = objj_msgSend(aCoder, "decodeObjectForKey:", CPExceptionUserInfoKey);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", name, CPExceptionNameKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", reason, CPExceptionReasonKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", userInfo, CPExceptionUserInfoKey);
}
})]);
}
objj_exception.prototype.isa = CPException;
objj_msgSend(CPException, "initialize");
_CPRaiseInvalidAbstractInvocation= function(anObject, aSelector)
{
    objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "*** -" + sel_getName(aSelector) + " cannot be sent to an abstract object of class " + objj_msgSend(anObject, "className") + ": Create a concrete instance!");
}

