i;9;CPRange.ji;10;CPObject.jc;17421;
{var the_class = objj_allocateClassPair(CPObject, "CPIndexSet"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_count"), new objj_ivar("_cachedRangeIndex"), new objj_ivar("_ranges")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _count = 0;
        _ranges = [];
        _cachedRangeIndex = 0;
    }
    return self;
}
}), new objj_method(sel_getUid("initWithIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _count = 1;
        _ranges = objj_msgSend(CPArray, "arrayWithObject:", CPMakeRange(anIndex, 1));
        _cachedRangeIndex = 0;
    }
    return self;
}
}), new objj_method(sel_getUid("initWithIndexesInRange:"), function(self, _cmd, aRange)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _count = aRange.length;
        _ranges = objj_msgSend(CPArray, "arrayWithObject:", aRange);
        _cachedRangeIndex = 0;
    }
    return self;
}
}), new objj_method(sel_getUid("initWithIndexSet:"), function(self, _cmd, anIndexSet)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _count = objj_msgSend(anIndexSet, "count");
        _ranges = [];
        _cachedRangeIndex = 0;
        var index = 0,
            count = anIndexSet._ranges.length;
        for (; index < count; ++index)
            _ranges.push(CPCopyRange(anIndexSet._ranges[index]));
    }
    return self;
}
}), new objj_method(sel_getUid("isEqualToIndexSet:"), function(self, _cmd, anIndexSet)
{ with(self)
{
 if (self == anIndexSet)
    return YES;
    var i = 0,
        count = _ranges.length;
        otherRanges = anIndexSet._ranges;
 if (count != otherRanges.length || _count != objj_msgSend(anIndexSet, "count"))
    return NO;
 for (; i < count; ++i)
  if (!CPEqualRanges(_ranges[i], otherRanges[i]))
   return NO;
 return YES;
}
}), new objj_method(sel_getUid("containsIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return objj_msgSend(self, "containsIndexesInRange:", CPMakeRange(anIndex, 1));
}
}), new objj_method(sel_getUid("containsIndexesInRange:"), function(self, _cmd, aRange)
{ with(self)
{
    if(!_count)
        return NO;
    var i = SOERangeIndex(self, aRange.location),
     lower = aRange.location,
     upper = CPMaxRange(aRange),
     count = _ranges.length;
    for(;i < count && _ranges[i].location < upper; ++i)
     if (_ranges[i].location <= lower && CPMaxRange(_ranges[i]) >= upper)
     {
            _cachedRangeIndex = i;
            return YES;
        }
    _cachedRangeIndex = i;
    return NO;
}
}), new objj_method(sel_getUid("containsIndexes:"), function(self, _cmd, anIndexSet)
{ with(self)
{
    if(!objj_msgSend(anIndexSet, "count"))
        return YES;
    if(!_count)
        return NO;
    var i = 0,
        count = _ranges.length;
    for(; i < count; ++i)
        if (!objj_msgSend(anIndexSet, "containsIndexesInRange:", _ranges[i]))
            return NO;
    return YES;
}
}), new objj_method(sel_getUid("intersectsIndexesInRange:"), function(self, _cmd, aRange)
{ with(self)
{
    if(!_count)
        return NO;
    var i = SOERangeIndex(self, aRange.location),
        count = _ranges.length,
        upper = CPMaxRange(aRange);
    for (; i < count && _ranges[i].location < upper; ++i)
        if(CPIntersectionRange(aRange, _ranges[i]).length)
            return YES;
    return NO;
}
}), new objj_method(sel_getUid("count"), function(self, _cmd)
{ with(self)
{
    return _count;
}
}), new objj_method(sel_getUid("firstIndex"), function(self, _cmd)
{ with(self)
{
    return _count ? _ranges[0].location : CPNotFound;
}
}), new objj_method(sel_getUid("lastIndex"), function(self, _cmd)
{ with(self)
{
    return _count ? CPMaxRange(_ranges[_ranges.length - 1]) - 1 : CPNotFound;
}
}), new objj_method(sel_getUid("indexGreaterThanIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    if(!_count)
        return CPNotFound;
    var i = SOERangeIndex(self, anIndex++),
        count = _ranges.length;
    for(; i < count && anIndex >= CPMaxRange(_ranges[i]); ++i) ;
    if (i == count)
        return CPNotFound;
    _cachedRangeIndex = i;
    if (anIndex < _ranges[i].location)
        return _ranges[i].location;
    return anIndex;
}
}), new objj_method(sel_getUid("indexLessThanIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    if (!_count)
        return CPNotFound;
    var i = GOERangeIndex(self, anIndex--);
    for (; i >= 0 && anIndex < _ranges[i].location; --i) ;
    if(i < 0)
        return CPNotFound;
    _cachedRangeIndex = i;
   if (CPLocationInRange(anIndex, _ranges[i]))
        return anIndex;
    if (CPMaxRange(_ranges[i]) - 1 < anIndex)
        return CPMaxRange(_ranges[i]) - 1;
    return CPNotFound;
}
}), new objj_method(sel_getUid("indexGreaterThanOrEqualToIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
 return objj_msgSend(self, "indexGreaterThanIndex:", anIndex - 1);
}
}), new objj_method(sel_getUid("indexLessThanOrEqualToIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
 return objj_msgSend(self, "indexLessThanIndex:", anIndex + 1);
}
}), new objj_method(sel_getUid("getIndexes:maxCount:inIndexRange:"), function(self, _cmd, anArray, aMaxCount, aRangePointer)
{ with(self)
{
    if (!_count || aMaxCount <= 0 || aRangePointer && !aRangePointer.length)
        return 0;
    var i = SOERangeIndex(self, aRangePointer? aRangePointer.location : 0),
        total = 0,
        count = _ranges.length;
    for (; i < count; ++i)
    {
        var intersection = aRangePointer ? CPIntersectionRange(_ranges[i], aRangePointer) : _ranges[i],
            index = intersection.location,
            maximum = CPMaxRange(intersection);
        for (; index < maximum; ++index)
        {
            anArray[total++] = index;
            if (total == aMaxCount)
            {
                if (aRangePointer)
                {
                    var upper = CPMaxRange(aRangePointer);
                    aRangePointer.location = index + 1;
                    aRangePointer.length = upper - index - 1;
                }
                return aMaxCount;
            }
        }
    }
    if (aRangePointer)
    {
        aRangePointer.location = CPNotFound;
        aRangePointer.length = 0;
    }
    return total;
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    var desc = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "description") + " ";
 if (_count)
 {
  desc += "[number of indexes: " + _count + " (in " + _ranges.length + " ranges), indexes: (";
  for (i = 0; i < _ranges.length; i++)
  {
   desc += _ranges[i].location;
   if (_ranges[i].length > 1) desc += "-" + (CPMaxRange(_ranges[i])-1) + ":"+_ranges[i].length+":";
   if (i+1 < _ranges.length) desc += " ";
  }
  desc += ")]";
 }
 else
  desc += "(no indexes)";
 return desc;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("indexSet"), function(self, _cmd)
{ with(self)
{
 return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
}), new objj_method(sel_getUid("indexSetWithIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
 return objj_msgSend(objj_msgSend(self, "alloc"), "initWithIndex:", anIndex);
}
}), new objj_method(sel_getUid("indexSetWithIndexesInRange:"), function(self, _cmd, aRange)
{ with(self)
{
 return objj_msgSend(objj_msgSend(self, "alloc"), "initWithIndexesInRange:", aRange);
}
})]);
}
{
var the_class = objj_getClass("CPIndexSet")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPIndexSet\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("addIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    objj_msgSend(self, "addIndexesInRange:", CPMakeRange(anIndex, 1));
}
}), new objj_method(sel_getUid("addIndexes:"), function(self, _cmd, anIndexSet)
{ with(self)
{
    var i = 0,
        ranges = anIndexSet._ranges,
        count = ranges.length;
    for(; i < count; ++i)
        objj_msgSend(self, "addIndexesInRange:", ranges[i]);
}
}), new objj_method(sel_getUid("addIndexesInRange:"), function(self, _cmd, aRange)
{ with(self)
{
    if (_ranges.length == 0)
    {
        _count = aRange.length;
        return objj_msgSend(_ranges, "addObject:", CPCopyRange(aRange));
    }
    var i = SOERangeIndex(self, aRange.location),
        count = _ranges.length,
        padded = CPMakeRange(aRange.location - 1, aRange.length + 2),
        maximum = CPMaxRange(aRange);
    if (count && CPMaxRange(_ranges[count - 1]) < aRange.location)
        objj_msgSend(_ranges, "addObject:", CPCopyRange(aRange));
    else
        for (; i < count; ++i)
        {
            if (maximum < _ranges[i].location)
            {
                _count += aRange.length;
                if (i < _cachedRangeIndex) ++_cachedRangeIndex;
                return objj_msgSend(_ranges, "insertObject:atIndex:", CPCopyRange(aRange), i);
            }
            if (CPIntersectionRange(_ranges[i], padded).length)
            {
                var union = CPUnionRange(_ranges[i], aRange);
                if (union.length == _ranges[i].length)
                    return;
                 ++union.length;
                var j = i;
                for(; j < count; ++j)
                    if(CPIntersectionRange(union, _ranges[j]).length)
                        _count -= _ranges[j].length;
                    else
                        break;
                --union.length;
                _ranges[i] = union;
                if (j - i - 1 > 0)
                {
                    var remove = CPMakeRange(i + 1, j - i - 1);
                    _ranges[i] = CPUnionRange(_ranges[i], _ranges[j - 1]);
                    objj_msgSend(_ranges, "removeObjectsInRange:", remove);
                    if (_cachedRangeIndex >= CPMaxRange(remove)) _cachedRangedIndex -= remove.length;
                    else if (CPLocationInRange(_cachedRangeIndex, remove)) _cachedRangeIndex = i;
                }
                _count += _ranges[i].length;
                return;
            }
        }
    _count += aRange.length;
}
}), new objj_method(sel_getUid("removeIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    objj_msgSend(self, "removeIndexesInRange:", CPMakeRange(anIndex, 1));
}
}), new objj_method(sel_getUid("removeIndexes:"), function(self, _cmd, anIndexSet)
{ with(self)
{
    var i = 0,
        ranges = anIndexSet._ranges,
        count = ranges.length;
    for(; i < count; ++i)
        objj_msgSend(self, "removeIndexesInRange:", ranges[i]);
}
}), new objj_method(sel_getUid("removeAllIndexes"), function(self, _cmd)
{ with(self)
{
    _ranges = [];
 _count = 0;
    _cachedRangeIndex = 0;
}
}), new objj_method(sel_getUid("removeIndexesInRange:"), function(self, _cmd, aRange)
{ with(self)
{
    var i = SOERangeIndex(self, aRange.location),
        count = _ranges.length,
        maximum = CPMaxRange(aRange),
        removal = CPMakeRange(CPNotFound, 0);
    for (; i < count; ++i)
    {
        var range = _ranges[i];
        if (maximum < range.location)
            break;
        var intersection = CPIntersectionRange(range, aRange);
        if (!intersection.length)
            continue;
        else if (intersection.length == range.length)
        {
            if (removal.location == CPNotFound)
                removal = CPMakeRange(i, 1);
            else
                ++removal.length;
        }
        else if (intersection.location > range.location && CPMaxRange(intersection) < CPMaxRange(range))
        {
            var insert = CPMakeRange(CPMaxRange(intersection), CPMaxRange(range) - CPMaxRange(intersection));
            range.length = intersection.location - range.location;
            _count -= intersection.length;
            return objj_msgSend(_ranges, "insertObject:atIndex:", insert, i + 1);
        }
        else
        {
            range.length -= intersection.length;
            if (intersection.location <= range.location)
                range.location += intersection.length;
        }
        _count -= intersection.length;
    }
    if (removal.length)
        objj_msgSend(_ranges, "removeObjectsInRange:", removal);
}
}), new objj_method(sel_getUid("shiftIndexesStartingAtIndex:by:"), function(self, _cmd, anIndex, aDelta)
{ with(self)
{
 if (!_count || aDelta == 0)
    return;
    var i = _ranges.length - 1,
        shifted = CPMakeRange(CPNotFound, 0);
    for(; i >= 0; --i)
    {
        var range = _ranges[i],
            maximum = CPMaxRange(range);
        if (anIndex > maximum)
            break;
        if (anIndex > range.location && anIndex < maximum)
        {
            shifted = CPMakeRange(anIndex + aDelta, maximum - anIndex);
            range.length = anIndex - range.location;
            if (aDelta > 0)
                objj_msgSend(_ranges, "insertObject:atIndex:", shifted, i + 1);
            else if (shifted.location < 0)
            {
                shifted.length = CPMaxRange(shifted);
                shifted.location = 0;
            }
            break;
        }
        if ((range.location += aDelta) < 0)
        {
            range.length = CPMaxRange(range);
            range.location = 0;
        }
    }
    if (aDelta < 0)
    {
        var j = i + 1,
            count = _ranges.length,
            shifts = [];
        for (; j < count; ++j)
            objj_msgSend(shifts, "addObject:", _ranges[j]);
        if ((j = i + 1) < count)
        {
            objj_msgSend(_ranges, "removeObjectsInRange:", CPMakeRange(j, count - j));
            for (j = 0, count = shifts.length; j < count; ++j)
                objj_msgSend(self, "addIndexesInRange:", shifts[j]);
        }
        if (shifted.location != CPNotFound)
            objj_msgSend(self, "addIndexesInRange:", shifted);
    }
}
})]);
}
var CPIndexSetCountKey = "CPIndexSetCountKey",
    CPIndexSetCachedRangeIndexKey = "CPIndexSetCachedRangeIndexKey",
    CPIndexSetRangeStringsKey = "CPIndexSetRangeStringsKey";
{
var the_class = objj_getClass("CPIndexSet")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPIndexSet\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _count = objj_msgSend(aCoder, "decodeIntForKey:", CPIndexSetCountKey);
        _cachedRangeIndex = objj_msgSend(aCoder, "decodeIntForKey:", CPIndexSetCachedRangeIndexKey);
        _ranges = [];
        var rangeStrings = objj_msgSend(aCoder, "decodeObjectForKey:", CPIndexSetRangeStringsKey),
            index = 0,
            count = rangeStrings.length;
        for (; index < count; ++index)
            _ranges.push(CPRangeFromString(rangeStrings[index]));
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeInt:forKey:", _count, CPIndexSetCountKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _cachedRangeIndex, CPIndexSetCachedRangeIndexKey);
    var index = 0,
        count = _ranges.length,
        rangeStrings = [];
    for (; index < count; ++index)
        rangeStrings[index] = CPStringFromRange(_ranges[index]);
    objj_msgSend(aCoder, "encodeObject:forKey:", rangeStrings, CPIndexSetRangeStringsKey);
}
})]);
}
{
var the_class = objj_getClass("CPIndexSet")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPIndexSet\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("copy"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "initWithIndexSet:", self);
}
}), new objj_method(sel_getUid("mutableCopy"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "initWithIndexSet:", self);
}
})]);
}
{var the_class = objj_allocateClassPair(CPIndexSet, "CPMutableIndexSet"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
}
var SOERangeIndex = function(anIndexSet, anIndex)
{
    var ranges = anIndexSet._ranges,
        cachedRangeIndex = 0;
    if(cachedRangeIndex < ranges.length && anIndex >= ranges[cachedRangeIndex].location)
        return cachedRangeIndex;
    return 0;
}
var GOERangeIndex = function(anIndexSet, anIndex)
{
    var ranges = anIndexSet._ranges,
        cachedRangeIndex = anIndexSet._ranges.length;
    if(cachedRangeIndex < ranges.length && anIndex <= ranges[cachedRangeIndex].location)
        return cachedRangeIndex;
    return ranges.length - 1;
}

