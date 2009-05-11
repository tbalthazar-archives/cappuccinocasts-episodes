i;10;CPObject.ji;9;CPCoder.jc;2907;
var _1=objj_allocateClassPair(CPObject,"CPValue"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_JSObject")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithJSObject:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_JSObject=_5;
}
return _3;
}
}),new objj_method(sel_getUid("JSObject"),function(_6,_7){
with(_6){
return _JSObject;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("valueWithJSObject:"),function(_8,_9,_a){
with(_8){
return objj_msgSend(objj_msgSend(_8,"alloc"),"initWithJSObject:",_a);
}
})]);
var _b="CPValueValueKey";
var _1=objj_getClass("CPValue");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPValue\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_c,_d,_e){
with(_c){
_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("CPObject")},"init");
if(_c){
_JSObject=CPJSObjectCreateWithJSON(objj_msgSend(_e,"decodeObjectForKey:",_b));
}
return _c;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_11,"encodeObject:forKey:",CPJSObjectCreateJSON(_JSObject),_b);
}
})]);
var _12={};
_12["\b"]="\\b";
_12["\t"]="\\t";
_12["\n"]="\\n";
_12["\f"]="\\f";
_12["\r"]="\\r";
_12["\""]="\\\"";
_12["\\"]="\\\\";
var _13=new RegExp("[\\\"\\\\\\x00-\\x1f\\x7f-\\x9f]","g");
CPJSObjectCreateJSON=function(_14){
var _15=typeof _14,_16=_14?_14.valueOf():null,_17=typeof _16;
if(_15!=_17){
_15=_17;
_14=_16;
}
switch(_15){
case "string":
if(!_13.test(_14)){
return "\""+_14+"\"";
}
return "\""+_14.replace(_13,_18)+"\"";
case "number":
return isFinite(_14)?String(_14):"null";
case "boolean":
case "null":
return String(_14);
case "object":
if(!_14){
return "null";
}
if(typeof _14.toJSON==="function"){
return CPJSObjectCreateJSON(_14.toJSON());
}
var _19=[];
if(_14.slice){
var _1a=0,_1b=_14.length;
for(;_1a<_1b;++_1a){
_19.push(CPJSObjectCreateJSON(_14[_1a])||"null");
}
return "["+_19.join(",")+"]";
}
var key=NULL;
for(key in _14){
if(!(typeof key==="string")){
continue;
}
var _1d=CPJSObjectCreateJSON(_14[key]);
if(_1d){
_19.push(CPJSObjectCreateJSON(key)+":"+_1d);
}
}
return "{"+_19.join(",")+"}";
}
};
var _18=function(_1e){
var _1f=_12[_1e];
if(_1f){
return _1f;
}
_1f=_1e.charCodeAt(0);
return "\\u00"+FLOOR(_1f/16).toString(16)+(_1f%16).toString(16);
};
var _20=new RegExp("\\\\.","g"),_21=new RegExp("\"[^\"\\\\\\n\\r]*\"|true|false|null|-?\\d+(?:\\.\\d*)?(?:[eE][+\\-]?\\d+)?","g"),_22=new RegExp("(?:^|:|,)(?:\\s*\\[)+","g"),_23=new RegExp("^[\\],:{}\\s]*$");
CPJSObjectCreateWithJSON=function(_24){
if(_23.test(_24.replace(_20,"@").replace(_21,"]").replace(_22,""))){
return eval("("+_24+")");
}
return nil;
};
