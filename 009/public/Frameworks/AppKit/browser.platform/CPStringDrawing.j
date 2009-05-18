I;21;Foundation/CPString.jc;1584;
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
if(!_1){
_1=document.createElement("span");
var _e=_1.style;
_e.position="absolute";
_e.whiteSpace="pre";
_e.visibility="visible";
_e.padding="0px";
_e.margin="0px";
_e.left="-100000px";
_e.top="-100000px";
_e.zIndex="10000";
_e.background="red";
document.getElementsByTagName("body")[0].appendChild(_1);
}
if(!_c){
if(!_2){
_2=objj_msgSend(CPFont,"systemFontOfSize:",12);
}
_c=_2;
}
var _e=_1.style;
if(_d===NULL){
_e.width="";
_e.whiteSpace="pre";
}else{
_e.width=ROUND(_d)+"px";
if(document.attachEvent){
_e.wordWrap="break-word";
}else{
_e.whiteSpace="-o-pre-wrap";
_e.whiteSpace="-pre-wrap";
_e.whiteSpace="-moz-pre-wrap";
_e.whiteSpace="pre-wrap";
}
}
_e.font=objj_msgSend(_c,"cssString");
if(CPFeatureIsCompatible(CPJavascriptInnerTextFeature)){
_1.innerText=_a;
}else{
if(CPFeatureIsCompatible(CPJavascriptTextContentFeature)){
_1.textContent=_a;
}
}
return {width:_1.clientWidth,height:_1.clientHeight};
return {width:0,height:0};
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("_resetSize"),function(_f,_10){
with(_f){
_1=nil;
}
})]);
