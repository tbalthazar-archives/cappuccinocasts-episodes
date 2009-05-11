I;21;Foundation/CPObject.jI;29;AppKit/_CPCibCustomResource.jI;30;AppKit/_CPCibKeyedUnarchiver.ji;19;CPThemedAttribute.jc;7729;
var _1=objj_allocateClassPair(CPObject,"CPBlend"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_bundle"),new objj_ivar("_themes"),new objj_ivar("_loadDelegate")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("_themes"),function(_3,_4){
with(_3){
return _themes;
}
}),new objj_method(sel_getUid("initWithContentsOfURL:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_bundle=objj_msgSend(objj_msgSend(CPBundle,"alloc"),"initWithPath:",_7+"/Info.plist");
}
return _5;
}
}),new objj_method(sel_getUid("loadWithDelegate:"),function(_8,_9,_a){
with(_8){
_loadDelegate=_a;
objj_msgSend(_bundle,"loadWithDelegate:",_8);
}
}),new objj_method(sel_getUid("bundleDidFinishLoading:"),function(_b,_c,_d){
with(_b){
var _e=objj_msgSend(_bundle,"objectForInfoDictionaryKey:","CPBundleReplacedFiles"),_f=0,_10=_e.length,_11=objj_msgSend(_bundle,"bundlePath");
while(_10--){
var _12=_e[_10];
if(objj_msgSend(_12,"pathExtension")==="keyedtheme"){
var _13=objj_msgSend(objj_msgSend(_CPThemeKeyedUnarchiver,"alloc"),"initForReadingWithData:bundle:",objj_msgSend(CPData,"dataWithString:",objj_files[_11+"/"+_12].contents),_bundle);
objj_msgSend(_13,"decodeObjectForKey:","root");
objj_msgSend(_13,"finishDecoding");
}
}
objj_msgSend(_loadDelegate,"blendDidFinishLoading:",_b);
}
})]);
var _14=nil,_15=nil,_16=Nil,_17=Nil;
var _1=objj_allocateClassPair(CPObject,"CPTheme"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_name"),new objj_ivar("_activeClass"),new objj_ivar("_classTable")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithName:"),function(_18,_19,_1a){
with(_18){
_18=objj_msgSendSuper({receiver:_18,super_class:objj_getClass("CPObject")},"init");
if(_18){
_name=_1a;
_classTable={};
_classTable[objj_msgSend(objj_msgSend(_18,"class"),"className")]={};
_14[_name]=_1a;
}
return _18;
}
}),new objj_method(sel_getUid("name"),function(_1b,_1c){
with(_1b){
return _name;
}
}),new objj_method(sel_getUid("setActiveClass:"),function(_1d,_1e,_1f){
with(_1d){
_activeClass=_1f;
}
}),new objj_method(sel_getUid("activeClass"),function(_20,_21){
with(_20){
return _activeClass;
}
}),new objj_method(sel_getUid("valueForAttributeName:inClass:"),function(_22,_23,_24,_25){
with(_22){
if(!_25){
return nil;
}
var _26=objj_msgSend(_25,"className"),_27=_classTable[_26];
if(!_27){
return nil;
}
var _28=_27[_24];
if(!_28){
return nil;
}
return _28;
}
}),new objj_method(sel_getUid("takeThemeFromObject:"),function(_29,_2a,_2b){
with(_29){
var _2c=objj_msgSend(_2b,"_themedAttributes"),_2d=nil,_2e=objj_msgSend(_2c,"keyEnumerator"),_2f=objj_msgSend(_2b,"class");
while(_2d=objj_msgSend(_2e,"nextObject")){
objj_msgSend(_29,"addValue:forAttributeName:inClass:",objj_msgSend(_2c,"objectForKey:",_2d),_2d,_2f);
}
}
}),new objj_method(sel_getUid("setDefaultValue:forAttributeName:"),function(_30,_31,_32,_33){
with(_30){
objj_msgSend(_30,"addValue:forAttributeName:inClass:",_32,_33,objj_msgSend(_30,"class"));
}
}),new objj_method(sel_getUid("addValue:forAttributeName:inClass:"),function(_34,_35,_36,_37,_38){
with(_34){
if(!_36){
return;
}
var _39=objj_msgSend(_38,"className"),_3a=_classTable[_39];
if(!_3a){
var _3b=[];
while(!_3a&&(_38!==_16)&&(_38!==_17)){
_3b.push(_39);
_38=objj_msgSend(_38,"superclass");
_39=objj_msgSend(_38,"className");
_3a=_classTable[_39];
}
if(!_3a){
_3a=_classTable[objj_msgSend(objj_msgSend(_34,"class"),"className")];
}
var _3c=objj_msgSend(_3b,"count");
while(_3c--){
_39=_3b[_3c];
_classTable[_39]={};
_classTable[_39].prototype=_3a;
_3a=_classTable[_39];
}
}
var _3d=_3a[_37];
if(_3d){
_3a[_37]=objj_msgSend(_3d,"themedAttributeMergedWithThemedAttribute:",_36);
}else{
_3a[_37]=_36;
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("initialize"),function(_3e,_3f){
with(_3e){
if(_3e!==objj_msgSend(CPTheme,"class")){
return;
}
_14={};
_16=objj_msgSend(CPView,"class");
_17=objj_msgSend(CPWindow,"class");
var _40=objj_msgSend(CPBundle,"bundleForClass:",_3e);
defaultThemePath=objj_msgSend(_40,"objectForInfoDictionaryKey:","Default Themes Path"),defaultThemeName=objj_msgSend(_40,"objectForInfoDictionaryKey:","Default Theme Name");
if(!defaultThemePath){
return;
}
defaultThemePath=objj_msgSend(_40,"pathForResource:",defaultThemePath);
var _41=objj_files[defaultThemePath+"/Info.plist"];
if(!_41){
return;
}
var _42=CPPropertyListCreateFromData(objj_msgSend(CPData,"dataWithString:",objj_files[defaultThemePath+"/Info.plist"].contents));
themes=objj_msgSend(_42,"objectForKey:","CPBundleReplacedFiles"),themeIndex=0,themeCount=objj_msgSend(themes,"count");
for(;themeIndex<themeCount;++themeIndex){
var _43=objj_msgSend(objj_msgSend(_CPThemeKeyedUnarchiver,"alloc"),"initForReadingWithData:bundle:",objj_msgSend(CPData,"dataWithString:",objj_files[defaultThemePath+"/"+themes[themeIndex]].contents),_41.bundle);
objj_msgSend(_43,"decodeObjectForKey:","root");
objj_msgSend(_43,"finishDecoding");
}
objj_msgSend(_3e,"setDefaultTheme:",objj_msgSend(CPTheme,"themeNamed:",defaultThemeName));
}
}),new objj_method(sel_getUid("setDefaultTheme:"),function(_44,_45,_46){
with(_44){
_15=_46;
}
}),new objj_method(sel_getUid("defaultTheme"),function(_47,_48){
with(_47){
return _15;
}
}),new objj_method(sel_getUid("themeNamed:"),function(_49,_4a,_4b){
with(_49){
return _14[_4b];
}
}),new objj_method(sel_getUid("loadThemesAtURL:delegate:"),function(_4c,_4d,_4e,_4f){
with(_4c){
}
})]);
var _50="CPThemeNameKey",_51="CPThemeClassNamesArrayKey";
var _1=objj_getClass("CPTheme");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTheme\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_52,_53,_54){
with(_52){
_52=objj_msgSendSuper({receiver:_52,super_class:objj_getClass("CPObject")},"init");
_name=objj_msgSend(_54,"decodeObjectForKey:",_50);
_classTable={};
_14[_name]=_52;
if(_52){
var _55=objj_msgSend(_54,"decodeObjectForKey:",_51),_56=_55.length;
while(_56--){
var _57=_55[_56],_58=objj_getClass(_57),_59=objj_msgSend(_54,"decodeObjectForKey:",_57),_5a=objj_msgSend(_59,"allKeys"),_5b=_5a.length;
while(_5b--){
var key=_5a[_5b];
objj_msgSend(_52,"addValue:forAttributeName:inClass:",objj_msgSend(_59,"objectForKey:",key),key,_58);
}
}
}
return _52;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_5d,_5e,_5f){
with(_5d){
var _60=[];
for(var _61 in _classTable){
if(_classTable.hasOwnProperty(_61)){
var _62=_classTable[_61],_63=objj_msgSend(CPDictionary,"dictionary");
for(var key in _62){
if(key!=="prototype"&&_62.hasOwnProperty(key)){
objj_msgSend(_63,"setObject:forKey:",_62[key],key);
}
}
objj_msgSend(_5f,"encodeObject:forKey:",_63,_61);
_60.push(_61);
}
}
objj_msgSend(_5f,"encodeObject:forKey:",_name,_50);
objj_msgSend(_5f,"encodeObject:forKey:",_60,_51);
}
})]);
var _1=objj_allocateClassPair(CPKeyedUnarchiver,"_CPThemeKeyedUnarchiver"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_bundle")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initForReadingWithData:bundle:"),function(_65,_66,_67,_68){
with(_65){
_65=objj_msgSendSuper({receiver:_65,super_class:objj_getClass("CPKeyedUnarchiver")},"initForReadingWithData:",_67);
if(_65){
_bundle=_68;
}
return _65;
}
}),new objj_method(sel_getUid("bundle"),function(_69,_6a){
with(_69){
return _bundle;
}
}),new objj_method(sel_getUid("awakenCustomResources"),function(_6b,_6c){
with(_6b){
return YES;
}
})]);
