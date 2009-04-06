I;21;Foundation/CPString.jI;20;Foundation/CPArray.ji;13;CPResponder.ji;20;CPWindowController.jc;15878;
CPSaveOperation = 0;
CPSaveAsOperation = 1;
CPSaveToOperation = 2;
CPAutosaveOperation = 3;
CPChangeDone = 0;
CPChangeUndone = 1;
CPChangeCleared = 2;
CPChangeReadOtherContents = 3;
CPChangeAutosaved = 4;
CPDocumentWillSaveNotification = "CPDocumentWillSaveNotification";
CPDocumentDidSaveNotification = "CPDocumentDidSaveNotification";
CPDocumentDidFailToSaveNotification = "CPDocumentDidFailToSaveNotification";
var CPDocumentUntitledCount = 0;
{var the_class = objj_allocateClassPair(CPResponder, "CPDocument"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_fileURL"), new objj_ivar("_fileType"), new objj_ivar("_windowControllers"), new objj_ivar("_untitledDocumentIndex"), new objj_ivar("_hasUndoManager"), new objj_ivar("_undoManager"), new objj_ivar("_changeCount"), new objj_ivar("_readConnection"), new objj_ivar("_writeRequest")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "init");
    if (self)
    {
        _windowControllers = [];
        _hasUndoManager = YES;
        _changeCount = 0;
        objj_msgSend(self, "setNextResponder:", CPApp);
    }
    return self;
}
}), new objj_method(sel_getUid("initWithType:error:"), function(self, _cmd, aType, anError)
{ with(self)
{
    self = objj_msgSend(self, "init");
    if (self)
        objj_msgSend(self, "setFileType:", aType);
    return self;
}
}), new objj_method(sel_getUid("initWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"), function(self, _cmd, anAbsoluteURL, aType, aDelegate, aDidReadSelector, aContextInfo)
{ with(self)
{
    self = objj_msgSend(self, "init");
    if (self)
    {
        objj_msgSend(self, "readFromURL:ofType:delegate:didReadSelector:contextInfo:", anAbsoluteURL, aType, aDelegate, aDidReadSelector, aContextInfo);
        objj_msgSend(self, "setFileURL:", anAbsoluteURL);
        objj_msgSend(self, "setFileType:", aType);
    }
    return self;
}
}), new objj_method(sel_getUid("initForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"), function(self, _cmd, anAbsoluteURL, absoluteContentsURL, aType, aDelegate, aDidReadSelector, aContextInfo)
{ with(self)
{
    self = objj_msgSend(self, "init");
    if (self)
    {
        objj_msgSend(self, "readFromURL:ofType:delegate:didReadSelector:contextInfo:", absoluteContentsURL, aType, aDelegate, aDidReadSelector, aContextInfo);
        objj_msgSend(self, "setFileURL:", anAbsoluteURL);
        objj_msgSend(self, "setFileType:", aType);
    }
    return self;
}
}), new objj_method(sel_getUid("dataOfType:error:"), function(self, _cmd, aType, anError)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "dataOfType:error: must be overridden by the document subclass.");
}
}), new objj_method(sel_getUid("readFromData:ofType:error:"), function(self, _cmd, aData, aType, anError)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", CPUnsupportedMethodException, "readFromData:ofType: must be overridden by the document subclass.");
}
}), new objj_method(sel_getUid("makeWindowControllers"), function(self, _cmd)
{ with(self)
{
    var controller = objj_msgSend(objj_msgSend(CPWindowController, "alloc"), "initWithWindowCibName:", nil);
    objj_msgSend(self, "addWindowController:", controller);
}
}), new objj_method(sel_getUid("windowControllers"), function(self, _cmd)
{ with(self)
{
    return _windowControllers;
}
}), new objj_method(sel_getUid("addWindowController:"), function(self, _cmd, aWindowController)
{ with(self)
{
    objj_msgSend(_windowControllers, "addObject:", aWindowController);
    if (objj_msgSend(aWindowController, "document") != self)
    {
        objj_msgSend(aWindowController, "setNextResponder:", self);
        objj_msgSend(aWindowController, "setDocument:", self);
    }
}
}), new objj_method(sel_getUid("showWindows"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(_windowControllers, "makeObjectsPerformSelector:withObject:", sel_getUid("showWindow:"), self);
}
}), new objj_method(sel_getUid("displayName"), function(self, _cmd)
{ with(self)
{
    if (_fileURL)
        return objj_msgSend(_fileURL, "lastPathComponent");
    if (!_untitledDocumentIndex)
        _untitledDocumentIndex = ++CPDocumentUntitledCount;
 if (_untitledDocumentIndex == 1)
    return "Untitled";
 return "Untitled " + _untitledDocumentIndex;
}
}), new objj_method(sel_getUid("windowCibName"), function(self, _cmd)
{ with(self)
{
    return nil;
}
}), new objj_method(sel_getUid("windowControllerDidLoadNib:"), function(self, _cmd, aWindowController)
{ with(self)
{
}
}), new objj_method(sel_getUid("windowControllerWillLoadNib:"), function(self, _cmd, aWindowController)
{ with(self)
{
}
}), new objj_method(sel_getUid("readFromURL:ofType:delegate:didReadSelector:contextInfo:"), function(self, _cmd, anAbsoluteURL, aType, aDelegate, aDidReadSelector, aContextInfo)
{ with(self)
{
    objj_msgSend(_readConnection, "cancel");
    _readConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", objj_msgSend(CPURLRequest, "requestWithURL:", anAbsoluteURL), self);
    _readConnection.session = _CPReadSessionMake(aType, aDelegate, aDidReadSelector, aContextInfo);
}
}), new objj_method(sel_getUid("fileURL"), function(self, _cmd)
{ with(self)
{
    return _fileURL;
}
}), new objj_method(sel_getUid("setFileURL:"), function(self, _cmd, aFileURL)
{ with(self)
{
    if (_fileURL == aFileURL)
        return;
    _fileURL = aFileURL;
    objj_msgSend(_windowControllers, "makeObjectsPerformSelector:", sel_getUid("synchronizeWindowTitleWithDocumentName"));
}
}), new objj_method(sel_getUid("saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:"), function(self, _cmd, anAbsoluteURL, aTypeName, aSaveOperation, aDelegate, aDidSaveSelector, aContextInfo)
{ with(self)
{
    var data = objj_msgSend(self, "dataOfType:error:", objj_msgSend(self, "fileType"), nil),
        oldChangeCount = _changeCount;
    _writeRequest = objj_msgSend(CPURLRequest, "requestWithURL:", anAbsoluteURL);
    objj_msgSend(_writeRequest, "setHTTPMethod:", "POST");
    objj_msgSend(_writeRequest, "setHTTPBody:", objj_msgSend(data, "string"));
    objj_msgSend(_writeRequest, "setValue:forHTTPHeaderField:", "close", "Connection");
    if (aSaveOperation == CPSaveOperation)
        objj_msgSend(_writeRequest, "setValue:forHTTPHeaderField:", "true", "x-cappuccino-overwrite");
    if (aSaveOperation != CPSaveToOperation)
        objj_msgSend(self, "updateChangeCount:", CPChangeCleared);
    var connection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", _writeRequest, self);
    connection.session = _CPSaveSessionMake(anAbsoluteURL, aSaveOperation, oldChangeCount, aDelegate, aDidSaveSelector, aContextInfo, connection);
}
}), new objj_method(sel_getUid("connection:didReceiveResponse:"), function(self, _cmd, aConnection, aResponse)
{ with(self)
{
    if (!objj_msgSend(aResponse, "isKindOfClass:", objj_msgSend(CPHTTPURLResponse, "class")))
        return;
    var statusCode = objj_msgSend(aResponse, "statusCode");
    if (statusCode === 200)
        return;
    var session = aConnection.session;
    if (aConnection == _readConnection)
    {
        objj_msgSend(aConnection, "cancel");
        alert("There was an error retrieving the document.");
        objj_msgSend(session.delegate, session.didReadSelector, self, NO, session.contextInfo);
    }
    else
    {
        if (statusCode == 409)
        {
            objj_msgSend(aConnection, "cancel");
            if (confirm("There already exists a file with that name, would you like to overwrite it?"))
            {
                objj_msgSend(_writeRequest, "setValue:forHTTPHeaderField:", "true", "x-cappuccino-overwrite");
                objj_msgSend(aConnection, "start");
            }
            else
            {
                if (session.saveOperation != CPSaveToOperation)
                {
                    _changeCount += session.changeCount;
                    objj_msgSend(_windowControllers, "makeObjectsPerformSelector:withObject:", sel_getUid("setDocumentEdited:"), objj_msgSend(self, "isDocumentEdited"));
                }
                _writeRequest = nil;
                objj_msgSend(session.delegate, session.didSaveSelector, self, NO, session.contextInfo);
            }
        }
    }
}
}), new objj_method(sel_getUid("connection:didReceiveData:"), function(self, _cmd, aConnection, aData)
{ with(self)
{
    var session = aConnection.session;
    if (aConnection == _readConnection)
    {
        objj_msgSend(self, "readFromData:ofType:error:", objj_msgSend(CPData, "dataWithString:", aData), session.fileType, nil);
        objj_msgSend(session.delegate, session.didReadSelector, self, YES, session.contextInfo);
    }
    else
    {
        if (session.saveOperation != CPSaveToOperation)
            objj_msgSend(self, "setFileURL:", session.absoluteURL);
        _writeRequest = nil;
        objj_msgSend(session.delegate, session.didSaveSelector, self, YES, session.contextInfo);
    }
}
}), new objj_method(sel_getUid("connection:didFailWithError:"), function(self, _cmd, aConnection, anError)
{ with(self)
{
    var session = aConnection.session;
    if (_readConnection == aConnection)
        objj_msgSend(session.delegate, session.didReadSelector, self, NO, session.contextInfo);
    else
    {
        if (session.saveOperation != CPSaveToOperation)
        {
            _changeCount += session.changeCount;
            objj_msgSend(_windowControllers, "makeObjectsPerformSelector:withObject:", sel_getUid("setDocumentEdited:"), objj_msgSend(self, "isDocumentEdited"));
        }
        _writeRequest = nil;
        alert("There was an error saving the document.");
        objj_msgSend(session.delegate, session.didSaveSelector, self, NO, session.contextInfo);
    }
}
}), new objj_method(sel_getUid("connectionDidFinishLoading:"), function(self, _cmd, aConnection)
{ with(self)
{
    if (_readConnection == aConnection)
        _readConnection = nil;
}
}), new objj_method(sel_getUid("isDocumentEdited"), function(self, _cmd)
{ with(self)
{
    return _changeCount != 0;
}
}), new objj_method(sel_getUid("updateChangeCount:"), function(self, _cmd, aChangeType)
{ with(self)
{
    if (aChangeType == CPChangeDone)
        ++_changeCount;
    else if (aChangeType == CPChangeUndone)
        --_changeCount;
    else if (aChangeType == CPChangeCleared)
        _changeCount = 0;
    objj_msgSend(_windowControllers, "makeObjectsPerformSelector:withObject:", sel_getUid("setDocumentEdited:"), objj_msgSend(self, "isDocumentEdited"));
}
}), new objj_method(sel_getUid("setFileType:"), function(self, _cmd, aType)
{ with(self)
{
    _fileType = aType;
}
}), new objj_method(sel_getUid("fileType"), function(self, _cmd)
{ with(self)
{
    return _fileType;
}
}), new objj_method(sel_getUid("hasUndoManager"), function(self, _cmd)
{ with(self)
{
    return _hasUndoManager;
}
}), new objj_method(sel_getUid("setHasUndoManager:"), function(self, _cmd, aFlag)
{ with(self)
{
    if (_hasUndoManager == aFlag)
        return;
    _hasUndoManager = aFlag;
    if (!_hasUndoManager)
        objj_msgSend(self, "setUndoManager:", nil);
}
}), new objj_method(sel_getUid("_undoManagerWillCloseGroup:"), function(self, _cmd, aNotification)
{ with(self)
{
    var undoManager = objj_msgSend(aNotification, "object");
    if (objj_msgSend(undoManager, "isUndoing") || objj_msgSend(undoManager, "isRedoing"))
        return;
    objj_msgSend(self, "updateChangeCount:", CPChangeDone);
}
}), new objj_method(sel_getUid("_undoManagerDidUndoChange:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "updateChangeCount:", CPChangeUndone);
}
}), new objj_method(sel_getUid("_undoManagerDidRedoChange:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "updateChangeCount:", CPChangeDone);
}
}), new objj_method(sel_getUid("setUndoManager:"), function(self, _cmd, anUndoManager)
{ with(self)
{
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_undoManager)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPUndoManagerDidUndoChangeNotification, _undoManager);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPUndoManagerDidRedoChangeNotification, _undoManager);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPUndoManagerWillCloseUndoGroupNotification, _undoManager);
    }
    _undoManager = anUndoManager;
    if (_undoManager)
    {
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_undoManagerDidUndoChange:"), CPUndoManagerDidUndoChangeNotification, _undoManager);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_undoManagerDidRedoChange:"), CPUndoManagerDidRedoChangeNotification, _undoManager);
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("_undoManagerWillCloseGroup:"), CPUndoManagerWillCloseUndoGroupNotification, _undoManager);
    }
}
}), new objj_method(sel_getUid("undoManager"), function(self, _cmd)
{ with(self)
{
    if (_hasUndoManager && !_undoManager)
        objj_msgSend(self, "setUndoManager:", objj_msgSend(objj_msgSend(CPUndoManager, "alloc"), "init"));
    return _undoManager;
}
}), new objj_method(sel_getUid("windowWillReturnUndoManager:"), function(self, _cmd, aWindow)
{ with(self)
{
    return objj_msgSend(self, "undoManager");
}
}), new objj_method(sel_getUid("saveDocument:"), function(self, _cmd, aSender)
{ with(self)
{
    if (_fileURL)
    {
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPDocumentWillSaveNotification, self);
        objj_msgSend(self, "saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:", _fileURL, objj_msgSend(self, "fileType"), CPSaveOperation, self, sel_getUid("document:didSave:contextInfo:"), NULL);
    }
    else
        objj_msgSend(self, "saveDocumentAs:", self);
}
}), new objj_method(sel_getUid("saveDocumentAs:"), function(self, _cmd, aSender)
{ with(self)
{
    _documentName = window.prompt("Document Name:");
    if (!_documentName)
        return;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPDocumentWillSaveNotification, self);
    objj_msgSend(self, "saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:", objj_msgSend(self, "proposedFileURL"), objj_msgSend(self, "fileType"), CPSaveAsOperation, self, sel_getUid("document:didSave:contextInfo:"), NULL);
}
}), new objj_method(sel_getUid("document:didSave:contextInfo:"), function(self, _cmd, aDocument, didSave, aContextInfo)
{ with(self)
{
    if (didSave)
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPDocumentDidSaveNotification, self);
    else
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPDocumentDidFailToSaveNotification, self);
}
})]);
}
var _CPReadSessionMake = function(aType, aDelegate, aDidReadSelector, aContextInfo)
{
    return { fileType:aType, delegate:aDelegate, didReadSelector:aDidReadSelector, contextInfo:aContextInfo };
}
var _CPSaveSessionMake = function(anAbsoluteURL, aSaveOperation, aChangeCount, aDelegate, aDidSaveSelector, aContextInfo, aConnection)
{
    return { absoluteURL:anAbsoluteURL, saveOperation:aSaveOperation, changeCount:aChangeCount, delegate:aDelegate, didSaveSelector:aDidSaveSelector, contextInfo:aContextInfo, connection:aConnection };
}

