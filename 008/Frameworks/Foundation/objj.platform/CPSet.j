i;10;CPObject.ji;9;CPArray.ji;10;CPNumber.ji;14;CPEnumerator.jc;7585;
var _1=objj_allocateClassPair(CPObject,"CPSet"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_contents"),new objj_ivar("_count")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init")){
_count=0;
_contents={};
}
return _3;
}
}),new objj_method(sel_getUid("initWithArray:"),function(_5,_6,_7){
with(_5){
if(_5=objj_msgSend(_5,"init")){
var _8=_7.length;
while(_8--){
objj_msgSend(_5,"addObject:",_7[_8]);
}
}
return _5;
}
}),new objj_method(sel_getUid("initWithObjects:count:"),function(_9,_a,_b,_c){
with(_9){
return objj_msgSend(_9,"initWithArray:",_b.splice(0,_c));
}
}),new objj_method(sel_getUid("initWithObjects:"),function(_d,_e,_f){
with(_d){
if(_d=objj_msgSend(_d,"init")){
var _10=arguments.length,i=2;
for(;i<_10&&(argument=arguments[i])!=nil;++i){
objj_msgSend(_d,"addObject:",argument);
}
}
return _d;
}
}),new objj_method(sel_getUid("initWithSet:"),function(_12,_13,_14){
with(_12){
return objj_msgSend(_12,"initWithSet:copyItems:",_14,NO);
}
}),new objj_method(sel_getUid("initWithSet:copyItems:"),function(_15,_16,_17,_18){
with(_15){
_15=objj_msgSend(_15,"init");
if(!_17){
return _15;
}
var _19=_17._contents;
for(var _1a in _19){
if(_19.hasOwnProperty(_1a)){
if(_18){
objj_msgSend(_15,"addObject:",objj_msgSend(_19[_1a],"copy"));
}else{
objj_msgSend(_15,"addObject:",_19[_1a]);
}
}
}
return _15;
}
}),new objj_method(sel_getUid("allObjects"),function(_1b,_1c){
with(_1b){
var _1d=[];
for(var _1e in _contents){
if(_contents.hasOwnProperty(_1e)){
_1d.push(_contents[_1e]);
}
}
return _1d;
}
}),new objj_method(sel_getUid("anyObject"),function(_1f,_20){
with(_1f){
for(var _21 in _contents){
if(_contents.hasOwnProperty(_21)){
return _contents[_21];
}
}
return nil;
}
}),new objj_method(sel_getUid("containsObject:"),function(_22,_23,_24){
with(_22){
if(_contents[objj_msgSend(_24,"hash")]&&objj_msgSend(_contents[objj_msgSend(_24,"hash")],"isEqual:",_24)){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("count"),function(_25,_26){
with(_25){
return _count;
}
}),new objj_method(sel_getUid("intersectsSet:"),function(_27,_28,set){
with(_27){
var _2a=objj_msgSend(set,"allObjects");
for(var i=_2a.length;i>0;i--){
if(objj_msgSend(_27,"containsObject:",_2a[i])){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("isEqualToSet:"),function(_2c,_2d,set){
with(_2c){
return _2c===set||(objj_msgSend(_2c,"count")===objj_msgSend(set,"count")&&objj_msgSend(set,"isSubsetOfSet:",_2c));
}
}),new objj_method(sel_getUid("isSubsetOfSet:"),function(_2f,_30,set){
with(_2f){
var _32=objj_msgSend(_2f,"allObjects");
for(var i=0;i<_32.length;i++){
if(!objj_msgSend(set,"containsObject:",_32[i])){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:"),function(_34,_35,_36){
with(_34){
objj_msgSend(_34,"makeObjectsPerformSelector:withObject:",_36,nil);
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:withObject:"),function(_37,_38,_39,_3a){
with(_37){
var _3b=objj_msgSend(_37,"allObjects");
for(var i=0;i<_3b.length;i++){
objj_msgSend(_3b[i],"performSelector:withObject:",_39,_3a);
}
}
}),new objj_method(sel_getUid("member:"),function(_3d,_3e,_3f){
with(_3d){
if(objj_msgSend(_3d,"containsObject:",_3f)){
return _3f;
}
return nil;
}
}),new objj_method(sel_getUid("objectEnumerator"),function(_40,_41){
with(_40){
return objj_msgSend(objj_msgSend(_40,"allObjects"),"objectEnumerator");
}
}),new objj_method(sel_getUid("initWithCapacity:"),function(_42,_43,_44){
with(_42){
_42=objj_msgSend(_42,"init");
return _42;
}
}),new objj_method(sel_getUid("setSet:"),function(_45,_46,set){
with(_45){
objj_msgSend(_45,"removeAllObjects");
objj_msgSend(_45,"addObjectsFromArray:",objj_msgSend(set,"allObjects"));
}
}),new objj_method(sel_getUid("addObject:"),function(_48,_49,_4a){
with(_48){
_contents[objj_msgSend(_4a,"hash")]=_4a;
_count++;
}
}),new objj_method(sel_getUid("addObjectsFromArray:"),function(_4b,_4c,_4d){
with(_4b){
for(var i=0,_4f=_4d.length;i<_4f;i++){
objj_msgSend(_4b,"addObject:",_4d[i]);
}
}
}),new objj_method(sel_getUid("removeObject:"),function(_50,_51,_52){
with(_50){
if(objj_msgSend(_50,"containsObject:",_52)){
delete _contents[objj_msgSend(_52,"hash")];
_count--;
}
}
}),new objj_method(sel_getUid("removeAllObjects"),function(_53,_54){
with(_53){
_contents={};
_count=0;
}
}),new objj_method(sel_getUid("intersectSet:"),function(_55,_56,set){
with(_55){
var _58=objj_msgSend(_55,"allObjects");
for(var i=0,_5a=_58.length;i<_5a;i++){
if(!objj_msgSend(set,"containsObject:",_58[i])){
objj_msgSend(_55,"removeObject:",_58[i]);
}
}
}
}),new objj_method(sel_getUid("minusSet:"),function(_5b,_5c,set){
with(_5b){
var _5e=objj_msgSend(set,"allObjects");
for(var i=0;i<_5e.length;i++){
if(objj_msgSend(_5b,"containsObject:",_5e[i])){
objj_msgSend(_5b,"removeObject:",_5e[i]);
}
}
}
}),new objj_method(sel_getUid("unionSet:"),function(_60,_61,set){
with(_60){
var _63=objj_msgSend(set,"allObjects");
for(var i=0,_65=_63.length;i<_65;i++){
objj_msgSend(_60,"addObject:",_63[i]);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("set"),function(_66,_67){
with(_66){
return objj_msgSend(objj_msgSend(_66,"alloc"),"init");
}
}),new objj_method(sel_getUid("setWithArray:"),function(_68,_69,_6a){
with(_68){
return objj_msgSend(objj_msgSend(_68,"alloc"),"initWithArray:",_6a);
}
}),new objj_method(sel_getUid("setWithObject:"),function(_6b,_6c,_6d){
with(_6b){
return objj_msgSend(objj_msgSend(_6b,"alloc"),"initWithArray:",[_6d]);
}
}),new objj_method(sel_getUid("setWithObjects:count:"),function(_6e,_6f,_70,_71){
with(_6e){
return objj_msgSend(objj_msgSend(_6e,"alloc"),"initWithObjects:count:",_70,_71);
}
}),new objj_method(sel_getUid("setWithObjects:"),function(_72,_73,_74){
with(_72){
var set=objj_msgSend(objj_msgSend(_72,"alloc"),"init"),_76=arguments.length,i=2;
for(;i<_76&&((argument=arguments[i])!==nil);++i){
objj_msgSend(set,"addObject:",argument);
}
return set;
}
}),new objj_method(sel_getUid("setWithSet:"),function(_78,_79,set){
with(_78){
return objj_msgSend(objj_msgSend(_78,"alloc"),"initWithSet:",set);
}
}),new objj_method(sel_getUid("setWithCapacity:"),function(_7b,_7c,_7d){
with(_7b){
return objj_msgSend(objj_msgSend(_7b,"alloc"),"initWithCapacity:",_7d);
}
})]);
var _1=objj_getClass("CPSet");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSet\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("copy"),function(_7e,_7f){
with(_7e){
return objj_msgSend(objj_msgSend(CPSet,"alloc"),"initWithSet:",_7e);
}
}),new objj_method(sel_getUid("mutableCopy"),function(_80,_81){
with(_80){
return objj_msgSend(_80,"copy");
}
})]);
var _82="CPSetObjectsKey";
var _1=objj_getClass("CPSet");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSet\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_83,_84,_85){
with(_83){
return objj_msgSend(_83,"initWithArray:",objj_msgSend(_85,"decodeObjectForKey:",_82));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_86,_87,_88){
with(_86){
objj_msgSend(_88,"encodeObject:forKey:",objj_msgSend(_86,"allObjects"),_82);
}
})]);
var _1=objj_allocateClassPair(CPSet,"CPMutableSet"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
