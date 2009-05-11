I;21;Foundation/CPObject.jc;5425;
CPControlStateNormal=0,CPControlStateHighlighted=1<<0,CPControlStateDisabled=1<<1,CPControlStateSelected=1<<2,CPControlStateDefault=1<<3,CPControlStateBordered=1<<4,CPControlStateBezeled=1<<5,CPControlStateVertical=1<<6,CPControlStateEditable=1<<7,CPControlStateEditing=1<<8;
CPControlStateHorizontal=1<<9;
CPControlStateCircular=1<<10;
var _1=[0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5],_2=function(_3){
var _4=0;
while(_3){
++_4;
_3&=(_3-1);
}
return _4;
};
var _5=objj_allocateClassPair(CPObject,"CPThemedAttribute"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_cache"),new objj_ivar("_name"),new objj_ivar("_defaultValue"),new objj_ivar("_theme"),new objj_ivar("_themedClass"),new objj_ivar("_values"),new objj_ivar("_attributeFromTheme")]);
objj_registerClassPair(_5);
objj_addClassForBundle(_5,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_5,[new objj_method(sel_getUid("initWithName:defaultValue:theme:class:"),function(_7,_8,_9,_a,_b,_c){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPObject")},"init");
if(_7){
_cache={};
_name=_9;
_defaultValue=_a;
_theme=_b;
_themedClass=_c;
_values=objj_msgSend(CPDictionary,"dictionary");
_attributeFromTheme=objj_msgSend(_theme,"valueForAttributeName:inClass:",_name,_themedClass);
}
return _7;
}
}),new objj_method(sel_getUid("setName:"),function(_d,_e,_f){
with(_d){
_name=_f;
}
}),new objj_method(sel_getUid("name"),function(_10,_11){
with(_10){
return _name;
}
}),new objj_method(sel_getUid("setDefaultValue:"),function(_12,_13,_14){
with(_12){
_cache={};
_defaultValue=_14;
}
}),new objj_method(sel_getUid("setTheme:"),function(_15,_16,_17){
with(_15){
if(_theme===_17){
return;
}
_cache={};
_theme=_17;
_attributeFromTheme=objj_msgSend(_theme,"valueForAttributeName:inClass:",_name,_themedClass);
}
}),new objj_method(sel_getUid("setThemedClass:"),function(_18,_19,_1a){
with(_18){
if(_themedClass===_1a){
return;
}
_cache={};
_themedClass=_1a;
_attributeFromTheme=objj_msgSend(_theme,"valueForAttributeName:inClass:",_name,_themedClass);
}
}),new objj_method(sel_getUid("setValue:"),function(_1b,_1c,_1d){
with(_1b){
_cache={};
if(_1d===undefined||_1d===nil){
_values=objj_msgSend(CPDictionary,"dictionary");
}else{
_values=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_1d,String(CPControlStateNormal));
}
}
}),new objj_method(sel_getUid("value"),function(_1e,_1f){
with(_1e){
return objj_msgSend(_1e,"valueForControlState:",CPControlStateNormal);
}
}),new objj_method(sel_getUid("setValue:forControlState:"),function(_20,_21,_22,_23){
with(_20){
_cache={};
if((_22===undefined)||(_22===nil)){
objj_msgSend(_values,"removeObjectForKey:",String(_23));
}else{
objj_msgSend(_values,"setObject:forKey:",_22,String(_23));
}
}
}),new objj_method(sel_getUid("valueForControlState:"),function(_24,_25,_26){
with(_24){
var _27=_cache[_26];
if(_27!==undefined){
return _27;
}
_27=objj_msgSend(_values,"objectForKey:",String(_26));
if((_27===undefined||_27===nil)&&_26>0){
if(_26&(_26-1)){
var _28=0,_29=objj_msgSend(_values,"allKeys"),_2a=_29.length;
while(_2a--){
state=Number(_29[_2a]);
if((state&_26)===state){
var _2b=(state<_1.length)?_1[state]:_2(state);
if(_2b>_28){
_28=_2b;
_27=objj_msgSend(_values,"objectForKey:",String(state));
}
}
}
}
if(_27===undefined||_27===nil){
_27=objj_msgSend(_values,"objectForKey:",String(CPControlStateNormal));
}
}
if(_27===undefined||_27===nil){
_27=objj_msgSend(_attributeFromTheme,"valueForControlState:",_26);
}
if(_27===undefined||_27===nil){
_27=_defaultValue;
}
_cache[_26]=_27;
return _27;
}
}),new objj_method(sel_getUid("themedAttributeMergedWithThemedAttribute:"),function(_2c,_2d,_2e){
with(_2c){
var _2f=CPThemedAttributeMake(_name,_defaultValue,_theme,_themedClass);
_2f._values=objj_msgSend(_values,"copy");
objj_msgSend(_2f._values,"addEntriesFromDictionary:",_2e._values);
return _2f;
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_30,_31,_32){
with(_30){
_30=objj_msgSendSuper({receiver:_30,super_class:objj_getClass("CPObject")},"init");
if(_30){
_cache={};
_values=objj_msgSend(_32,"decodeObjectForKey:","values");
}
return _30;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_33,_34,_35){
with(_33){
objj_msgSend(_35,"encodeObject:forKey:",_values,"values");
}
})]);
CPThemedAttributeMake=function(_36,_37,_38,_39){
return objj_msgSend(objj_msgSend(CPThemedAttribute,"alloc"),"initWithName:defaultValue:theme:class:",_36,_37,_38,_39);
};
CPThemedAttributeEncode=function(_3a,_3b){
var _3c=_3b._values,_3d=objj_msgSend(_3c,"count");
if(_3d===1){
var key=objj_msgSend(_3c,"allKeys")[0];
if(Number(key)===0){
return objj_msgSend(_3a,"encodeObject:forKey:",objj_msgSend(_3c,"objectForKey:",key),"$a"+objj_msgSend(_3b,"name"));
}
}
if(_3d>=1){
objj_msgSend(_3a,"encodeObject:forKey:",_3b,"$a"+objj_msgSend(_3b,"name"));
}
};
CPThemedAttributeDecode=function(_3f,_40,_41,_42,_43){
var key="$a"+_40;
if(!objj_msgSend(_3f,"containsValueForKey:",key)){
return CPThemedAttributeMake(_40,_41,_42,_43);
}
var _45=objj_msgSend(_3f,"decodeObjectForKey:",key);
if(!_45.isa||!objj_msgSend(_45,"isKindOfClass:",objj_msgSend(CPThemedAttribute,"class"))){
var _46=CPThemedAttributeMake(_40,_41,_42,_43);
objj_msgSend(_46,"setValue:",_45);
_45=_46;
}else{
objj_msgSend(_45,"setName:",_40);
objj_msgSend(_45,"setDefaultValue:",_41);
objj_msgSend(_45,"setTheme:",_42);
objj_msgSend(_45,"setThemedClass:",_43);
}
return _45;
};
