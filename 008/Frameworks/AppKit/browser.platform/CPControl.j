i;8;CPFont.ji;10;CPShadow.ji;8;CPView.jc;19021;
CPLeftTextAlignment=0;
CPRightTextAlignment=1;
CPCenterTextAlignment=2;
CPJustifiedTextAlignment=3;
CPNaturalTextAlignment=4;
CPRegularControlSize=0;
CPSmallControlSize=1;
CPMiniControlSize=2;
CPControlNormalBackgroundColor="CPControlNormalBackgroundColor";
CPControlSelectedBackgroundColor="CPControlSelectedBackgroundColor";
CPControlHighlightedBackgroundColor="CPControlHighlightedBackgroundColor";
CPControlDisabledBackgroundColor="CPControlDisabledBackgroundColor";
CPControlTextDidBeginEditingNotification="CPControlTextDidBeginEditingNotification";
CPControlTextDidChangeNotification="CPControlTextDidChangeNotification";
CPControlTextDidEndEditingNotification="CPControlTextDidEndEditingNotification";
var _1=objj_msgSend(CPColor,"blackColor");
var _2=objj_allocateClassPair(CPView,"CPControl"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_value"),new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_sendActionOn"),new objj_ivar("_continuousTracking"),new objj_ivar("_trackingWasWithinFrame"),new objj_ivar("_trackingMouseDownFlags"),new objj_ivar("_previousTrackingLocation"),new objj_ivar("_controlState"),new objj_ivar("_ephemeralSubviewsForNames"),new objj_ivar("_ephereralSubviews"),new objj_ivar("_toolTip"),new objj_ivar("_isBezeled")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPView")},"initWithFrame:",_6);
if(_4){
_controlState=CPControlStateNormal;
_sendActionOn=CPLeftMouseUpMask;
_trackingMouseDownFlags=0;
}
return _4;
}
}),new objj_method(sel_getUid("setAction:"),function(_7,_8,_9){
with(_7){
_action=_9;
}
}),new objj_method(sel_getUid("action"),function(_a,_b){
with(_a){
return _action;
}
}),new objj_method(sel_getUid("setTarget:"),function(_c,_d,_e){
with(_c){
_target=_e;
}
}),new objj_method(sel_getUid("target"),function(_f,_10){
with(_f){
return _target;
}
}),new objj_method(sel_getUid("sendAction:to:"),function(_11,_12,_13,_14){
with(_11){
objj_msgSend(CPApp,"sendAction:to:from:",_13,_14,_11);
}
}),new objj_method(sel_getUid("sendActionOn:"),function(_15,_16,_17){
with(_15){
var _18=_sendActionOn;
_sendActionOn=_17;
return _18;
}
}),new objj_method(sel_getUid("isContinuous"),function(_19,_1a){
with(_19){
return (_sendActionOn&CPPeriodicMask)!==0;
}
}),new objj_method(sel_getUid("setContinuous:"),function(_1b,_1c,_1d){
with(_1b){
if(_1d){
_sendActionOn|=CPPeriodicMask;
}else{
_sendActionOn&=~CPPeriodicMask;
}
}
}),new objj_method(sel_getUid("tracksMouseOutsideOfFrame"),function(_1e,_1f){
with(_1e){
return NO;
}
}),new objj_method(sel_getUid("trackMouse:"),function(_20,_21,_22){
with(_20){
var _23=objj_msgSend(_22,"type"),_24=objj_msgSend(_20,"convertPoint:fromView:",objj_msgSend(_22,"locationInWindow"),nil);
isWithinFrame=objj_msgSend(_20,"tracksMouseOutsideOfFrame")||CGRectContainsPoint(objj_msgSend(_20,"bounds"),_24);
if(_23===CPLeftMouseUp){
objj_msgSend(_20,"stopTracking:at:mouseIsUp:",_previousTrackingLocation,_24,YES);
_trackingMouseDownFlags=0;
}else{
if(_23===CPLeftMouseDown){
_trackingMouseDownFlags=objj_msgSend(_22,"modifierFlags");
_continuousTracking=objj_msgSend(_20,"startTrackingAt:",_24);
}else{
if(_23===CPLeftMouseDragged){
if(isWithinFrame){
if(!_trackingWasWithinFrame){
_continuousTracking=objj_msgSend(_20,"startTrackingAt:",_24);
}else{
if(_continuousTracking){
_continuousTracking=objj_msgSend(_20,"continueTracking:at:",_previousTrackingLocation,_24);
}
}
}else{
objj_msgSend(_20,"stopTracking:at:mouseIsUp:",_previousTrackingLocation,_24,NO);
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_20,sel_getUid("trackMouse:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
if((_sendActionOn&(1<<_23))&&isWithinFrame){
objj_msgSend(_20,"sendAction:to:",_action,_target);
}
_trackingWasWithinFrame=isWithinFrame;
_previousTrackingLocation=_24;
}
}),new objj_method(sel_getUid("performClick:"),function(_25,_26,_27){
with(_25){
objj_msgSend(_25,"highlight:",YES);
objj_msgSend(_25,"setState:",objj_msgSend(_25,"nextState"));
objj_msgSend(_25,"sendAction:to:",objj_msgSend(_25,"action"),objj_msgSend(_25,"target"));
objj_msgSend(_25,"highlight:",NO);
}
}),new objj_method(sel_getUid("mouseDownFlags"),function(_28,_29){
with(_28){
return _trackingMouseDownFlags;
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_2a,"highlight:",YES);
return (_sendActionOn&CPPeriodicMask)||(_sendActionOn&CPLeftMouseDraggedMask);
}
}),new objj_method(sel_getUid("continueTracking:at:"),function(_2d,_2e,_2f,_30){
with(_2d){
return (_sendActionOn&CPPeriodicMask)||(_sendActionOn&CPLeftMouseDraggedMask);
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(_31,_32,_33,_34,_35){
with(_31){
objj_msgSend(_31,"highlight:",NO);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_36,_37,_38){
with(_36){
if(!objj_msgSend(_36,"isEnabled")){
return;
}
objj_msgSend(_36,"trackMouse:",_38);
}
}),new objj_method(sel_getUid("objectValue"),function(_39,_3a){
with(_39){
return _value;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_3b,_3c,_3d){
with(_3b){
_value=_3d;
objj_msgSend(_3b,"setNeedsLayout");
objj_msgSend(_3b,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("floatValue"),function(_3e,_3f){
with(_3e){
var _40=parseFloat(_value,10);
return isNaN(_40)?0:_40;
}
}),new objj_method(sel_getUid("setFloatValue:"),function(_41,_42,_43){
with(_41){
objj_msgSend(_41,"setObjectValue:",_43);
}
}),new objj_method(sel_getUid("doubleValue"),function(_44,_45){
with(_44){
var _46=parseFloat(_value,10);
return isNaN(_46)?0:_46;
}
}),new objj_method(sel_getUid("setDoubleValue:"),function(_47,_48,_49){
with(_47){
objj_msgSend(_47,"setObjectValue:",_49);
}
}),new objj_method(sel_getUid("intValue"),function(_4a,_4b){
with(_4a){
var _4c=parseInt(_value,10);
return isNaN(_4c)?0:_4c;
}
}),new objj_method(sel_getUid("setIntValue:"),function(_4d,_4e,_4f){
with(_4d){
objj_msgSend(_4d,"setObjectValue:",_4f);
}
}),new objj_method(sel_getUid("integerValue"),function(_50,_51){
with(_50){
var _52=parseInt(_value,10);
return isNaN(_52)?0:_52;
}
}),new objj_method(sel_getUid("setIntegerValue:"),function(_53,_54,_55){
with(_53){
objj_msgSend(_53,"setObjectValue:",_55);
}
}),new objj_method(sel_getUid("stringValue"),function(_56,_57){
with(_56){
return (_value===undefined||_value===nil)?"":String(_value);
}
}),new objj_method(sel_getUid("setStringValue:"),function(_58,_59,_5a){
with(_58){
objj_msgSend(_58,"setObjectValue:",_5a);
}
}),new objj_method(sel_getUid("takeDoubleValueFrom:"),function(_5b,_5c,_5d){
with(_5b){
if(objj_msgSend(_5d,"respondsToSelector:",sel_getUid("doubleValue"))){
objj_msgSend(_5b,"setDoubleValue:",objj_msgSend(_5d,"doubleValue"));
}
}
}),new objj_method(sel_getUid("takeFloatValueFrom:"),function(_5e,_5f,_60){
with(_5e){
if(objj_msgSend(_60,"respondsToSelector:",sel_getUid("floatValue"))){
objj_msgSend(_5e,"setFloatValue:",objj_msgSend(_60,"floatValue"));
}
}
}),new objj_method(sel_getUid("takeIntegerValueFrom:"),function(_61,_62,_63){
with(_61){
if(objj_msgSend(_63,"respondsToSelector:",sel_getUid("integerValue"))){
objj_msgSend(_61,"setIntegerValue:",objj_msgSend(_63,"integerValue"));
}
}
}),new objj_method(sel_getUid("takeIntValueFrom:"),function(_64,_65,_66){
with(_64){
if(objj_msgSend(_66,"respondsToSelector:",sel_getUid("intValue"))){
objj_msgSend(_64,"setIntValue:",objj_msgSend(_66,"intValue"));
}
}
}),new objj_method(sel_getUid("takeObjectValueFrom:"),function(_67,_68,_69){
with(_67){
if(objj_msgSend(_69,"respondsToSelector:",sel_getUid("objectValue"))){
objj_msgSend(_67,"setObjectValue:",objj_msgSend(_69,"objectValue"));
}
}
}),new objj_method(sel_getUid("takeStringValueFrom:"),function(_6a,_6b,_6c){
with(_6a){
if(objj_msgSend(_6c,"respondsToSelector:",sel_getUid("stringValue"))){
objj_msgSend(_6a,"setStringValue:",objj_msgSend(_6c,"stringValue"));
}
}
}),new objj_method(sel_getUid("textDidBeginEditing:"),function(_6d,_6e,_6f){
with(_6d){
if(objj_msgSend(_6f,"object")!=_6d){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidBeginEditingNotification,_6d,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_6f,"object"),"CPFieldEditor"));
}
}),new objj_method(sel_getUid("textDidChange:"),function(_70,_71,_72){
with(_70){
if(objj_msgSend(_72,"object")!=_70){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidChangeNotification,_70,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_72,"object"),"CPFieldEditor"));
}
}),new objj_method(sel_getUid("textDidEndEditing:"),function(_73,_74,_75){
with(_73){
if(objj_msgSend(_75,"object")!=_73){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidEndEditingNotification,_73,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_75,"object"),"CPFieldEditor"));
}
}),new objj_method(sel_getUid("setAlignment:"),function(_76,_77,_78){
with(_76){
objj_msgSend(_76,"setValue:forThemedAttributeName:",_78,"alignment");
}
}),new objj_method(sel_getUid("alignment"),function(_79,_7a){
with(_79){
return objj_msgSend(_79,"valueForThemedAttributeName:","alignment");
}
}),new objj_method(sel_getUid("setVerticalAlignment:"),function(_7b,_7c,_7d){
with(_7b){
objj_msgSend(_7b,"setValue:forThemedAttributeName:",_7d,"vertical-alignment");
}
}),new objj_method(sel_getUid("verticalAlignment"),function(_7e,_7f){
with(_7e){
return objj_msgSend(_7e,"valueForThemedAttributeName:","vertical-alignment");
}
}),new objj_method(sel_getUid("setLineBreakMode:"),function(_80,_81,_82){
with(_80){
objj_msgSend(_80,"setValue:forThemedAttributeName:",_82,"line-break-mode");
}
}),new objj_method(sel_getUid("lineBreakMode"),function(_83,_84){
with(_83){
return objj_msgSend(_83,"valueForThemedAttributeName:","line-break-mode");
}
}),new objj_method(sel_getUid("setTextColor:"),function(_85,_86,_87){
with(_85){
objj_msgSend(_85,"setValue:forThemedAttributeName:",_87,"text-color");
}
}),new objj_method(sel_getUid("textColor"),function(_88,_89){
with(_88){
return objj_msgSend(_88,"valueForThemedAttributeName:","text-color");
}
}),new objj_method(sel_getUid("setFont:"),function(_8a,_8b,_8c){
with(_8a){
objj_msgSend(_8a,"setValue:forThemedAttributeName:",_8c,"font");
}
}),new objj_method(sel_getUid("font"),function(_8d,_8e){
with(_8d){
return objj_msgSend(_8d,"valueForThemedAttributeName:","font");
}
}),new objj_method(sel_getUid("setTextShadowColor:"),function(_8f,_90,_91){
with(_8f){
objj_msgSend(_8f,"setValue:forThemedAttributeName:",_91,"text-shadow-color");
}
}),new objj_method(sel_getUid("textShadowColor"),function(_92,_93){
with(_92){
return objj_msgSend(_92,"valueForThemedAttributeName:","text-shadow-color");
}
}),new objj_method(sel_getUid("setTextShadowOffset:"),function(_94,_95,_96){
with(_94){
objj_msgSend(_94,"setValue:forThemedAttributeName:",_96,"text-shadow-offset");
}
}),new objj_method(sel_getUid("textShadowOffset"),function(_97,_98){
with(_97){
return objj_msgSend(_97,"valueForThemedAttributeName:","text-shadow-offset");
}
}),new objj_method(sel_getUid("setImagePosition:"),function(_99,_9a,_9b){
with(_99){
objj_msgSend(_99,"setValue:forThemedAttributeName:",_9b,"image-position");
}
}),new objj_method(sel_getUid("imagePosition"),function(_9c,_9d){
with(_9c){
return objj_msgSend(_9c,"valueForThemedAttributeName:","image-position");
}
}),new objj_method(sel_getUid("setImageScaling:"),function(_9e,_9f,_a0){
with(_9e){
objj_msgSend(_9e,"setValue:forThemedAttributeName:",_a0,"image-scaling");
}
}),new objj_method(sel_getUid("imageScaling"),function(_a1,_a2){
with(_a1){
return objj_msgSend(_a1,"valueForThemedAttributeName:","image-scaling");
}
}),new objj_method(sel_getUid("controlState"),function(_a3,_a4){
with(_a3){
return _controlState;
}
}),new objj_method(sel_getUid("setEnabled:"),function(_a5,_a6,_a7){
with(_a5){
if((!(_controlState&CPControlStateDisabled))===_a7){
return;
}
if(_a7){
_controlState&=~CPControlStateDisabled;
}else{
_controlState|=CPControlStateDisabled;
}
objj_msgSend(_a5,"setNeedsLayout");
objj_msgSend(_a5,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("isEnabled"),function(_a8,_a9){
with(_a8){
return !(_controlState&CPControlStateDisabled);
}
}),new objj_method(sel_getUid("highlight:"),function(_aa,_ab,_ac){
with(_aa){
objj_msgSend(_aa,"setHighlighted:",_ac);
}
}),new objj_method(sel_getUid("setHighlighted:"),function(_ad,_ae,_af){
with(_ad){
if((!!(_controlState&CPControlStateHighlighted))===_af){
return;
}
if(_af){
_controlState|=CPControlStateHighlighted;
}else{
_controlState&=~CPControlStateHighlighted;
}
objj_msgSend(_ad,"setNeedsLayout");
objj_msgSend(_ad,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("isHighlighted"),function(_b0,_b1){
with(_b0){
return !!(_controlState&CPControlStateHighlighted);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_b2,_b3,_b4){
with(_b2){
return nil;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_b5,_b6,_b7){
with(_b5){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
}),new objj_method(sel_getUid("layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:"),function(_b8,_b9,_ba,_bb,_bc){
with(_b8){
if(!_ephemeralSubviewsForNames){
_ephemeralSubviewsForNames={};
_ephemeralSubviews=objj_msgSend(CPSet,"set");
}
var _bd=objj_msgSend(_b8,"rectForEphemeralSubviewNamed:",_ba);
if(_bd&&!(_bd.size.width<=0||_bd.size.height<=0)){
if(!_ephemeralSubviewsForNames[_ba]){
_ephemeralSubviewsForNames[_ba]=objj_msgSend(_b8,"createEphemeralSubviewNamed:",_ba);
objj_msgSend(_ephemeralSubviews,"addObject:",_ephemeralSubviewsForNames[_ba]);
if(_ephemeralSubviewsForNames[_ba]){
objj_msgSend(_b8,"addSubview:positioned:relativeTo:",_ephemeralSubviewsForNames[_ba],_bb,_ephemeralSubviewsForNames[_bc]);
}
}
if(_ephemeralSubviewsForNames[_ba]){
objj_msgSend(_ephemeralSubviewsForNames[_ba],"setFrame:",_bd);
}
}else{
if(_ephemeralSubviewsForNames[_ba]){
objj_msgSend(_ephemeralSubviewsForNames[_ba],"removeFromSuperview");
objj_msgSend(_ephemeralSubviews,"removeObject:",_ephemeralSubviewsForNames[_ba]);
delete _ephemeralSubviewsForNames[_ba];
}
}
return _ephemeralSubviewsForNames[_ba];
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("themedAttributes"),function(_be,_bf){
with(_be){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[CPLeftTextAlignment,CPTopVerticalTextAlignment,CPLineBreakByClipping,objj_msgSend(CPColor,"blackColor"),objj_msgSend(CPFont,"systemFontOfSize:",12),nil,{width:0,height:0},CPImageLeft,CPScaleToFit],["alignment","vertical-alignment","line-break-mode","text-color","font","text-shadow-color","text-shadow-offset","image-position","image-scaling"]);
}
})]);
var _c0="CPControlValueKey",_c1="CPControlControlStateKey",_c2="CPControlIsEnabledKey",_c3="CPControlTargetKey",_c4="CPControlActionKey",_c5="CPControlSendActionOnKey";
var _c6="CPImageViewImageKey";
var _2=objj_getClass("CPControl");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPControl\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_c7,_c8,_c9){
with(_c7){
_c7=objj_msgSendSuper({receiver:_c7,super_class:objj_getClass("CPView")},"initWithCoder:",_c9);
if(_c7){
_controlState=objj_msgSend(_c9,"decodeObjectForKey:",_c1);
objj_msgSend(_c7,"setObjectValue:",objj_msgSend(_c9,"decodeObjectForKey:",_c0));
objj_msgSend(_c7,"setTarget:",objj_msgSend(_c9,"decodeObjectForKey:",_c3));
objj_msgSend(_c7,"setAction:",objj_msgSend(_c9,"decodeObjectForKey:",_c4));
objj_msgSend(_c7,"sendActionOn:",objj_msgSend(_c9,"decodeIntForKey:",_c5));
}
return _c7;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_ca,_cb,_cc){
with(_ca){
var _cd=objj_msgSend(_subviews,"count"),_ce;
subviews=nil;
if(_cd>0&&objj_msgSend(_ephemeralSubviews,"count")>0){
subviews=objj_msgSend(_subviews.slice(0),"copy");
while(_cd--){
if(objj_msgSend(_ephemeralSubviews,"containsObject:",_subviews[_cd])){
_subviews.splice(_cd,1);
}
}
}
objj_msgSendSuper({receiver:_ca,super_class:objj_getClass("CPView")},"encodeWithCoder:",_cc);
if(subviews){
_subviews=subviews;
}
objj_msgSend(_cc,"encodeObject:forKey:",_controlState,_c1);
objj_msgSend(_cc,"encodeObject:forKey:",_value,_c0);
objj_msgSend(_cc,"encodeConditionalObject:forKey:",_target,_c3);
objj_msgSend(_cc,"encodeObject:forKey:",_action,_c4);
objj_msgSend(_cc,"encodeInt:forKey:",_sendActionOn,_c5);
}
})]);
var _cf=[],_d0={},_d1={},_d2={};
_cf[CPRegularControlSize]="Regular";
_cf[CPSmallControlSize]="Small";
_cf[CPMiniControlSize]="Mini";
_CPControlIdentifierForControlSize=function(_d3){
return _cf[_d3];
};
_CPControlColorWithPatternImage=function(_d4,_d5){
var _d6=1,_d7=arguments.length,_d8="";
for(;_d6<_d7;++_d6){
_d8+=arguments[_d6];
}
var _d9=_d1[_d8];
if(!_d9){
var _da=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPControl,"class"));
_d9=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_da,"pathForResource:",_d5+"/"+_d8+".png"),_d4[_d8]));
_d1[_d8]=_d9;
}
return _d9;
};
_CPControlThreePartImages=function(_db,_dc){
var _dd=1,_de=arguments.length,_df="";
for(;_dd<_de;++_dd){
_df+=arguments[_dd];
}
var _e0=_d0[_df];
if(!_e0){
var _e1=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPControl,"class")),_e2=_dc+"/"+_df;
_db=_db[_df];
_e0=[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_e1,"pathForResource:",_e2+"0.png"),_db[0]),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_e1,"pathForResource:",_e2+"1.png"),_db[1]),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_e1,"pathForResource:",_e2+"2.png"),_db[2])];
_d0[_df]=_e0;
}
return _e0;
};
_CPControlThreePartImagePattern=function(_e3,_e4,_e5){
var _e6=2,_e7=arguments.length,_e8="";
for(;_e6<_e7;++_e6){
_e8+=arguments[_e6];
}
var _e9=_d2[_e8];
if(!_e9){
var _ea=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPControl,"class")),_eb=_e5+"/"+_e8;
_e4=_e4[_e8];
_e9=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ea,"pathForResource:",_eb+"0.png"),_e4[0]),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ea,"pathForResource:",_eb+"1.png"),_e4[1]),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ea,"pathForResource:",_eb+"2.png"),_e4[2])],_e3));
_d2[_e8]=_e9;
}
return _e9;
};
