I;21;Foundation/CPObject.jc;1931;


var _CPCibCustomObjectClassName = "_CPCibCustomObjectClassName";

{var the_class = objj_allocateClassPair(CPObject, "_CPCibCustomObject"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_className")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("customClassName"), function(self, _cmd)
{ with(self)
{
    return _className;
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "description") + " (" + objj_msgSend(self, "customClassName") + ')';
}
})]);
}

{
var the_class = objj_getClass("_CPCibCustomObject")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"_CPCibCustomObject\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");

    if (self)
        _className = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibCustomObjectClassName);

    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _className, _CPCibCustomObjectClassName);
}
}), new objj_method(sel_getUid("_cibInstantiate"), function(self, _cmd)
{ with(self)
{
    var theClass = CPClassFromString(_className);

    if (!theClass)
        CPLog("Unknown class \"" + _className + "\" in cib file");

    if (theClass === objj_msgSend(CPApplication, "class"))
        return objj_msgSend(CPApplication, "sharedApplication");

    return objj_msgSend(objj_msgSend(theClass, "alloc"), "init");
}
})]);
}

