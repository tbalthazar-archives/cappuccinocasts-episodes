I;21;Foundation/CPObject.jc;5510;
CPDeleteKeyCode=8;
CPTabKeyCode=9;
CPReturnKeyCode=13;
CPEscapeKeyCode=27;
CPLeftArrowKeyCode=37;
CPUpArrowKeyCode=38;
CPRightArrowKeyCode=39;
CPDownArrowKeyCode=40;
var _1=objj_allocateClassPair(CPObject,"CPResponder"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_menu"),new objj_ivar("_nextResponder")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("acceptsFirstResponder"),function(_3,_4){
with(_3){
return NO;
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_5,_6){
with(_5){
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_7,_8){
with(_7){
return YES;
}
}),new objj_method(sel_getUid("setNextResponder:"),function(_9,_a,_b){
with(_9){
_nextResponder=_b;
}
}),new objj_method(sel_getUid("nextResponder"),function(_c,_d){
with(_c){
return _nextResponder;
}
}),new objj_method(sel_getUid("interpretKeyEvents:"),function(_e,_f,_10){
with(_e){
var _11,_12=0;
while(_11=_10[_12++]){
switch(objj_msgSend(_11,"keyCode")){
case CPLeftArrowKeyCode:
objj_msgSend(_e,"moveBackward:",_e);
break;
case CPRightArrowKeyCode:
objj_msgSend(_e,"moveForward:",_e);
break;
case CPUpArrowKeyCode:
objj_msgSend(_e,"moveUp:",_e);
break;
case CPDownArrowKeyCode:
objj_msgSend(_e,"moveDown:",_e);
break;
case CPDeleteKeyCode:
objj_msgSend(_e,"deleteBackward:",_e);
break;
case CPReturnKeyCode:
case 3:
objj_msgSend(_e,"insertLineBreak:",_e);
break;
case CPEscapeKeyCode:
objj_msgSend(_e,"cancel:",_e);
break;
case CPTabKeyCode:
var _13=objj_msgSend(_11,"modifierFlags")&CPShiftKeyMask;
if(!_13){
objj_msgSend(_e,"insertTab:",_e);
}else{
objj_msgSend(_e,"insertBackTab:",_e);
}
break;
default:
objj_msgSend(_e,"insertText:",objj_msgSend(_11,"characters"));
}
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_14,_15,_16){
with(_14){
objj_msgSend(_nextResponder,"performSelector:withObject:",_15,_16);
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_17,_18,_19){
with(_17){
objj_msgSend(_nextResponder,"performSelector:withObject:",_18,_19);
}
}),new objj_method(sel_getUid("mouseUp:"),function(_1a,_1b,_1c){
with(_1a){
objj_msgSend(_nextResponder,"performSelector:withObject:",_1b,_1c);
}
}),new objj_method(sel_getUid("mouseMoved:"),function(_1d,_1e,_1f){
with(_1d){
objj_msgSend(_nextResponder,"performSelector:withObject:",_1e,_1f);
}
}),new objj_method(sel_getUid("mouseEntered:"),function(_20,_21,_22){
with(_20){
objj_msgSend(_nextResponder,"performSelector:withObject:",_21,_22);
}
}),new objj_method(sel_getUid("mouseExited:"),function(_23,_24,_25){
with(_23){
objj_msgSend(_nextResponder,"performSelector:withObject:",_24,_25);
}
}),new objj_method(sel_getUid("scrollWheel:"),function(_26,_27,_28){
with(_26){
objj_msgSend(_nextResponder,"performSelector:withObject:",_27,_28);
}
}),new objj_method(sel_getUid("keyDown:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(_nextResponder,"performSelector:withObject:",_2a,_2b);
}
}),new objj_method(sel_getUid("keyUp:"),function(_2c,_2d,_2e){
with(_2c){
objj_msgSend(_nextResponder,"performSelector:withObject:",_2d,_2e);
}
}),new objj_method(sel_getUid("performKeyEquivalent:"),function(_2f,_30,_31){
with(_2f){
return NO;
}
}),new objj_method(sel_getUid("deleteBackward:"),function(_32,_33,_34){
with(_32){
}
}),new objj_method(sel_getUid("insertLineBreak:"),function(_35,_36,_37){
with(_35){
objj_msgSend(_35,"insertNewline:",_37);
}
}),new objj_method(sel_getUid("insertNewline:"),function(_38,_39,_3a){
with(_38){
objj_msgSend(_38,"insertNewline:",_3a);
}
}),new objj_method(sel_getUid("cancel:"),function(_3b,_3c,_3d){
with(_3b){
}
}),new objj_method(sel_getUid("insertTab:"),function(_3e,_3f,_40){
with(_3e){
}
}),new objj_method(sel_getUid("insertBackTab:"),function(_41,_42,_43){
with(_41){
}
}),new objj_method(sel_getUid("insertText:"),function(_44,_45,_46){
with(_44){
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_47,_48,_49){
with(_47){
if(objj_msgSend(_47,"respondsToSelector:",_49)){
objj_msgSend(_47,"performSelector:",_49);
}else{
objj_msgSend(_nextResponder,"doCommandBySelector:",_49);
}
}
}),new objj_method(sel_getUid("tryToPerform:with:"),function(_4a,_4b,_4c,_4d){
with(_4a){
if(objj_msgSend(_4a,"respondsToSelector:",_4c)){
objj_msgSend(_4a,"performSelector:withObject:",_4c,_4d);
return YES;
}
return objj_msgSend(_nextResponder,"tryToPerform:with:",_4c,_4d);
}
}),new objj_method(sel_getUid("setMenu:"),function(_4e,_4f,_50){
with(_4e){
_menu=_50;
}
}),new objj_method(sel_getUid("menu"),function(_51,_52){
with(_51){
return _menu;
}
}),new objj_method(sel_getUid("undoManager"),function(_53,_54){
with(_53){
return objj_msgSend(_nextResponder,"performSelector:",_54);
}
}),new objj_method(sel_getUid("noResponderFor:"),function(_55,_56,_57){
with(_55){
}
})]);
var _58="CPResponderNextResponderKey";
var _1=objj_getClass("CPResponder");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPResponder\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_59,_5a,_5b){
with(_59){
_59=objj_msgSendSuper({receiver:_59,super_class:objj_getClass("CPObject")},"init");
if(_59){
_nextResponder=objj_msgSend(_5b,"decodeObjectForKey:",_58);
}
return _59;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_5c,_5d,_5e){
with(_5c){
if(_nextResponder!==nil){
objj_msgSend(_5e,"encodeConditionalObject:forKey:",_nextResponder,_58);
}
}
})]);
