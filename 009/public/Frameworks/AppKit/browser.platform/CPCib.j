I;21;Foundation/CPObject.jI;28;Foundation/CPURLConnection.jI;25;Foundation/CPURLRequest.ji;20;_CPCibCustomObject.ji;22;_CPCibCustomResource.ji;18;_CPCibCustomView.ji;23;_CPCibKeyedUnarchiver.ji;18;_CPCibObjectData.ji;22;_CPCibWindowTemplate.jc;4170;
CPCibOwner="CPCibOwner",CPCibTopLevelObjects="CPCibTopLevelObjects",CPCibReplacementClasses="CPCibReplacementClasses";
var _1="CPCibObjectDataKey";
var _2=objj_allocateClassPair(CPObject,"CPCib"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_data"),new objj_ivar("_bundle"),new objj_ivar("_awakenCustomResources"),new objj_ivar("_loadDelegate")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithContentsOfURL:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_data=objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:error:",objj_msgSend(CPURLRequest,"requestWithURL:",_6),nil,nil);
_awakenCustomResources=YES;
}
return _4;
}
}),new objj_method(sel_getUid("initWithContentsOfURL:loadDelegate:"),function(_7,_8,_9,_a){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPObject")},"init");
if(_7){
objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",objj_msgSend(CPURLRequest,"requestWithURL:",_9),_7);
_awakenCustomResources=YES;
_loadDelegate=_a;
}
return _7;
}
}),new objj_method(sel_getUid("initWithCibNamed:bundle:loadDelegate:"),function(_b,_c,_d,_e,_f){
with(_b){
if(!objj_msgSend(_d,"hasSuffix:",".cib")){
_d=objj_msgSend(_d,"stringByAppendingString:",".cib");
}
_b=objj_msgSend(_b,"initWithContentsOfURL:loadDelegate:",objj_msgSend(_e||objj_msgSend(CPBundle,"mainBundle"),"pathForResource:",_d),_f);
if(_b){
_bundle=_e;
}
return _b;
}
}),new objj_method(sel_getUid("_setAwakenCustomResources:"),function(_10,_11,_12){
with(_10){
_awakenCustomResources=_12;
}
}),new objj_method(sel_getUid("_awakenCustomResources"),function(_13,_14){
with(_13){
return _awakenCustomResources;
}
}),new objj_method(sel_getUid("instantiateCibWithExternalNameTable:"),function(_15,_16,_17){
with(_15){
var _18=_bundle,_19=objj_msgSend(_17,"objectForKey:",CPCibOwner);
if(!_18&&_19){
_18=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_19,"class"));
}
var _1a=objj_msgSend(objj_msgSend(_CPCibKeyedUnarchiver,"alloc"),"initForReadingWithData:bundle:awakenCustomResources:",_data,_18,_awakenCustomResources),_1b=objj_msgSend(_17,"objectForKey:",CPCibReplacementClasses);
if(_1b){
var key=nil,_1d=objj_msgSend(_1b,"keyEnumerator");
while(key=objj_msgSend(_1d,"nextObject")){
objj_msgSend(_1a,"setClass:forClassName:",objj_msgSend(_1b,"objectForKey:",key),key);
}
}
var _1e=objj_msgSend(_1a,"decodeObjectForKey:",_1);
if(!_1e||!objj_msgSend(_1e,"isKindOfClass:",objj_msgSend(_CPCibObjectData,"class"))){
return NO;
}
var _1f=objj_msgSend(_17,"objectForKey:",CPCibTopLevelObjects);
objj_msgSend(_1e,"instantiateWithOwner:topLevelObjects:",_19,_1f);
objj_msgSend(_1e,"establishConnectionsWithOwner:topLevelObjects:",_19,_1f);
objj_msgSend(_1e,"awakeWithOwner:topLevelObjects:",_19,_1f);
var _20;
if((_20=objj_msgSend(_1e,"mainMenu"))!=nil){
objj_msgSend(CPApp,"setMainMenu:",_20);
objj_msgSend(CPMenu,"setMenuBarVisible:",YES);
}
objj_msgSend(_1e,"displayVisibleWindows");
return YES;
}
}),new objj_method(sel_getUid("instantiateCibWithOwner:topLevelObjects:"),function(_21,_22,_23,_24){
with(_21){
return objj_msgSend(_21,"instantiateCibWithExternalNameTable:",objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_23,CPCibOwner,_24,CPCibTopLevelObjects));
}
})]);
var _2=objj_getClass("CPCib");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPCib\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("connection:didReceiveData:"),function(_25,_26,_27,_28){
with(_25){
_data=objj_msgSend(CPData,"dataWithString:",_28);
}
}),new objj_method(sel_getUid("connection:didFailWithError:"),function(_29,_2a,_2b,_2c){
with(_29){
alert("cib: connection failed.");
_loadDelegate=nil;
}
}),new objj_method(sel_getUid("connectionDidFinishLoading:"),function(_2d,_2e,_2f){
with(_2d){
if(objj_msgSend(_loadDelegate,"respondsToSelector:",sel_getUid("cibDidFinishLoading:"))){
objj_msgSend(_loadDelegate,"cibDidFinishLoading:",_2d);
}
_loadDelegate=nil;
}
})]);
