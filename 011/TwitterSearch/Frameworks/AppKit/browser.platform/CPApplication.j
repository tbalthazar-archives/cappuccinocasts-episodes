I;21;Foundation/CPBundle.ji;17;CPCompatibility.ji;9;CPEvent.ji;8;CPMenu.ji;13;CPResponder.ji;22;CPDocumentController.ji;14;CPThemeBlend.ji;14;CPCibLoading.ji;12;CPPlatform.jc;19690;
var _1="CPMainCibFile",_2="Main cib file base name";
CPApp=nil;
CPApplicationWillFinishLaunchingNotification="CPApplicationWillFinishLaunchingNotification";
CPApplicationDidFinishLaunchingNotification="CPApplicationDidFinishLaunchingNotification";
CPRunStoppedResponse=-1000;
CPRunAbortedResponse=-1001;
CPRunContinuesResponse=-1002;
var _3=objj_allocateClassPair(CPResponder,"CPApplication"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_eventListeners"),new objj_ivar("_currentEvent"),new objj_ivar("_windows"),new objj_ivar("_keyWindow"),new objj_ivar("_mainWindow"),new objj_ivar("_mainMenu"),new objj_ivar("_documentController"),new objj_ivar("_currentSession"),new objj_ivar("_delegate"),new objj_ivar("_finishedLaunching"),new objj_ivar("_namedArgs"),new objj_ivar("_args"),new objj_ivar("_fullArgsString")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("init"),function(_5,_6){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPResponder")},"init");
if(_5){
_eventListeners=[];
_windows=[];
objj_msgSend(_windows,"addObject:",nil);
_mainMenu=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","MainMenu");
objj_msgSend(_mainMenu,"setAutoenablesItems:",NO);
var _7=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPApplication,"class")),_8=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","New",sel_getUid("newDocument:"),"N");
objj_msgSend(_8,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/New.png"),CGSizeMake(16,16)));
objj_msgSend(_8,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/NewHighlighted.png"),CGSizeMake(16,16)));
objj_msgSend(_mainMenu,"addItem:",_8);
var _9=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Open",sel_getUid("openDocument:"),"O");
objj_msgSend(_9,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/Open.png"),CGSizeMake(16,16)));
objj_msgSend(_9,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/OpenHighlighted.png"),CGSizeMake(16,16)));
objj_msgSend(_mainMenu,"addItem:",_9);
var _a=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","Save"),_b=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Save",sel_getUid("saveDocument:"),nil);
objj_msgSend(_b,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/Save.png"),CGSizeMake(16,16)));
objj_msgSend(_b,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_7,"pathForResource:","CPApplication/SaveHighlighted.png"),CGSizeMake(16,16)));
objj_msgSend(_a,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Save",sel_getUid("saveDocument:"),"S"));
objj_msgSend(_a,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Save As",sel_getUid("saveDocumentAs:"),nil));
objj_msgSend(_b,"setSubmenu:",_a);
objj_msgSend(_mainMenu,"addItem:",_b);
var _c=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Edit",nil,nil),_d=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","Edit"),_e=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Undo",sel_getUid("undo:"),CPUndoKeyEquivalent),_f=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Redo",sel_getUid("redo:"),CPRedoKeyEquivalent);
objj_msgSend(_e,"setKeyEquivalentModifierMask:",CPUndoKeyEquivalentModifierMask);
objj_msgSend(_f,"setKeyEquivalentModifierMask:",CPRedoKeyEquivalentModifierMask);
objj_msgSend(_d,"addItem:",_e);
objj_msgSend(_d,"addItem:",_f);
objj_msgSend(_d,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Cut",sel_getUid("cut:"),"X")),objj_msgSend(_d,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Copy",sel_getUid("copy:"),"C")),objj_msgSend(_d,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Paste",sel_getUid("paste:"),"V"));
objj_msgSend(_c,"setSubmenu:",_d);
objj_msgSend(_c,"setHidden:",YES);
objj_msgSend(_mainMenu,"addItem:",_c);
objj_msgSend(_mainMenu,"addItem:",objj_msgSend(CPMenuItem,"separatorItem"));
}
return _5;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_10,_11,_12){
with(_10){
if(_delegate==_12){
return;
}
var _13=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
objj_msgSend(_13,"removeObserver:name:object:",_delegate,CPApplicationWillFinishLaunchingNotification,_10);
objj_msgSend(_13,"removeObserver:name:object:",_delegate,CPApplicationDidFinishLaunchingNotification,_10);
}
_delegate=_12;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("applicationWillFinishLaunching:"))){
objj_msgSend(_13,"addObserver:selector:name:object:",_delegate,sel_getUid("applicationWillFinishLaunching:"),CPApplicationWillFinishLaunchingNotification,_10);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("applicationDidFinishLaunching:"))){
objj_msgSend(_13,"addObserver:selector:name:object:",_delegate,sel_getUid("applicationDidFinishLaunching:"),CPApplicationDidFinishLaunchingNotification,_10);
}
}
}),new objj_method(sel_getUid("delegate"),function(_14,_15){
with(_14){
return _delegate;
}
}),new objj_method(sel_getUid("finishLaunching"),function(_16,_17){
with(_16){
var _18=objj_msgSend(CPBundle,"mainBundle"),_19=objj_msgSend(_18,"objectForInfoDictionaryKey:","CPBundleDocumentTypes");
if(objj_msgSend(_19,"count")>0){
_documentController=objj_msgSend(CPDocumentController,"sharedDocumentController");
}
var _1a=objj_msgSend(_18,"objectForInfoDictionaryKey:","CPApplicationDelegateClass");
if(_1a){
var _1b=objj_getClass(_1a);
if(_1b){
if(objj_msgSend(_documentController,"class")==_1b){
objj_msgSend(_16,"setDelegate:",_documentController);
}else{
objj_msgSend(_16,"setDelegate:",objj_msgSend(objj_msgSend(_1b,"alloc"),"init"));
}
}
}
var _1c=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_1c,"postNotificationName:object:",CPApplicationWillFinishLaunchingNotification,_16);
var _1d=window.cpOpeningFilename&&window.cpOpeningFilename(),_1e=!!_documentController;
if(objj_msgSend(_1d,"length")){
_1e=!objj_msgSend(_16,"_openFile:",_1d);
}
if(_1e&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("applicationShouldOpenUntitledFile:"))){
_1e=objj_msgSend(_delegate,"applicationShouldOpenUntitledFile:",_16);
}
if(_1e){
objj_msgSend(_documentController,"newDocument:",_16);
}
objj_msgSend(_1c,"postNotificationName:object:",CPApplicationDidFinishLaunchingNotification,_16);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
_finishedLaunching=YES;
}
}),new objj_method(sel_getUid("terminate:"),function(_1f,_20,_21){
with(_1f){
objj_msgSend(CPPlatform,"terminateApplication");
}
}),new objj_method(sel_getUid("activateIgnoringOtherApps:"),function(_22,_23,_24){
with(_22){
objj_msgSend(CPPlatform,"activateIgnoringOtherApps:",_24);
}
}),new objj_method(sel_getUid("run"),function(_25,_26){
with(_25){
objj_msgSend(_25,"finishLaunching");
}
}),new objj_method(sel_getUid("runModalForWindow:"),function(_27,_28,_29){
with(_27){
objj_msgSend(_27,"runModalSession:",objj_msgSend(_27,"beginModalSessionForWindow:",_29));
}
}),new objj_method(sel_getUid("stopModalWithCode:"),function(_2a,_2b,_2c){
with(_2a){
if(!_currentSession){
return;
}
_currentSession._state=_2c;
_currentSession=_currentSession._previous;
objj_msgSend(_2a,"_removeRunModalLoop");
}
}),new objj_method(sel_getUid("_removeRunModalLoop"),function(_2d,_2e){
with(_2d){
var _2f=_eventListeners.length;
while(_2f--){
if(_eventListeners[_2f]._callback===_30){
_eventListeners.splice(_2f,1);
return;
}
}
}
}),new objj_method(sel_getUid("stopModal"),function(_31,_32){
with(_31){
objj_msgSend(_31,"stopModalWithCode:",CPRunStoppedResponse);
}
}),new objj_method(sel_getUid("abortModal"),function(_33,_34){
with(_33){
objj_msgSend(_33,"stopModalWithCode:",CPRunAbortedResponse);
}
}),new objj_method(sel_getUid("beginModalSessionForWindow:"),function(_35,_36,_37){
with(_35){
return _38(_37,0);
}
}),new objj_method(sel_getUid("runModalSession:"),function(_39,_3a,_3b){
with(_39){
_3b._previous=_currentSession;
_currentSession=_3b;
var _3c=_3b._window;
objj_msgSend(_3c,"center");
objj_msgSend(_3c,"makeKeyAndOrderFront:",_39);
objj_msgSend(CPApp,"setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:",_30,CPAnyEventMask,nil,0,NO);
}
}),new objj_method(sel_getUid("modalWindow"),function(_3d,_3e){
with(_3d){
if(!_currentSession){
return nil;
}
return _currentSession._window;
}
}),new objj_method(sel_getUid("_handleKeyEquivalent:"),function(_3f,_40,_41){
with(_3f){
if(objj_msgSend(_mainMenu,"performKeyEquivalent:",_41)){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("sendEvent:"),function(_42,_43,_44){
with(_42){
_currentEvent=_44;
if(objj_msgSend(_44,"type")==CPKeyDown&&objj_msgSend(_44,"modifierFlags")&(CPCommandKeyMask|CPControlKeyMask)&&objj_msgSend(objj_msgSend(_44,"characters"),"length")>0&&objj_msgSend(_42,"_handleKeyEquivalent:",_44)){
return;
}
if(_eventListeners.length){
if(_eventListeners[_eventListeners.length-1]._mask&(1<<objj_msgSend(_44,"type"))){
_eventListeners.pop()._callback(_44);
}
return;
}
objj_msgSend(objj_msgSend(_44,"window"),"sendEvent:",_44);
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_45,_46,_47){
with(_45){
if(objj_msgSend(_delegate,"respondsToSelector:",_47)){
objj_msgSend(_delegate,"performSelector:",_47);
}else{
objj_msgSendSuper({receiver:_45,super_class:objj_getClass("CPResponder")},"doCommandBySelector:",_47);
}
}
}),new objj_method(sel_getUid("keyWindow"),function(_48,_49){
with(_48){
return _keyWindow;
}
}),new objj_method(sel_getUid("mainWindow"),function(_4a,_4b){
with(_4a){
return _mainWindow;
}
}),new objj_method(sel_getUid("windowWithWindowNumber:"),function(_4c,_4d,_4e){
with(_4c){
return _windows[_4e];
}
}),new objj_method(sel_getUid("windows"),function(_4f,_50){
with(_4f){
return _windows;
}
}),new objj_method(sel_getUid("mainMenu"),function(_51,_52){
with(_51){
return _mainMenu;
}
}),new objj_method(sel_getUid("setMainMenu:"),function(_53,_54,_55){
with(_53){
if(objj_msgSend(_55,"_menuName")==="CPMainMenu"){
if(_mainMenu===_55){
return;
}
_mainMenu=_55;
if(objj_msgSend(CPPlatform,"supportsNativeMainMenu")){
window.cpSetMainMenu(_mainMenu);
}
}else{
objj_msgSend(_55,"_setMenuName:","CPMainMenu");
}
}
}),new objj_method(sel_getUid("orderFrontColorPanel:"),function(_56,_57,_58){
with(_56){
objj_msgSend(objj_msgSend(CPColorPanel,"sharedColorPanel"),"orderFront:",_56);
}
}),new objj_method(sel_getUid("orderFrontStandardAboutPanel:"),function(_59,_5a,_5b){
with(_59){
objj_msgSend(_59,"orderFrontStandardAboutPanelWithOptions:",nil);
}
}),new objj_method(sel_getUid("orderFrontStandardAboutPanelWithOptions:"),function(_5c,_5d,_5e){
with(_5c){
}
}),new objj_method(sel_getUid("tryToPerform:with:"),function(_5f,_60,_61,_62){
with(_5f){
if(!_61){
return NO;
}
if(objj_msgSendSuper({receiver:_5f,super_class:objj_getClass("CPResponder")},"tryToPerform:with:",_61,_62)){
return YES;
}
if(objj_msgSend(_delegate,"respondsToSelector:",_61)){
objj_msgSend(_delegate,"performSelector:withObject:",_61,_62);
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("sendAction:to:from:"),function(_63,_64,_65,_66,_67){
with(_63){
var _68=objj_msgSend(_63,"targetForAction:to:from:",_65,_66,_67);
if(!_68){
return NO;
}
objj_msgSend(_68,"performSelector:withObject:",_65,_67);
return YES;
}
}),new objj_method(sel_getUid("targetForAction:to:from:"),function(_69,_6a,_6b,_6c,_6d){
with(_69){
if(!_6b){
return nil;
}
if(_6c){
return _6c;
}
return objj_msgSend(_69,"targetForAction:",_6b);
}
}),new objj_method(sel_getUid("_targetForWindow:action:"),function(_6e,_6f,_70,_71){
with(_6e){
var _72=objj_msgSend(_70,"firstResponder"),_73=YES;
while(_72){
if(objj_msgSend(_72,"respondsToSelector:",_71)){
return _72;
}
if(_72==_70){
_73=NO;
}
_72=objj_msgSend(_72,"nextResponder");
}
if(_73&&objj_msgSend(_70,"respondsToSelector:",_71)){
return _70;
}
var _74=objj_msgSend(_70,"delegate");
if(objj_msgSend(_74,"respondsToSelector:",_71)){
return _74;
}
var _75=objj_msgSend(_70,"windowController");
if(objj_msgSend(_75,"respondsToSelector:",_71)){
return _75;
}
var _76=objj_msgSend(_75,"document");
if(_76!=_74&&objj_msgSend(_76,"respondsToSelector:",_71)){
return _76;
}
return nil;
}
}),new objj_method(sel_getUid("targetForAction:"),function(_77,_78,_79){
with(_77){
if(!_79){
return nil;
}
var _7a=objj_msgSend(_77,"_targetForWindow:action:",objj_msgSend(_77,"keyWindow"),_79);
if(_7a){
return _7a;
}
_7a=objj_msgSend(_77,"_targetForWindow:action:",objj_msgSend(_77,"mainWindow"),_79);
if(_7a){
return _7a;
}
if(objj_msgSend(_77,"respondsToSelector:",_79)){
return _77;
}
if(objj_msgSend(_delegate,"respondsToSelector:",_79)){
return _delegate;
}
if(objj_msgSend(_documentController,"respondsToSelector:",_79)){
return _documentController;
}
return nil;
}
}),new objj_method(sel_getUid("setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:"),function(_7b,_7c,_7d,_7e,_7f,_80,_81){
with(_7b){
_eventListeners.push(_82(_7e,_7d));
if(_eventListeners.length==3){
objj_debug_print_backtrace();
}
}
}),new objj_method(sel_getUid("setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:"),function(_83,_84,_85,_86,_87,_88,_89,_8a){
with(_83){
_eventListeners.push(_82(_87,function(_8b){
objj_msgSend(_85,_86,_8b);
}));
}
}),new objj_method(sel_getUid("currentEvent"),function(_8c,_8d){
with(_8c){
return _currentEvent;
}
}),new objj_method(sel_getUid("beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:"),function(_8e,_8f,_90,_91,_92,_93,_94){
with(_8e){
var _95=objj_msgSend(_90,"styleMask");
if(!(_95&CPDocModalWindowMask)){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Currently only CPDocModalWindowMask style mask is supported for attached sheets");
return;
}
objj_msgSend(_91,"_attachSheet:modalDelegate:didEndSelector:contextInfo:",_90,_92,_93,_94);
}
}),new objj_method(sel_getUid("endSheet:returnCode:"),function(_96,_97,_98,_99){
with(_96){
var _9a=objj_msgSend(_windows,"count");
while(--_9a>=0){
var _9b=objj_msgSend(_windows,"objectAtIndex:",_9a);
var _9c=_9b._sheetContext;
if(_9c!=nil&&_9c["sheet"]===_98){
_9c["returnCode"]=_99;
objj_msgSend(_9b,"_detachSheetWindow");
return;
}
}
}
}),new objj_method(sel_getUid("endSheet:"),function(_9d,_9e,_9f){
with(_9d){
objj_msgSend(_9d,"endSheet:returnCode:",_9f,0);
}
}),new objj_method(sel_getUid("arguments"),function(_a0,_a1){
with(_a0){
if(_fullArgsString!=window.location.hash){
objj_msgSend(_a0,"_reloadArguments");
}
return _args;
}
}),new objj_method(sel_getUid("setArguments:"),function(_a2,_a3,_a4){
with(_a2){
if(!_a4||_a4.length==0){
_args=[];
window.location.hash="#";
return;
}
if(objj_msgSend(_a4,"class")!=CPArray){
_a4=objj_msgSend(CPArray,"arrayWithObject:",_a4);
}
_args=_a4;
var _a5=objj_msgSend(_args,"copy");
for(var i=0,_a7=_a5.length;i<_a7;i++){
_a5[i]=encodeURIComponent(_a5[i]);
}
var _a8=objj_msgSend(_a5,"componentsJoinedByString:","/");
window.location.hash="#"+_a8;
}
}),new objj_method(sel_getUid("_reloadArguments"),function(_a9,_aa){
with(_a9){
_fullArgsString=window.location.hash;
var _ab=_fullArgsString.replace("#","").split("/").slice(0);
for(var i=0,_ad=_ab.length;i<_ad;i++){
_ab[i]=decodeURIComponent(_ab[i]);
}
_args=_ab;
}
}),new objj_method(sel_getUid("namedArguments"),function(_ae,_af){
with(_ae){
return _namedArgs;
}
}),new objj_method(sel_getUid("_openFile:"),function(_b0,_b1,_b2){
with(_b0){
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("application:openFile:"))){
return objj_msgSend(_delegate,"application:openFile:",_b0,_b2);
}else{
return objj_msgSend(_documentController,"openDocumentWithContentsOfURL:display:error:",_b2,YES,NULL);
}
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("sharedApplication"),function(_b3,_b4){
with(_b3){
if(!CPApp){
CPApp=objj_msgSend(objj_msgSend(CPApplication,"alloc"),"init");
}
return CPApp;
}
})]);
var _38=function(_b5,_b6){
return {_window:_b5,_state:CPRunContinuesResponse,_previous:nil};
};
var _82=function(_b7,_b8){
return {_mask:_b7,_callback:_b8};
};
var _30=function(_b9){
objj_msgSend(CPApp,"setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:",_30,CPAnyEventMask,nil,0,NO);
var _ba=objj_msgSend(_b9,"window"),_bb=CPApp._currentSession;
if(_ba==_bb._window||objj_msgSend(_ba,"worksWhenModal")){
objj_msgSend(_ba,"sendEvent:",_b9);
}
};
CPApplicationMain=function(_bc,_bd){
var _be=objj_msgSend(CPBundle,"mainBundle"),_bf=objj_msgSend(_be,"principalClass");
if(!_bf){
_bf=objj_msgSend(CPApplication,"class");
}
objj_msgSend(_bf,"sharedApplication");
if(!_bc){
var _bc=objj_msgSend(CPApp,"arguments");
if(objj_msgSend(_bc,"containsObject:","debug")){
CPLogRegister(CPLogPopup);
}
}
if(!_bd){
var _c0=window.location.search.substring(1).split("&");
_bd=objj_msgSend(CPDictionary,"dictionary");
for(var i=0;i<_c0.length;i++){
var _c2=_c0[i].indexOf("=");
if(_c2==-1){
objj_msgSend(_bd,"setObject:forKey:","",_c0[i]);
}else{
objj_msgSend(_bd,"setObject:forKey:",_c0[i].substring(_c2+1),_c0[i].substring(0,_c2));
}
}
}
CPApp._args=_bc;
CPApp._namedArgs=_bd;
objj_msgSend(_CPAppBootstrapper,"performActions");
};
var _c3=nil;
var _3=objj_allocateClassPair(CPObject,"_CPAppBootstrapper"),_4=_3.isa;
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("actions"),function(_c4,_c5){
with(_c4){
return [sel_getUid("bootstrapPlatform"),sel_getUid("loadDefaultTheme"),sel_getUid("loadMainCibFile")];
}
}),new objj_method(sel_getUid("performActions"),function(_c6,_c7){
with(_c6){
if(!_c3){
_c3=objj_msgSend(_c6,"actions");
}
while(_c3.length){
var _c8=_c3.shift();
if(objj_msgSend(_c6,_c8)){
return;
}
}
objj_msgSend(CPApp,"run");
}
}),new objj_method(sel_getUid("bootstrapPlatform"),function(_c9,_ca){
with(_c9){
return objj_msgSend(CPPlatform,"bootstrap");
}
}),new objj_method(sel_getUid("loadDefaultTheme"),function(_cb,_cc){
with(_cb){
var _cd=objj_msgSend(objj_msgSend(CPThemeBlend,"alloc"),"initWithContentsOfURL:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPApplication,"class")),"pathForResource:","Aristo.blend"));
objj_msgSend(_cd,"loadWithDelegate:",_cb);
return YES;
}
}),new objj_method(sel_getUid("blendDidFinishLoading:"),function(_ce,_cf,_d0){
with(_ce){
objj_msgSend(CPTheme,"setDefaultTheme:",objj_msgSend(CPTheme,"themeNamed:","Aristo"));
objj_msgSend(_ce,"performActions");
}
}),new objj_method(sel_getUid("loadMainCibFile"),function(_d1,_d2){
with(_d1){
var _d3=objj_msgSend(CPBundle,"mainBundle"),_d4=objj_msgSend(_d3,"objectForInfoDictionaryKey:",_1)||objj_msgSend(_d3,"objectForInfoDictionaryKey:",_2);
if(_d4){
objj_msgSend(_d3,"loadCibFile:externalNameTable:loadDelegate:",_d4,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",CPApp,CPCibOwner),_d1);
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("cibDidFinishLoading:"),function(_d5,_d6,_d7){
with(_d5){
objj_msgSend(_d5,"performActions");
}
})]);
