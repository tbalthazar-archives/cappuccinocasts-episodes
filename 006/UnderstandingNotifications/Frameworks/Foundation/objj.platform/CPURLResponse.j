i;10;CPObject.jc;1193;
{var the_class = objj_allocateClassPair(CPObject, "CPURLResponse"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_URL")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithURL:"), function(self, _cmd, aURL)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _URL = aURL;
    return self;
}
}), new objj_method(sel_getUid("URL"), function(self, _cmd)
{ with(self)
{
    return _URL;
}
})]);
}
{var the_class = objj_allocateClassPair(CPURLResponse, "CPHTTPURLResponse"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_statusCode")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("_setStatusCode:"), function(self, _cmd, aStatusCode)
{ with(self)
{
    _statusCode = aStatusCode;
}
}), new objj_method(sel_getUid("statusCode"), function(self, _cmd)
{ with(self)
{
    return _statusCode;
}
})]);
}

