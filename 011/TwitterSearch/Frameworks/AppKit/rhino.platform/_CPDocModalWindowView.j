i;15;_CPWindowView.jc;1334;
var _1=nil;
var _2=objj_allocateClassPair(_CPWindowView,"_CPDocModalWindowView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_bodyView")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:styleMask:"),function(_4,_5,_6,_7){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("_CPWindowView")},"initWithFrame:styleMask:",_6,_7);
if(_4){
var _8=objj_msgSend(_4,"class"),_9=objj_msgSend(_4,"bounds");
_bodyView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_9),CGRectGetHeight(_9)));
objj_msgSend(_bodyView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_bodyView,"setBackgroundColor:",objj_msgSend(_8,"bodyBackgroundColor"));
objj_msgSend(_bodyView,"setHitTests:",NO);
objj_msgSend(_4,"addSubview:",_bodyView);
}
return _4;
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_a,_b,_c){
with(_a){
return _c;
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_d,_e,_f){
with(_d){
return _f;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("bodyBackgroundColor"),function(_10,_11){
with(_10){
if(!_1){
_1=objj_msgSend(CPColor,"colorWithWhite:alpha:",0.96,1);
}
return _1;
}
})]);
