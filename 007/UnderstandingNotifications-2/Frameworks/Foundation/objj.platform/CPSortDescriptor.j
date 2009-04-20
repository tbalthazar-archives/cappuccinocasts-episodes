i;10;CPObject.ji;15;CPObjJRuntime.jc;1863;
CPOrderedAscending = -1;
CPOrderedSame = 0;
CPOrderedDescending = 1;
{var the_class = objj_allocateClassPair(CPObject, "CPSortDescriptor"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_key"), new objj_ivar("_selector"), new objj_ivar("_ascending")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithKey:ascending:"), function(self, _cmd, aKey, isAscending)
{ with(self)
{
    return objj_msgSend(self, "initWithKey:ascending:selector:", aKey, isAscending, sel_getUid("compare:"));
}
}), new objj_method(sel_getUid("initWithKey:ascending:selector:"), function(self, _cmd, aKey, isAscending, aSelector)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _key = aKey;
        _ascending = isAscending;
        _selector = aSelector;
    }
    return self;
}
}), new objj_method(sel_getUid("ascending"), function(self, _cmd)
{ with(self)
{
    return _ascending;
}
}), new objj_method(sel_getUid("key"), function(self, _cmd)
{ with(self)
{
    return _key;
}
}), new objj_method(sel_getUid("selector"), function(self, _cmd)
{ with(self)
{
    return _selector;
}
}), new objj_method(sel_getUid("compareObject:withObject:"), function(self, _cmd, lhsObject, rhsObject)
{ with(self)
{
    return (_ascending ? 1 : -1) * objj_msgSend(objj_msgSend(lhsObject, "valueForKey:", _key), "performSelector:withObject:", _selector, objj_msgSend(rhsObject, "valueForKey:", _key));
}
}), new objj_method(sel_getUid("reversedSortDescriptor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "initWithKey:ascending:selector:", _key, !_ascending, _selector);
}
})]);
}

