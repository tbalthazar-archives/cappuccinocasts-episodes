I;21;Foundation/CPObject.jI;21;Foundation/CPString.jc;1690;
{var the_class = objj_allocateClassPair(CPObject, "CPCookie"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_cookieName"), new objj_ivar("_cookieValue"), new objj_ivar("_expires")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithName:"), function(self, _cmd, aName)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    _cookieName = aName;
    _cookieValue = objj_msgSend(self, "_readCookieValue");
    return self;
}
}), new objj_method(sel_getUid("value"), function(self, _cmd)
{ with(self)
{
    return _cookieValue;
}
}), new objj_method(sel_getUid("name"), function(self, _cmd)
{ with(self)
{
    return _cookieName;
}
}), new objj_method(sel_getUid("expires"), function(self, _cmd)
{ with(self)
{
    return _expires;
}
}), new objj_method(sel_getUid("setValue:expires:domain:"), function(self, _cmd, value, date, domain)
{ with(self)
{
    if(date)
        var expires = "; expires="+date.toGMTString();
    else
        var expires = "";
    if(domain)
        domain = "; domain="+domain;
    else
        domain = "";
 document.cookie = _cookieName+"="+value+expires+"; path=/"+domain;
}
}), new objj_method(sel_getUid("_readCookieValue"), function(self, _cmd)
{ with(self)
{
 var nameEQ = _cookieName + "=";
 var ca = document.cookie.split(';');
 for(var i=0;i < ca.length;i++) {
  var c = ca[i];
  while (c.charAt(0)==' ') c = c.substring(1,c.length);
  if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
 }
 return "";
}
})]);
}

