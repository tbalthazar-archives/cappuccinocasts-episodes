i;10;CPObject.jc;937;
CPPropertyListOpenStepFormat = kCFPropertyListOpenStepFormat;
CPPropertyListXMLFormat_v1_0 = kCFPropertyListXMLFormat_v1_0;
CPPropertyListBinaryFormat_v1_0 = kCFPropertyListBinaryFormat_v1_0;
CPPropertyList280NorthFormat_v1_0 = kCFPropertyList280NorthFormat_v1_0;
{var the_class = objj_allocateClassPair(CPObject, "CPPropertyListSerialization"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(meta_class, [new objj_method(sel_getUid("dataFromPropertyList:format:errorDescription:"), function(self, _cmd, aPlist, aFormat, anErrorString)
{ with(self)
{
    return CPPropertyListCreateData(aPlist, aFormat);
}
}), new objj_method(sel_getUid("propertyListFromData:format:errorDescription:"), function(self, _cmd, data, aFormat, errorString)
{ with(self)
{
    return CPPropertyListCreateFromData(data, aFormat);
}
})]);
}

