i;10;CPObject.ji;9;CPRange.ji;14;CPEnumerator.ji;18;CPSortDescriptor.ji;13;CPException.jc;17789;
var _1=objj_allocateClassPair(CPEnumerator,"_CPArrayEnumerator"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_array"),new objj_ivar("_index")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithArray:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPEnumerator")},"init");
if(_3){
_array=_5;
_index=-1;
}
return _3;
}
}),new objj_method(sel_getUid("nextObject"),function(_6,_7){
with(_6){
if(++_index>=objj_msgSend(_array,"count")){
return nil;
}
return objj_msgSend(_array,"objectAtIndex:",_index);
}
})]);
var _1=objj_allocateClassPair(CPEnumerator,"_CPReverseArrayEnumerator"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_array"),new objj_ivar("_index")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithArray:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPEnumerator")},"init");
if(_8){
_array=_a;
_index=objj_msgSend(_array,"count");
}
return _8;
}
}),new objj_method(sel_getUid("nextObject"),function(_b,_c){
with(_b){
if(--_index<0){
return nil;
}
return objj_msgSend(_array,"objectAtIndex:",_index);
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPArray"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_d,_e){
with(_d){
return _d;
}
}),new objj_method(sel_getUid("initWithArray:"),function(_f,_10,_11){
with(_f){
_f=objj_msgSendSuper({receiver:_f,super_class:objj_getClass("CPObject")},"init");
if(_f){
objj_msgSend(_f,"setArray:",_11);
}
return _f;
}
}),new objj_method(sel_getUid("initWithArray:copyItems:"),function(_12,_13,_14,_15){
with(_12){
if(!_15){
return objj_msgSend(_12,"initWithArray:",_14);
}
_12=objj_msgSendSuper({receiver:_12,super_class:objj_getClass("CPObject")},"init");
if(_12){
var _16=0,_17=objj_msgSend(_14,"count");
for(;_16<_17;++i){
if(_14[i].isa){
_12[i]=objj_msgSend(_14,"copy");
}else{
_12[i]=_14;
}
}
}
return _12;
}
}),new objj_method(sel_getUid("initWithObjects:"),function(_18,_19,_1a){
with(_18){
var i=2,_1c;
for(;i<arguments.length&&(_1c=arguments[i])!=nil;++i){
push(_1c);
}
return _18;
}
}),new objj_method(sel_getUid("initWithObjects:count:"),function(_1d,_1e,_1f,_20){
with(_1d){
_1d=objj_msgSendSuper({receiver:_1d,super_class:objj_getClass("CPObject")},"init");
if(_1d){
var _21=0;
for(;_21<_20;++_21){
push(_1f[_21]);
}
}
return _1d;
}
}),new objj_method(sel_getUid("hash"),function(_22,_23){
with(_22){
if(_22.__address==nil){
_22.__address=_objj_generateObjectHash();
}
return _22.__address;
}
}),new objj_method(sel_getUid("containsObject:"),function(_24,_25,_26){
with(_24){
return objj_msgSend(_24,"indexOfObject:",_26)!=CPNotFound;
}
}),new objj_method(sel_getUid("count"),function(_27,_28){
with(_27){
return length;
}
}),new objj_method(sel_getUid("indexOfObject:"),function(_29,_2a,_2b){
with(_29){
if(_2b===nil){
return CPNotFound;
}
var i=0,_2d=length;
if(_2b.isa){
for(;i<_2d;++i){
if(objj_msgSend(_29[i],"isEqual:",_2b)){
return i;
}
}
}else{
if(_29.indexOf){
return indexOf(_2b);
}else{
for(;i<_2d;++i){
if(_29[i]==_2b){
return i;
}
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObject:inRange:"),function(_2e,_2f,_30,_31){
with(_2e){
if(_30===nil){
return CPNotFound;
}
var i=_31.location,_33=MIN(CPMaxRange(_31),length);
if(_30.isa){
for(;i<_33;++i){
if(objj_msgSend(_2e[i],"isEqual:",_30)){
return i;
}
}
}else{
for(;i<_33;++i){
if(_2e[i]==_30){
return i;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:"),function(_34,_35,_36){
with(_34){
if(_36===nil){
return CPNotFound;
}
if(_34.indexOf){
return indexOf(_36);
}else{
var _37=0,_38=length;
for(;_37<_38;++_37){
if(_34[_37]==_36){
return _37;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObjectIdenticalTo:inRange:"),function(_39,_3a,_3b,_3c){
with(_39){
if(_3b===nil){
return CPNotFound;
}
if(_39.indexOf){
var _3d=indexOf(_3b,_3c.location);
if(CPLocationInRange(_3d,_3c)){
return _3d;
}
}else{
var _3d=_3c.location,_3e=MIN(CPMaxRange(_3c),length);
for(;_3d<_3e;++_3d){
if(_39[_3d]==_3b){
return _3d;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObject:sortedBySelector:"),function(_3f,_40,_41,_42){
with(_3f){
return objj_msgSend(_3f,"indexOfObject:sortedByFunction:",_41,function(lhs,rhs){
objj_msgSend(lhs,_42,rhs);
});
}
}),new objj_method(sel_getUid("indexOfObject:sortedByFunction:"),function(_45,_46,_47,_48){
with(_45){
return objj_msgSend(_45,"indexOfObject:sortedByFunction:context:",_47,_48,nil);
}
}),new objj_method(sel_getUid("indexOfObject:sortedByFunction:context:"),function(_49,_4a,_4b,_4c,_4d){
with(_49){
if(!_4c||_4b===undefined){
return CPNotFound;
}
var mid,c,_50=0,_51=length-1;
while(_50<=_51){
mid=FLOOR((_50+_51)/2);
c=_4c(_4b,_49[mid],_4d);
if(c>0){
_50=mid+1;
}else{
if(c<0){
_51=mid-1;
}else{
while(mid<length-1&&_4c(_4b,_49[mid+1],_4d)==CPOrderedSame){
mid++;
}
return mid;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfObject:sortedByDescriptors:"),function(_52,_53,_54,_55){
with(_52){
objj_msgSend(_52,"indexOfObject:sortedByFunction:",_54,function(lhs,rhs){
var i=0,_59=objj_msgSend(_55,"count"),_5a=CPOrderedSame;
while(i<_59){
if((_5a=objj_msgSend(_55[i++],"compareObject:withObject:",lhs,rhs))!=CPOrderedSame){
return _5a;
}
}
return _5a;
});
}
}),new objj_method(sel_getUid("lastObject"),function(_5b,_5c){
with(_5b){
var _5d=objj_msgSend(_5b,"count");
if(!_5d){
return nil;
}
return _5b[_5d-1];
}
}),new objj_method(sel_getUid("objectAtIndex:"),function(_5e,_5f,_60){
with(_5e){
return _5e[_60];
}
}),new objj_method(sel_getUid("objectsAtIndexes:"),function(_61,_62,_63){
with(_61){
var _64=objj_msgSend(_63,"firstIndex"),_65=[];
while(_64!=CPNotFound){
objj_msgSend(_65,"addObject:",_61[_64]);
_64=objj_msgSend(_63,"indexGreaterThanIndex:",_64);
}
return _65;
}
}),new objj_method(sel_getUid("objectEnumerator"),function(_66,_67){
with(_66){
return objj_msgSend(objj_msgSend(_CPArrayEnumerator,"alloc"),"initWithArray:",_66);
}
}),new objj_method(sel_getUid("reverseObjectEnumerator"),function(_68,_69){
with(_68){
return objj_msgSend(objj_msgSend(_CPReverseArrayEnumerator,"alloc"),"initWithArray:",_68);
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:"),function(_6a,_6b,_6c){
with(_6a){
if(!_6c){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"makeObjectsPerformSelector: 'aSelector' can't be nil");
}
var _6d=0,_6e=length;
for(;_6d<_6e;++_6d){
objj_msgSend(_6a[_6d],_6c);
}
}
}),new objj_method(sel_getUid("makeObjectsPerformSelector:withObject:"),function(_6f,_70,_71,_72){
with(_6f){
if(!_71){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"makeObjectsPerformSelector:withObject 'aSelector' can't be nil");
}
var _73=0,_74=length;
for(;_73<_74;++_73){
objj_msgSend(_6f[_73],_71,_72);
}
}
}),new objj_method(sel_getUid("firstObjectCommonWithArray:"),function(_75,_76,_77){
with(_75){
if(!objj_msgSend(_77,"count")||!objj_msgSend(_75,"count")){
return nil;
}
var i=0,_79=objj_msgSend(_75,"count");
for(;i<_79;++i){
if(objj_msgSend(_77,"containsObject:",_75[i])){
return _75[i];
}
}
return nil;
}
}),new objj_method(sel_getUid("isEqualToArray:"),function(_7a,_7b,_7c){
with(_7a){
if(_7a===_7c){
return YES;
}
if(length!=_7c.length){
return NO;
}
var _7d=0,_7e=objj_msgSend(_7a,"count");
for(;_7d<_7e;++_7d){
var lhs=_7a[_7d],rhs=_7c[_7d];
if(lhs!==rhs&&(!lhs.isa||!rhs.isa||!objj_msgSend(lhs,"isEqual:",rhs))){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("isEqual:"),function(_81,_82,_83){
with(_81){
if(_81===_83){
return YES;
}
if(!objj_msgSend(_83,"isKindOfClass:",objj_msgSend(CPArray,"class"))){
return NO;
}
return objj_msgSend(_81,"isEqualToArray:",_83);
}
}),new objj_method(sel_getUid("arrayByAddingObject:"),function(_84,_85,_86){
with(_84){
if(_86===nil||_86===undefined){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"arrayByAddingObject: object can't be nil");
}
var _87=objj_msgSend(_84,"copy");
_87.push(_86);
return _87;
}
}),new objj_method(sel_getUid("arrayByAddingObjectsFromArray:"),function(_88,_89,_8a){
with(_88){
return slice(0).concat(_8a);
}
}),new objj_method(sel_getUid("subarrayWithRange:"),function(_8b,_8c,_8d){
with(_8b){
if(_8d.location<0||CPMaxRange(_8d)>length){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"subarrayWithRange: aRange out of bounds");
}
return slice(_8d.location,CPMaxRange(_8d));
}
}),new objj_method(sel_getUid("sortedArrayUsingDescriptors:"),function(_8e,_8f,_90){
with(_8e){
var _91=objj_msgSend(_8e,"copy");
objj_msgSend(_91,"sortUsingDescriptors:",_90);
return _91;
}
}),new objj_method(sel_getUid("sortedArrayUsingFunction:"),function(_92,_93,_94){
with(_92){
return objj_msgSend(_92,"sortedArrayUsingFunction:context:",_94,nil);
}
}),new objj_method(sel_getUid("sortedArrayUsingFunction:context:"),function(_95,_96,_97,_98){
with(_95){
var _99=objj_msgSend(_95,"copy");
objj_msgSend(_99,"sortUsingFunction:context:",_97,_98);
return _99;
}
}),new objj_method(sel_getUid("sortedArrayUsingSelector:"),function(_9a,_9b,_9c){
with(_9a){
var _9d=objj_msgSend(_9a,"copy");
objj_msgSend(_9d,"sortUsingSelector:",_9c);
return _9d;
}
}),new objj_method(sel_getUid("componentsJoinedByString:"),function(_9e,_9f,_a0){
with(_9e){
return join(_a0);
}
}),new objj_method(sel_getUid("description"),function(_a1,_a2){
with(_a1){
var i=0,_a4=objj_msgSend(_a1,"count"),_a5="(";
for(;i<_a4;++i){
if(_a1[i].isa){
_a5+=objj_msgSend(_a1[i],"description");
}else{
_a5+=_a1[i];
}
if(i!=_a4-1){
_a5+=", ";
}
}
return _a5+")";
}
}),new objj_method(sel_getUid("pathsMatchingExtensions:"),function(_a6,_a7,_a8){
with(_a6){
var _a9=0,_aa=objj_msgSend(_a6,"count"),_ab=[];
for(;_a9<_aa;++_a9){
if(_a6[_a9].isa&&objj_msgSend(_a6[_a9],"isKindOfClass:",objj_msgSend(CPString,"class"))&&objj_msgSend(_a8,"containsObject:",objj_msgSend(_a6[_a9],"pathExtension"))){
_ab.push(_a6[_a9]);
}
}
return _ab;
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_ac,_ad,_ae,_af){
with(_ac){
var i=0,_b1=objj_msgSend(_ac,"count");
for(;i<_b1;++i){
objj_msgSend(_ac[i],"setValue:forKey:",_ae,_af);
}
}
}),new objj_method(sel_getUid("valueForKey:"),function(_b2,_b3,_b4){
with(_b2){
var i=0,_b6=objj_msgSend(_b2,"count"),_b7=[];
for(;i<_b6;++i){
_b7.push(objj_msgSend(_b2[i],"valueForKey:",_b4));
}
return _b7;
}
}),new objj_method(sel_getUid("copy"),function(_b8,_b9){
with(_b8){
return slice(0);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("alloc"),function(_ba,_bb){
with(_ba){
return [];
}
}),new objj_method(sel_getUid("array"),function(_bc,_bd){
with(_bc){
return objj_msgSend(objj_msgSend(_bc,"alloc"),"init");
}
}),new objj_method(sel_getUid("arrayWithArray:"),function(_be,_bf,_c0){
with(_be){
return objj_msgSend(objj_msgSend(_be,"alloc"),"initWithArray:",_c0);
}
}),new objj_method(sel_getUid("arrayWithObject:"),function(_c1,_c2,_c3){
with(_c1){
return objj_msgSend(objj_msgSend(_c1,"alloc"),"initWithObjects:",_c3);
}
}),new objj_method(sel_getUid("arrayWithObjects:"),function(_c4,_c5,_c6){
with(_c4){
var i=2,_c8=objj_msgSend(objj_msgSend(_c4,"alloc"),"init"),_c9;
for(;i<arguments.length&&(_c9=arguments[i])!=nil;++i){
_c8.push(_c9);
}
return _c8;
}
}),new objj_method(sel_getUid("arrayWithObjects:count:"),function(_ca,_cb,_cc,_cd){
with(_ca){
return objj_msgSend(objj_msgSend(_ca,"alloc"),"initWithObjects:count:",_cc,_cd);
}
})]);
var _1=objj_getClass("CPArray");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPArray\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCapacity:"),function(_ce,_cf,_d0){
with(_ce){
return _ce;
}
}),new objj_method(sel_getUid("addObject:"),function(_d1,_d2,_d3){
with(_d1){
push(_d3);
}
}),new objj_method(sel_getUid("addObjectsFromArray:"),function(_d4,_d5,_d6){
with(_d4){
splice.apply(_d4,[length,0].concat(_d6));
}
}),new objj_method(sel_getUid("insertObject:atIndex:"),function(_d7,_d8,_d9,_da){
with(_d7){
splice(_da,0,_d9);
}
}),new objj_method(sel_getUid("insertObjects:atIndexes:"),function(_db,_dc,_dd,_de){
with(_db){
var _df=objj_msgSend(_de,"count"),_e0=objj_msgSend(_dd,"count");
if(_df!==_e0){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"the counts of the passed-in array ("+_e0+") and index set ("+_df+") must be identical.");
}
var _e1=objj_msgSend(_de,"lastIndex");
if(_e1>=objj_msgSend(_db,"count")+_df){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"the last index ("+_e1+") must be less than the sum of the original count ("+objj_msgSend(_db,"count")+") and the insertion count ("+_df+").");
}
var _e2=0,_e3=objj_msgSend(_de,"firstIndex");
for(;_e2<_e0;++_e2,_e3=objj_msgSend(_de,"indexGreaterThanIndex:",_e3)){
objj_msgSend(_db,"insertObject:atIndex:",_dd[_e2],_e3);
}
}
}),new objj_method(sel_getUid("replaceObjectAtIndex:withObject:"),function(_e4,_e5,_e6,_e7){
with(_e4){
_e4[_e6]=_e7;
}
}),new objj_method(sel_getUid("replaceObjectsAtIndexes:withObjects:"),function(_e8,_e9,_ea,_eb){
with(_e8){
var i=0,_ed=objj_msgSend(_ea,"firstIndex");
while(_ed!=CPNotFound){
objj_msgSend(_e8,"replaceObjectAtIndex:withObject:",_ed,_eb[i++]);
_ed=objj_msgSend(_ea,"indexGreaterThanIndex:",_ed);
}
}
}),new objj_method(sel_getUid("replaceObjectsInRange:withObjectsFromArray:range:"),function(_ee,_ef,_f0,_f1,_f2){
with(_ee){
if(!_f2.location&&_f2.length==objj_msgSend(_f1,"count")){
objj_msgSend(_ee,"replaceObjectsInRange:withObjectsFromArray:",_f0,_f1);
}else{
splice.apply(_ee,[_f0.location,_f0.length].concat(objj_msgSend(_f1,"subarrayWithRange:",_f2)));
}
}
}),new objj_method(sel_getUid("replaceObjectsInRange:withObjectsFromArray:"),function(_f3,_f4,_f5,_f6){
with(_f3){
splice.apply(_f3,[_f5.location,_f5.length].concat(_f6));
}
}),new objj_method(sel_getUid("setArray:"),function(_f7,_f8,_f9){
with(_f7){
if(_f7==_f9){
return;
}
splice.apply(_f7,[0,length].concat(_f9));
}
}),new objj_method(sel_getUid("removeAllObjects"),function(_fa,_fb){
with(_fa){
splice(0,length);
}
}),new objj_method(sel_getUid("removeLastObject"),function(_fc,_fd){
with(_fc){
pop();
}
}),new objj_method(sel_getUid("removeObject:"),function(_fe,_ff,_100){
with(_fe){
objj_msgSend(_fe,"removeObject:inRange:",_100,CPMakeRange(0,length));
}
}),new objj_method(sel_getUid("removeObject:inRange:"),function(self,_cmd,_103,_104){
with(self){
var _105;
while((_105=objj_msgSend(self,"indexOfObject:inRange:",_103,_104))!=CPNotFound){
objj_msgSend(self,"removeObjectAtIndex:",_105);
_104=CPIntersectionRange(CPMakeRange(_105,length-_105),_104);
}
}
}),new objj_method(sel_getUid("removeObjectAtIndex:"),function(self,_cmd,_108){
with(self){
splice(_108,1);
}
}),new objj_method(sel_getUid("removeObjectsAtIndexes:"),function(self,_cmd,_10b){
with(self){
var _10c=objj_msgSend(_10b,"lastIndex");
while(_10c!=CPNotFound){
objj_msgSend(self,"removeObjectAtIndex:",_10c);
_10c=objj_msgSend(_10b,"indexLessThanIndex:",_10c);
}
}
}),new objj_method(sel_getUid("removeObjectIdenticalTo:"),function(self,_cmd,_10f){
with(self){
objj_msgSend(self,"removeObjectIdenticalTo:inRange:",_10f,CPMakeRange(0,length));
}
}),new objj_method(sel_getUid("removeObjectIdenticalTo:inRange:"),function(self,_cmd,_112,_113){
with(self){
var _114;
while((_114=objj_msgSend(self,"indexOfObjectIdenticalTo:inRange:",_112,_113))!=CPNotFound){
objj_msgSend(self,"removeObjectAtIndex:",_114);
_113=CPIntersectionRange(CPMakeRange(_114,length-_114),_113);
}
}
}),new objj_method(sel_getUid("removeObjectsInArray:"),function(self,_cmd,_117){
with(self){
var _118=0,_119=objj_msgSend(_117,"count");
for(;_118<_119;++_118){
objj_msgSend(self,"removeObject:",_117[_118]);
}
}
}),new objj_method(sel_getUid("removeObjectsInRange:"),function(self,_cmd,_11c){
with(self){
splice(_11c.location,_11c.length);
}
}),new objj_method(sel_getUid("exchangeObjectAtIndex:withObjectAtIndex:"),function(self,_cmd,_11f,_120){
with(self){
var _121=self[_11f];
self[_11f]=self[_120];
self[_120]=_121;
}
}),new objj_method(sel_getUid("sortUsingDescriptors:"),function(self,_cmd,_124){
with(self){
sort(function(lhs,rhs){
var i=0,_128=objj_msgSend(_124,"count"),_129=CPOrderedSame;
while(i<_128){
if((_129=objj_msgSend(_124[i++],"compareObject:withObject:",lhs,rhs))!=CPOrderedSame){
return _129;
}
}
return _129;
});
}
}),new objj_method(sel_getUid("sortUsingFunction:context:"),function(self,_cmd,_12c,_12d){
with(self){
sort(function(lhs,rhs){
return _12c(lhs,rhs,_12d);
});
}
}),new objj_method(sel_getUid("sortUsingSelector:"),function(self,_cmd,_132){
with(self){
sort(function(lhs,rhs){
return objj_msgSend(lhs,_132,rhs);
});
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("arrayWithCapacity:"),function(self,_cmd,_137){
with(self){
return objj_msgSend(objj_msgSend(self,"alloc"),"initWithCapacity:",_137);
}
})]);
var _1=objj_getClass("CPArray");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPArray\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(self,_cmd,_13a){
with(self){
return objj_msgSend(_13a,"decodeObjectForKey:","CP.objects");
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_cmd,_13d){
with(self){
objj_msgSend(_13d,"_encodeArrayOfObjects:forKey:",self,"CP.objects");
}
})]);
var _1=objj_allocateClassPair(CPArray,"CPMutableArray"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
Array.prototype.isa=CPArray;
objj_msgSend(CPArray,"initialize");
