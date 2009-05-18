I;21;Foundation/CPString.jI;20;Foundation/CPArray.ji;13;CPResponder.ji;20;CPWindowController.jc;12379;
CPSaveOperation=0;
CPSaveAsOperation=1;
CPSaveToOperation=2;
CPAutosaveOperation=3;
CPChangeDone=0;
CPChangeUndone=1;
CPChangeCleared=2;
CPChangeReadOtherContents=3;
CPChangeAutosaved=4;
CPDocumentWillSaveNotification="CPDocumentWillSaveNotification";
CPDocumentDidSaveNotification="CPDocumentDidSaveNotification";
CPDocumentDidFailToSaveNotification="CPDocumentDidFailToSaveNotification";
var _1=0;
var _2=objj_allocateClassPair(CPResponder,"CPDocument"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_fileURL"),new objj_ivar("_fileType"),new objj_ivar("_windowControllers"),new objj_ivar("_untitledDocumentIndex"),new objj_ivar("_hasUndoManager"),new objj_ivar("_undoManager"),new objj_ivar("_changeCount"),new objj_ivar("_readConnection"),new objj_ivar("_writeRequest")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPResponder")},"init");
if(_4){
_windowControllers=[];
_hasUndoManager=YES;
_changeCount=0;
objj_msgSend(_4,"setNextResponder:",CPApp);
}
return _4;
}
}),new objj_method(sel_getUid("initWithType:error:"),function(_6,_7,_8,_9){
with(_6){
_6=objj_msgSend(_6,"init");
if(_6){
objj_msgSend(_6,"setFileType:",_8);
}
return _6;
}
}),new objj_method(sel_getUid("initWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"),function(_a,_b,_c,_d,_e,_f,_10){
with(_a){
_a=objj_msgSend(_a,"init");
if(_a){
objj_msgSend(_a,"readFromURL:ofType:delegate:didReadSelector:contextInfo:",_c,_d,_e,_f,_10);
objj_msgSend(_a,"setFileURL:",_c);
objj_msgSend(_a,"setFileType:",_d);
}
return _a;
}
}),new objj_method(sel_getUid("initForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"),function(_11,_12,_13,_14,_15,_16,_17,_18){
with(_11){
_11=objj_msgSend(_11,"init");
if(_11){
objj_msgSend(_11,"readFromURL:ofType:delegate:didReadSelector:contextInfo:",_14,_15,_16,_17,_18);
objj_msgSend(_11,"setFileURL:",_13);
objj_msgSend(_11,"setFileType:",_15);
}
return _11;
}
}),new objj_method(sel_getUid("dataOfType:error:"),function(_19,_1a,_1b,_1c){
with(_19){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"dataOfType:error: must be overridden by the document subclass.");
}
}),new objj_method(sel_getUid("readFromData:ofType:error:"),function(_1d,_1e,_1f,_20,_21){
with(_1d){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"readFromData:ofType: must be overridden by the document subclass.");
}
}),new objj_method(sel_getUid("makeWindowControllers"),function(_22,_23){
with(_22){
var _24=objj_msgSend(objj_msgSend(CPWindowController,"alloc"),"initWithWindowCibName:",nil);
objj_msgSend(_22,"addWindowController:",_24);
}
}),new objj_method(sel_getUid("windowControllers"),function(_25,_26){
with(_25){
return _windowControllers;
}
}),new objj_method(sel_getUid("addWindowController:"),function(_27,_28,_29){
with(_27){
objj_msgSend(_windowControllers,"addObject:",_29);
if(objj_msgSend(_29,"document")!=_27){
objj_msgSend(_29,"setNextResponder:",_27);
objj_msgSend(_29,"setDocument:",_27);
}
}
}),new objj_method(sel_getUid("showWindows"),function(_2a,_2b){
with(_2a){
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("showWindow:"),_2a);
}
}),new objj_method(sel_getUid("displayName"),function(_2c,_2d){
with(_2c){
if(_fileURL){
return objj_msgSend(_fileURL,"lastPathComponent");
}
if(!_untitledDocumentIndex){
_untitledDocumentIndex=++_1;
}
if(_untitledDocumentIndex==1){
return "Untitled";
}
return "Untitled "+_untitledDocumentIndex;
}
}),new objj_method(sel_getUid("windowCibName"),function(_2e,_2f){
with(_2e){
return nil;
}
}),new objj_method(sel_getUid("windowControllerDidLoadNib:"),function(_30,_31,_32){
with(_30){
}
}),new objj_method(sel_getUid("windowControllerWillLoadNib:"),function(_33,_34,_35){
with(_33){
}
}),new objj_method(sel_getUid("readFromURL:ofType:delegate:didReadSelector:contextInfo:"),function(_36,_37,_38,_39,_3a,_3b,_3c){
with(_36){
objj_msgSend(_readConnection,"cancel");
_readConnection=objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",objj_msgSend(CPURLRequest,"requestWithURL:",_38),_36);
_readConnection.session=_3d(_39,_3a,_3b,_3c);
}
}),new objj_method(sel_getUid("fileURL"),function(_3e,_3f){
with(_3e){
return _fileURL;
}
}),new objj_method(sel_getUid("setFileURL:"),function(_40,_41,_42){
with(_40){
if(_fileURL==_42){
return;
}
_fileURL=_42;
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:",sel_getUid("synchronizeWindowTitleWithDocumentName"));
}
}),new objj_method(sel_getUid("saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:"),function(_43,_44,_45,_46,_47,_48,_49,_4a){
with(_43){
var _4b=objj_msgSend(_43,"dataOfType:error:",objj_msgSend(_43,"fileType"),nil),_4c=_changeCount;
_writeRequest=objj_msgSend(CPURLRequest,"requestWithURL:",_45);
objj_msgSend(_writeRequest,"setHTTPMethod:","POST");
objj_msgSend(_writeRequest,"setHTTPBody:",objj_msgSend(_4b,"string"));
objj_msgSend(_writeRequest,"setValue:forHTTPHeaderField:","close","Connection");
if(_47==CPSaveOperation){
objj_msgSend(_writeRequest,"setValue:forHTTPHeaderField:","true","x-cappuccino-overwrite");
}
if(_47!=CPSaveToOperation){
objj_msgSend(_43,"updateChangeCount:",CPChangeCleared);
}
var _4d=objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",_writeRequest,_43);
_4d.session=_4e(_45,_47,_4c,_48,_49,_4a,_4d);
}
}),new objj_method(sel_getUid("connection:didReceiveResponse:"),function(_4f,_50,_51,_52){
with(_4f){
if(!objj_msgSend(_52,"isKindOfClass:",objj_msgSend(CPHTTPURLResponse,"class"))){
return;
}
var _53=objj_msgSend(_52,"statusCode");
if(_53===200){
return;
}
var _54=_51.session;
if(_51==_readConnection){
objj_msgSend(_51,"cancel");
alert("There was an error retrieving the document.");
objj_msgSend(_54.delegate,_54.didReadSelector,_4f,NO,_54.contextInfo);
}else{
if(_53==409){
objj_msgSend(_51,"cancel");
if(confirm("There already exists a file with that name, would you like to overwrite it?")){
objj_msgSend(_writeRequest,"setValue:forHTTPHeaderField:","true","x-cappuccino-overwrite");
objj_msgSend(_51,"start");
}else{
if(_54.saveOperation!=CPSaveToOperation){
_changeCount+=_54.changeCount;
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("setDocumentEdited:"),objj_msgSend(_4f,"isDocumentEdited"));
}
_writeRequest=nil;
objj_msgSend(_54.delegate,_54.didSaveSelector,_4f,NO,_54.contextInfo);
}
}
}
}
}),new objj_method(sel_getUid("connection:didReceiveData:"),function(_55,_56,_57,_58){
with(_55){
var _59=_57.session;
if(_57==_readConnection){
objj_msgSend(_55,"readFromData:ofType:error:",objj_msgSend(CPData,"dataWithString:",_58),_59.fileType,nil);
objj_msgSend(_59.delegate,_59.didReadSelector,_55,YES,_59.contextInfo);
}else{
if(_59.saveOperation!=CPSaveToOperation){
objj_msgSend(_55,"setFileURL:",_59.absoluteURL);
}
_writeRequest=nil;
objj_msgSend(_59.delegate,_59.didSaveSelector,_55,YES,_59.contextInfo);
}
}
}),new objj_method(sel_getUid("connection:didFailWithError:"),function(_5a,_5b,_5c,_5d){
with(_5a){
var _5e=_5c.session;
if(_readConnection==_5c){
objj_msgSend(_5e.delegate,_5e.didReadSelector,_5a,NO,_5e.contextInfo);
}else{
if(_5e.saveOperation!=CPSaveToOperation){
_changeCount+=_5e.changeCount;
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("setDocumentEdited:"),objj_msgSend(_5a,"isDocumentEdited"));
}
_writeRequest=nil;
alert("There was an error saving the document.");
objj_msgSend(_5e.delegate,_5e.didSaveSelector,_5a,NO,_5e.contextInfo);
}
}
}),new objj_method(sel_getUid("connectionDidFinishLoading:"),function(_5f,_60,_61){
with(_5f){
if(_readConnection==_61){
_readConnection=nil;
}
}
}),new objj_method(sel_getUid("isDocumentEdited"),function(_62,_63){
with(_62){
return _changeCount!=0;
}
}),new objj_method(sel_getUid("updateChangeCount:"),function(_64,_65,_66){
with(_64){
if(_66==CPChangeDone){
++_changeCount;
}else{
if(_66==CPChangeUndone){
--_changeCount;
}else{
if(_66==CPChangeCleared){
_changeCount=0;
}
}
}
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("setDocumentEdited:"),objj_msgSend(_64,"isDocumentEdited"));
}
}),new objj_method(sel_getUid("setFileType:"),function(_67,_68,_69){
with(_67){
_fileType=_69;
}
}),new objj_method(sel_getUid("fileType"),function(_6a,_6b){
with(_6a){
return _fileType;
}
}),new objj_method(sel_getUid("hasUndoManager"),function(_6c,_6d){
with(_6c){
return _hasUndoManager;
}
}),new objj_method(sel_getUid("setHasUndoManager:"),function(_6e,_6f,_70){
with(_6e){
if(_hasUndoManager==_70){
return;
}
_hasUndoManager=_70;
if(!_hasUndoManager){
objj_msgSend(_6e,"setUndoManager:",nil);
}
}
}),new objj_method(sel_getUid("_undoManagerWillCloseGroup:"),function(_71,_72,_73){
with(_71){
var _74=objj_msgSend(_73,"object");
if(objj_msgSend(_74,"isUndoing")||objj_msgSend(_74,"isRedoing")){
return;
}
objj_msgSend(_71,"updateChangeCount:",CPChangeDone);
}
}),new objj_method(sel_getUid("_undoManagerDidUndoChange:"),function(_75,_76,_77){
with(_75){
objj_msgSend(_75,"updateChangeCount:",CPChangeUndone);
}
}),new objj_method(sel_getUid("_undoManagerDidRedoChange:"),function(_78,_79,_7a){
with(_78){
objj_msgSend(_78,"updateChangeCount:",CPChangeDone);
}
}),new objj_method(sel_getUid("setUndoManager:"),function(_7b,_7c,_7d){
with(_7b){
var _7e=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_undoManager){
objj_msgSend(_7e,"removeObserver:name:object:",_7b,CPUndoManagerDidUndoChangeNotification,_undoManager);
objj_msgSend(_7e,"removeObserver:name:object:",_7b,CPUndoManagerDidRedoChangeNotification,_undoManager);
objj_msgSend(_7e,"removeObserver:name:object:",_7b,CPUndoManagerWillCloseUndoGroupNotification,_undoManager);
}
_undoManager=_7d;
if(_undoManager){
objj_msgSend(_7e,"addObserver:selector:name:object:",_7b,sel_getUid("_undoManagerDidUndoChange:"),CPUndoManagerDidUndoChangeNotification,_undoManager);
objj_msgSend(_7e,"addObserver:selector:name:object:",_7b,sel_getUid("_undoManagerDidRedoChange:"),CPUndoManagerDidRedoChangeNotification,_undoManager);
objj_msgSend(_7e,"addObserver:selector:name:object:",_7b,sel_getUid("_undoManagerWillCloseGroup:"),CPUndoManagerWillCloseUndoGroupNotification,_undoManager);
}
}
}),new objj_method(sel_getUid("undoManager"),function(_7f,_80){
with(_7f){
if(_hasUndoManager&&!_undoManager){
objj_msgSend(_7f,"setUndoManager:",objj_msgSend(objj_msgSend(CPUndoManager,"alloc"),"init"));
}
return _undoManager;
}
}),new objj_method(sel_getUid("windowWillReturnUndoManager:"),function(_81,_82,_83){
with(_81){
return objj_msgSend(_81,"undoManager");
}
}),new objj_method(sel_getUid("saveDocument:"),function(_84,_85,_86){
with(_84){
if(_fileURL){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPDocumentWillSaveNotification,_84);
objj_msgSend(_84,"saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:",_fileURL,objj_msgSend(_84,"fileType"),CPSaveOperation,_84,sel_getUid("document:didSave:contextInfo:"),NULL);
}else{
objj_msgSend(_84,"saveDocumentAs:",_84);
}
}
}),new objj_method(sel_getUid("saveDocumentAs:"),function(_87,_88,_89){
with(_87){
_documentName=window.prompt("Document Name:");
if(!_documentName){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPDocumentWillSaveNotification,_87);
objj_msgSend(_87,"saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:",objj_msgSend(_87,"proposedFileURL"),objj_msgSend(_87,"fileType"),CPSaveAsOperation,_87,sel_getUid("document:didSave:contextInfo:"),NULL);
}
}),new objj_method(sel_getUid("document:didSave:contextInfo:"),function(_8a,_8b,_8c,_8d,_8e){
with(_8a){
if(_8d){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPDocumentDidSaveNotification,_8a);
}else{
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPDocumentDidFailToSaveNotification,_8a);
}
}
})]);
var _3d=function(_8f,_90,_91,_92){
return {fileType:_8f,delegate:_90,didReadSelector:_91,contextInfo:_92};
};
var _4e=function(_93,_94,_95,_96,_97,_98,_99){
return {absoluteURL:_93,saveOperation:_94,changeCount:_95,delegate:_96,didSaveSelector:_97,contextInfo:_98,connection:_99};
};
