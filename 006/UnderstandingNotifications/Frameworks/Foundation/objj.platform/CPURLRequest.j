i;10;CPObject.jc;2343;
{var the_class = objj_allocateClassPair(CPObject, "CPURLRequest"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_URL"), new objj_ivar("_HTTPBody"), new objj_ivar("_HTTPMethod"), new objj_ivar("_HTTPHeaderFields")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithURL:"), function(self, _cmd, aURL)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _URL = aURL;
        _HTTPBody = "";
        _HTTPMethod = "GET";
        _HTTPHeaderFields = objj_msgSend(CPDictionary, "dictionary");
        objj_msgSend(self, "setValue:forHTTPHeaderField:", "Thu, 1 Jan 1970 00:00:00 GMT", "If-Modified-Since");
        objj_msgSend(self, "setValue:forHTTPHeaderField:", "no-cache", "Cache-Control");
    }
    return self;
}
}), new objj_method(sel_getUid("URL"), function(self, _cmd)
{ with(self)
{
    return _URL;
}
}), new objj_method(sel_getUid("setURL:"), function(self, _cmd, aURL)
{ with(self)
{
    _URL = aURL;
}
}), new objj_method(sel_getUid("setHTTPBody:"), function(self, _cmd, anHTTPBody)
{ with(self)
{
    _HTTPBody = anHTTPBody;
}
}), new objj_method(sel_getUid("HTTPBody"), function(self, _cmd)
{ with(self)
{
    return _HTTPBody;
}
}), new objj_method(sel_getUid("setHTTPMethod:"), function(self, _cmd, anHTTPMethod)
{ with(self)
{
    _HTTPMethod = anHTTPMethod;
}
}), new objj_method(sel_getUid("HTTPMethod"), function(self, _cmd)
{ with(self)
{
    return _HTTPMethod;
}
}), new objj_method(sel_getUid("allHTTPHeaderFields"), function(self, _cmd)
{ with(self)
{
    return _HTTPHeaderFields;
}
}), new objj_method(sel_getUid("valueForHTTPHeaderField:"), function(self, _cmd, aField)
{ with(self)
{
    return objj_msgSend(_HTTPHeaderFields, "objectForKey:", aField);
}
}), new objj_method(sel_getUid("setValue:forHTTPHeaderField:"), function(self, _cmd, aValue, aField)
{ with(self)
{
    objj_msgSend(_HTTPHeaderFields, "setObject:forKey:", aValue, aField);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("requestWithURL:"), function(self, _cmd, aURL)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPURLRequest, "alloc"), "initWithURL:", aURL);
}
})]);
}

