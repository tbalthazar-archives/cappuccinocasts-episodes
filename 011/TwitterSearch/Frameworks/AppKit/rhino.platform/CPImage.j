I;21;Foundation/CPBundle.jI;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.jI;21;Foundation/CPString.ji;12;CPGeometry.jc;9082;
CPImageLoadStatusInitialized=0;
CPImageLoadStatusLoading=1;
CPImageLoadStatusCompleted=2;
CPImageLoadStatusCancelled=3;
CPImageLoadStatusInvalidData=4;
CPImageLoadStatusUnexpectedEOF=5;
CPImageLoadStatusReadError=6;
CPImageDidLoadNotification="CPImageDidLoadNotification";
CPImageInBundle=function(_1,_2,_3){
if(!_3){
_3=objj_msgSend(CPBundle,"mainBundle");
}
if(_2){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_3,"pathForResource:",_1),_2);
}
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_3,"pathForResource:",_1));
};
var _4=objj_getClass("CPBundle");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPBundle\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("pathForResource:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"resourcePath")+"/"+_8;
}
})]);
var _4=objj_allocateClassPair(CPObject,"CPImage"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_size"),new objj_ivar("_filename"),new objj_ivar("_delegate"),new objj_ivar("_loadStatus"),new objj_ivar("_image")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("init"),function(_9,_a){
with(_9){
return objj_msgSend(_9,"initByReferencingFile:size:","",CGSizeMake(-1,-1));
}
}),new objj_method(sel_getUid("initByReferencingFile:size:"),function(_b,_c,_d,_e){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPObject")},"init");
if(_b){
_size=CPSizeCreateCopy(_e);
_filename=_d;
_loadStatus=CPImageLoadStatusInitialized;
}
return _b;
}
}),new objj_method(sel_getUid("initWithContentsOfFile:size:"),function(_f,_10,_11,_12){
with(_f){
_f=objj_msgSend(_f,"initByReferencingFile:size:",_11,_12);
if(_f){
objj_msgSend(_f,"load");
}
return _f;
}
}),new objj_method(sel_getUid("initWithContentsOfFile:"),function(_13,_14,_15){
with(_13){
_13=objj_msgSend(_13,"initByReferencingFile:size:",_15,CGSizeMake(-1,-1));
if(_13){
objj_msgSend(_13,"load");
}
return _13;
}
}),new objj_method(sel_getUid("filename"),function(_16,_17){
with(_16){
return _filename;
}
}),new objj_method(sel_getUid("setSize:"),function(_18,_19,_1a){
with(_18){
_size=CGSizeMakeCopy(_1a);
}
}),new objj_method(sel_getUid("size"),function(_1b,_1c){
with(_1b){
return _size;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_1d,_1e,_1f){
with(_1d){
_delegate=_1f;
}
}),new objj_method(sel_getUid("delegate"),function(_20,_21){
with(_20){
return _delegate;
}
}),new objj_method(sel_getUid("loadStatus"),function(_22,_23){
with(_22){
return _loadStatus;
}
}),new objj_method(sel_getUid("load"),function(_24,_25){
with(_24){
if(_loadStatus==CPImageLoadStatusLoading||_loadStatus==CPImageLoadStatusCompleted){
return;
}
_loadStatus=CPImageLoadStatusLoading;
_image=new Image();
var _26=YES;
_image.onload=function(){
if(_26){
window.setTimeout(function(){
objj_msgSend(_24,"_imageDidLoad");
},0);
}else{
objj_msgSend(_24,"_imageDidLoad");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
objj_msgSend(_24,"_derefFromImage");
};
_image.onerror=function(){
if(_26){
window.setTimeout(function(){
objj_msgSend(_24,"_imageDidError");
},0);
}else{
objj_msgSend(_24,"_imageDidError");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
objj_msgSend(_24,"_derefFromImage");
};
_image.onabort=function(){
if(_26){
window.setTimeout(function(){
objj_msgSend(_24,"_imageDidAbort");
},0);
}else{
objj_msgSend(_24,"_imageDidAbort");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
objj_msgSend(_24,"_derefFromImage");
};
_image.src=_filename;
_26=NO;
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_27,_28){
with(_27){
return NO;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_29,_2a){
with(_29){
return NO;
}
}),new objj_method(sel_getUid("_derefFromImage"),function(_2b,_2c){
with(_2b){
_image.onload=null;
_image.onerror=null;
_image.onabort=null;
}
}),new objj_method(sel_getUid("_imageDidLoad"),function(_2d,_2e){
with(_2d){
_loadStatus=CPImageLoadStatusCompleted;
if(!_size||(_size.width==-1&&_size.height==-1)){
_size=CGSizeMake(_image.width,_image.height);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPImageDidLoadNotification,_2d);
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imageDidLoad:"))){
objj_msgSend(_delegate,"imageDidLoad:",_2d);
}
}
}),new objj_method(sel_getUid("_imageDidError"),function(_2f,_30){
with(_2f){
_loadStatus=CPImageLoadStatusReadError;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imageDidError:"))){
objj_msgSend(_delegate,"imageDidError:",_2f);
}
}
}),new objj_method(sel_getUid("_imageDidAbort"),function(_31,_32){
with(_31){
_loadStatus=CPImageLoadStatusCancelled;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imageDidAbort:"))){
objj_msgSend(_delegate,"imageDidAbort:",_31);
}
}
})]);
var _4=objj_getClass("CPImage");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPImage\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_33,_34,_35){
with(_33){
return objj_msgSend(_33,"initWithContentsOfFile:size:",objj_msgSend(_35,"decodeObjectForKey:","CPFilename"),objj_msgSend(_35,"decodeSizeForKey:","CPSize"));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_36,_37,_38){
with(_36){
objj_msgSend(_38,"encodeObject:forKey:",_filename,"CPFilename");
objj_msgSend(_38,"encodeSize:forKey:",_size,"CPSize");
}
})]);
var _4=objj_allocateClassPair(CPObject,"CPThreePartImage"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_imageSlices"),new objj_ivar("_isVertical")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("initWithImageSlices:isVertical:"),function(_39,_3a,_3b,_3c){
with(_39){
_39=objj_msgSendSuper({receiver:_39,super_class:objj_getClass("CPObject")},"init");
if(_39){
_imageSlices=_3b;
_isVertical=_3c;
}
return _39;
}
}),new objj_method(sel_getUid("filename"),function(_3d,_3e){
with(_3d){
return "";
}
}),new objj_method(sel_getUid("imageSlices"),function(_3f,_40){
with(_3f){
return _imageSlices;
}
}),new objj_method(sel_getUid("isVertical"),function(_41,_42){
with(_41){
return _isVertical;
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_43,_44){
with(_43){
return YES;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_45,_46){
with(_45){
return NO;
}
})]);
var _47="CPThreePartImageImageSlicesKey",_48="CPThreePartImageIsVerticalKey";
var _4=objj_getClass("CPThreePartImage");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPThreePartImage\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_49,_4a,_4b){
with(_49){
_49=objj_msgSendSuper({receiver:_49,super_class:objj_getClass("CPObject")},"init");
if(_49){
_imageSlices=objj_msgSend(_4b,"decodeObjectForKey:",_47);
_isVertical=objj_msgSend(_4b,"decodeBoolForKey:",_48);
}
return _49;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_4c,_4d,_4e){
with(_4c){
objj_msgSend(_4e,"encodeObject:forKey:",_imageSlices,_47);
objj_msgSend(_4e,"encodeBool:forKey:",_isVertical,_48);
}
})]);
var _4=objj_allocateClassPair(CPObject,"CPNinePartImage"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_imageSlices")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("initWithImageSlices:"),function(_4f,_50,_51){
with(_4f){
_4f=objj_msgSendSuper({receiver:_4f,super_class:objj_getClass("CPObject")},"init");
if(_4f){
_imageSlices=_51;
}
return _4f;
}
}),new objj_method(sel_getUid("filename"),function(_52,_53){
with(_52){
return "";
}
}),new objj_method(sel_getUid("imageSlices"),function(_54,_55){
with(_54){
return _imageSlices;
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_56,_57){
with(_56){
return NO;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_58,_59){
with(_58){
return YES;
}
})]);
var _5a="CPNinePartImageImageSlicesKey";
var _4=objj_getClass("CPNinePartImage");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPNinePartImage\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_5b,_5c,_5d){
with(_5b){
_5b=objj_msgSendSuper({receiver:_5b,super_class:objj_getClass("CPObject")},"init");
if(_5b){
_imageSlices=objj_msgSend(_5d,"decodeObjectForKey:",_5a);
}
return _5b;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_5e,_5f,_60){
with(_5e){
objj_msgSend(_60,"encodeObject:forKey:",_imageSlices,_5a);
}
})]);
