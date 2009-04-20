i;7;CPSet.jc;1671;

{var the_class = objj_allocateClassPair(CPMutableSet, "CPCountedSet"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_counts")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("addObject:"), function(self, _cmd, anObject)
{ with(self)
{
    if (!_counts)
        _counts = {};

    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPMutableSet") }, "addObject:", anObject);

    var hash = objj_msgSend(anObject, "hash");

    if (_counts[hash] === undefined)
        _counts[hash] = 1;
    else
        ++_counts[hash];
}
}), new objj_method(sel_getUid("removeObject:"), function(self, _cmd, anObject)
{ with(self)
{
    if (!_counts)
        return;

    var hash = objj_msgSend(anObject, "hash");

    if (_counts[hash] === undefined)
        return;

    else
    {
        --_counts[hash];

        if (_counts[hash] === 0)
        {
            delete _counts[hash];
            objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPMutableSet") }, "removeObject:", anObject);
        }
    }
}
}), new objj_method(sel_getUid("removeAllObjects"), function(self, _cmd)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPMutableSet") }, "removeAllObjects");
    _counts = {};
}
}), new objj_method(sel_getUid("countForObject:"), function(self, _cmd, anObject)
{ with(self)
{
    if (!_counts)
        _counts = {};

    var hash = objj_msgSend(anObject, "hash");

    if (_counts[hash] === undefined)
        return 0;

    return _counts[hash];
}
})]);
}

