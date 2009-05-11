i;9;CPRange.ji;10;CPObject.jc;12005;
var _1=objj_allocateClassPair(CPObject,"CPIndexSet"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_count"),new objj_ivar("_cachedRangeIndex"),new objj_ivar("_ranges")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_count=0;
_ranges=[];
_cachedRangeIndex=0;
}
return _3;
}
}),new objj_method(sel_getUid("initWithIndex:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_count=1;
_ranges=objj_msgSend(CPArray,"arrayWithObject:",CPMakeRange(_7,1));
_cachedRangeIndex=0;
}
return _5;
}
}),new objj_method(sel_getUid("initWithIndexesInRange:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPObject")},"init");
if(_8){
_count=_a.length;
_ranges=objj_msgSend(CPArray,"arrayWithObject:",_a);
_cachedRangeIndex=0;
}
return _8;
}
}),new objj_method(sel_getUid("initWithIndexSet:"),function(_b,_c,_d){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPObject")},"init");
if(_b){
_count=objj_msgSend(_d,"count");
_ranges=[];
_cachedRangeIndex=0;
var _e=0,_f=_d._ranges.length;
for(;_e<_f;++_e){
_ranges.push(CPCopyRange(_d._ranges[_e]));
}
}
return _b;
}
}),new objj_method(sel_getUid("isEqualToIndexSet:"),function(_10,_11,_12){
with(_10){
if(_10==_12){
return YES;
}
var i=0,_14=_ranges.length;
otherRanges=_12._ranges;
if(_14!=otherRanges.length||_count!=objj_msgSend(_12,"count")){
return NO;
}
for(;i<_14;++i){
if(!CPEqualRanges(_ranges[i],otherRanges[i])){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("containsIndex:"),function(_15,_16,_17){
with(_15){
return objj_msgSend(_15,"containsIndexesInRange:",CPMakeRange(_17,1));
}
}),new objj_method(sel_getUid("containsIndexesInRange:"),function(_18,_19,_1a){
with(_18){
if(!_count){
return NO;
}
var i=_1c(_18,_1a.location),_1d=_1a.location,_1e=CPMaxRange(_1a),_1f=_ranges.length;
for(;i<_1f&&_ranges[i].location<_1e;++i){
if(_ranges[i].location<=_1d&&CPMaxRange(_ranges[i])>=_1e){
_cachedRangeIndex=i;
return YES;
}
}
_cachedRangeIndex=i;
return NO;
}
}),new objj_method(sel_getUid("containsIndexes:"),function(_20,_21,_22){
with(_20){
if(!objj_msgSend(_22,"count")){
return YES;
}
if(!_count){
return NO;
}
var i=0,_24=_ranges.length;
for(;i<_24;++i){
if(!objj_msgSend(_22,"containsIndexesInRange:",_ranges[i])){
return NO;
}
}
return YES;
}
}),new objj_method(sel_getUid("intersectsIndexesInRange:"),function(_25,_26,_27){
with(_25){
if(!_count){
return NO;
}
var i=_1c(_25,_27.location),_29=_ranges.length,_2a=CPMaxRange(_27);
for(;i<_29&&_ranges[i].location<_2a;++i){
if(CPIntersectionRange(_27,_ranges[i]).length){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("count"),function(_2b,_2c){
with(_2b){
return _count;
}
}),new objj_method(sel_getUid("firstIndex"),function(_2d,_2e){
with(_2d){
return _count?_ranges[0].location:CPNotFound;
}
}),new objj_method(sel_getUid("lastIndex"),function(_2f,_30){
with(_2f){
return _count?CPMaxRange(_ranges[_ranges.length-1])-1:CPNotFound;
}
}),new objj_method(sel_getUid("indexGreaterThanIndex:"),function(_31,_32,_33){
with(_31){
if(!_count){
return CPNotFound;
}
var i=_1c(_31,_33++),_35=_ranges.length;
for(;i<_35&&_33>=CPMaxRange(_ranges[i]);++i){
}
if(i==_35){
return CPNotFound;
}
_cachedRangeIndex=i;
if(_33<_ranges[i].location){
return _ranges[i].location;
}
return _33;
}
}),new objj_method(sel_getUid("indexLessThanIndex:"),function(_36,_37,_38){
with(_36){
if(!_count){
return CPNotFound;
}
var i=_3a(_36,_38--);
for(;i>=0&&_38<_ranges[i].location;--i){
}
if(i<0){
return CPNotFound;
}
_cachedRangeIndex=i;
if(CPLocationInRange(_38,_ranges[i])){
return _38;
}
if(CPMaxRange(_ranges[i])-1<_38){
return CPMaxRange(_ranges[i])-1;
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexGreaterThanOrEqualToIndex:"),function(_3b,_3c,_3d){
with(_3b){
return objj_msgSend(_3b,"indexGreaterThanIndex:",_3d-1);
}
}),new objj_method(sel_getUid("indexLessThanOrEqualToIndex:"),function(_3e,_3f,_40){
with(_3e){
return objj_msgSend(_3e,"indexLessThanIndex:",_40+1);
}
}),new objj_method(sel_getUid("getIndexes:maxCount:inIndexRange:"),function(_41,_42,_43,_44,_45){
with(_41){
if(!_count||_44<=0||_45&&!_45.length){
return 0;
}
var i=_1c(_41,_45?_45.location:0),_47=0,_48=_ranges.length;
for(;i<_48;++i){
var _49=_45?CPIntersectionRange(_ranges[i],_45):_ranges[i],_4a=_49.location,_4b=CPMaxRange(_49);
for(;_4a<_4b;++_4a){
_43[_47++]=_4a;
if(_47==_44){
if(_45){
var _4c=CPMaxRange(_45);
_45.location=_4a+1;
_45.length=_4c-_4a-1;
}
return _44;
}
}
}
if(_45){
_45.location=CPNotFound;
_45.length=0;
}
return _47;
}
}),new objj_method(sel_getUid("description"),function(_4d,_4e){
with(_4d){
var _4f=objj_msgSendSuper({receiver:_4d,super_class:objj_getClass("CPObject")},"description")+" ";
if(_count){
_4f+="[number of indexes: "+_count+" (in "+_ranges.length+" ranges), indexes: (";
for(i=0;i<_ranges.length;i++){
_4f+=_ranges[i].location;
if(_ranges[i].length>1){
_4f+="-"+(CPMaxRange(_ranges[i])-1)+":"+_ranges[i].length+":";
}
if(i+1<_ranges.length){
_4f+=" ";
}
}
_4f+=")]";
}else{
_4f+="(no indexes)";
}
return _4f;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("indexSet"),function(_50,_51){
with(_50){
return objj_msgSend(objj_msgSend(_50,"alloc"),"init");
}
}),new objj_method(sel_getUid("indexSetWithIndex:"),function(_52,_53,_54){
with(_52){
return objj_msgSend(objj_msgSend(_52,"alloc"),"initWithIndex:",_54);
}
}),new objj_method(sel_getUid("indexSetWithIndexesInRange:"),function(_55,_56,_57){
with(_55){
return objj_msgSend(objj_msgSend(_55,"alloc"),"initWithIndexesInRange:",_57);
}
})]);
var _1=objj_getClass("CPIndexSet");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPIndexSet\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("addIndex:"),function(_58,_59,_5a){
with(_58){
objj_msgSend(_58,"addIndexesInRange:",CPMakeRange(_5a,1));
}
}),new objj_method(sel_getUid("addIndexes:"),function(_5b,_5c,_5d){
with(_5b){
var i=0,_5f=_5d._ranges,_60=_5f.length;
for(;i<_60;++i){
objj_msgSend(_5b,"addIndexesInRange:",_5f[i]);
}
}
}),new objj_method(sel_getUid("addIndexesInRange:"),function(_61,_62,_63){
with(_61){
if(_ranges.length==0){
_count=_63.length;
return objj_msgSend(_ranges,"addObject:",CPCopyRange(_63));
}
var i=_1c(_61,_63.location),_65=_ranges.length,_66=CPMakeRange(_63.location-1,_63.length+2),_67=CPMaxRange(_63);
if(_65&&CPMaxRange(_ranges[_65-1])<_63.location){
objj_msgSend(_ranges,"addObject:",CPCopyRange(_63));
}else{
for(;i<_65;++i){
if(_67<_ranges[i].location){
_count+=_63.length;
if(i<_cachedRangeIndex){
++_cachedRangeIndex;
}
return objj_msgSend(_ranges,"insertObject:atIndex:",CPCopyRange(_63),i);
}
if(CPIntersectionRange(_ranges[i],_66).length){
var _68=CPUnionRange(_ranges[i],_63);
if(_68.length==_ranges[i].length){
return;
}
++_68.length;
var j=i;
for(;j<_65;++j){
if(CPIntersectionRange(_68,_ranges[j]).length){
_count-=_ranges[j].length;
}else{
break;
}
}
--_68.length;
_ranges[i]=_68;
if(j-i-1>0){
var _6a=CPMakeRange(i+1,j-i-1);
_ranges[i]=CPUnionRange(_ranges[i],_ranges[j-1]);
objj_msgSend(_ranges,"removeObjectsInRange:",_6a);
if(_cachedRangeIndex>=CPMaxRange(_6a)){
_cachedRangedIndex-=_6a.length;
}else{
if(CPLocationInRange(_cachedRangeIndex,_6a)){
_cachedRangeIndex=i;
}
}
}
_count+=_ranges[i].length;
return;
}
}
}
_count+=_63.length;
}
}),new objj_method(sel_getUid("removeIndex:"),function(_6b,_6c,_6d){
with(_6b){
objj_msgSend(_6b,"removeIndexesInRange:",CPMakeRange(_6d,1));
}
}),new objj_method(sel_getUid("removeIndexes:"),function(_6e,_6f,_70){
with(_6e){
var i=0,_72=_70._ranges,_73=_72.length;
for(;i<_73;++i){
objj_msgSend(_6e,"removeIndexesInRange:",_72[i]);
}
}
}),new objj_method(sel_getUid("removeAllIndexes"),function(_74,_75){
with(_74){
_ranges=[];
_count=0;
_cachedRangeIndex=0;
}
}),new objj_method(sel_getUid("removeIndexesInRange:"),function(_76,_77,_78){
with(_76){
var i=_1c(_76,_78.location),_7a=_ranges.length,_7b=CPMaxRange(_78),_7c=CPMakeRange(CPNotFound,0);
for(;i<_7a;++i){
var _7d=_ranges[i];
if(_7b<_7d.location){
break;
}
var _7e=CPIntersectionRange(_7d,_78);
if(!_7e.length){
continue;
}else{
if(_7e.length==_7d.length){
if(_7c.location==CPNotFound){
_7c=CPMakeRange(i,1);
}else{
++_7c.length;
}
}else{
if(_7e.location>_7d.location&&CPMaxRange(_7e)<CPMaxRange(_7d)){
var _7f=CPMakeRange(CPMaxRange(_7e),CPMaxRange(_7d)-CPMaxRange(_7e));
_7d.length=_7e.location-_7d.location;
_count-=_7e.length;
return objj_msgSend(_ranges,"insertObject:atIndex:",_7f,i+1);
}else{
_7d.length-=_7e.length;
if(_7e.location<=_7d.location){
_7d.location+=_7e.length;
}
}
}
}
_count-=_7e.length;
}
if(_7c.length){
objj_msgSend(_ranges,"removeObjectsInRange:",_7c);
}
}
}),new objj_method(sel_getUid("shiftIndexesStartingAtIndex:by:"),function(_80,_81,_82,_83){
with(_80){
if(!_count||_83==0){
return;
}
var i=_ranges.length-1,_85=CPMakeRange(CPNotFound,0);
for(;i>=0;--i){
var _86=_ranges[i],_87=CPMaxRange(_86);
if(_82>_87){
break;
}
if(_82>_86.location&&_82<_87){
_85=CPMakeRange(_82+_83,_87-_82);
_86.length=_82-_86.location;
if(_83>0){
objj_msgSend(_ranges,"insertObject:atIndex:",_85,i+1);
}else{
if(_85.location<0){
_85.length=CPMaxRange(_85);
_85.location=0;
}
}
break;
}
if((_86.location+=_83)<0){
_86.length=CPMaxRange(_86);
_86.location=0;
}
}
if(_83<0){
var j=i+1,_89=_ranges.length,_8a=[];
for(;j<_89;++j){
objj_msgSend(_8a,"addObject:",_ranges[j]);
}
if((j=i+1)<_89){
objj_msgSend(_ranges,"removeObjectsInRange:",CPMakeRange(j,_89-j));
for(j=0,_89=_8a.length;j<_89;++j){
objj_msgSend(_80,"addIndexesInRange:",_8a[j]);
}
}
if(_85.location!=CPNotFound){
objj_msgSend(_80,"addIndexesInRange:",_85);
}
}
}
})]);
var _8b="CPIndexSetCountKey",_8c="CPIndexSetCachedRangeIndexKey",_8d="CPIndexSetRangeStringsKey";
var _1=objj_getClass("CPIndexSet");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPIndexSet\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_8e,_8f,_90){
with(_8e){
_8e=objj_msgSendSuper({receiver:_8e,super_class:objj_getClass("CPObject")},"init");
if(_8e){
_count=objj_msgSend(_90,"decodeIntForKey:",_8b);
_cachedRangeIndex=objj_msgSend(_90,"decodeIntForKey:",_8c);
_ranges=[];
var _91=objj_msgSend(_90,"decodeObjectForKey:",_8d),_92=0,_93=_91.length;
for(;_92<_93;++_92){
_ranges.push(CPRangeFromString(_91[_92]));
}
}
return _8e;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_94,_95,_96){
with(_94){
objj_msgSend(_96,"encodeInt:forKey:",_count,_8b);
objj_msgSend(_96,"encodeInt:forKey:",_cachedRangeIndex,_8c);
var _97=0,_98=_ranges.length,_99=[];
for(;_97<_98;++_97){
_99[_97]=CPStringFromRange(_ranges[_97]);
}
objj_msgSend(_96,"encodeObject:forKey:",_99,_8d);
}
})]);
var _1=objj_getClass("CPIndexSet");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPIndexSet\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("copy"),function(_9a,_9b){
with(_9a){
return objj_msgSend(objj_msgSend(objj_msgSend(_9a,"class"),"alloc"),"initWithIndexSet:",_9a);
}
}),new objj_method(sel_getUid("mutableCopy"),function(_9c,_9d){
with(_9c){
return objj_msgSend(objj_msgSend(objj_msgSend(_9c,"class"),"alloc"),"initWithIndexSet:",_9c);
}
})]);
var _1=objj_allocateClassPair(CPIndexSet,"CPMutableIndexSet"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var _1c=function(_9e,_9f){
var _a0=_9e._ranges,_a1=0;
if(_a1<_a0.length&&_9f>=_a0[_a1].location){
return _a1;
}
return 0;
};
var _3a=function(_a2,_a3){
var _a4=_a2._ranges,_a5=_a2._ranges.length;
if(_a5<_a4.length&&_a3<=_a4[_a5].location){
return _a5;
}
return _a4.length-1;
};
