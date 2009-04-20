i;10;CPObject.ji;10;CPString.jc;2675;
{var the_class = objj_allocateClassPair(CPObject, "CPData"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_plistObject")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithString:"), function(self, _cmd, aString)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        string = aString;
    return self;
}
}), new objj_method(sel_getUid("initWithPlistObject:"), function(self, _cmd, aPlistObject)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _plistObject = aPlistObject;
    return self;
}
}), new objj_method(sel_getUid("length"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "string"), "length");
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    return string;
}
}), new objj_method(sel_getUid("string"), function(self, _cmd)
{ with(self)
{
    if (!string && _plistObject)
        string = objj_msgSend(objj_msgSend(CPPropertyListSerialization, "dataFromPropertyList:format:errorDescription:", _plistObject, CPPropertyList280NorthFormat_v1_0, NULL), "string");
    return string;
}
}), new objj_method(sel_getUid("setString:"), function(self, _cmd, aString)
{ with(self)
{
    string = aString;
    _plistObject = nil;
}
}), new objj_method(sel_getUid("plistObject"), function(self, _cmd)
{ with(self)
{
    if (string && !_plistObject)
        _plistObject = objj_msgSend(CPPropertyListSerialization, "propertyListFromData:format:errorDescription:", self, 0, NULL);
    return _plistObject;
}
}), new objj_method(sel_getUid("setPlistObject:"), function(self, _cmd, aPlistObject)
{ with(self)
{
    string = nil;
    _plistObject = aPlistObject;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function(self, _cmd)
{ with(self)
{
    return new objj_data();
}
}), new objj_method(sel_getUid("data"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithPlistObject:", nil);
}
}), new objj_method(sel_getUid("dataWithString:"), function(self, _cmd, aString)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithString:", aString);
}
}), new objj_method(sel_getUid("dataWithPlistObject:"), function(self, _cmd, aPlistObject)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithPlistObject:", aPlistObject);
}
})]);
}
objj_data.prototype.isa = CPData;

