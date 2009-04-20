i;10;CPObject.ji;14;CPEnumerator.ji;13;CPException.jc;7652;
{var the_class = objj_allocateClassPair(CPEnumerator, "_CPDictionaryValueEnumerator"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_keyEnumerator"), new objj_ivar("_dictionary")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithDictionary:"), function(self, _cmd, aDictionary)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPEnumerator") }, "init");
    if (self)
    {
        _keyEnumerator = objj_msgSend(aDictionary, "keyEnumerator");
        _dictionary = aDictionary;
    }
    return self;
}
}), new objj_method(sel_getUid("nextObject"), function(self, _cmd)
{ with(self)
{
    var key = objj_msgSend(_keyEnumerator, "nextObject");
    if (!key)
        return nil;
    return objj_msgSend(_dictionary, "objectForKey:", key);
}
})]);
}
{var the_class = objj_allocateClassPair(CPObject, "CPDictionary"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithDictionary:"), function(self, _cmd, aDictionary)
{ with(self)
{
    var key = "",
        dictionary = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    for (key in aDictionary._buckets)
        objj_msgSend(dictionary, "setObject:forKey:", objj_msgSend(aDictionary, "objectForKey:", key), key);
    return dictionary;
}
}), new objj_method(sel_getUid("initWithObjects:forKeys:"), function(self, _cmd, objects, keyArray)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (objj_msgSend(objects, "count") != objj_msgSend(keyArray, "count"))
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Counts are different.("+objj_msgSend(objects, "count")+"!="+objj_msgSend(keyArray, "count")+")");
    if (self)
    {
        var i = objj_msgSend(keyArray, "count");
        while (i--)
            objj_msgSend(self, "setObject:forKey:", objects[i], keyArray[i]);
    }
    return self;
}
}), new objj_method(sel_getUid("copy"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPDictionary, "dictionaryWithDictionary:", self);
}
}), new objj_method(sel_getUid("count"), function(self, _cmd)
{ with(self)
{
    return count;
}
}), new objj_method(sel_getUid("allKeys"), function(self, _cmd)
{ with(self)
{
    return _keys;
}
}), new objj_method(sel_getUid("allValues"), function(self, _cmd)
{ with(self)
{
    var index = _keys.length,
        values = [];
    while (index--)
        values.push(dictionary_getValue(self, [_keys[index]]));
    return values;
}
}), new objj_method(sel_getUid("keyEnumerator"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_keys, "objectEnumerator");
}
}), new objj_method(sel_getUid("objectEnumerator"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(_CPDictionaryValueEnumerator, "alloc"), "initWithDictionary:", self);
}
}), new objj_method(sel_getUid("isEqualToDictionary:"), function(self, _cmd, aDictionary)
{ with(self)
{
    if (count != objj_msgSend(aDictionary, "count"))
        return NO;
    var index = count;
    while (index--)
    {
        var currentKey = _keys[index],
            lhsObject = _buckets[currentKey],
            rhsObject = aDictionary._buckets[currentKey];
        if (lhsObject === rhsObject)
            continue;
        if (lhsObject.isa && rhsObject.isa && objj_msgSend(lhsObject, "respondsToSelector:", sel_getUid("isEqual:")) && objj_msgSend(lhsObject, "isEqual:", rhsObject))
            continue;
        return NO;
    }
    return YES;
}
}), new objj_method(sel_getUid("objectForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    var object = _buckets[aKey];
    return (object === undefined) ? nil : object;
}
}), new objj_method(sel_getUid("removeAllObjects"), function(self, _cmd)
{ with(self)
{
    _keys = [];
    count = 0;
    _buckets = {};
}
}), new objj_method(sel_getUid("removeObjectForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    dictionary_removeValue(self, aKey);
}
}), new objj_method(sel_getUid("removeObjectsForKeys:"), function(self, _cmd, allKeys)
{ with(self)
{
    for (var i=0, count = allKeys.length; i<count; i++)
        dictionary_removeValue(self, allKeys[i]);
}
}), new objj_method(sel_getUid("setObject:forKey:"), function(self, _cmd, anObject, aKey)
{ with(self)
{
    dictionary_setValue(self, aKey, anObject);
}
}), new objj_method(sel_getUid("addEntriesFromDictionary:"), function(self, _cmd, aDictionary)
{ with(self)
{
    if (!aDictionary)
        return;
    var keys = objj_msgSend(aDictionary, "allKeys"),
        count = objj_msgSend(keys, "count");
    while (count--)
    {
        var key = keys[count];
        objj_msgSend(self, "setObject:forKey:", objj_msgSend(aDictionary, "objectForKey:", key), key);
    }
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    var description = "CPDictionary {\n";
    var i = _keys.length;
    while (i--)
        description += _keys[i] +":"+objj_msgSend(_buckets[_keys[i]], "description")+"\n";
    description += "}";
    return description;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function(self, _cmd)
{ with(self)
{
    return new objj_dictionary();
}
}), new objj_method(sel_getUid("dictionary"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
}), new objj_method(sel_getUid("dictionaryWithDictionary:"), function(self, _cmd, aDictionary)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithDictionary:", aDictionary);
}
}), new objj_method(sel_getUid("dictionaryWithObject:forKey:"), function(self, _cmd, anObject, aKey)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithObjects:forKeys:", [anObject], [aKey]);
}
}), new objj_method(sel_getUid("dictionaryWithObjects:forKeys:"), function(self, _cmd, objects, keys)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithObjects:forKeys:", objects, keys);
}
}), new objj_method(sel_getUid("dictionaryWithJSObject:"), function(self, _cmd, object)
{ with(self)
{
    return objj_msgSend(self, "dictionaryWithJSObject:recursively:", object, NO);
}
}), new objj_method(sel_getUid("dictionaryWithJSObject:recursively:"), function(self, _cmd, object, recursively)
{ with(self)
{
    var dictionary = objj_msgSend(objj_msgSend(self, "alloc"), "init");
    for (var key in object)
    {
        var value = object[key];
        if (recursively && value.constructor === Object)
            value = objj_msgSend(CPDictionary, "dictionaryWithJSObject:recursively:", value, YES);
        objj_msgSend(dictionary, "setObject:forKey:", value, key);
    }
    return dictionary;
}
})]);
}
{
var the_class = objj_getClass("CPDictionary")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPDictionary\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(aCoder, "_decodeDictionaryOfObjectsForKey:", "CP.objects");
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "_encodeDictionaryOfObjects:forKey:", self, "CP.objects");
}
})]);
}
objj_dictionary.prototype.isa = CPDictionary;

