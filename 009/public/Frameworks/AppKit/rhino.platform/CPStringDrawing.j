I;21;Foundation/CPString.jc;670;
var _1=nil,_2=nil;
var _3=objj_getClass("CPString");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("cssString"),function(_5,_6){
with(_5){
return _5;
}
}),new objj_method(sel_getUid("sizeWithFont:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(_7,"sizeWithFont:inWidth:",_9,NULL);
}
}),new objj_method(sel_getUid("sizeWithFont:inWidth:"),function(_a,_b,_c,_d){
with(_a){
return {width:0,height:0};
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("_resetSize"),function(_e,_f){
with(_e){
_1=nil;
}
})]);
