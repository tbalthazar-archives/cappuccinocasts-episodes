I;21;Foundation/CPObject.jI;18;Foundation/CPSet.ji;10;CPButton.jc;3193;
var _1=objj_allocateClassPair(CPButton,"CPRadio"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_radioGroup")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:radioGroup:"),function(_3,_4,_5,_6){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPButton")},"initWithFrame:",_5);
if(_3){
_radioGroup=_6||objj_msgSend(CPRadioGroup,"new");
objj_msgSend(_3,"setHighlightsBy:",CPContentsCellMask);
objj_msgSend(_3,"setShowsStateBy:",CPContentsCellMask);
objj_msgSend(_3,"setImagePosition:",CPImageLeft);
objj_msgSend(_3,"setAlignment:",CPLeftTextAlignment);
objj_msgSend(_3,"setBordered:",YES);
}
return _3;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(_7,"initWithFrame:radioGroup:",_9,nil);
}
}),new objj_method(sel_getUid("nextState"),function(_a,_b){
with(_a){
return CPOnState;
}
}),new objj_method(sel_getUid("setRadioGroup:"),function(_c,_d,_e){
with(_c){
if(_radioGroup===_e){
return;
}
objj_msgSend(_radioGroup,"_removeRadio:",_c);
_radioGroup=_e;
objj_msgSend(_radioGroup,"_addRadio:",_c);
}
}),new objj_method(sel_getUid("radioGroup"),function(_f,_10){
with(_f){
return _radioGroup;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_11,_12,_13){
with(_11){
objj_msgSendSuper({receiver:_11,super_class:objj_getClass("CPButton")},"setObjectValue:",_13);
if(objj_msgSend(_11,"state")===CPOnState){
objj_msgSend(_radioGroup,"_setSelectedRadio:",_11);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("standardButtonWithTitle:"),function(_14,_15,_16){
with(_14){
var _17=objj_msgSend(objj_msgSend(CPRadio,"alloc"),"init");
objj_msgSend(_17,"setTitle:",_16);
return _17;
}
}),new objj_method(sel_getUid("themeClass"),function(_18,_19){
with(_18){
return "radio";
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPRadioGroup"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_radios"),new objj_ivar("_selectedRadio")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_1a,_1b){
with(_1a){
_1a=objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("CPObject")},"init");
if(_1a){
_radios=objj_msgSend(CPSet,"set");
_selectedRadio=nil;
}
return _1a;
}
}),new objj_method(sel_getUid("_addRadio:"),function(_1c,_1d,_1e){
with(_1c){
objj_msgSend(_radios,"addObject:",_1e);
if(objj_msgSend(_1e,"state")===CPOnState){
objj_msgSend(_1c,"_setSelectedRadio:",_1e);
}
}
}),new objj_method(sel_getUid("_removeRadio:"),function(_1f,_20,_21){
with(_1f){
if(_selectedRadio===_21){
_selectedRadio=nil;
}
objj_msgSend(_radios,"removeObject:",_21);
}
}),new objj_method(sel_getUid("_setSelectedRadio:"),function(_22,_23,_24){
with(_22){
if(_selectedRadio===_24){
return;
}
objj_msgSend(_selectedRadio,"setState:",CPOffState);
_selectedRadio=_24;
}
}),new objj_method(sel_getUid("selectedRadio"),function(_25,_26){
with(_25){
return _selectedRadio;
}
}),new objj_method(sel_getUid("radios"),function(_27,_28){
with(_27){
return objj_msgSend(_radios,"allObjects");
}
})]);
