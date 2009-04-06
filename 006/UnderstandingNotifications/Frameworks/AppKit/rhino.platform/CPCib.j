I;21;Foundation/CPObject.jI;28;Foundation/CPURLConnection.jI;25;Foundation/CPURLRequest.ji;20;_CPCibCustomObject.ji;22;_CPCibCustomResource.ji;18;_CPCibCustomView.ji;23;_CPCibKeyedUnarchiver.ji;18;_CPCibObjectData.ji;22;_CPCibWindowTemplate.jc;3552;
CPCibOwner = "CPCibOwner",
CPCibTopLevelObjects = "CPCibTopLevelObjects",
CPCibReplacementClasses = "CPCibReplacementClasses";
var CPCibObjectDataKey = "CPCibObjectDataKey";
{var the_class = objj_allocateClassPair(CPObject, "CPCib"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_data"), new objj_ivar("_bundle"), new objj_ivar("_awakenCustomResources")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithContentsOfURL:"), function(self, _cmd, aURL)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _data = objj_msgSend(CPURLConnection, "sendSynchronousRequest:returningResponse:error:", objj_msgSend(CPURLRequest, "requestWithURL:", aURL), nil, nil);
        _awakenCustomResources = YES;
    }
    return self;
}
}), new objj_method(sel_getUid("initWithCibNamed:bundle:"), function(self, _cmd, aName, aBundle)
{ with(self)
{
    self = objj_msgSend(self, "initWithContentsOfURL:", aName);
    if (self)
    {
        _bundle = aBundle;
    }
    return self;
}
}), new objj_method(sel_getUid("_setAwakenCustomResources:"), function(self, _cmd, shouldAwakenCustomResources)
{ with(self)
{
    _awakenCustomResources = shouldAwakenCustomResources;
}
}), new objj_method(sel_getUid("_awakenCustomResources"), function(self, _cmd)
{ with(self)
{
    return _awakenCustomResources;
}
}), new objj_method(sel_getUid("instantiateCibWithExternalNameTable:"), function(self, _cmd, anExternalNameTable)
{ with(self)
{
    var unarchiver = objj_msgSend(objj_msgSend(_CPCibKeyedUnarchiver, "alloc"), "initForReadingWithData:bundle:awakenCustomResources:", _data, _bundle, _awakenCustomResources),
        replacementClasses = objj_msgSend(anExternalNameTable, "objectForKey:", CPCibReplacementClasses);
    if (replacementClasses)
    {
        var key = nil,
            keyEnumerator = objj_msgSend(replacementClasses, "keyEnumerator");
        while (key = objj_msgSend(keyEnumerator, "nextObject"))
            objj_msgSend(unarchiver, "setClass:forClassName:", objj_msgSend(replacementClasses, "objectForKey:", key), key);
    }
    var objectData = objj_msgSend(unarchiver, "decodeObjectForKey:", CPCibObjectDataKey);
    if (!objectData || !objj_msgSend(objectData, "isKindOfClass:", objj_msgSend(_CPCibObjectData, "class")))
        return NO;
    var owner = objj_msgSend(anExternalNameTable, "objectForKey:", CPCibOwner),
        topLevelObjects = objj_msgSend(anExternalNameTable, "objectForKey:", CPCibTopLevelObjects);
    objj_msgSend(objectData, "instantiateWithOwner:topLevelObjects:", owner, topLevelObjects)
    objj_msgSend(objectData, "establishConnectionsWithOwner:topLevelObjects:", owner, topLevelObjects);
    objj_msgSend(objectData, "awakeWithOwner:topLevelObjects:", owner, topLevelObjects);
    var menu;
    if ((menu = objj_msgSend(objectData, "mainMenu")) != nil)
    {
         objj_msgSend(CPApp, "setMainMenu:", menu);
         objj_msgSend(CPMenu, "setMenuBarVisible:", YES);
    }
    objj_msgSend(objectData, "displayVisibleWindows");
    return YES;
}
}), new objj_method(sel_getUid("instantiateCibWithOwner:topLevelObjects:"), function(self, _cmd, anOwner, topLevelObjects)
{ with(self)
{
    objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", anOwner, CPCibOwner, topLevelObjects, CPCibTopLevelObjects);
    return objj_msgSend(self, "instantiate");
}
})]);
}

