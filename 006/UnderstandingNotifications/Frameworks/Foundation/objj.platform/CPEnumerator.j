i;10;CPObject.jc;448;
{var the_class = objj_allocateClassPair(CPObject, "CPEnumerator"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("nextObject"), function(self, _cmd)
{ with(self)
{
    return nil;
}
}), new objj_method(sel_getUid("allObjects"), function(self, _cmd)
{ with(self)
{
    return [];
}
})]);
}

