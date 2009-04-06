I;21;Foundation/CPObject.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;40;Foundation/CPPropertyListSerialization.jc;5499;
CPGeneralPboard = "CPGeneralPboard";
CPFontPboard = "CPFontPboard";
CPRulerPboard = "CPRulerPboard";
CPFindPboard = "CPFindPboard";
CPDragPboard = "CPDragPboard";
CPColorPboardType = "CPColorPboardType";
CPFilenamesPboardType = "CPFilenamesPboardType";
CPFontPboardType = "CPFontPboardType";
CPHTMLPboardType = "CPHTMLPboardType";
CPStringPboardType = "CPStringPboardType";
CPURLPboardType = "CPURLPboardType";
CPImagePboardType = "CPImagePboardType";
var CPPasteboards = nil;
{var the_class = objj_allocateClassPair(CPObject, "CPPasteboard"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_types"), new objj_ivar("_owners"), new objj_ivar("_provided"), new objj_ivar("_changeCount"), new objj_ivar("_stateUID")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("_initWithName:"), function(self, _cmd, aName)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _name = aName;
        _types = [];
        _owners = objj_msgSend(CPDictionary, "dictionary");
        _provided = objj_msgSend(CPDictionary, "dictionary");
        _changeCount = 0;
    }
    return self;
}
}), new objj_method(sel_getUid("addTypes:owner:"), function(self, _cmd, types, anOwner)
{ with(self)
{
    var i = 0,
        count = types.length;
    for (; i < count; ++i)
    {
        var type = types[i];
        if(!objj_msgSend(_owners, "objectForKey:", type))
        {
            objj_msgSend(_types, "addObject:", type);
            objj_msgSend(_provided, "removeObjectForKey:", type);
        }
        objj_msgSend(_owners, "setObject:forKey:", anOwner, type);
    }
    return ++_changeCount;
}
}), new objj_method(sel_getUid("declareTypes:owner:"), function(self, _cmd, types, anOwner)
{ with(self)
{
    objj_msgSend(_types, "setArray:", types);
    _owners = objj_msgSend(CPDictionary, "dictionary");
    _provided = objj_msgSend(CPDictionary, "dictionary");
    var count = _types.length;
    while (count--)
        objj_msgSend(_owners, "setObject:forKey:", anOwner, _types[count]);
    return ++_changeCount;
}
}), new objj_method(sel_getUid("setData:forType:"), function(self, _cmd, aData, aType)
{ with(self)
{
    objj_msgSend(_provided, "setObject:forKey:", aData, aType);
    return YES;
}
}), new objj_method(sel_getUid("setPropertyList:forType:"), function(self, _cmd, aPropertyList, aType)
{ with(self)
{
    return objj_msgSend(self, "setData:forType:", objj_msgSend(CPPropertyListSerialization, "dataFromPropertyList:format:errorDescription:", aPropertyList, CPPropertyListXMLFormat_v1_0, nil), aType);
}
}), new objj_method(sel_getUid("setString:forType:"), function(self, _cmd, aString, aType)
{ with(self)
{
    return objj_msgSend(self, "setPropertyList:forType:", aString, aType);
}
}), new objj_method(sel_getUid("availableTypeFromArray:"), function(self, _cmd, anArray)
{ with(self)
{
    return objj_msgSend(_types, "firstObjectCommonWithArray:", anArray);
}
}), new objj_method(sel_getUid("types"), function(self, _cmd)
{ with(self)
{
    return _types;
}
}), new objj_method(sel_getUid("changeCount"), function(self, _cmd)
{ with(self)
{
    return _changeCount;
}
}), new objj_method(sel_getUid("dataForType:"), function(self, _cmd, aType)
{ with(self)
{
    var data = objj_msgSend(_provided, "objectForKey:", aType);
    if (data)
        return data;
    var owner = objj_msgSend(_owners, "objectForKey:", aType);
    if (owner)
    {
        objj_msgSend(owner, "pasteboard:provideDataForType:", self, aType);
        ++_changeCount;
        return objj_msgSend(_provided, "objectForKey:", aType);
    }
    return nil;
}
}), new objj_method(sel_getUid("propertyListForType:"), function(self, _cmd, aType)
{ with(self)
{
    var data = objj_msgSend(self, "dataForType:", aType);
    if (data)
        return objj_msgSend(CPPropertyListSerialization, "propertyListFromData:format:errorDescription:", data, CPPropertyListXMLFormat_v1_0, nil);
    return nil;
}
}), new objj_method(sel_getUid("stringForType:"), function(self, _cmd, aType)
{ with(self)
{
    return objj_msgSend(self, "propertyListForType:", aType);
}
}), new objj_method(sel_getUid("_generateStateUID"), function(self, _cmd)
{ with(self)
{
    var bits = 32;
    _stateUID = "";
    while (bits--)
        _stateUID += FLOOR(RAND() * 16.0).toString(16).toUpperCase();
    return _stateUID;
}
}), new objj_method(sel_getUid("_stateUID"), function(self, _cmd)
{ with(self)
{
    return _stateUID;
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(CPPasteboard, "class"))
        return;
    objj_msgSend(self, "setVersion:", 1.0);
    CPPasteboards = objj_msgSend(CPDictionary, "dictionary");
}
}), new objj_method(sel_getUid("generalPasteboard"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(CPPasteboard, "pasteboardWithName:", CPGeneralPboard);
}
}), new objj_method(sel_getUid("pasteboardWithName:"), function(self, _cmd, aName)
{ with(self)
{
    var pasteboard = objj_msgSend(CPPasteboards, "objectForKey:", aName);
    if (pasteboard)
        return pasteboard;
    pasteboard = objj_msgSend(objj_msgSend(CPPasteboard, "alloc"), "_initWithName:", aName);
    objj_msgSend(CPPasteboards, "setObject:forKey:", pasteboard, aName);
    return pasteboard;
}
})]);
}

