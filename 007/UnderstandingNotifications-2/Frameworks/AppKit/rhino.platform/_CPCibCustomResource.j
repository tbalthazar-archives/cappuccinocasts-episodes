I;21;Foundation/CPObject.jI;21;Foundation/CPString.jc;3713;
var _CPCibCustomResourceClassNameKey = "_CPCibCustomResourceClassNameKey",
    _CPCibCustomResourceResourceNameKey = "_CPCibCustomResourceResourceNameKey",
    _CPCibCustomResourcePropertiesKey = "_CPCibCustomResourcePropertiesKey";
{var the_class = objj_allocateClassPair(CPObject, "_CPCibCustomResource"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_className"), new objj_ivar("_resourceName"), new objj_ivar("_properties")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithClassName:resourceName:properties:"), function(self, _cmd, aClassName, aResourceName, properties)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _className = aClassName;
        _resourceName = aResourceName;
        _properties = properties;
    }
    return self;
}
}), new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _className = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibCustomResourceClassNameKey);
        _resourceName = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibCustomResourceResourceNameKey);
        _properties = objj_msgSend(aCoder, "decodeObjectForKey:", _CPCibCustomResourcePropertiesKey);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _className, _CPCibCustomResourceClassNameKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _resourceName, _CPCibCustomResourceResourceNameKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _properties, _CPCibCustomResourcePropertiesKey);
}
}), new objj_method(sel_getUid("awakeAfterUsingCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    if (objj_msgSend(aCoder, "respondsToSelector:", sel_getUid("bundle")) &&
        (!objj_msgSend(aCoder, "respondsToSelector:", sel_getUid("awakenCustomResources")) || objj_msgSend(aCoder, "awakenCustomResources")))
        if (_className === "CPImage")
            return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(aCoder, "bundle"), "pathForResource:", _resourceName), objj_msgSend(_properties, "objectForKey:", "size"));
    return self;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("imageResourceWithName:size:"), function(self, _cmd, aResourceName, aSize)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithClassName:resourceName:properties:", "CPImage", aResourceName, objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", aSize, "size"));
}
})]);
}
{
var the_class = objj_getClass("_CPCibCustomResource")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"_CPCibCustomResource\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("filename"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPBundle, "mainBundle"), "pathForResource:", _resourceName);
}
}), new objj_method(sel_getUid("size"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_properties, "objectForKey:", "size");
}
}), new objj_method(sel_getUid("isThreePartImage"), function(self, _cmd)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("isNinePartImage"), function(self, _cmd)
{ with(self)
{
    return NO;
}
})]);
}

