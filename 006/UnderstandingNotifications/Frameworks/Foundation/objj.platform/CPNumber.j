i;10;CPObject.ji;15;CPObjJRuntime.jc;7267;
var __placeholder = new Number(),
    _CPNumberHashes = { };
{var the_class = objj_allocateClassPair(CPObject, "CPNumber"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithBool:"), function(self, _cmd, aBoolean)
{ with(self)
{
    return aBoolean;
}
}), new objj_method(sel_getUid("initWithChar:"), function(self, _cmd, aChar)
{ with(self)
{
    if (aChar.charCodeAt)
        return aChar.charCodeAt(0);
    return aChar;
}
}), new objj_method(sel_getUid("initWithDouble:"), function(self, _cmd, aDouble)
{ with(self)
{
    return aDouble;
}
}), new objj_method(sel_getUid("initWithFloat:"), function(self, _cmd, aFloat)
{ with(self)
{
    return aFloat;
}
}), new objj_method(sel_getUid("initWithInt:"), function(self, _cmd, anInt)
{ with(self)
{
    return anInt;
}
}), new objj_method(sel_getUid("initWithLong:"), function(self, _cmd, aLong)
{ with(self)
{
    return aLong;
}
}), new objj_method(sel_getUid("initWithLongLong:"), function(self, _cmd, aLongLong)
{ with(self)
{
    return aLongLong;
}
}), new objj_method(sel_getUid("initWithShort:"), function(self, _cmd, aShort)
{ with(self)
{
    return aShort;
}
}), new objj_method(sel_getUid("initWithUnsignedChar:"), function(self, _cmd, aChar)
{ with(self)
{
    if (aChar.charCodeAt)
        return aChar.charCodeAt(0);
    return aChar;
}
}), new objj_method(sel_getUid("initWithUnsignedInt:"), function(self, _cmd, anUnsignedInt)
{ with(self)
{
    return anUnsignedInt;
}
}), new objj_method(sel_getUid("initWithUnsignedLong:"), function(self, _cmd, anUnsignedLong)
{ with(self)
{
    return anUnsignedLong;
}
}), new objj_method(sel_getUid("initWithUnsignedShort:"), function(self, _cmd, anUnsignedShort)
{ with(self)
{
    return anUnsignedShort;
}
}), new objj_method(sel_getUid("hash"), function(self, _cmd)
{ with(self)
{
    if (!_CPNumberHashes[self])
        _CPNumberHashes[self] = _objj_generateObjectHash();
    return _CPNumberHashes[self];
}
}), new objj_method(sel_getUid("boolValue"), function(self, _cmd)
{ with(self)
{
    return self ? true : false;
}
}), new objj_method(sel_getUid("charValue"), function(self, _cmd)
{ with(self)
{
    return String.fromCharCode(self);
}
}), new objj_method(sel_getUid("decimalValue"), function(self, _cmd)
{ with(self)
{
    objj_throw_exception("decimalValue: NOT YET IMPLEMENTED");
}
}), new objj_method(sel_getUid("descriptionWithLocale:"), function(self, _cmd, aDictionary)
{ with(self)
{
    if (!aDictionary) return toString();
    objj_throw_exception("descriptionWithLocale: NOT YET IMPLEMENTED");
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "descriptionWithLocale:", nil);
}
}), new objj_method(sel_getUid("doubleValue"), function(self, _cmd)
{ with(self)
{
    if (typeof self == "boolean") return self ? 1 : 0;
    return self;
}
}), new objj_method(sel_getUid("floatValue"), function(self, _cmd)
{ with(self)
{
    if (typeof self == "boolean") return self ? 1 : 0;
    return self;
}
}), new objj_method(sel_getUid("intValue"), function(self, _cmd)
{ with(self)
{
    if (typeof self == "boolean") return self ? 1 : 0;
    return self;
}
}), new objj_method(sel_getUid("longLongValue"), function(self, _cmd)
{ with(self)
{
    if (typeof self == "boolean") return self ? 1 : 0;
    return self;
}
}), new objj_method(sel_getUid("longValue"), function(self, _cmd)
{ with(self)
{
    if (typeof self == "boolean") return self ? 1 : 0;
    return self;
}
}), new objj_method(sel_getUid("shortValue"), function(self, _cmd)
{ with(self)
{
    if (typeof self == "boolean") return self ? 1 : 0;
    return self;
}
}), new objj_method(sel_getUid("stringValue"), function(self, _cmd)
{ with(self)
{
    return toString();
}
}), new objj_method(sel_getUid("unsignedCharValue"), function(self, _cmd)
{ with(self)
{
    return String.fromCharCode(self);
}
}), new objj_method(sel_getUid("unsignedIntValue"), function(self, _cmd)
{ with(self)
{
    if (typeof self == "boolean") return self ? 1 : 0;
    return self;
}
}), new objj_method(sel_getUid("unsignedLongValue"), function(self, _cmd)
{ with(self)
{
    if (typeof self == "boolean") return self ? 1 : 0;
    return self;
}
}), new objj_method(sel_getUid("unsignedShortValue"), function(self, _cmd)
{ with(self)
{
    if (typeof self == "boolean") return self ? 1 : 0;
    return self;
}
}), new objj_method(sel_getUid("compare:"), function(self, _cmd, aNumber)
{ with(self)
{
    if (self > aNumber) return CPOrderedDescending;
    else if (self < aNumber) return CPOrderedAscending;
    return CPOrderedSame;
}
}), new objj_method(sel_getUid("isEqualToNumber:"), function(self, _cmd, aNumber)
{ with(self)
{
    return self == aNumber;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function(self, _cmd)
{ with(self)
{
    return __placeholder;
}
}), new objj_method(sel_getUid("numberWithBool:"), function(self, _cmd, aBoolean)
{ with(self)
{
    return aBoolean;
}
}), new objj_method(sel_getUid("numberWithChar:"), function(self, _cmd, aChar)
{ with(self)
{
    if (aChar.charCodeAt)
        return aChar.charCodeAt(0);
    return aChar;
}
}), new objj_method(sel_getUid("numberWithDouble:"), function(self, _cmd, aDouble)
{ with(self)
{
    return aDouble;
}
}), new objj_method(sel_getUid("numberWithFloat:"), function(self, _cmd, aFloat)
{ with(self)
{
    return aFloat;
}
}), new objj_method(sel_getUid("numberWithInt:"), function(self, _cmd, anInt)
{ with(self)
{
    return anInt;
}
}), new objj_method(sel_getUid("numberWithLong:"), function(self, _cmd, aLong)
{ with(self)
{
    return aLong;
}
}), new objj_method(sel_getUid("numberWithLongLong:"), function(self, _cmd, aLongLong)
{ with(self)
{
    return aLongLong;
}
}), new objj_method(sel_getUid("numberWithShort:"), function(self, _cmd, aShort)
{ with(self)
{
    return aShort;
}
}), new objj_method(sel_getUid("numberWithUnsignedChar:"), function(self, _cmd, aChar)
{ with(self)
{
    if (aChar.charCodeAt)
        return aChar.charCodeAt(0);
    return aChar;
}
}), new objj_method(sel_getUid("numberWithUnsignedInt:"), function(self, _cmd, anUnsignedInt)
{ with(self)
{
    return anUnsignedInt;
}
}), new objj_method(sel_getUid("numberWithUnsignedLong:"), function(self, _cmd, anUnsignedLong)
{ with(self)
{
    return anUnsignedLong;
}
}), new objj_method(sel_getUid("numberWithUnsignedShort:"), function(self, _cmd, anUnsignedShort)
{ with(self)
{
    return anUnsignedShort;
}
})]);
}
{
var the_class = objj_getClass("CPNumber")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPNumber\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    return objj_msgSend(aCoder, "decodeNumber");
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeNumber:forKey:", self, "self");
}
})]);
}
Number.prototype.isa = CPNumber;
Boolean.prototype.isa = CPNumber;
objj_msgSend(CPNumber, "initialize");

