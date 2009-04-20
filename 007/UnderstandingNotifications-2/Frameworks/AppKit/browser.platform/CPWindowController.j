I;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;13;CPResponder.ji;10;CPWindow.ji;12;CPDocument.jc;5626;
{var the_class = objj_allocateClassPair(CPResponder, "CPWindowController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_owner"), new objj_ivar("_window"), new objj_ivar("_document"), new objj_ivar("_windowCibName")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithWindow:"), function(self, _cmd, aWindow)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "init");
    if (self)
    {
        objj_msgSend(self, "setWindow:", aWindow);
        objj_msgSend(self, "setNextResponder:", CPApp);
    }
    return self;
}
}), new objj_method(sel_getUid("initWithWindowCibName:"), function(self, _cmd, aWindowCibName)
{ with(self)
{
    return objj_msgSend(self, "initWithWindowCibName:owner:", aWindowCibName, self);
}
}), new objj_method(sel_getUid("initWithWindowCibName:owner:"), function(self, _cmd, aWindowCibName, anOwner)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "init");
    if (self)
    {
        _owner = anOwner;
        _windowCibName = aWindowCibName;
        objj_msgSend(self, "setNextResponder:", CPApp);
    }
    return self;
}
}), new objj_method(sel_getUid("loadWindow"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "windowWillLoad");
    objj_msgSend(self, "setWindow:", CPApp._keyWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CPRectMakeZero(), CPBorderlessBridgeWindowMask|CPTitledWindowMask|CPClosableWindowMask|CPResizableWindowMask));
    objj_msgSend(self, "windowDidLoad");
}
}), new objj_method(sel_getUid("showWindow:"), function(self, _cmd, aSender)
{ with(self)
{
    var theWindow = objj_msgSend(self, "window");
 if (objj_msgSend(theWindow, "respondsToSelector:", sel_getUid("becomesKeyOnlyIfNeeded")) && objj_msgSend(theWindow, "becomesKeyOnlyIfNeeded"))
        objj_msgSend(theWindow, "orderFront:", aSender);
    else
        objj_msgSend(theWindow, "makeKeyAndOrderFront:", aSender);
}
}), new objj_method(sel_getUid("isWindowLoaded"), function(self, _cmd)
{ with(self)
{
    return _window;
}
}), new objj_method(sel_getUid("window"), function(self, _cmd)
{ with(self)
{
    if (!_window)
         objj_msgSend(self, "loadWindow");
    return _window;
}
}), new objj_method(sel_getUid("setWindow:"), function(self, _cmd, aWindow)
{ with(self)
{
    _window = aWindow;
    objj_msgSend(_window, "setWindowController:", self);
    objj_msgSend(_window, "setNextResponder:", self);
}
}), new objj_method(sel_getUid("windowDidLoad"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(_document, "windowControllerDidLoadNib:", self);
    objj_msgSend(self, "synchronizeWindowTitleWithDocumentName");
}
}), new objj_method(sel_getUid("windowWillLoad"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(_document, "windowControllerWillLoadNib:", self);
}
}), new objj_method(sel_getUid("setDocument:"), function(self, _cmd, aDocument)
{ with(self)
{
    if (_document == aDocument)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_document)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPDocumentWillSaveNotification, _document);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPDocumentDidSaveNotification, _document);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPDocumentDidFailToSaveNotification, _document);
    }
    _document = aDocument;
    if (_document)
    {
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_documentWillSave:"), CPDocumentWillSaveNotification, _document);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_documentDidSave:"), CPDocumentDidSaveNotification, _document);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_documentDidFailToSave:"), CPDocumentDidFailToSaveNotification, _document);
        objj_msgSend(self, "setDocumentEdited:", objj_msgSend(_document, "isDocumentEdited"));
    }
    objj_msgSend(self, "synchronizeWindowTitleWithDocumentName");
}
}), new objj_method(sel_getUid("_documentWillSave:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentSaving:", YES);
}
}), new objj_method(sel_getUid("_documentDidSave:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentSaving:", NO);
}
}), new objj_method(sel_getUid("_documentDidFailToSave:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentSaving:", NO);
}
}), new objj_method(sel_getUid("document"), function(self, _cmd)
{ with(self)
{
    return _document;
}
}), new objj_method(sel_getUid("setDocumentEdited:"), function(self, _cmd, isEdited)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "setDocumentEdited:", isEdited);
}
}), new objj_method(sel_getUid("synchronizeWindowTitleWithDocumentName"), function(self, _cmd)
{ with(self)
{
    if (!_document || !_window)
        return;
    objj_msgSend(_window, "setTitle:", objj_msgSend(self, "windowTitleForDocumentDisplayName:", objj_msgSend(_document, "displayName")));
}
}), new objj_method(sel_getUid("windowTitleForDocumentDisplayName:"), function(self, _cmd, aDisplayName)
{ with(self)
{
    return aDisplayName;
}
})]);
}

