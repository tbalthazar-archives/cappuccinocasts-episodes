I;21;Foundation/CPBundle.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPString.jc;1627;
var CPCibOwner = "CPCibOwner";
{
var the_class = objj_getClass("CPObject")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPObject\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("awakeFromCib"), function(self, _cmd)
{ with(self)
{
}
})]);
}
{
var the_class = objj_getClass("CPBundle")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPBundle\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("loadCibFile:externalNameTable:"), function(self, _cmd, aPath, aNameTable)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(CPCib, "alloc"), "initWithContentsOfFile:", aPath), "instantiateCibWithExternalNameTable:", aNameTable);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("loadCibFile:externalNameTable:"), function(self, _cmd, aPath, aNameTable)
{ with(self)
{
    return objj_msgSend(objj_msgSend(objj_msgSend(CPCib, "alloc"), "initWithContentsOfFile:", aPath), "instantiateCibWithExternalNameTable:", aNameTable);
}
}), new objj_method(sel_getUid("loadCibNamed:owner:"), function(self, _cmd, aName, anOwner)
{ with(self)
{
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(anOwner, "class"));
    var path = objj_msgSend(bundle, "pathForResource:", aName);
    return objj_msgSend(CPBundle, "loadCibFile:externalNameTable:", aPath, objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", anOwner, CPCibOwner));
}
})]);
}

