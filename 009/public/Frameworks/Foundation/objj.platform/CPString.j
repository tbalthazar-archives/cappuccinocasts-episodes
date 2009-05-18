i;10;CPObject.ji;13;CPException.ji;18;CPSortDescriptor.ji;9;CPValue.jc;8998;
CPCaseInsensitiveSearch=1;
CPLiteralSearch=2;
CPBackwardsSearch=4;
CPAnchoredSearch=8;
CPNumericSearch=64;
var _1=new objj_dictionary();
var _2=objj_allocateClassPair(CPObject,"CPString"),_3=_2.isa;
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithString:"),function(_4,_5,_6){
with(_4){
return String(_6);
}
}),new objj_method(sel_getUid("initWithFormat:"),function(_7,_8,_9){
with(_7){
if(!_9){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"initWithFormat: the format can't be 'nil'");
}
_7=sprintf.apply(this,Array.prototype.slice.call(arguments,2));
return _7;
}
}),new objj_method(sel_getUid("description"),function(_a,_b){
with(_a){
return _a;
}
}),new objj_method(sel_getUid("length"),function(_c,_d){
with(_c){
return length;
}
}),new objj_method(sel_getUid("characterAtIndex:"),function(_e,_f,_10){
with(_e){
return charAt(_10);
}
}),new objj_method(sel_getUid("stringByAppendingFormat:"),function(_11,_12,_13){
with(_11){
if(!_13){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"initWithFormat: the format can't be 'nil'");
}
return _11+sprintf.apply(this,Array.prototype.slice.call(arguments,2));
}
}),new objj_method(sel_getUid("stringByAppendingString:"),function(_14,_15,_16){
with(_14){
return _14+_16;
}
}),new objj_method(sel_getUid("stringByPaddingToLength:withString:startingAtIndex:"),function(_17,_18,_19,_1a,_1b){
with(_17){
if(length==_19){
return _17;
}
if(_19<length){
return substr(0,_19);
}
var _1c=_17,_1d=_1a.substring(_1b),_1e=_19-length;
while((_1e-=_1d.length)>=0){
_1c+=_1d;
}
if(-_1e<_1d.length){
_1c+=_1d.substring(0,-_1e);
}
return _1c;
}
}),new objj_method(sel_getUid("componentsSeparatedByString:"),function(_1f,_20,_21){
with(_1f){
return split(_21);
}
}),new objj_method(sel_getUid("substringFromIndex:"),function(_22,_23,_24){
with(_22){
return substr(_24);
}
}),new objj_method(sel_getUid("substringWithRange:"),function(_25,_26,_27){
with(_25){
return substr(_27.location,_27.length);
}
}),new objj_method(sel_getUid("substringToIndex:"),function(_28,_29,_2a){
with(_28){
return substring(0,_2a);
}
}),new objj_method(sel_getUid("rangeOfString:"),function(_2b,_2c,_2d){
with(_2b){
return objj_msgSend(_2b,"rangeOfString:options:",_2d,0);
}
}),new objj_method(sel_getUid("rangeOfString:options:"),function(_2e,_2f,_30,_31){
with(_2e){
return objj_msgSend(_2e,"rangeOfString:options:range:",_30,_31,nil);
}
}),new objj_method(sel_getUid("rangeOfString:options:range:"),function(_32,_33,_34,_35,_36){
with(_32){
var _37=(_36==nil)?_32:objj_msgSend(_32,"substringWithRange:",_36),_38=CPNotFound;
if(_35&CPCaseInsensitiveSearch){
_37=_37.toLowerCase();
_34=_34.toLowerCase();
}
if(_35&CPBackwardsSearch){
_38=_37.lastIndexOf(_34,_35&CPAnchoredSearch?length-_34.length:0);
}else{
if(_35&CPAnchoredSearch){
_38=_37.substr(0,_34.length).indexOf(_34)!=CPNotFound?0:CPNotFound;
}else{
_38=_37.indexOf(_34);
}
}
return CPMakeRange(_38,_38==CPNotFound?0:_34.length);
}
}),new objj_method(sel_getUid("stringByReplacingOccurrencesOfString:withString:"),function(_39,_3a,_3b,_3c){
with(_39){
return _39.replace(new RegExp(_3b,"g"),_3c);
}
}),new objj_method(sel_getUid("stringByReplacingOccurrencesOfString:withString:options:range:"),function(_3d,_3e,_3f,_40,_41,_42){
with(_3d){
var _43=substring(0,_42.location),_44=substr(_42.location,_42.length),end=substring(_42.location+_42.length,_3d.length),_46;
if(_41&CPCaseInsensitiveSearch){
_46=new RegExp(_3f,"gi");
}else{
_46=new RegExp(_3f,"g");
}
return _43+""+_44.replace(_46,_40)+""+end;
}
}),new objj_method(sel_getUid("stringByReplacingCharactersInRange:withString:"),function(_47,_48,_49,_4a){
with(_47){
return ""+substring(0,_49.location)+_4a+substring(_49.location+_49.length,_47.length);
}
}),new objj_method(sel_getUid("compare:"),function(_4b,_4c,_4d){
with(_4b){
return objj_msgSend(_4b,"compare:options:",_4d,nil);
}
}),new objj_method(sel_getUid("caseInsensitiveCompare:"),function(_4e,_4f,_50){
with(_4e){
return objj_msgSend(_4e,"compare:options:",_50,CPCaseInsensitiveSearch);
}
}),new objj_method(sel_getUid("compare:options:"),function(_51,_52,_53,_54){
with(_51){
var lhs=_51,rhs=_53;
if(_54&CPCaseInsensitiveSearch){
lhs=lhs.toLowerCase();
rhs=rhs.toLowerCase();
}
if(lhs<rhs){
return CPOrderedAscending;
}else{
if(lhs>rhs){
return CPOrderedDescending;
}
}
return CPOrderedSame;
}
}),new objj_method(sel_getUid("compare:options:range:"),function(_57,_58,_59,_5a,_5b){
with(_57){
var lhs=objj_msgSend(_57,"substringWithRange:",_5b),rhs=_59;
return objj_msgSend(lhs,"compare:options:",rhs,_5a);
}
}),new objj_method(sel_getUid("hasPrefix:"),function(_5e,_5f,_60){
with(_5e){
return _60&&_60!=""&&indexOf(_60)==0;
}
}),new objj_method(sel_getUid("hasSuffix:"),function(_61,_62,_63){
with(_61){
return _63&&_63!=""&&lastIndexOf(_63)==(length-_63.length);
}
}),new objj_method(sel_getUid("isEqualToString:"),function(_64,_65,_66){
with(_64){
return _64==_66;
}
}),new objj_method(sel_getUid("hash"),function(_67,_68){
with(_67){
var _69=dictionary_getValue(_1,_67);
if(!_69){
_69=_objj_generateObjectHash();
dictionary_setValue(_1,_67,_69);
}
return _69;
}
}),new objj_method(sel_getUid("capitalizedString"),function(_6a,_6b){
with(_6a){
var _6c=_6a.split(/\b/g);
for(var i=0;i<_6c.length;i++){
if(i==0||(/\s$/).test(_6c[i-1])){
_6c[i]=_6c[i].substring(0,1).toUpperCase()+_6c[i].substring(1).toLowerCase();
}else{
_6c[i]=_6c[i].toLowerCase();
}
}
return _6c.join("");
}
}),new objj_method(sel_getUid("lowercaseString"),function(_6e,_6f){
with(_6e){
return toLowerCase();
}
}),new objj_method(sel_getUid("uppercaseString"),function(_70,_71){
with(_70){
return toUpperCase();
}
}),new objj_method(sel_getUid("doubleValue"),function(_72,_73){
with(_72){
return parseFloat(_72,10);
}
}),new objj_method(sel_getUid("boolValue"),function(_74,_75){
with(_74){
var _76=new RegExp("^\\s*[\\+,\\-]*0*");
return RegExp("^[Y,y,t,T,1-9]").test(_74.replace(_76,""));
}
}),new objj_method(sel_getUid("floatValue"),function(_77,_78){
with(_77){
return parseFloat(_77,10);
}
}),new objj_method(sel_getUid("intValue"),function(_79,_7a){
with(_79){
return parseInt(_79,10);
}
}),new objj_method(sel_getUid("pathComponents"),function(_7b,_7c){
with(_7b){
var _7d=split("/");
if(_7d[0]===""){
_7d[0]="/";
}
if(_7d[_7d.length-1]===""){
_7d.pop();
}
return _7d;
}
}),new objj_method(sel_getUid("pathExtension"),function(_7e,_7f){
with(_7e){
return substr(lastIndexOf(".")+1);
}
}),new objj_method(sel_getUid("lastPathComponent"),function(_80,_81){
with(_80){
var _82=objj_msgSend(_80,"pathComponents");
return _82[_82.length-1];
}
}),new objj_method(sel_getUid("stringByDeletingLastPathComponent"),function(_83,_84){
with(_83){
var _85=_83,_86=length-1;
while(_85.charAt(_86)==="/"){
_86--;
}
_85=_85.substr(0,_85.lastIndexOf("/",_86));
if(_85===""&&charAt(0)==="/"){
return "/";
}
return _85;
}
}),new objj_method(sel_getUid("stringByStandardizingPath"),function(_87,_88){
with(_87){
return objj_standardize_path(_87);
}
}),new objj_method(sel_getUid("copy"),function(_89,_8a){
with(_89){
return new String(_89);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("alloc"),function(_8b,_8c){
with(_8b){
return new String;
}
}),new objj_method(sel_getUid("string"),function(_8d,_8e){
with(_8d){
return objj_msgSend(objj_msgSend(_8d,"alloc"),"init");
}
}),new objj_method(sel_getUid("stringWithHash:"),function(_8f,_90,_91){
with(_8f){
var _92=parseInt(_91,10).toString(16);
return "000000".substring(0,MAX(6-_92.length,0))+_92;
}
}),new objj_method(sel_getUid("stringWithString:"),function(_93,_94,_95){
with(_93){
if(!_95){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"stringWithString: the string can't be 'nil'");
}
return objj_msgSend(objj_msgSend(_93,"alloc"),"initWithString:",_95);
}
}),new objj_method(sel_getUid("stringWithFormat:"),function(_96,_97,_98){
with(_96){
if(!_98){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"initWithFormat: the format can't be 'nil'");
}
return sprintf.apply(this,Array.prototype.slice.call(arguments,2));
}
})]);
var _2=objj_getClass("CPString");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("objectFromJSON"),function(_99,_9a){
with(_99){
return CPJSObjectCreateWithJSON(_99);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("JSONFromObject:"),function(_9b,_9c,_9d){
with(_9b){
return CPJSObjectCreateJSON(_9d);
}
})]);
var _2=objj_getClass("CPString");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _3=_2.isa;
class_addMethods(_3,[new objj_method(sel_getUid("UUID"),function(_9e,_9f){
with(_9e){
var g="";
for(var i=0;i<32;i++){
g+=FLOOR(RAND()*15).toString(15);
}
return g;
}
})]);
String.prototype.isa=CPString;
