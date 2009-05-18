I;21;Foundation/CPBundle.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPString.jc;1850;
var _1="CPCibOwner";
var _2={};
var _3=objj_getClass("CPObject");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPObject\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("awakeFromCib"),function(_5,_6){
with(_5){
}
})]);
var _3=objj_getClass("CPBundle");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPBundle\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("loadCibFile:externalNameTable:loadDelegate:"),function(_7,_8,_9,_a,_b){
with(_7){
var _c=objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithCibNamed:bundle:loadDelegate:",_9,_7,objj_msgSend(_7,"class"));
_2[objj_msgSend(_c,"hash")]={loadDelegate:_b,externalNameTable:_a};
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("loadCibFile:externalNameTable:loadDelegate:"),function(_d,_e,_f,_10,_11){
with(_d){
var cib=objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithContentsOfURL:loadDelegate:",_f,_d);
_2[objj_msgSend(cib,"hash")]={loadDelegate:_11,externalNameTable:_10};
}
}),new objj_method(sel_getUid("loadCibNamed:owner:loadDelegate:"),function(_13,_14,_15,_16,_17){
with(_13){
var _18=_16?objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_16,"class")):objj_msgSend(CPBundle,"mainBundle"),_19=objj_msgSend(_18,"pathForResource:",_15);
objj_msgSend(_13,"loadCibFile:externalNameTable:loadDelegate:",_19,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_16,_1),_17);
}
}),new objj_method(sel_getUid("cibDidFinishLoading:"),function(_1a,_1b,_1c){
with(_1a){
var _1d=_2[objj_msgSend(_1c,"hash")];
delete _2[objj_msgSend(_1c,"hash")];
objj_msgSend(_1c,"instantiateCibWithExternalNameTable:",_1d.externalNameTable);
objj_msgSend(_1d.loadDelegate,"cibDidFinishLoading:",_1c);
}
})]);
