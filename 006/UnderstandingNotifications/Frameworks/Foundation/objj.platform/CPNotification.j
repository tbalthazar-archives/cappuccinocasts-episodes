i;10;CPObject.ji;13;CPException.jc;1803;
{var the_class = objj_allocateClassPair(CPObject, "CPNotification"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_name"), new objj_ivar("_object"), new objj_ivar("_userInfo")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "CPNotification's init method should not be used");
}
}), new objj_method(sel_getUid("initWithName:object:userInfo:"), function(self, _cmd, aNotificationName, anObject, aUserInfo)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _name = aNotificationName;
        _object = anObject;
        _userInfo = aUserInfo;
    }
    return self;
}
}), new objj_method(sel_getUid("name"), function(self, _cmd)
{ with(self)
{
    return _name;
}
}), new objj_method(sel_getUid("object"), function(self, _cmd)
{ with(self)
{
    return _object;
}
}), new objj_method(sel_getUid("userInfo"), function(self, _cmd)
{ with(self)
{
    return _userInfo;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("notificationWithName:object:userInfo:"), function(self, _cmd, aNotificationName, anObject, aUserInfo)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithName:object:userInfo:", aNotificationName, anObject, aUserInfo);
}
}), new objj_method(sel_getUid("notificationWithName:object:"), function(self, _cmd, aNotificationName, anObject)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithName:object:userInfo:", aNotificationName, anObject, nil);
}
})]);
}

