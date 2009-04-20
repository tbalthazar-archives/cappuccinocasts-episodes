i;9;CPArray.ji;10;CPObject.ji;14;CPDictionary.jc;8183;
var CPObjectAccessorsForClass = nil,
    CPObjectModifiersForClass = nil;
CPUndefinedKeyException = "CPUndefinedKeyException";
CPTargetObjectUserInfoKey = "CPTargetObjectUserInfoKey";
CPUnknownUserInfoKey = "CPUnknownUserInfoKey";
{
var the_class = objj_getClass("CPObject")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPObject\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("_ivarForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    var ivar = '_' + aKey;
    if (typeof self[ivar] != "undefined")
        return ivar;
    var isKey = "is" + aKey.charAt(0).toUpperCase() + aKey.substr(1);
    ivar = '_' + isKey;
    if (typeof self[ivar] != "undefined")
        return ivar;
    ivar = aKey;
    if (typeof self[ivar] != "undefined")
        return ivar;
    ivar = isKey;
    if (typeof self[ivar] != "undefined")
        return ivar;
    return nil;
}
}), new objj_method(sel_getUid("valueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    var theClass = objj_msgSend(self, "class"),
        selector = objj_msgSend(theClass, "_accessorForKey:", aKey);
    if (selector)
        return objj_msgSend(self, selector);
    if(objj_msgSend(theClass, "accessInstanceVariablesDirectly"))
    {
        var ivar = objj_msgSend(self, "_ivarForKey:", aKey);
        if (ivar)
            return self[ivar];
    }
    return objj_msgSend(self, "valueForUndefinedKey:", aKey);
}
}), new objj_method(sel_getUid("valueForKeyPath:"), function(self, _cmd, aKeyPath)
{ with(self)
{
    var keys = aKeyPath.split("."),
        index = 0,
        count = keys.length,
        value = self;
    for(; index < count; ++index)
        value = objj_msgSend(value, "valueForKey:", keys[index]);
    return value;
}
}), new objj_method(sel_getUid("dictionaryWithValuesForKeys:"), function(self, _cmd, keys)
{ with(self)
{
    var index = 0,
        count = keys.length,
        dictionary = objj_msgSend(CPDictionary, "dictionary");
    for (; index < count; ++index)
    {
        var key = keys[index],
            value = objj_msgSend(self, "valueForKey:", key);
        if (value === nil)
            objj_msgSend(dictionary, "setObject:forKey:", objj_msgSend(CPNull, "null"), key);
        else
            objj_msgSend(dictionary, "setObject:forKey:", value, key);
    }
    return dictionary;
}
}), new objj_method(sel_getUid("valueForUndefinedKey:"), function(self, _cmd, aKey)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPException, "exceptionWithName:reason:userInfo:", CPUndefinedKeyException, objj_msgSend(self, "description") + " is not key value coding-compliant for the key " + aKey, objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [self, aKey], [CPTargetObjectUserInfoKey, CPUnknownUserInfoKey])), "raise");
}
}), new objj_method(sel_getUid("setValue:forKeyPath:"), function(self, _cmd, aValue, aKeyPath)
{ with(self)
{
    if (!aKeyPath) aKeyPath = "self";
    var i = 0,
        keys = aKeyPath.split("."),
        count = keys.length - 1,
        owner = self;
    for(; i < count; ++i)
        owner = objj_msgSend(owner, "valueForKey:", keys[i]);
    objj_msgSend(owner, "setValue:forKey:", aValue, keys[i]);
}
}), new objj_method(sel_getUid("setValue:forKey:"), function(self, _cmd, aValue, aKey)
{ with(self)
{
    var theClass = objj_msgSend(self, "class"),
        selector = objj_msgSend(theClass, "_modifierForKey:", aKey);
    if (selector)
        return objj_msgSend(self, selector, aValue);
    if(objj_msgSend(theClass, "accessInstanceVariablesDirectly"))
    {
        var ivar = objj_msgSend(self, "_ivarForKey:", aKey);
        if (ivar)
        {
            objj_msgSend(self, "willChangeValueForKey:", aKey);
            self[ivar] = aValue;
            objj_msgSend(self, "didChangeValueForKey:", aKey);
        }
        return;
    }
    objj_msgSend(self, "setValue:forUndefinedKey:", aValue, aKey);
}
}), new objj_method(sel_getUid("setValue:forUndefinedKey:"), function(self, _cmd, aValue, aKey)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPException, "exceptionWithName:reason:userInfo:", CPUndefinedKeyException, objj_msgSend(self, "description") + " is not key value coding-compliant for the key " + aKey, objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [self, aKey], [CPTargetObjectUserInfoKey, CPUnknownUserInfoKey])), "raise");
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("accessInstanceVariablesDirectly"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("_accessorForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    if (!CPObjectAccessorsForClass)
        CPObjectAccessorsForClass = objj_msgSend(CPDictionary, "dictionary");
    var hash = objj_msgSend(isa, "hash"),
        selector = nil,
        accessors = objj_msgSend(CPObjectAccessorsForClass, "objectForKey:", hash);
    if (accessors)
    {
        selector = objj_msgSend(accessors, "objectForKey:", aKey);
        if (selector)
            return selector === objj_msgSend(CPNull, "null") ? nil : selector;
    }
    else
    {
        accessors = objj_msgSend(CPDictionary, "dictionary");
        objj_msgSend(CPObjectAccessorsForClass, "setObject:forKey:", accessors, hash);
    }
    var capitalizedKey = aKey.charAt(0).toUpperCase() + aKey.substr(1);
    if (objj_msgSend(self, "instancesRespondToSelector:", selector = CPSelectorFromString("get" + capitalizedKey)) ||
        objj_msgSend(self, "instancesRespondToSelector:", selector = CPSelectorFromString(aKey)) ||
        objj_msgSend(self, "instancesRespondToSelector:", selector = CPSelectorFromString("is" + capitalizedKey)) ||
        objj_msgSend(self, "instancesRespondToSelector:", selector = CPSelectorFromString("_get" + capitalizedKey)) ||
        objj_msgSend(self, "instancesRespondToSelector:", selector = CPSelectorFromString("_" + aKey)) ||
        objj_msgSend(self, "instancesRespondToSelector:", selector = CPSelectorFromString("_is" + capitalizedKey)))
    {
        objj_msgSend(accessors, "setObject:forKey:", selector, aKey);
        return selector;
    }
    objj_msgSend(accessors, "setObject:forKey:", objj_msgSend(CPNull, "null"), aKey);
    return nil;
}
}), new objj_method(sel_getUid("_modifierForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    if (!CPObjectModifiersForClass)
        CPObjectModifiersForClass = objj_msgSend(CPDictionary, "dictionary");
    var hash = objj_msgSend(isa, "hash"),
        selector = nil,
        modifiers = objj_msgSend(CPObjectModifiersForClass, "objectForKey:", hash);
    if (modifiers)
    {
        selector = objj_msgSend(modifiers, "objectForKey:", aKey);
        if (selector)
            return selector === objj_msgSend(CPNull, "null") ? nil : selector;
    }
    else
    {
        modifiers = objj_msgSend(CPDictionary, "dictionary");
        objj_msgSend(CPObjectModifiersForClass, "setObject:forKey:", modifiers, hash);
    }
    if (selector)
        return selector === objj_msgSend(CPNull, "null") ? nil : selector;
    var capitalizedKey = aKey.charAt(0).toUpperCase() + aKey.substr(1) + ':';
    if (objj_msgSend(self, "instancesRespondToSelector:", selector = CPSelectorFromString("set" + capitalizedKey)) ||
        objj_msgSend(self, "instancesRespondToSelector:", selector = CPSelectorFromString("_set" + capitalizedKey)))
    {
        objj_msgSend(modifiers, "setObject:forKey:", selector, aKey);
        return selector;
    }
    objj_msgSend(modifiers, "setObject:forKey:", objj_msgSend(CPNull, "null"), aKey);
    return nil;
}
})]);
}
{
var the_class = objj_getClass("CPDictionary")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPDictionary\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("valueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
 return objj_msgSend(self, "objectForKey:", aKey);
}
}), new objj_method(sel_getUid("setValue:forKey:"), function(self, _cmd, aValue, aKey)
{ with(self)
{
    objj_msgSend(self, "setObject:forKey:", aValue, aKey);
}
})]);
}
i;13;CPArray+KVO.j