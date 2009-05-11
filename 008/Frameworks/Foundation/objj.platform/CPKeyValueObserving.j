i;9;CPArray.ji;14;CPDictionary.ji;13;CPException.ji;10;CPObject.ji;7;CPSet.jc;14900;
var _1=objj_getClass("CPObject");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPObject\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("willChangeValueForKey:"),function(_3,_4,_5){
with(_3){
}
}),new objj_method(sel_getUid("didChangeValueForKey:"),function(_6,_7,_8){
with(_6){
}
}),new objj_method(sel_getUid("willChange:valuesAtIndexes:forKey:"),function(_9,_a,_b,_c,_d){
with(_9){
}
}),new objj_method(sel_getUid("didChange:valuesAtIndexes:forKey:"),function(_e,_f,_10,_11,key){
with(_e){
}
}),new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"),function(_13,_14,_15,_16,_17,_18){
with(_13){
if(!_15||!_16){
return;
}
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_13),"_addObserver:forKeyPath:options:context:",_15,_16,_17,_18);
}
}),new objj_method(sel_getUid("removeObserver:forKeyPath:"),function(_19,_1a,_1b,_1c){
with(_19){
if(!_1b||!_1c){
return;
}
objj_msgSend(objj_msgSend(_1d,"objectForKey:",objj_msgSend(_19,"hash")),"_removeObserver:forKeyPath:",_1b,_1c);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("automaticallyNotifiesObserversForKey:"),function(_1e,_1f,_20){
with(_1e){
return YES;
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingValueForKey:"),function(_21,_22,_23){
with(_21){
var _24=_23.charAt(0).toUpperCase()+_23.substring(1);
selector="keyPathsForValuesAffectingValueFor"+_24;
if(objj_msgSend(objj_msgSend(_21,"class"),"respondsToSelector:",selector)){
return objj_msgSend(objj_msgSend(_21,"class"),selector);
}
return objj_msgSend(CPSet,"set");
}
})]);
CPKeyValueObservingOptionNew=1<<0;
CPKeyValueObservingOptionOld=1<<1;
CPKeyValueObservingOptionInitial=1<<2;
CPKeyValueObservingOptionPrior=1<<3;
CPKeyValueChangeKindKey="CPKeyValueChangeKindKey";
CPKeyValueChangeNewKey="CPKeyValueChangeNewKey";
CPKeyValueChangeOldKey="CPKeyValueChangeOldKey";
CPKeyValueChangeIndexesKey="CPKeyValueChangeIndexesKey";
CPKeyValueChangeNotificationIsPriorKey="CPKeyValueChangeNotificationIsPriorKey";
CPKeyValueChangeSetting=1;
CPKeyValueChangeInsertion=2;
CPKeyValueChangeRemoval=3;
CPKeyValueChangeReplacement=4;
var _25=CPKeyValueObservingOptionNew|CPKeyValueObservingOptionOld;
var _1d=objj_msgSend(CPDictionary,"dictionary"),_26=objj_msgSend(CPDictionary,"dictionary");
var _1=objj_allocateClassPair(CPObject,"_CPKVOProxy"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_targetObject"),new objj_ivar("_nativeClass"),new objj_ivar("_changesForKey"),new objj_ivar("_observersForKey"),new objj_ivar("_replacedKeys")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithTarget:"),function(_27,_28,_29){
with(_27){
_27=objj_msgSendSuper({receiver:_27,super_class:objj_getClass("CPObject")},"init");
_targetObject=_29;
_nativeClass=objj_msgSend(_29,"class");
_observersForKey=objj_msgSend(CPDictionary,"dictionary");
_changesForKey=objj_msgSend(CPDictionary,"dictionary");
_replacedKeys=objj_msgSend(CPSet,"set");
return _27;
}
}),new objj_method(sel_getUid("_replaceClass"),function(_2a,_2b){
with(_2a){
var _2c=_nativeClass,_2d="$KVO_"+class_getName(_nativeClass),_2e=objj_lookUpClass(_2d);
if(_2e){
_targetObject.isa=_2e;
return;
}
var _2f=objj_allocateClassPair(_2c,_2d);
objj_registerClassPair(_2f);
_class_initialize(_2f);
var _30=_CPKVOModelSubclass.method_list,_31=_30.length;
for(var i=0;i<_31;i++){
var _33=_30[i];
class_addMethod(_2f,method_getName(_33),method_getImplementation(_33),"");
}
_targetObject.isa=_2f;
}
}),new objj_method(sel_getUid("_replaceSetterForKey:"),function(_34,_35,_36){
with(_34){
if(objj_msgSend(_replacedKeys,"containsObject:",_36)||!objj_msgSend(_nativeClass,"automaticallyNotifiesObserversForKey:",_36)){
return;
}
var _37=_nativeClass,_38=_36.charAt(0).toUpperCase()+_36.substring(1),_39=false,_3a=["set"+_38+":",_3b,"_set"+_38+":",_3b,"insertObject:in"+_38+"AtIndex:",_3c,"replaceObjectIn"+_38+"AtIndex:withObject:",_3d,"removeObjectFrom"+_38+"AtIndex:",_3e];
for(var i=0,_40=_3a.length;i<_40;i+=2){
var _41=sel_getName(_3a[i]),_42=_3a[i+1];
if(objj_msgSend(_nativeClass,"instancesRespondToSelector:",_41)){
var _43=class_getInstanceMethod(_nativeClass,_41);
class_addMethod(_targetObject.isa,_41,_42(_36,_43),"");
_39=true;
}
}
if(_39){
return;
}
var _44=objj_msgSend(objj_msgSend(_nativeClass,"keyPathsForValuesAffectingValueForKey:",_36),"allObjects");
if(!_44){
return;
}
var _45=objj_msgSend(_26,"objectForKey:",objj_msgSend(_nativeClass,"hash"));
if(!_45){
_45=objj_msgSend(CPDictionary,"new");
objj_msgSend(_26,"setObject:forKey:",_45,objj_msgSend(_nativeClass,"hash"));
}
for(var i=0,_40=_44.length;i<_40;i++){
var _46=_44[i],_47=objj_msgSend(_45,"objectForKey:",_46);
if(!_47){
_47=objj_msgSend(CPSet,"new");
objj_msgSend(_45,"setObject:forKey:",_47,_46);
}
objj_msgSend(_47,"addObject:",_36);
objj_msgSend(_34,"_replaceSetterForKey:",_46);
}
}
}),new objj_method(sel_getUid("_addObserver:forKeyPath:options:context:"),function(_48,_49,_4a,_4b,_4c,_4d){
with(_48){
if(!_4a){
return;
}
var _4e=nil;
if(_4b.indexOf(".")!=CPNotFound){
_4e=objj_msgSend(objj_msgSend(_CPKVOForwardingObserver,"alloc"),"initWithKeyPath:object:observer:options:context:",_4b,_targetObject,_4a,_4c,_4d);
}else{
objj_msgSend(_48,"_replaceSetterForKey:",_4b);
}
var _4f=objj_msgSend(_observersForKey,"objectForKey:",_4b);
if(!_4f){
_4f=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_observersForKey,"setObject:forKey:",_4f,_4b);
}
objj_msgSend(_4f,"setObject:forKey:",_50(_4a,_4c,_4d,_4e),objj_msgSend(_4a,"hash"));
if(_4c&CPKeyValueObservingOptionInitial){
var _51=objj_msgSend(_targetObject,"valueForKeyPath:",_4b);
if(_51===nil||_51===undefined){
_51=objj_msgSend(CPNull,"null");
}
var _52=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_51,CPKeyValueChangeNewKey);
objj_msgSend(_4a,"observeValueForKeyPath:ofObject:change:context:",_4b,_48,_52,_4d);
}
}
}),new objj_method(sel_getUid("_removeObserver:forKeyPath:"),function(_53,_54,_55,_56){
with(_53){
var _57=objj_msgSend(_observersForKey,"objectForKey:",_56);
if(_56.indexOf(".")!=CPNotFound){
var _58=objj_msgSend(_57,"objectForKey:",objj_msgSend(_55,"hash")).forwarder;
objj_msgSend(_58,"finalize");
}
objj_msgSend(_57,"removeObjectForKey:",objj_msgSend(_55,"hash"));
if(!objj_msgSend(_57,"count")){
objj_msgSend(_observersForKey,"removeObjectForKey:",_56);
}
if(!objj_msgSend(_observersForKey,"count")){
_targetObject.isa=_nativeClass;
objj_msgSend(_1d,"removeObjectForKey:",objj_msgSend(_targetObject,"hash"));
}
}
}),new objj_method(sel_getUid("_sendNotificationsForKey:changeOptions:isBefore:"),function(_59,_5a,_5b,_5c,_5d){
with(_59){
var _5e=objj_msgSend(_changesForKey,"objectForKey:",_5b);
if(_5d){
_5e=_5c;
var _5f=objj_msgSend(_5e,"objectForKey:",CPKeyValueChangeIndexesKey);
if(_5f){
var _60=objj_msgSend(_5e,"objectForKey:",CPKeyValueChangeKindKey);
if(_60==CPKeyValueChangeReplacement||_60==CPKeyValueChangeRemoval){
var _61=objj_msgSend(objj_msgSend(_targetObject,"mutableArrayValueForKeyPath:",_5b),"objectsAtIndexes:",_5f);
objj_msgSend(_5e,"setValue:forKey:",_61,CPKeyValueChangeOldKey);
}
}else{
var _62=objj_msgSend(_targetObject,"valueForKey:",_5b);
if(_62===nil||_62===undefined){
_62=objj_msgSend(CPNull,"null");
}
objj_msgSend(_5e,"setObject:forKey:",_62,CPKeyValueChangeOldKey);
}
objj_msgSend(_5e,"setObject:forKey:",1,CPKeyValueChangeNotificationIsPriorKey);
objj_msgSend(_changesForKey,"setObject:forKey:",_5e,_5b);
}else{
objj_msgSend(_5e,"removeObjectForKey:",CPKeyValueChangeNotificationIsPriorKey);
var _5f=objj_msgSend(_5e,"objectForKey:",CPKeyValueChangeIndexesKey);
if(_5f){
var _60=objj_msgSend(_5e,"objectForKey:",CPKeyValueChangeKindKey);
if(_60==CPKeyValueChangeReplacement||_60==CPKeyValueChangeInsertion){
var _61=objj_msgSend(objj_msgSend(_targetObject,"mutableArrayValueForKeyPath:",_5b),"objectsAtIndexes:",_5f);
objj_msgSend(_5e,"setValue:forKey:",_61,CPKeyValueChangeNewKey);
}
}else{
var _63=objj_msgSend(_targetObject,"valueForKey:",_5b);
if(_63===nil||_63===undefined){
_63=objj_msgSend(CPNull,"null");
}
objj_msgSend(_5e,"setObject:forKey:",_63,CPKeyValueChangeNewKey);
}
}
var _64=objj_msgSend(objj_msgSend(_observersForKey,"objectForKey:",_5b),"allValues"),_65=objj_msgSend(_64,"count");
while(_65--){
var _66=_64[_65];
if(_5d&&(_66.options&CPKeyValueObservingOptionPrior)){
objj_msgSend(_66.observer,"observeValueForKeyPath:ofObject:change:context:",_5b,_targetObject,_5e,_66.context);
}else{
if(!_5d){
objj_msgSend(_66.observer,"observeValueForKeyPath:ofObject:change:context:",_5b,_targetObject,_5e,_66.context);
}
}
}
var _67=objj_msgSend(objj_msgSend(objj_msgSend(_26,"objectForKey:",objj_msgSend(_nativeClass,"hash")),"objectForKey:",_5b),"allObjects");
if(!_67){
return;
}
for(var i=0,_65=_67.length;i<_65;i++){
objj_msgSend(_59,"_sendNotificationsForKey:changeOptions:isBefore:",_67[i],_5c,_5d);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("proxyForObject:"),function(_69,_6a,_6b){
with(_69){
var _6c=objj_msgSend(_1d,"objectForKey:",objj_msgSend(_6b,"hash"));
if(_6c){
return _6c;
}
_6c=objj_msgSend(objj_msgSend(_69,"alloc"),"initWithTarget:",_6b);
objj_msgSend(_6c,"_replaceClass");
objj_msgSend(_1d,"setObject:forKey:",_6c,objj_msgSend(_6b,"hash"));
return _6c;
}
})]);
var _1=objj_allocateClassPair(Nil,"_CPKVOModelSubclass"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("willChangeValueForKey:"),function(_6d,_6e,_6f){
with(_6d){
if(!_6f){
return;
}
var _70=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",CPKeyValueChangeSetting,CPKeyValueChangeKindKey);
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_6d),"_sendNotificationsForKey:changeOptions:isBefore:",_6f,_70,YES);
}
}),new objj_method(sel_getUid("didChangeValueForKey:"),function(_71,_72,_73){
with(_71){
if(!_73){
return;
}
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_71),"_sendNotificationsForKey:changeOptions:isBefore:",_73,nil,NO);
}
}),new objj_method(sel_getUid("willChange:valuesAtIndexes:forKey:"),function(_74,_75,_76,_77,_78){
with(_74){
if(!_78){
return;
}
var _79=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_76,_77],[CPKeyValueChangeKindKey,CPKeyValueChangeIndexesKey]);
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_74),"_sendNotificationsForKey:changeOptions:isBefore:",_78,_79,YES);
}
}),new objj_method(sel_getUid("didChange:valuesAtIndexes:forKey:"),function(_7a,_7b,_7c,_7d,_7e){
with(_7a){
if(!_7e){
return;
}
objj_msgSend(objj_msgSend(_CPKVOProxy,"proxyForObject:",_7a),"_sendNotificationsForKey:changeOptions:isBefore:",_7e,nil,NO);
}
}),new objj_method(sel_getUid("class"),function(_7f,_80){
with(_7f){
return objj_msgSend(_1d,"objectForKey:",objj_msgSend(_7f,"hash"))._nativeClass;
}
}),new objj_method(sel_getUid("superclass"),function(_81,_82){
with(_81){
return objj_msgSend(objj_msgSend(_81,"class"),"superclass");
}
}),new objj_method(sel_getUid("isKindOfClass:"),function(_83,_84,_85){
with(_83){
return objj_msgSend(objj_msgSend(_83,"class"),"isSubclassOfClass:",_85);
}
}),new objj_method(sel_getUid("isMemberOfClass:"),function(_86,_87,_88){
with(_86){
return objj_msgSend(_86,"class")==_88;
}
}),new objj_method(sel_getUid("className"),function(_89,_8a){
with(_89){
return objj_msgSend(_89,"class").name;
}
})]);
var _1=objj_allocateClassPair(CPObject,"_CPKVOForwardingObserver"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_object"),new objj_ivar("_observer"),new objj_ivar("_context"),new objj_ivar("_firstPart"),new objj_ivar("_secondPart"),new objj_ivar("_value")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithKeyPath:object:observer:options:context:"),function(_8b,_8c,_8d,_8e,_8f,_90,_91){
with(_8b){
_8b=objj_msgSendSuper({receiver:_8b,super_class:objj_getClass("CPObject")},"init");
_context=_91;
_observer=_8f;
_object=_8e;
var _92=_8d.indexOf(".");
if(_92==CPNotFound){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Created _CPKVOForwardingObserver without compound key path: "+_8d);
}
_firstPart=_8d.substring(0,_92);
_secondPart=_8d.substring(_92+1);
objj_msgSend(_object,"addObserver:forKeyPath:options:context:",_8b,_firstPart,_25,nil);
_value=objj_msgSend(_object,"valueForKey:",_firstPart);
if(_value){
objj_msgSend(_value,"addObserver:forKeyPath:options:context:",_8b,_secondPart,_25,nil);
}
return _8b;
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_93,_94,_95,_96,_97,_98){
with(_93){
if(_96==_object){
objj_msgSend(_observer,"observeValueForKeyPath:ofObject:change:context:",_firstPart,_object,_97,_context);
if(_value){
objj_msgSend(_value,"removeObserver:forKeyPath:",_93,_secondPart);
}
_value=objj_msgSend(_object,"valueForKey:",_firstPart);
if(_value){
objj_msgSend(_value,"addObserver:forKeyPath:options:context:",_93,_secondPart,_25,nil);
}
}else{
objj_msgSend(_observer,"observeValueForKeyPath:ofObject:change:context:",_firstPart+"."+_95,_object,_97,_context);
}
}
}),new objj_method(sel_getUid("finalize"),function(_99,_9a){
with(_99){
if(_value){
objj_msgSend(_value,"removeObserver:forKeyPath:",_99,_secondPart);
}
objj_msgSend(_object,"removeObserver:forKeyPath:",_99,_firstPart);
_object=nil;
_observer=nil;
_context=nil;
_value=nil;
}
})]);
var _50=_50=function(_9b,_9c,_9d,_9e){
return {observer:_9b,options:_9c,context:_9d,forwarder:_9e};
};
var _3b=_3b=function(_9f,_a0){
return function(_a1,_a2,_a3){
objj_msgSend(_a1,"willChangeValueForKey:",_9f);
_a0.method_imp(_a1,_a2,_a3);
objj_msgSend(_a1,"didChangeValueForKey:",_9f);
};
};
var _3c=_3c=function(_a4,_a5){
return function(_a6,_a7,_a8,_a9){
objj_msgSend(_a6,"willChange:valuesAtIndexes:forKey:",CPKeyValueChangeInsertion,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_a9),_a4);
_a5.method_imp(_a6,_a7,_a8,_a9);
objj_msgSend(_a6,"didChange:valuesAtIndexes:forKey:",CPKeyValueChangeInsertion,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_a9),_a4);
};
};
var _3d=_3d=function(_aa,_ab){
return function(_ac,_ad,_ae,_af){
objj_msgSend(_ac,"willChange:valuesAtIndexes:forKey:",CPKeyValueChangeReplacement,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_ae),_aa);
_ab.method_imp(_ac,_ad,_ae,_af);
objj_msgSend(_ac,"didChange:valuesAtIndexes:forKey:",CPKeyValueChangeReplacement,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_ae),_aa);
};
};
var _3e=_3e=function(_b0,_b1){
return function(_b2,_b3,_b4){
objj_msgSend(_b2,"willChange:valuesAtIndexes:forKey:",CPKeyValueChangeRemoval,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_b4),_b0);
_b1.method_imp(_b2,_b3,_b4);
objj_msgSend(_b2,"didChange:valuesAtIndexes:forKey:",CPKeyValueChangeRemoval,objj_msgSend(CPIndexSet,"indexSetWithIndex:",_b4),_b0);
};
};
i;13;CPArray+KVO.j