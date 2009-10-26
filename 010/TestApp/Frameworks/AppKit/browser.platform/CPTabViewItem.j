I;21;Foundation/CPObject.jI;15;AppKit/CPView.jc;2688;
CPSelectedTab=0;
CPBackgroundTab=1;
CPPressedTab=2;
var _1=objj_allocateClassPair(CPObject,"CPTabViewItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_identifier"),new objj_ivar("_label"),new objj_ivar("_view"),new objj_ivar("_auxiliaryView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"initWithIdentifier:","");
}
}),new objj_method(sel_getUid("initWithIdentifier:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_identifier=_7;
}
return _5;
}
}),new objj_method(sel_getUid("setLabel:"),function(_8,_9,_a){
with(_8){
_label=_a;
}
}),new objj_method(sel_getUid("label"),function(_b,_c){
with(_b){
return _label;
}
}),new objj_method(sel_getUid("tabState"),function(_d,_e){
with(_d){
return _tabState;
}
}),new objj_method(sel_getUid("setIdentifier:"),function(_f,_10,_11){
with(_f){
_identifier=_11;
}
}),new objj_method(sel_getUid("identifier"),function(_12,_13){
with(_12){
return _identifier;
}
}),new objj_method(sel_getUid("setView:"),function(_14,_15,_16){
with(_14){
_view=_16;
}
}),new objj_method(sel_getUid("view"),function(_17,_18){
with(_17){
return _view;
}
}),new objj_method(sel_getUid("setAuxiliaryView:"),function(_19,_1a,_1b){
with(_19){
_auxiliaryView=_1b;
}
}),new objj_method(sel_getUid("auxiliaryView"),function(_1c,_1d){
with(_1c){
return _auxiliaryView;
}
}),new objj_method(sel_getUid("tabView"),function(_1e,_1f){
with(_1e){
return _tabView;
}
})]);
var _20="CPTabViewItemIdentifierKey",_21="CPTabViewItemLabelKey",_22="CPTabViewItemViewKey",_23="CPTabViewItemAuxViewKey";
var _1=objj_getClass("CPTabViewItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTabViewItem\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_24,_25,_26){
with(_24){
_24=objj_msgSendSuper({receiver:_24,super_class:objj_getClass("CPObject")},"init");
if(_24){
_identifier=objj_msgSend(_26,"decodeObjectForKey:",_20);
_label=objj_msgSend(_26,"decodeObjectForKey:",_21);
_view=objj_msgSend(_26,"decodeObjectForKey:",_22);
_auxiliaryView=objj_msgSend(_26,"decodeObjectForKey:",_23);
}
return _24;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_27,_28,_29){
with(_27){
objj_msgSend(_29,"encodeObject:forKey:",_identifier,_20);
objj_msgSend(_29,"encodeObject:forKey:",_label,_21);
objj_msgSend(_29,"encodeObject:forKey:",_view,_22);
objj_msgSend(_29,"encodeObject:forKey:",_auxiliaryView,_23);
}
})]);
