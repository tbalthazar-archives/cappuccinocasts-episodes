i;10;CPObject.ji;9;CPArray.ji;10;CPNumber.ji;14;CPEnumerator.jc;9568;
{var the_class = objj_allocateClassPair(CPObject, "CPSet"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contents"), new objj_ivar("_count")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init"))
    {
        _count = 0;
        _contents = {};
    }
    return self;
}
}), new objj_method(sel_getUid("initWithArray:"), function(self, _cmd, anArray)
{ with(self)
{
    if (self = objj_msgSend(self, "init"))
    {
        var count = anArray.length;
        while (count--)
            objj_msgSend(self, "addObject:", anArray[count]);
    }
    return self;
}
}), new objj_method(sel_getUid("initWithObjects:count:"), function(self, _cmd, objects, count)
{ with(self)
{
    return objj_msgSend(self, "initWithArray:", objects.splice(0, count));
}
}), new objj_method(sel_getUid("initWithObjects:"), function(self, _cmd, anObject)
{ with(self)
{
    if (self = objj_msgSend(self, "init"))
    {
  var argLength = arguments.length,
   i = 2;
        for(; i < argLength && (argument = arguments[i]) != nil; ++i)
            objj_msgSend(self, "addObject:", argument);
    }
    return self;
}
}), new objj_method(sel_getUid("initWithSet:"), function(self, _cmd, aSet)
{ with(self)
{
    return objj_msgSend(self, "initWithSet:copyItems:", aSet, NO);
}
}), new objj_method(sel_getUid("initWithSet:copyItems:"), function(self, _cmd, aSet, shouldCopyItems)
{ with(self)
{
    self = objj_msgSend(self, "init");
    if (!aSet)
        return self;
    var contents = aSet._contents;
    for (var property in contents)
    {
        if (contents.hasOwnProperty(property))
        {
            if (shouldCopyItems)
                objj_msgSend(self, "addObject:", objj_msgSend(contents[property], "copy"));
            else
                objj_msgSend(self, "addObject:", contents[property]);
        }
    }
    return self;
}
}), new objj_method(sel_getUid("allObjects"), function(self, _cmd)
{ with(self)
{
    var array = [];
    for (var property in _contents)
    {
        if (_contents.hasOwnProperty(property))
            array.push(_contents[property]);
    }
    return array;
}
}), new objj_method(sel_getUid("anyObject"), function(self, _cmd)
{ with(self)
{
    for (var property in _contents)
    {
        if (_contents.hasOwnProperty(property))
            return _contents[property];
    }
    return nil;
}
}), new objj_method(sel_getUid("containsObject:"), function(self, _cmd, anObject)
{ with(self)
{
    if (_contents[objj_msgSend(anObject, "hash")] && objj_msgSend(_contents[objj_msgSend(anObject, "hash")], "isEqual:", anObject))
        return YES;
    return NO;
}
}), new objj_method(sel_getUid("count"), function(self, _cmd)
{ with(self)
{
    return _count;
}
}), new objj_method(sel_getUid("intersectsSet:"), function(self, _cmd, set)
{ with(self)
{
    var items = objj_msgSend(set, "allObjects");
    for (var i = items.length; i > 0; i--)
    {
        if (objj_msgSend(self, "containsObject:", items[i]))
            return YES;
    }
    return NO;
}
}), new objj_method(sel_getUid("isEqualToSet:"), function(self, _cmd, set)
{ with(self)
{
    return self === set || (objj_msgSend(self, "count") === objj_msgSend(set, "count") && objj_msgSend(set, "isSubsetOfSet:", self));
}
}), new objj_method(sel_getUid("isSubsetOfSet:"), function(self, _cmd, set)
{ with(self)
{
    var items = objj_msgSend(self, "allObjects");
    for (var i = 0; i < items.length; i++)
    {
        if (!objj_msgSend(set, "containsObject:", items[i]))
            return NO;
    }
    return YES;
}
}), new objj_method(sel_getUid("makeObjectsPerformSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    objj_msgSend(self, "makeObjectsPerformSelector:withObject:", aSelector, nil);
}
}), new objj_method(sel_getUid("makeObjectsPerformSelector:withObject:"), function(self, _cmd, aSelector, argument)
{ with(self)
{
    var items = objj_msgSend(self, "allObjects");
    for (var i = 0; i < items.length; i++)
    {
        objj_msgSend(items[i], "performSelector:withObject:", aSelector, argument);
    }
}
}), new objj_method(sel_getUid("member:"), function(self, _cmd, object)
{ with(self)
{
    if (objj_msgSend(self, "containsObject:", object))
        return object;
    return nil;
}
}), new objj_method(sel_getUid("objectEnumerator"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "allObjects"), "objectEnumerator");
}
}), new objj_method(sel_getUid("initWithCapacity:"), function(self, _cmd, numItems)
{ with(self)
{
    self = objj_msgSend(self, "init");
    return self;
}
}), new objj_method(sel_getUid("setSet:"), function(self, _cmd, set)
{ with(self)
{
    objj_msgSend(self, "removeAllObjects");
    objj_msgSend(self, "addObjectsFromArray:", objj_msgSend(set, "allObjects"));
}
}), new objj_method(sel_getUid("addObject:"), function(self, _cmd, anObject)
{ with(self)
{
    _contents[objj_msgSend(anObject, "hash")] = anObject;
    _count++;
}
}), new objj_method(sel_getUid("addObjectsFromArray:"), function(self, _cmd, array)
{ with(self)
{
    for (var i = 0, count = array.length; i < count; i++)
    {
        objj_msgSend(self, "addObject:", array[i]);
    }
}
}), new objj_method(sel_getUid("removeObject:"), function(self, _cmd, anObject)
{ with(self)
{
    if (objj_msgSend(self, "containsObject:", anObject))
    {
        delete _contents[objj_msgSend(anObject, "hash")];
        _count--;
    }
}
}), new objj_method(sel_getUid("removeAllObjects"), function(self, _cmd)
{ with(self)
{
    _contents = {};
    _count = 0;
}
}), new objj_method(sel_getUid("intersectSet:"), function(self, _cmd, set)
{ with(self)
{
    var items = objj_msgSend(self, "allObjects");
    for (var i = 0, count = items.length; i < count; i++)
    {
        if (!objj_msgSend(set, "containsObject:", items[i]))
            objj_msgSend(self, "removeObject:", items[i]);
    }
}
}), new objj_method(sel_getUid("minusSet:"), function(self, _cmd, set)
{ with(self)
{
    var items = objj_msgSend(set, "allObjects");
    for (var i = 0; i < items.length; i++)
    {
        if (objj_msgSend(self, "containsObject:", items[i]))
            objj_msgSend(self, "removeObject:", items[i]);
    }
}
}), new objj_method(sel_getUid("unionSet:"), function(self, _cmd, set)
{ with(self)
{
    var items = objj_msgSend(set, "allObjects");
    for (var i = 0, count = items.length; i < count; i++)
    {
        objj_msgSend(self, "addObject:", items[i]);
    }
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("set"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
}), new objj_method(sel_getUid("setWithArray:"), function(self, _cmd, array)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithArray:", array);
}
}), new objj_method(sel_getUid("setWithObject:"), function(self, _cmd, anObject)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithArray:", [anObject]);
}
}), new objj_method(sel_getUid("setWithObjects:count:"), function(self, _cmd, objects, count)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithObjects:count:", objects, count);
}
}), new objj_method(sel_getUid("setWithObjects:"), function(self, _cmd, anObject)
{ with(self)
{
    var set = objj_msgSend(objj_msgSend(self, "alloc"), "init"),
        argLength = arguments.length,
        i = 2;
    for(; i < argLength && ((argument = arguments[i]) !== nil); ++i)
        objj_msgSend(set, "addObject:", argument);
    return set;
}
}), new objj_method(sel_getUid("setWithSet:"), function(self, _cmd, set)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithSet:", set);
}
}), new objj_method(sel_getUid("setWithCapacity:"), function(self, _cmd, numItems)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithCapacity:", numItems);
}
})]);
}
{
var the_class = objj_getClass("CPSet")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPSet\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("copy"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPSet, "alloc"), "initWithSet:", self);
}
}), new objj_method(sel_getUid("mutableCopy"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "copy");
}
})]);
}
var CPSetObjectsKey = "CPSetObjectsKey";
{
var the_class = objj_getClass("CPSet")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPSet\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(self, "initWithArray:", objj_msgSend(aCoder, "decodeObjectForKey:", CPSetObjectsKey));
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self, "allObjects"), CPSetObjectsKey);
}
})]);
}
{var the_class = objj_allocateClassPair(CPSet, "CPMutableSet"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
}

