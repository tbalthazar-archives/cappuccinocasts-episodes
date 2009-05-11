I;21;Foundation/CPObject.jc;3174;
var _1="_CPCibWindowTemplateMinSizeKey",_2="_CPCibWindowTemplateMaxSizeKey",_3="_CPCibWindowTemplateViewClassKey",_4="_CPCibWindowTemplateWindowClassKey",_5="_CPCibWindowTemplateWindowRectKey",_6="_CPCibWindowTempatStyleMaskKey",_7="_CPCibWindowTemplateWindowTitleKey",_8="_CPCibWindowTemplateWindowViewKey",_9="_CPCibWindowTemplateWindowIsFullBridgeKey";
var _a=objj_allocateClassPair(CPObject,"_CPCibWindowTemplate"),_b=_a.isa;
class_addIvars(_a,[new objj_ivar("_minSize"),new objj_ivar("_maxSize"),new objj_ivar("_viewClass"),new objj_ivar("_windowClass"),new objj_ivar("_windowRect"),new objj_ivar("_windowStyleMask"),new objj_ivar("_windowTitle"),new objj_ivar("_windowView"),new objj_ivar("_windowIsFullBridge")]);
objj_registerClassPair(_a);
objj_addClassForBundle(_a,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_a,[new objj_method(sel_getUid("initWithCoder:"),function(_c,_d,_e){
with(_c){
_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("CPObject")},"init");
if(_c){
if(objj_msgSend(_e,"containsValueForKey:",_1)){
_minSize=objj_msgSend(_e,"decodeSizeForKey:",_1);
}
if(objj_msgSend(_e,"containsValueForKey:",_2)){
_maxSize=objj_msgSend(_e,"decodeSizeForKey:",_2);
}
_viewClass=objj_msgSend(_e,"decodeObjectForKey:",_3);
_windowClass=objj_msgSend(_e,"decodeObjectForKey:",_4);
_windowRect=objj_msgSend(_e,"decodeRectForKey:",_5);
_windowStyleMask=objj_msgSend(_e,"decodeIntForKey:",_6);
_windowTitle=objj_msgSend(_e,"decodeObjectForKey:",_7);
_windowView=objj_msgSend(_e,"decodeObjectForKey:",_8);
_windowIsFullBridge=objj_msgSend(_e,"decodeObjectForKey:",_9);
}
return _c;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_f,_10,_11){
with(_f){
if(_minSize){
objj_msgSend(_11,"encodeSize:forKey:",_minSize,_1);
}
if(_maxSize){
objj_msgSend(_11,"encodeSize:forKey:",_maxSize,_2);
}
objj_msgSend(_11,"encodeObject:forKey:",_viewClass,_3);
objj_msgSend(_11,"encodeObject:forKey:",_windowClass,_4);
objj_msgSend(_11,"encodeRect:forKey:",_windowRect,_5);
objj_msgSend(_11,"encodeInt:forKey:",_windowStyleMask,_6);
objj_msgSend(_11,"encodeObject:forKey:",_windowTitle,_7);
objj_msgSend(_11,"encodeObject:forKey:",_windowView,_8);
objj_msgSend(_11,"encodeObject:forKey:",_windowIsFullBridge,_9);
}
}),new objj_method(sel_getUid("windowClass"),function(_12,_13){
with(_12){
return _windowClass;
}
}),new objj_method(sel_getUid("_cibInstantiate"),function(_14,_15){
with(_14){
var _16=CPClassFromString(objj_msgSend(_14,"windowClass"));
var _17=objj_msgSend(objj_msgSend(_16,"alloc"),"initWithContentRect:styleMask:",_windowRect,_windowStyleMask);
if(_minSize){
objj_msgSend(_17,"setMinSize:",_minSize);
}
if(_maxSize){
objj_msgSend(_17,"setMaxSize:",_maxSize);
}
objj_msgSend(_17,"setLevel:",CPFloatingWindowLevel);
objj_msgSend(_17,"setTitle:",_windowTitle);
objj_msgSend(_windowView,"setAutoresizesSubviews:",NO);
objj_msgSend(_17,"setContentView:",_windowView);
objj_msgSend(_windowView,"setAutoresizesSubviews:",YES);
if(objj_msgSend(_viewClass,"isKindOfClass:",objj_msgSend(CPToolbar,"class"))){
objj_msgSend(_17,"setToolbar:",_viewClass);
}
objj_msgSend(_17,"setFullBridge:",_windowIsFullBridge);
return _17;
}
})]);
