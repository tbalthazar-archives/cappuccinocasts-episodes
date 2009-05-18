I;20;Foundation/CPArray.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;7;CPCib.ji;17;_CPCibConnector.jc;6115;
var _1=objj_allocateClassPair(CPObject,"_CPCibObjectData"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_namesKeys"),new objj_ivar("_namesValues"),new objj_ivar("_accessibilityConnectors"),new objj_ivar("_accessibilityOidsKeys"),new objj_ivar("_accessibilityOidsValues"),new objj_ivar("_classesKeys"),new objj_ivar("_classesValues"),new objj_ivar("_connections"),new objj_ivar("_fontManager"),new objj_ivar("_framework"),new objj_ivar("_nextOid"),new objj_ivar("_objectsKeys"),new objj_ivar("_objectsValues"),new objj_ivar("_oidKeys"),new objj_ivar("_oidValues"),new objj_ivar("_fileOwner"),new objj_ivar("_visibleWindows"),new objj_ivar("_replacementObjects")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_namesKeys=[];
_namesValues=[];
_classesKeys=[];
_classesValues=[];
_connections=[];
_framework="";
_nextOid=[];
_objectsKeys=[];
_objectsValues=[];
_oidKeys=[];
_oidValues=[];
_fileOwner=nil;
_visibleWindows=objj_msgSend(CPSet,"set");
}
return _3;
}
}),new objj_method(sel_getUid("mainMenu"),function(_5,_6){
with(_5){
var _7=objj_msgSend(_namesValues,"indexOfObjectIdenticalTo:","MainMenu");
if(_7===CPNotFound){
_7=objj_msgSend(_namesValues,"indexOfObjectIdenticalTo:","Main Menu");
if(_7===CPNotFound){
return nil;
}
}
return _namesKeys[_7];
}
}),new objj_method(sel_getUid("displayVisibleWindows"),function(_8,_9){
with(_8){
var _a=nil,_b=objj_msgSend(_visibleWindows,"objectEnumerator");
while(_a=objj_msgSend(_b,"nextObject")){
objj_msgSend(_replacementObjects[objj_msgSend(_a,"hash")],"makeKeyAndOrderFront:",_8);
}
}
})]);
var _c="_CPCibObjectDataNamesKeysKey",_d="_CPCibObjectDataNamesValuesKey",_e="_CPCibObjectDataAccessibilityConnectors",_f="_CPCibObjectDataAccessibilityOidsKeys",_10="_CPCibObjectDataAccessibilityOidsValues",_11="_CPCibObjectDataClassesKeysKey",_12="_CPCibObjectDataClassesValuesKey",_13="_CPCibObjectDataConnectionsKey",_14="_CPCibObjectDataFontManagerKey",_15="_CPCibObjectDataFrameworkKey",_16="_CPCibObjectDataNextOidKey",_17="_CPCibObjectDataObjectsKeysKey",_18="_CPCibObjectDataObjectsValuesKey",_19="_CPCibObjectDataOidKeysKey",_1a="_CPCibObjectDataOidValuesKey",_1b="_CPCibObjectDataFileOwnerKey",_1c="_CPCibObjectDataVisibleWindowsKey";
var _1=objj_getClass("_CPCibObjectData");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPCibObjectData\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_1d,_1e,_1f){
with(_1d){
_1d=objj_msgSendSuper({receiver:_1d,super_class:objj_getClass("CPObject")},"init");
if(_1d){
_replacementObjects={};
_namesKeys=objj_msgSend(_1f,"decodeObjectForKey:",_c);
_namesValues=objj_msgSend(_1f,"decodeObjectForKey:",_d);
_classesKeys=objj_msgSend(_1f,"decodeObjectForKey:",_11);
_classesValues=objj_msgSend(_1f,"decodeObjectForKey:",_12);
_connections=objj_msgSend(_1f,"decodeObjectForKey:",_13);
_framework=objj_msgSend(_1f,"decodeObjectForKey:",_15);
_nextOid=objj_msgSend(_1f,"decodeIntForKey:",_16);
_objectsKeys=objj_msgSend(_1f,"decodeObjectForKey:",_17);
_objectsValues=objj_msgSend(_1f,"decodeObjectForKey:",_18);
_oidKeys=objj_msgSend(_1f,"decodeObjectForKey:",_19);
_oidValues=objj_msgSend(_1f,"decodeObjectForKey:",_1a);
_fileOwner=objj_msgSend(_1f,"decodeObjectForKey:",_1b);
_visibleWindows=objj_msgSend(_1f,"decodeObjectForKey:",_1c);
}
return _1d;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_20,_21,_22){
with(_20){
objj_msgSend(_22,"encodeObject:forKey:",_namesKeys,_c);
objj_msgSend(_22,"encodeObject:forKey:",_namesValues,_d);
objj_msgSend(_22,"encodeObject:forKey:",_classesKeys,_11);
objj_msgSend(_22,"encodeObject:forKey:",_classesValues,_12);
objj_msgSend(_22,"encodeObject:forKey:",_connections,_13);
objj_msgSend(_22,"encodeObject:forKey:",_framework,_15);
objj_msgSend(_22,"encodeInt:forKey:",_nextOid,_16);
objj_msgSend(_22,"encodeObject:forKey:",_objectsKeys,_17);
objj_msgSend(_22,"encodeObject:forKey:",_objectsValues,_18);
objj_msgSend(_22,"encodeObject:forKey:",_oidKeys,_19);
objj_msgSend(_22,"encodeObject:forKey:",_oidValues,_1a);
objj_msgSend(_22,"encodeObject:forKey:",_fileOwner,_1b);
objj_msgSend(_22,"encodeObject:forKey:",_visibleWindows,_1c);
}
}),new objj_method(sel_getUid("instantiateWithOwner:topLevelObjects:"),function(_23,_24,_25,_26){
with(_23){
var _27=objj_msgSend(_objectsKeys,"count");
while(_27--){
var _28=_objectsKeys[_27],_29=_objectsValues[_27],_2a=_28;
if(objj_msgSend(_28,"respondsToSelector:",sel_getUid("_cibInstantiate"))){
var _2a=objj_msgSend(_28,"_cibInstantiate");
if(_2a!==_28){
_replacementObjects[objj_msgSend(_28,"hash")]=_2a;
if(objj_msgSend(_2a,"isKindOfClass:",objj_msgSend(CPView,"class"))){
var _2b=objj_msgSend(_2a,"superview");
if(objj_msgSend(_2b,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
var _2c=objj_msgSend(_2b,"superview");
if(objj_msgSend(_2c,"isKindOfClass:",objj_msgSend(CPScrollView,"class"))){
objj_msgSend(_2c,"setDocumentView:",_2a);
}
}
}
}
}
if(_26&&_29===_fileOwner&&_28!==_fileOwner){
_26.push(_2a);
}
}
}
}),new objj_method(sel_getUid("establishConnectionsWithOwner:topLevelObjects:"),function(_2d,_2e,_2f,_30){
with(_2d){
_replacementObjects[objj_msgSend(_fileOwner,"hash")]=_2f;
var _31=0,_32=_connections.length;
for(;_31<_32;++_31){
var _33=_connections[_31];
objj_msgSend(_33,"replaceObjects:",_replacementObjects);
objj_msgSend(_33,"establishConnection");
}
}
}),new objj_method(sel_getUid("awakeWithOwner:topLevelObjects:"),function(_34,_35,_36,_37){
with(_34){
var _38=objj_msgSend(_objectsKeys,"count");
while(_38--){
var _39=_objectsKeys[_38],_3a=_replacementObjects[objj_msgSend(_39,"hash")];
if(_3a){
_39=_3a;
}
if(_39!==_36&&objj_msgSend(_39,"respondsToSelector:",sel_getUid("awakeFromCib"))){
objj_msgSend(_39,"awakeFromCib");
}
}
if(objj_msgSend(_36,"respondsToSelector:",sel_getUid("awakeFromCib"))){
objj_msgSend(_36,"awakeFromCib");
}
}
})]);
