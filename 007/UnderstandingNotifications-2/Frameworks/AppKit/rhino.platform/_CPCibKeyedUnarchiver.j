I;30;Foundation/CPKeyedUnarchiver.jc;1350;


{var the_class = objj_allocateClassPair(CPKeyedUnarchiver, "_CPCibKeyedUnarchiver"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_bundle"), new objj_ivar("_awakenCustomResources")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initForReadingWithData:bundle:awakenCustomResources:"), function(self, _cmd, data, aBundle, shouldAwakenCustomResources)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPKeyedUnarchiver") }, "initForReadingWithData:", data);

    if (self)
    {
        _bundle = aBundle;
        _awakenCustomResources = shouldAwakenCustomResources;

        objj_msgSend(self, "setDelegate:", self);
    }

    return self;
}
}), new objj_method(sel_getUid("bundle"), function(self, _cmd)
{ with(self)
{
    return _bundle;
}
}), new objj_method(sel_getUid("awakenCustomResources"), function(self, _cmd)
{ with(self)
{
    return _awakenCustomResources;
}
}), new objj_method(sel_getUid("replaceObjectAtUID:withObject:"), function(self, _cmd, aUID, anObject)
{ with(self)
{
    _objects[aUID] = anObject;
}
}), new objj_method(sel_getUid("objectAtUID:"), function(self, _cmd, aUID)
{ with(self)
{
    return _objects[aUID];
}
})]);
}

