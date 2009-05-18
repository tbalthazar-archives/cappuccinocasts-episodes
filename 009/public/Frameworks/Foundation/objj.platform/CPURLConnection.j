i;10;CPObject.ji;11;CPRunLoop.ji;14;CPURLRequest.ji;15;CPURLResponse.jc;4217;
var _1=0,_2=1,_3=2,_4=3,_5=4;
var _6=nil;
var _7=objj_allocateClassPair(CPObject,"CPURLConnection"),_8=_7.isa;
class_addIvars(_7,[new objj_ivar("_request"),new objj_ivar("_delegate"),new objj_ivar("_isCanceled"),new objj_ivar("_isLocalFileConnection"),new objj_ivar("_XMLHTTPRequest")]);
objj_registerClassPair(_7);
objj_addClassForBundle(_7,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_7,[new objj_method(sel_getUid("initWithRequest:delegate:startImmediately:"),function(_9,_a,_b,_c,_d){
with(_9){
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPObject")},"init");
if(_9){
_request=_b;
_delegate=_c;
_isCanceled=NO;
var _e=objj_msgSend(_request,"URL");
_isLocalFileConnection=_e.indexOf("file:")===0||((_e.indexOf("http:")!==0||_e.indexOf("https:")!==0)&&window.location&&window.location.protocol==="file:");
_XMLHTTPRequest=objj_request_xmlhttp();
if(_d){
objj_msgSend(_9,"start");
}
}
return _9;
}
}),new objj_method(sel_getUid("initWithRequest:delegate:"),function(_f,_10,_11,_12){
with(_f){
return objj_msgSend(_f,"initWithRequest:delegate:startImmediately:",_11,_12,YES);
}
}),new objj_method(sel_getUid("delegate"),function(_13,_14){
with(_13){
return _delegate;
}
}),new objj_method(sel_getUid("start"),function(_15,_16){
with(_15){
_isCanceled=NO;
try{
_XMLHTTPRequest.open(objj_msgSend(_request,"HTTPMethod"),objj_msgSend(_request,"URL"),YES);
_XMLHTTPRequest.onreadystatechange=function(){
objj_msgSend(_15,"_readyStateDidChange");
};
var _17=objj_msgSend(_request,"allHTTPHeaderFields"),key=nil,_19=objj_msgSend(_17,"keyEnumerator");
while(key=objj_msgSend(_19,"nextObject")){
_XMLHTTPRequest.setRequestHeader(key,objj_msgSend(_17,"objectForKey:",key));
}
_XMLHTTPRequest.send(objj_msgSend(_request,"HTTPBody"));
}
catch(anException){
objj_msgSend(_delegate,"connection:didFailWithError:",_15,anException);
}
}
}),new objj_method(sel_getUid("cancel"),function(_1a,_1b){
with(_1a){
_isCanceled=YES;
try{
_XMLHTTPRequest.abort();
}
catch(anException){
}
}
}),new objj_method(sel_getUid("isLocalFileConnection"),function(_1c,_1d){
with(_1c){
return _isLocalFileConnection;
}
}),new objj_method(sel_getUid("_readyStateDidChange"),function(_1e,_1f){
with(_1e){
if(_XMLHTTPRequest.readyState==_5){
var _20=_XMLHTTPRequest.status,URL=objj_msgSend(_request,"URL");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connection:didReceiveResponse:"))){
if(_isLocalFileConnection){
objj_msgSend(_delegate,"connection:didReceiveResponse:",_1e,objj_msgSend(objj_msgSend(CPURLResponse,"alloc"),"initWithURL:",URL));
}else{
var _22=objj_msgSend(objj_msgSend(CPHTTPURLResponse,"alloc"),"initWithURL:",URL);
objj_msgSend(_22,"_setStatusCode:",_20);
objj_msgSend(_delegate,"connection:didReceiveResponse:",_1e,_22);
}
}
if(!_isCanceled){
if(_20==401&&objj_msgSend(_6,"respondsToSelector:",sel_getUid("connectionDidReceiveAuthenticationChallenge:"))){
objj_msgSend(_6,"connectionDidReceiveAuthenticationChallenge:",_1e);
}else{
objj_msgSend(_delegate,"connection:didReceiveData:",_1e,_XMLHTTPRequest.responseText);
objj_msgSend(_delegate,"connectionDidFinishLoading:",_1e);
}
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("_XMLHTTPRequest"),function(_23,_24){
with(_23){
return _XMLHTTPRequest;
}
})]);
class_addMethods(_8,[new objj_method(sel_getUid("setClassDelegate:"),function(_25,_26,_27){
with(_25){
_6=_27;
}
}),new objj_method(sel_getUid("sendSynchronousRequest:returningResponse:error:"),function(_28,_29,_2a,_2b,_2c){
with(_28){
try{
var _2d=objj_request_xmlhttp();
_2d.open(objj_msgSend(_2a,"HTTPMethod"),objj_msgSend(_2a,"URL"),NO);
var _2e=objj_msgSend(_2a,"allHTTPHeaderFields"),key=nil,_30=objj_msgSend(_2e,"keyEnumerator");
while(key=objj_msgSend(_30,"nextObject")){
_2d.setRequestHeader(key,objj_msgSend(_2e,"objectForKey:",key));
}
_2d.send(objj_msgSend(_2a,"HTTPBody"));
return objj_msgSend(CPData,"dataWithString:",_2d.responseText);
}
catch(anException){
}
return nil;
}
}),new objj_method(sel_getUid("connectionWithRequest:delegate:"),function(_31,_32,_33,_34){
with(_31){
return objj_msgSend(objj_msgSend(_31,"alloc"),"initWithRequest:delegate:",_33,_34);
}
})]);
