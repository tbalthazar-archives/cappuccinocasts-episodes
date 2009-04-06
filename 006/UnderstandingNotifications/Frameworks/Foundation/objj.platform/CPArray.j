i;10;CPObject.ji;9;CPRange.ji;14;CPEnumerator.ji;18;CPSortDescriptor.ji;13;CPException.jc;23113;
{var the_class = objj_allocateClassPair(CPEnumerator, "_CPArrayEnumerator"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_array"), new objj_ivar("_index")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithArray:"), function(self, _cmd, anArray)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPEnumerator") }, "init");
    if (self)
    {
        _array = anArray;
        _index = -1;
    }
    return self;
}
}), new objj_method(sel_getUid("nextObject"), function(self, _cmd)
{ with(self)
{
    if (++_index >= objj_msgSend(_array, "count"))
        return nil;
    return objj_msgSend(_array, "objectAtIndex:", _index);
}
})]);
}
{var the_class = objj_allocateClassPair(CPEnumerator, "_CPReverseArrayEnumerator"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_array"), new objj_ivar("_index")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithArray:"), function(self, _cmd, anArray)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPEnumerator") }, "init");
    if (self)
    {
        _array = anArray;
        _index = objj_msgSend(_array, "count");
    }
    return self;
}
}), new objj_method(sel_getUid("nextObject"), function(self, _cmd)
{ with(self)
{
    if (--_index < 0)
        return nil;
    return objj_msgSend(_array, "objectAtIndex:", _index);
}
})]);
}
{var the_class = objj_allocateClassPair(CPObject, "CPArray"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("initWithArray:"), function(self, _cmd, anArray)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        objj_msgSend(self, "setArray:", anArray);
    return self;
}
}), new objj_method(sel_getUid("initWithArray:copyItems:"), function(self, _cmd, anArray, copyItems)
{ with(self)
{
    if (!copyItems)
        return objj_msgSend(self, "initWithArray:", anArray);
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        var index = 0,
            count = objj_msgSend(anArray, "count");
        for(; index < count; ++i)
        {
            if (anArray[i].isa)
                self[i] = objj_msgSend(anArray, "copy");
            else
                self[i] = anArray;
        }
    }
    return self;
}
}), new objj_method(sel_getUid("initWithObjects:"), function(self, _cmd, anArray)
{ with(self)
{
    var i = 2,
        argument;
    for(; i < arguments.length && (argument = arguments[i]) != nil; ++i)
        push(argument);
    return self;
}
}), new objj_method(sel_getUid("initWithObjects:count:"), function(self, _cmd, objects, aCount)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        var index = 0;
        for(; index < aCount; ++index)
            push(objects[index]);
    }
    return self;
}
}), new objj_method(sel_getUid("hash"), function(self, _cmd)
{ with(self)
{
    if (self.__address == nil)
        self.__address = _objj_generateObjectHash();
    return self.__address;
}
}), new objj_method(sel_getUid("containsObject:"), function(self, _cmd, anObject)
{ with(self)
{
    return objj_msgSend(self, "indexOfObject:", anObject) != CPNotFound;
}
}), new objj_method(sel_getUid("count"), function(self, _cmd)
{ with(self)
{
    return length;
}
}), new objj_method(sel_getUid("indexOfObject:"), function(self, _cmd, anObject)
{ with(self)
{
    if (anObject === nil)
        return CPNotFound;
    var i = 0,
        count = length;
    if (anObject.isa)
    {
        for(; i < count; ++i)
            if(objj_msgSend(self[i], "isEqual:", anObject))
                return i;
    }
    else if (self.indexOf)
        return indexOf(anObject);
    else
        for(; i < count; ++i)
            if(self[i] == anObject)
                return i;
    return CPNotFound;
}
}), new objj_method(sel_getUid("indexOfObject:inRange:"), function(self, _cmd, anObject, aRange)
{ with(self)
{
    if (anObject === nil)
        return CPNotFound;
    var i = aRange.location,
        count = MIN(CPMaxRange(aRange), length);
    if (anObject.isa)
    {
        for(; i < count; ++i)
            if(objj_msgSend(self[i], "isEqual:", anObject))
                return i;
    }
    else
        for(; i < count; ++i)
            if(self[i] == anObject)
                return i;
    return CPNotFound;
}
}), new objj_method(sel_getUid("indexOfObjectIdenticalTo:"), function(self, _cmd, anObject)
{ with(self)
{
    if (anObject === nil)
        return CPNotFound;
    if (self.indexOf)
        return indexOf(anObject);
    else
    {
        var index = 0,
            count = length;
        for(; index < count; ++index)
            if(self[index] == anObject)
                return index;
    }
    return CPNotFound;
}
}), new objj_method(sel_getUid("indexOfObjectIdenticalTo:inRange:"), function(self, _cmd, anObject, aRange)
{ with(self)
{
    if (anObject === nil)
        return CPNotFound;
    if (self.indexOf)
    {
        var index = indexOf(anObject, aRange.location);
        if (CPLocationInRange(index, aRange))
            return index;
    }
    else
    {
        var index = aRange.location,
            count = MIN(CPMaxRange(aRange), length);
        for(; index < count; ++index)
            if(self[index] == anObject)
                return index;
    }
    return CPNotFound;
}
}), new objj_method(sel_getUid("indexOfObject:sortedBySelector:"), function(self, _cmd, anObject, aSelector)
{ with(self)
{
    return objj_msgSend(self, "indexOfObject:sortedByFunction:", anObject,  function(lhs, rhs) { objj_msgSend(lhs, aSelector, rhs); });
}
}), new objj_method(sel_getUid("indexOfObject:sortedByFunction:"), function(self, _cmd, anObject, aFunction)
{ with(self)
{
    return objj_msgSend(self, "indexOfObject:sortedByFunction:context:", anObject, aFunction, nil);
}
}), new objj_method(sel_getUid("indexOfObject:sortedByFunction:context:"), function(self, _cmd, anObject, aFunction, aContext)
{ with(self)
{
    if (!aFunction || anObject === undefined)
        return CPNotFound;
    var mid, c, first = 0, last = length - 1;
    while (first <= last)
    {
        mid = FLOOR((first + last) / 2);
          c = aFunction(anObject, self[mid], aContext);
        if (c > 0)
            first = mid + 1;
        else if (c < 0)
            last = mid - 1;
        else
        {
            while (mid < length - 1 && aFunction(anObject, self[mid+1], aContext) == CPOrderedSame)
                mid++;
            return mid;
        }
    }
    return CPNotFound;
}
}), new objj_method(sel_getUid("indexOfObject:sortedByDescriptors:"), function(self, _cmd, anObject, descriptors)
{ with(self)
{
    objj_msgSend(self, "indexOfObject:sortedByFunction:", anObject, function(lhs, rhs)
    {
        var i = 0,
            count = objj_msgSend(descriptors, "count"),
            result = CPOrderedSame;
        while (i < count)
            if((result = objj_msgSend(descriptors[i++], "compareObject:withObject:", lhs, rhs)) != CPOrderedSame)
                return result;
        return result;
    });
}
}), new objj_method(sel_getUid("lastObject"), function(self, _cmd)
{ with(self)
{
    var count = objj_msgSend(self, "count");
    if (!count) return nil;
    return self[count - 1];
}
}), new objj_method(sel_getUid("objectAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return self[anIndex];
}
}), new objj_method(sel_getUid("objectsAtIndexes:"), function(self, _cmd, indexes)
{ with(self)
{
    var index = objj_msgSend(indexes, "firstIndex"),
        objects = [];
    while(index != CPNotFound)
    {
        objj_msgSend(objects, "addObject:", self[index]);
        index = objj_msgSend(indexes, "indexGreaterThanIndex:", index);
    }
    return objects;
}
}), new objj_method(sel_getUid("objectEnumerator"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(_CPArrayEnumerator, "alloc"), "initWithArray:", self);
}
}), new objj_method(sel_getUid("reverseObjectEnumerator"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(_CPReverseArrayEnumerator, "alloc"), "initWithArray:", self);
}
}), new objj_method(sel_getUid("makeObjectsPerformSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    if (!aSelector)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "makeObjectsPerformSelector: 'aSelector' can't be nil");
    var index = 0,
        count = length;
    for(; index < count; ++index)
        objj_msgSend(self[index], aSelector);
}
}), new objj_method(sel_getUid("makeObjectsPerformSelector:withObject:"), function(self, _cmd, aSelector, anObject)
{ with(self)
{
    if (!aSelector)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "makeObjectsPerformSelector:withObject 'aSelector' can't be nil");
    var index = 0,
        count = length;
    for(; index < count; ++index)
        objj_msgSend(self[index], aSelector, anObject);
}
}), new objj_method(sel_getUid("firstObjectCommonWithArray:"), function(self, _cmd, anArray)
{ with(self)
{
    if (!objj_msgSend(anArray, "count") || !objj_msgSend(self, "count"))
        return nil;
    var i = 0,
        count = objj_msgSend(self, "count");
    for(; i < count; ++i)
        if(objj_msgSend(anArray, "containsObject:", self[i]))
            return self[i];
    return nil;
}
}), new objj_method(sel_getUid("isEqualToArray:"), function(self, _cmd, anArray)
{ with(self)
{
    if (self === anArray)
        return YES;
    if(length != anArray.length)
        return NO;
    var index = 0,
        count = objj_msgSend(self, "count");
    for(; index < count; ++index)
    {
        var lhs = self[index],
            rhs = anArray[index];
        if (lhs !== rhs && (!lhs.isa || !rhs.isa || !objj_msgSend(lhs, "isEqual:", rhs)))
            return NO;
    }
    return YES;
}
}), new objj_method(sel_getUid("isEqual:"), function(self, _cmd, anObject)
{ with(self)
{
    if (self === anObject)
        return YES;
    if(!objj_msgSend(anObject, "isKindOfClass:", objj_msgSend(CPArray, "class")))
        return NO;
    return objj_msgSend(self, "isEqualToArray:", anObject);
}
}), new objj_method(sel_getUid("arrayByAddingObject:"), function(self, _cmd, anObject)
{ with(self)
{
    if (anObject === nil || anObject === undefined)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "arrayByAddingObject: object can't be nil");
    var array = objj_msgSend(self, "copy");
    array.push(anObject);
    return array;
}
}), new objj_method(sel_getUid("arrayByAddingObjectsFromArray:"), function(self, _cmd, anArray)
{ with(self)
{
    return slice(0).concat(anArray);
}
}), new objj_method(sel_getUid("subarrayWithRange:"), function(self, _cmd, aRange)
{ with(self)
{
    if (aRange.location < 0 || CPMaxRange(aRange) > length)
        objj_msgSend(CPException, "raise:reason:", CPRangeException, "subarrayWithRange: aRange out of bounds");
    return slice(aRange.location, CPMaxRange(aRange));
}
}), new objj_method(sel_getUid("sortedArrayUsingDescriptors:"), function(self, _cmd, descriptors)
{ with(self)
{
    var sorted = objj_msgSend(self, "copy");
    objj_msgSend(sorted, "sortUsingDescriptors:", descriptors);
    return sorted;
}
}), new objj_method(sel_getUid("sortedArrayUsingFunction:"), function(self, _cmd, aFunction)
{ with(self)
{
    return objj_msgSend(self, "sortedArrayUsingFunction:context:", aFunction, nil);
}
}), new objj_method(sel_getUid("sortedArrayUsingFunction:context:"), function(self, _cmd, aFunction, aContext)
{ with(self)
{
    var sorted = objj_msgSend(self, "copy");
    objj_msgSend(sorted, "sortUsingFunction:context:", aFunction, aContext);
    return sorted;
}
}), new objj_method(sel_getUid("sortedArrayUsingSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    var sorted = objj_msgSend(self, "copy")
    objj_msgSend(sorted, "sortUsingSelector:", aSelector);
    return sorted;
}
}), new objj_method(sel_getUid("componentsJoinedByString:"), function(self, _cmd, aString)
{ with(self)
{
    return join(aString);
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    var i = 0,
        count = objj_msgSend(self, "count"),
        description = '(';
    for(; i < count; ++i)
    {
        if (self[i].isa) description += objj_msgSend(self[i], "description");
        else description += self[i];
        if (i != count - 1) description += ", ";
    }
    return description + ')';
}
}), new objj_method(sel_getUid("pathsMatchingExtensions:"), function(self, _cmd, filterTypes)
{ with(self)
{
    var index = 0,
        count = objj_msgSend(self, "count"),
        array = [];
    for(; index < count; ++index)
        if (self[index].isa && objj_msgSend(self[index], "isKindOfClass:", objj_msgSend(CPString, "class")) && objj_msgSend(filterTypes, "containsObject:", objj_msgSend(self[index], "pathExtension")))
            array.push(self[index]);
    return array;
}
}), new objj_method(sel_getUid("setValue:forKey:"), function(self, _cmd, aValue, aKey)
{ with(self)
{
    var i = 0,
        count = objj_msgSend(self, "count");
    for(; i < count; ++i)
        objj_msgSend(self[i], "setValue:forKey:", aValue, aKey);
}
}), new objj_method(sel_getUid("valueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    var i = 0,
        count = objj_msgSend(self, "count"),
        array = [];
    for(; i < count; ++i)
        array.push(objj_msgSend(self[i], "valueForKey:", aKey));
    return array;
}
}), new objj_method(sel_getUid("copy"), function(self, _cmd)
{ with(self)
{
    return slice(0);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function(self, _cmd)
{ with(self)
{
    return [];
}
}), new objj_method(sel_getUid("array"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
}), new objj_method(sel_getUid("arrayWithArray:"), function(self, _cmd, anArray)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithArray:", anArray);
}
}), new objj_method(sel_getUid("arrayWithObject:"), function(self, _cmd, anObject)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithObjects:", anObject);
}
}), new objj_method(sel_getUid("arrayWithObjects:"), function(self, _cmd, anObject)
{ with(self)
{
    var i = 2,
        array = objj_msgSend(objj_msgSend(self, "alloc"), "init"),
        argument;
    for(; i < arguments.length && (argument = arguments[i]) != nil; ++i)
        array.push(argument);
    return array;
}
}), new objj_method(sel_getUid("arrayWithObjects:count:"), function(self, _cmd, objects, aCount)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithObjects:count:", objects, aCount);
}
})]);
}
{
var the_class = objj_getClass("CPArray")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPArray\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCapacity:"), function(self, _cmd, aCapacity)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("addObject:"), function(self, _cmd, anObject)
{ with(self)
{
    push(anObject);
}
}), new objj_method(sel_getUid("addObjectsFromArray:"), function(self, _cmd, anArray)
{ with(self)
{
    splice.apply(self, [length, 0].concat(anArray));
}
}), new objj_method(sel_getUid("insertObject:atIndex:"), function(self, _cmd, anObject, anIndex)
{ with(self)
{
    splice(anIndex, 0, anObject);
}
}), new objj_method(sel_getUid("insertObjects:atIndexes:"), function(self, _cmd, objects, indexes)
{ with(self)
{
    var indexesCount = objj_msgSend(indexes, "count"),
        objectsCount = objj_msgSend(objects, "count");
    if(indexesCount !== objectsCount)
        objj_msgSend(CPException, "raise:reason:", CPRangeException, "the counts of the passed-in array (" + objectsCount + ") and index set (" + indexesCount + ") must be identical.");
    var lastIndex = objj_msgSend(indexes, "lastIndex");
    if(lastIndex >= objj_msgSend(self, "count") + indexesCount)
        objj_msgSend(CPException, "raise:reason:", CPRangeException, "the last index (" + lastIndex + ") must be less than the sum of the original count (" + objj_msgSend(self, "count") + ") and the insertion count (" + indexesCount + ").");
    var index = 0,
        currentIndex = objj_msgSend(indexes, "firstIndex");
    for (; index < objectsCount; ++index, currentIndex = objj_msgSend(indexes, "indexGreaterThanIndex:", currentIndex))
        objj_msgSend(self, "insertObject:atIndex:", objects[index], currentIndex);
}
}), new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"), function(self, _cmd, anIndex, anObject)
{ with(self)
{
    self[anIndex] = anObject;
}
}), new objj_method(sel_getUid("replaceObjectsAtIndexes:withObjects:"), function(self, _cmd, anIndexSet, objects)
{ with(self)
{
    var i = 0,
        index = objj_msgSend(anIndexSet, "firstIndex");
    while(index != CPNotFound)
    {
        objj_msgSend(self, "replaceObjectAtIndex:withObject:", index, objects[i++]);
        index = objj_msgSend(anIndexSet, "indexGreaterThanIndex:", index);
    }
}
}), new objj_method(sel_getUid("replaceObjectsInRange:withObjectsFromArray:range:"), function(self, _cmd, aRange, anArray, otherRange)
{ with(self)
{
    if (!otherRange.location && otherRange.length == objj_msgSend(anArray, "count"))
        objj_msgSend(self, "replaceObjectsInRange:withObjectsFromArray:", aRange, anArray);
    else
        splice.apply(self, [aRange.location, aRange.length].concat(objj_msgSend(anArray, "subarrayWithRange:", otherRange)));
}
}), new objj_method(sel_getUid("replaceObjectsInRange:withObjectsFromArray:"), function(self, _cmd, aRange, anArray)
{ with(self)
{
    splice.apply(self, [aRange.location, aRange.length].concat(anArray));
}
}), new objj_method(sel_getUid("setArray:"), function(self, _cmd, anArray)
{ with(self)
{
    if(self == anArray) return;
    splice.apply(self, [0, length].concat(anArray));
}
}), new objj_method(sel_getUid("removeAllObjects"), function(self, _cmd)
{ with(self)
{
    splice(0, length);
}
}), new objj_method(sel_getUid("removeLastObject"), function(self, _cmd)
{ with(self)
{
    pop();
}
}), new objj_method(sel_getUid("removeObject:"), function(self, _cmd, anObject)
{ with(self)
{
    objj_msgSend(self, "removeObject:inRange:", anObject, CPMakeRange(0, length));
}
}), new objj_method(sel_getUid("removeObject:inRange:"), function(self, _cmd, anObject, aRange)
{ with(self)
{
    var index;
    while ((index = objj_msgSend(self, "indexOfObject:inRange:", anObject, aRange)) != CPNotFound)
    {
        objj_msgSend(self, "removeObjectAtIndex:", index);
        aRange = CPIntersectionRange(CPMakeRange(index, length - index), aRange);
    }
}
}), new objj_method(sel_getUid("removeObjectAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    splice(anIndex, 1);
}
}), new objj_method(sel_getUid("removeObjectsAtIndexes:"), function(self, _cmd, anIndexSet)
{ with(self)
{
    var index = objj_msgSend(anIndexSet, "lastIndex");
    while (index != CPNotFound)
    {
        objj_msgSend(self, "removeObjectAtIndex:", index);
        index = objj_msgSend(anIndexSet, "indexLessThanIndex:", index);
    }
}
}), new objj_method(sel_getUid("removeObjectIdenticalTo:"), function(self, _cmd, anObject)
{ with(self)
{
    objj_msgSend(self, "removeObjectIdenticalTo:inRange:", anObject, CPMakeRange(0, length));
}
}), new objj_method(sel_getUid("removeObjectIdenticalTo:inRange:"), function(self, _cmd, anObject, aRange)
{ with(self)
{
    var index;
    while ((index = objj_msgSend(self, "indexOfObjectIdenticalTo:inRange:", anObject, aRange)) != CPNotFound)
    {
        objj_msgSend(self, "removeObjectAtIndex:", index);
        aRange = CPIntersectionRange(CPMakeRange(index, length - index), aRange);
    }
}
}), new objj_method(sel_getUid("removeObjectsInArray:"), function(self, _cmd, anArray)
{ with(self)
{
    var index = 0,
        count = objj_msgSend(anArray, "count");
    for (; index < count; ++index)
        objj_msgSend(self, "removeObject:", anArray[index]);
}
}), new objj_method(sel_getUid("removeObjectsInRange:"), function(self, _cmd, aRange)
{ with(self)
{
    splice(aRange.location, aRange.length);
}
}), new objj_method(sel_getUid("exchangeObjectAtIndex:withObjectAtIndex:"), function(self, _cmd, anIndex, otherIndex)
{ with(self)
{
    var temporary = self[anIndex];
    self[anIndex] = self[otherIndex];
    self[otherIndex] = temporary;
}
}), new objj_method(sel_getUid("sortUsingDescriptors:"), function(self, _cmd, descriptors)
{ with(self)
{
    sort(function(lhs, rhs)
    {
        var i = 0,
            count = objj_msgSend(descriptors, "count"),
            result = CPOrderedSame;
        while(i < count)
            if((result = objj_msgSend(descriptors[i++], "compareObject:withObject:", lhs, rhs)) != CPOrderedSame)
                return result;
        return result;
    });
}
}), new objj_method(sel_getUid("sortUsingFunction:context:"), function(self, _cmd, aFunction, aContext)
{ with(self)
{
    sort(function(lhs, rhs) { return aFunction(lhs, rhs, aContext); });
}
}), new objj_method(sel_getUid("sortUsingSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    sort(function(lhs, rhs) { return objj_msgSend(lhs, aSelector, rhs); });
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("arrayWithCapacity:"), function(self, _cmd, aCapacity)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithCapacity:", aCapacity);
}
})]);
}
{
var the_class = objj_getClass("CPArray")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPArray\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(aCoder, "decodeObjectForKey:", "CP.objects");
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "_encodeArrayOfObjects:forKey:", self, "CP.objects");
}
})]);
}
{var the_class = objj_allocateClassPair(CPArray, "CPMutableArray"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
}
Array.prototype.isa = CPArray;
objj_msgSend(CPArray, "initialize");

