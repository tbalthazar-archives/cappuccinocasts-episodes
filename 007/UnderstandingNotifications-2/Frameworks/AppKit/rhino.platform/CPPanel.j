i;10;CPWindow.jc;1446;
CPOKButton = 1;
CPCancelButton = 0;
{var the_class = objj_allocateClassPair(CPWindow, "CPPanel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_becomesKeyOnlyIfNeeded"), new objj_ivar("_worksWhenModal")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("isFloatingPanel"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "level") == CPFloatingWindowLevel;
}
}), new objj_method(sel_getUid("setFloatingPanel:"), function(self, _cmd, isFloatingPanel)
{ with(self)
{
    objj_msgSend(self, "setLevel:", isFloatingPanel ? CPFloatingWindowLevel : CPNormalWindowLevel);
}
}), new objj_method(sel_getUid("becomesKeyOnlyIfNeeded"), function(self, _cmd)
{ with(self)
{
    return _becomesKeyOnlyIfNeeded;
}
}), new objj_method(sel_getUid("setBecomesKeyOnlyIfNeeded:"), function(self, _cmd, shouldBecomeKeyOnlyIfNeeded)
{ with(self)
{
    _becomesKeyOnlyIfNeeded = shouldBecomeKeyOnlyIfNeeded
}
}), new objj_method(sel_getUid("worksWhenModal"), function(self, _cmd)
{ with(self)
{
    return _worksWhenModal;
}
}), new objj_method(sel_getUid("setWorksWhenModal:"), function(self, _cmd, shouldWorkWhenModal)
{ with(self)
{
    _worksWhenModal = shouldWorkWhenModal;
}
}), new objj_method(sel_getUid("canBecomeMainWindow"), function(self, _cmd)
{ with(self)
{
    return NO;
}
})]);
}

