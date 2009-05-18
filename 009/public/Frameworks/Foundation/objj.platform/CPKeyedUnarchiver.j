i;8;CPNull.ji;9;CPCoder.jc;8106;
var _1=1,_2=1<<1,_3=1<<2,_4=1<<3,_5=1<<4;
var _6="$null";
_CPKeyedArchiverUIDKey="CP$UID",_CPKeyedArchiverTopKey="$top",_CPKeyedArchiverObjectsKey="$objects",_CPKeyedArchiverArchiverKey="$archiver",_CPKeyedArchiverVersionKey="$version",_CPKeyedArchiverClassNameKey="$classname",_CPKeyedArchiverClassesKey="$classes",_CPKeyedArchiverClassKey="$class";
var _7=Nil,_8=Nil,_9=Nil,_a=Nil,_b=Nil,_c=Nil;
var _d=objj_allocateClassPair(CPCoder,"CPKeyedUnarchiver"),_e=_d.isa;
class_addIvars(_d,[new objj_ivar("_delegate"),new objj_ivar("_delegateSelectors"),new objj_ivar("_data"),new objj_ivar("_replacementClasses"),new objj_ivar("_objects"),new objj_ivar("_archive"),new objj_ivar("_plistObject"),new objj_ivar("_plistObjects")]);
objj_registerClassPair(_d);
objj_addClassForBundle(_d,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_d,[new objj_method(sel_getUid("initForReadingWithData:"),function(_f,_10,_11){
with(_f){
_f=objj_msgSendSuper({receiver:_f,super_class:objj_getClass("CPCoder")},"init");
if(_f){
_archive=objj_msgSend(_11,"plistObject");
_objects=objj_msgSend(CPArray,"arrayWithObject:",objj_msgSend(CPNull,"null"));
_plistObject=objj_msgSend(_archive,"objectForKey:",_CPKeyedArchiverTopKey);
_plistObjects=objj_msgSend(_archive,"objectForKey:",_CPKeyedArchiverObjectsKey);
_replacementClasses=objj_msgSend(CPDictionary,"dictionary");
}
return _f;
}
}),new objj_method(sel_getUid("containsValueForKey:"),function(_12,_13,_14){
with(_12){
return objj_msgSend(_plistObject,"objectForKey:",_14)!=nil;
}
}),new objj_method(sel_getUid("_decodeDictionaryOfObjectsForKey:"),function(_15,_16,_17){
with(_15){
var _18=objj_msgSend(_plistObject,"objectForKey:",_17);
if(objj_msgSend(_18,"isKindOfClass:",_9)){
var key,_1a=objj_msgSend(_18,"keyEnumerator"),_1b=objj_msgSend(CPDictionary,"dictionary");
while(key=objj_msgSend(_1a,"nextObject")){
objj_msgSend(_1b,"setObject:forKey:",_1c(_15,objj_msgSend(objj_msgSend(_18,"objectForKey:",key),"objectForKey:",_CPKeyedArchiverUIDKey)),key);
}
return _1b;
}
return nil;
}
}),new objj_method(sel_getUid("decodeBoolForKey:"),function(_1d,_1e,_1f){
with(_1d){
return objj_msgSend(_1d,"decodeObjectForKey:",_1f);
}
}),new objj_method(sel_getUid("decodeFloatForKey:"),function(_20,_21,_22){
with(_20){
return objj_msgSend(_20,"decodeObjectForKey:",_22);
}
}),new objj_method(sel_getUid("decodeDoubleForKey:"),function(_23,_24,_25){
with(_23){
return objj_msgSend(_23,"decodeObjectForKey:",_25);
}
}),new objj_method(sel_getUid("decodeIntForKey:"),function(_26,_27,_28){
with(_26){
return objj_msgSend(_26,"decodeObjectForKey:",_28);
}
}),new objj_method(sel_getUid("decodePointForKey:"),function(_29,_2a,_2b){
with(_29){
var _2c=objj_msgSend(_29,"decodeObjectForKey:",_2b);
if(_2c){
return CPPointFromString(_2c);
}else{
return CPPointMake(0,0);
}
}
}),new objj_method(sel_getUid("decodeRectForKey:"),function(_2d,_2e,_2f){
with(_2d){
var _30=objj_msgSend(_2d,"decodeObjectForKey:",_2f);
if(_30){
return CPRectFromString(_30);
}else{
return CPRectMakeZero();
}
}
}),new objj_method(sel_getUid("decodeSizeForKey:"),function(_31,_32,_33){
with(_31){
var _34=objj_msgSend(_31,"decodeObjectForKey:",_33);
if(_34){
return CPSizeFromString(_34);
}else{
return CPSizeMake(0,0);
}
}
}),new objj_method(sel_getUid("decodeObjectForKey:"),function(_35,_36,_37){
with(_35){
var _38=objj_msgSend(_plistObject,"objectForKey:",_37);
if(objj_msgSend(_38,"isKindOfClass:",_9)){
return _1c(_35,objj_msgSend(_38,"objectForKey:",_CPKeyedArchiverUIDKey));
}else{
if(objj_msgSend(_38,"isKindOfClass:",_a)||objj_msgSend(_38,"isKindOfClass:",_b)){
return _38;
}else{
if(objj_msgSend(_38,"isKindOfClass:",_7)){
var _39=0,_3a=_38.length,_3b=[];
for(;_39<_3a;++_39){
_3b[_39]=_1c(_35,objj_msgSend(_38[_39],"objectForKey:",_CPKeyedArchiverUIDKey));
}
return _3b;
}
}
}
return nil;
}
}),new objj_method(sel_getUid("decodeBytesForKey:"),function(_3c,_3d,_3e){
with(_3c){
var _3f=objj_msgSend(_3c,"decodeObjectForKey:",_3e);
if(objj_msgSend(_3f,"isKindOfClass:",objj_msgSend(CPData,"class"))){
return _3f.bytes;
}
return nil;
}
}),new objj_method(sel_getUid("finishDecoding"),function(_40,_41){
with(_40){
if(_delegateSelectors&_4){
objj_msgSend(_delegate,"unarchiverWillFinish:",_40);
}
if(_delegateSelectors&_5){
objj_msgSend(_delegate,"unarchiverDidFinish:",_40);
}
}
}),new objj_method(sel_getUid("delegate"),function(_42,_43){
with(_42){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_44,_45,_46){
with(_44){
_delegate=_46;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("unarchiver:cannotDecodeObjectOfClassName:originalClasses:"))){
_delegateSelectors|=_1;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("unarchiver:didDecodeObject:"))){
_delegateSelectors|=_2;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("unarchiver:willReplaceObject:withObject:"))){
_delegateSelectors|=_3;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("unarchiverWillFinish:"))){
_delegateSelectors|=_CPKeyedUnarchiverWilFinishSelector;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("unarchiverDidFinish:"))){
_delegateSelectors|=_5;
}
}
}),new objj_method(sel_getUid("setClass:forClassName:"),function(_47,_48,_49,_4a){
with(_47){
objj_msgSend(_replacementClasses,"setObject:forKey:",_49,_4a);
}
}),new objj_method(sel_getUid("classForClassName:"),function(_4b,_4c,_4d){
with(_4b){
return objj_msgSend(_replacementClasses,"objectForKey:",_4d);
}
}),new objj_method(sel_getUid("allowsKeyedCoding"),function(_4e,_4f){
with(_4e){
return YES;
}
})]);
class_addMethods(_e,[new objj_method(sel_getUid("initialize"),function(_50,_51){
with(_50){
if(_50!==objj_msgSend(CPKeyedUnarchiver,"class")){
return;
}
_7=objj_msgSend(CPArray,"class");
_8=objj_msgSend(CPString,"class");
_9=objj_msgSend(CPDictionary,"class");
_a=objj_msgSend(CPNumber,"class");
_b=objj_msgSend(CPData,"class");
_c=objj_msgSend(_CPKeyedArchiverValue,"class");
}
}),new objj_method(sel_getUid("unarchiveObjectWithData:"),function(_52,_53,_54){
with(_52){
var _55=objj_msgSend(objj_msgSend(_52,"alloc"),"initForReadingWithData:",_54),_56=objj_msgSend(_55,"decodeObjectForKey:","root");
objj_msgSend(_55,"finishDecoding");
return _56;
}
}),new objj_method(sel_getUid("unarchiveObjectWithFile:"),function(_57,_58,_59){
with(_57){
}
}),new objj_method(sel_getUid("unarchiveObjectWithFile:asynchronously:"),function(_5a,_5b,_5c,_5d){
with(_5a){
}
})]);
var _1c=function(_5e,_5f){
var _60=_5e._objects[_5f];
if(_60){
if(_60==_5e._objects[0]){
return nil;
}else{
return _60;
}
}
var _60,_61=_5e._plistObjects[_5f];
if(objj_msgSend(_61,"isKindOfClass:",_9)){
var _62=_5e._plistObjects[objj_msgSend(objj_msgSend(_61,"objectForKey:",_CPKeyedArchiverClassKey),"objectForKey:",_CPKeyedArchiverUIDKey)],_63=objj_msgSend(_62,"objectForKey:",_CPKeyedArchiverClassNameKey),_64=objj_msgSend(_62,"objectForKey:",_CPKeyedArchiverClassesKey),_65=objj_msgSend(_5e,"classForClassName:",_63);
if(!_65){
_65=CPClassFromString(_63);
}
_60=objj_msgSend(_65,"alloc");
_5e._objects[_5f]=_60;
var _66=_5e._plistObject;
_5e._plistObject=_61;
var _67=_63;
var _68=objj_msgSend(_60,"initWithCoder:",_5e);
_5e._plistObject=_66;
if(_68!=_60){
if(_5e._delegateSelectors&_3){
objj_msgSend(_5e._delegate,"unarchiver:willReplaceObject:withObject:",_5e,_60,_68);
}
_60=_68;
_5e._objects[_5f]=_68;
}
_68=objj_msgSend(_60,"awakeAfterUsingCoder:",_5e);
if(_68!=_60){
if(_5e._delegateSelectors&_3){
objj_msgSend(_5e._delegate,"unarchiver:willReplaceObject:withObject:",_5e,_60,_68);
}
_60=_68;
_5e._objects[_5f]=_68;
}
if(_5e._delegate){
if(_5e._delegateSelectors&_2){
_68=objj_msgSend(_5e._delegate,"unarchiver:didDecodeObject:",_5e,_60);
}
if(_68!=_60){
if(_5e._delegateSelectors&_3){
objj_msgSend(_5e._delegate,"unarchiver:willReplaceObject:withObject:",_5e,_60,_68);
}
_60=_68;
_5e._objects[_5f]=_68;
}
}
}else{
_5e._objects[_5f]=_60=_61;
if(objj_msgSend(_60,"class")==_8){
if(_60==_6){
_5e._objects[_5f]=_5e._objects[0];
return nil;
}else{
_5e._objects[_5f]=_60=_61;
}
}
}
if(objj_msgSend(_60,"isMemberOfClass:",_c)){
_60=objj_msgSend(_60,"JSObject");
}
return _60;
};
