i;10;CPObject.ji;13;CPException.jc;2259;
{var the_class = objj_allocateClassPair(CPObject, "CPCoder"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("allowsKeyedCoding"), function(self, _cmd)
{ with(self)
{
   return NO;
}
}), new objj_method(sel_getUid("encodeValueOfObjCType:at:"), function(self, _cmd, aType, anObject)
{ with(self)
{
   CPInvalidAbstractInvocation();
}
}), new objj_method(sel_getUid("encodeDataObject:"), function(self, _cmd, aData)
{ with(self)
{
   CPInvalidAbstractInvocation();
}
}), new objj_method(sel_getUid("encodeObject:"), function(self, _cmd, anObject)
{ with(self)
{
}
}), new objj_method(sel_getUid("encodePoint:"), function(self, _cmd, aPoint)
{ with(self)
{
    objj_msgSend(self, "encodeNumber:", aPoint.x);
    objj_msgSend(self, "encodeNumber:", aPoint.y);
}
}), new objj_method(sel_getUid("encodeRect:"), function(self, _cmd, aRect)
{ with(self)
{
    objj_msgSend(self, "encodePoint:", aRect.origin);
    objj_msgSend(self, "encodeSize:", aRect.size);
}
}), new objj_method(sel_getUid("encodeSize:"), function(self, _cmd, aSize)
{ with(self)
{
    objj_msgSend(self, "encodeNumber:", aSize.width);
    objj_msgSend(self, "encodeNumber:", aSize.height);
}
}), new objj_method(sel_getUid("encodePropertyList:"), function(self, _cmd, aPropertyList)
{ with(self)
{
}
}), new objj_method(sel_getUid("encodeRootObject:"), function(self, _cmd, anObject)
{ with(self)
{
   objj_msgSend(self, "encodeObject:", anObject);
}
}), new objj_method(sel_getUid("encodeBycopyObject:"), function(self, _cmd, anObject)
{ with(self)
{
   objj_msgSend(self, "encodeObject:", object);
}
}), new objj_method(sel_getUid("encodeConditionalObject:"), function(self, _cmd, anObject)
{ with(self)
{
   objj_msgSend(self, "encodeObject:", object);
}
})]);
}
{
var the_class = objj_getClass("CPObject")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPObject\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("awakeAfterUsingCoder:"), function(self, _cmd, aDecoder)
{ with(self)
{
    return self;
}
})]);
}

