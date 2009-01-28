@STATIC;1.0;p;17;_CPCibConnector.jI;21;Foundation/CPObject.jI;29;Foundation/CPKeyValueCoding.jc;2953;
var _1="_CPCibConnectorSourceKey",_2="_CPCibConnectorDestinationKey",_3="_CPCibConnectorLabelKey";
var _4=objj_allocateClassPair(CPObject,"_CPCibConnector"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_source"),new objj_ivar("_destination"),new objj_ivar("_label")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("replaceObject:withObject:"),function(_6,_7,_8,_9){
with(_6){
if(_source==_8){
_source=_9;
}else{
if(_destination==_8){
_destination=_9;
}
}
}
})]);
var _4=objj_getClass("_CPCibConnector");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPCibConnector\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_a,_b,_c){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPObject")},"init");
if(_a){
_source=objj_msgSend(_c,"decodeObjectForKey:",_1);
_destination=objj_msgSend(_c,"decodeObjectForKey:",_2);
_label=objj_msgSend(_c,"decodeObjectForKey:",_3);
}
return _a;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_d,_e,_f){
with(_d){
objj_msgSend(_f,"encodeObject:forKey:",_source,_1);
objj_msgSend(_f,"encodeObject:forKey:",_destination,_2);
objj_msgSend(_f,"encodeObject:forKey:",_label,_3);
}
})]);
var _4=objj_allocateClassPair(_CPCibConnector,"_CPCibControlConnector"),_5=_4.isa;
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("establishConnection"),function(_10,_11){
with(_10){
var _12=_label;
if(!objj_msgSend(_12,"hasSuffix:",":")){
_12+=":";
}
var _13=CPSelectorFromString(_12);
if(!_13){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"-["+objj_msgSend(_10,"className")+" "+_11+"] selector "+_12+" does not exist.");
}
if(objj_msgSend(_source,"respondsToSelector:",sel_getUid("setAction:"))){
objj_msgSend(_source,sel_getUid("setAction:"),_13);
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"-["+objj_msgSend(_10,"className")+" "+_11+"] "+objj_msgSend(_source,"description")+" does not respond to setAction:");
}
if(objj_msgSend(_source,"respondsToSelector:",sel_getUid("setTarget:"))){
objj_msgSend(_source,sel_getUid("setTarget:"),_destination);
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"-["+objj_msgSend(_10,"className")+" "+_11+"] "+objj_msgSend(_source,"description")+" does not respond to setTarget:");
}
}
})]);
var _4=objj_allocateClassPair(_CPCibConnector,"_CPCibOutletConnector"),_5=_4.isa;
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("establishConnection"),function(_14,_15){
with(_14){
objj_msgSend(_source,"setValue:forKey:",_destination,_label);
}
})]);
p;20;_CPCibCustomObject.jI;21;Foundation/CPObject.jc;1105;
var _1="_CPCibCustomObjectClassName";
var _2=objj_allocateClassPair(CPObject,"_CPCibCustomObject"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_className")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var _2=objj_getClass("_CPCibCustomObject");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPCibCustomObject\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_className=objj_msgSend(_6,"decodeObjectForKey:",_1);
}
return _4;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7,_8,_9){
with(_7){
objj_msgSend(_9,"encodeObject:forKey:",_className,_1);
}
}),new objj_method(sel_getUid("_cibInstantiate"),function(_a,_b){
with(_a){
var _c=CPClassFromString(_className);
if(!_c){
CPLog("Unknown class \""+_className+"\" in cib file");
}
return objj_msgSend(objj_msgSend(_c,"alloc"),"init");
}
})]);
p;18;_CPCibCustomView.ji;8;CPView.jc;1926;
var _1=objj_allocateClassPair(CPView,"_CPCibCustomView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_className")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
var _3="_CPCibCustomViewClassNameKey";
var _1=objj_getClass("_CPCibCustomView");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPCibCustomView\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPView")},"initWithCoder:",_6);
if(_4){
_className=objj_msgSend(_6,"decodeObjectForKey:",_3);
}
return _4;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7,_8,_9){
with(_7){
objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPView")},"encodeWithCoder:",_9);
objj_msgSend(_9,"encodeObject:forKey:",_className,_3);
}
}),new objj_method(sel_getUid("_cibInstantiate"),function(_a,_b){
with(_a){
var _c=CPClassFromString(_className);
if(!_c){
CPLog("Unknown class \""+_className+"\" in cib file, using CPView instead.");
_c=objj_msgSend(CPView,"class");
}
var _d=objj_msgSend(objj_msgSend(_c,"alloc"),"initWithFrame:",objj_msgSend(_a,"frame"));
if(_d){
objj_msgSend(_d,"setBounds:",objj_msgSend(_a,"bounds"));
var _e=objj_msgSend(objj_msgSend(_a,"subviews"),"copy"),_f=0,_10=_e.length;
for(;_f<_10;++_f){
objj_msgSend(_d,"addSubview:",_e[_f]);
}
objj_msgSend(_d,"setAutoresizingMask:",objj_msgSend(_a,"autoresizingMask"));
objj_msgSend(_d,"setAutoresizesSubviews:",objj_msgSend(_a,"autoresizesSubviews"));
objj_msgSend(_d,"setHitTests:",objj_msgSend(_a,"hitTests"));
objj_msgSend(_d,"setHidden:",objj_msgSend(_a,"isHidden"));
objj_msgSend(_d,"setAlphaValue:",objj_msgSend(_a,"alphaValue"));
objj_msgSend(_d,"setBackgroundColor:",objj_msgSend(_a,"backgroundColor"));
}
return _d;
}
})]);
p;23;_CPCibKeyedUnarchiver.jI;30;Foundation/CPKeyedUnarchiver.jc;916;
var _1=objj_allocateClassPair(CPKeyedUnarchiver,"_CPCibKeyedUnarchiver"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initForReadingWithData:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPKeyedUnarchiver")},"initForReadingWithData:",_5);
if(_3){
objj_msgSend(_3,"setDelegate:",_3);
}
return _3;
}
}),new objj_method(sel_getUid("unarchiver:didDecodeObject:"),function(_6,_7,_8,_9){
with(_6){
if(objj_msgSend(_9,"respondsToSelector:",sel_getUid("_cibInstantiate"))){
return objj_msgSend(_9,"_cibInstantiate");
}
return _9;
}
}),new objj_method(sel_getUid("replaceObjectAtUID:withObject:"),function(_a,_b,_c,_d){
with(_a){
_objects[_c]=_d;
}
}),new objj_method(sel_getUid("objectAtUID:"),function(_e,_f,_10){
with(_e){
return _objects[_10];
}
})]);
p;15;_CPCibLoading.jI;21;Foundation/CPBundle.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPString.jc;1358;
var _1="CPCibOwner";
var _2=objj_getClass("CPObject");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPObject\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("awakeFromCib"),function(_4,_5){
with(_4){
}
})]);
var _2=objj_getClass("CPBundle");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPBundle\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("loadCibFile:externalNameTable:"),function(_6,_7,_8,_9){
with(_6){
return objj_msgSend(objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithContentsOfFile:",_8),"instantiateCibWithExternalNameTable:",_9);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("loadCibFile:externalNameTable:"),function(_a,_b,_c,_d){
with(_a){
return objj_msgSend(objj_msgSend(objj_msgSend(CPCib,"alloc"),"initWithContentsOfFile:",_c),"instantiateCibWithExternalNameTable:",_d);
}
}),new objj_method(sel_getUid("loadCibNamed:owner:"),function(_e,_f,_10,_11){
with(_e){
var _12=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_11,"class"));
var _13=objj_msgSend(_12,"pathForResource:",_10);
return objj_msgSend(CPBundle,"loadCibFile:externalNameTable:",aPath,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_11,_1));
}
})]);
p;18;_CPCibObjectData.jI;20;Foundation/CPArray.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;7;CPCib.ji;17;_CPCibConnector.jc;4091;
var _1=objj_allocateClassPair(CPObject,"_CPCibObjectData"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_namesKeys"),new objj_ivar("_namesValues"),new objj_ivar("_accessibilityConnectors"),new objj_ivar("_accessibilityOidsKeys"),new objj_ivar("_accessibilityOidsValues"),new objj_ivar("_classesKeys"),new objj_ivar("_classesValues"),new objj_ivar("_connections"),new objj_ivar("_fontManager"),new objj_ivar("_framework"),new objj_ivar("_nextOid"),new objj_ivar("_objectsKeys"),new objj_ivar("_objectsValues"),new objj_ivar("_oidKeys"),new objj_ivar("_oidValues"),new objj_ivar("_fileOwner"),new objj_ivar("_visibleWindows")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("topLevelObjects"),function(_3,_4){
with(_3){
var _5=objj_msgSend(_objectsValues,"count"),_6=[];
while(_5--){
var _7=_objectsValues[_5];
if(_7==_fileOwner){
var _8=_objectsKeys[_5];
if(_8!=_fileOwner){
_6.push(_8);
}
}
}
return _6;
}
}),new objj_method(sel_getUid("mainMenu"),function(_9,_a){
with(_9){
var _b=objj_msgSend(_namesValues,"indexOfObjectIdenticalTo:","MainMenu");
if(_b===CPNotFound){
return nil;
}
return _namesKeys[_b];
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
}
}),new objj_method(sel_getUid("establishConnectionsWithExternalNameTable:"),function(_23,_24,_25){
with(_23){
var _26=0,_27=_connections.length,_28=objj_msgSend(_25,"objectForKey:",CPCibOwner);
for(;_26<_27;++_26){
var _29=_connections[_26];
objj_msgSend(_29,"replaceObject:withObject:",_fileOwner,_28);
objj_msgSend(_29,"establishConnection");
}
}
})]);
p;22;_CPCibWindowTemplate.jI;21;Foundation/CPObject.jc;2788;
var _1="_CPCibWindowTemplateMinSizeKey",_2="_CPCibWindowTemplateMaxSizeKey",_3="_CPCibWindowTemplateViewClassKey",_4="_CPCibWindowTemplateWindowClassKey",_5="_CPCibWindowTemplateWindowRectKey",_6="_CPCibWindowTempatStyleMaskKey",_7="_CPCibWindowTemplateWindowTitleKey",_8="_CPCibWindowTemplateWindowViewKey";
var _9=objj_allocateClassPair(CPObject,"_CPCibWindowTemplate"),_a=_9.isa;
class_addIvars(_9,[new objj_ivar("_minSize"),new objj_ivar("_maxSize"),new objj_ivar("_viewClass"),new objj_ivar("_windowClass"),new objj_ivar("_windowRect"),new objj_ivar("_windowStyleMask"),new objj_ivar("_windowTitle"),new objj_ivar("_windowView")]);
objj_registerClassPair(_9);
objj_addClassForBundle(_9,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_9,[new objj_method(sel_getUid("initWithCoder:"),function(_b,_c,_d){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPObject")},"init");
if(_b){
if(objj_msgSend(_d,"containsValueForKey:",_1)){
_minSize=objj_msgSend(_d,"decodeSizeForKey:",_1);
}
if(objj_msgSend(_d,"containsValueForKey:",_2)){
_maxSize=objj_msgSend(_d,"decodeSizeForKey:",_2);
}
_viewClass=objj_msgSend(_d,"decodeObjectForKey:",_3);
_windowClass=objj_msgSend(_d,"decodeObjectForKey:",_4);
_windowRect=objj_msgSend(_d,"decodeRectForKey:",_5);
_windowStyleMask=objj_msgSend(_d,"decodeIntForKey:",_6);
_windowTitle=objj_msgSend(_d,"decodeObjectForKey:",_7);
_windowView=objj_msgSend(_d,"decodeObjectForKey:",_8);
}
return _b;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_e,_f,_10){
with(_e){
if(_minSize){
objj_msgSend(_10,"encodeSize:forKey:",_minSize,_1);
}
if(_maxSize){
objj_msgSend(_10,"encodeSize:forKey:",_maxSize,_2);
}
objj_msgSend(_10,"encodeObject:forKey:",_viewClass,_3);
objj_msgSend(_10,"encodeObject:forKey:",_windowClass,_4);
objj_msgSend(_10,"encodeRect:forKey:",_windowRect,_5);
objj_msgSend(_10,"encodeInt:forKey:",_windowStyleMask,_6);
objj_msgSend(_10,"encodeObject:forKey:",_windowTitle,_7);
objj_msgSend(_10,"encodeObject:forKey:",_windowView,_8);
}
}),new objj_method(sel_getUid("_cibInstantiate"),function(_11,_12){
with(_11){
var _13=CPClassFromString(_windowClass);
var _14=objj_msgSend(objj_msgSend(_13,"alloc"),"initWithContentRect:styleMask:",_windowRect,_windowStyleMask);
if(_minSize){
objj_msgSend(_14,"setMinSize:",_minSize);
}
if(_maxSize){
objj_msgSend(_14,"setMaxSize:",_maxSize);
}
objj_msgSend(_14,"setLevel:",CPFloatingWindowLevel);
objj_msgSend(_14,"setTitle:",_windowTitle);
objj_msgSend(_windowView,"setAutoresizesSubviews:",NO);
objj_msgSend(_14,"setContentView:",_windowView);
objj_msgSend(_windowView,"setAutoresizesSubviews:",YES);
if(objj_msgSend(_viewClass,"isKindOfClass:",objj_msgSend(CPToolbar,"class"))){
objj_msgSend(_14,"setToolbar:",_viewClass);
}
return _14;
}
})]);
p;22;_CPImageAndTitleView.jI;21;Foundation/CPString.ji;9;CPColor.ji;8;CPFont.ji;9;CPImage.ji;13;CPTextField.ji;8;CPView.jc;7503;
var _1=objj_allocateClassPair(CPView,"_CPImageAndTitleView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_alignment"),new objj_ivar("_textColor"),new objj_ivar("_font"),new objj_ivar("_imagePosition"),new objj_ivar("_imageScaling"),new objj_ivar("_image"),new objj_ivar("_title"),new objj_ivar("_titleSize"),new objj_ivar("_DOMImageElement"),new objj_ivar("_titleField")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPView")},"initWithFrame:",_5);
if(_3){
_alignment=CPCenterTextAlignment;
_textColor=nil;
_font=objj_msgSend(CPFont,"systemFontOfSize:",12);
_imagePosition=CPNoImage;
_imageScaling=CPScaleNone;
_titleSize=CGSizeMakeZero();
}
return _3;
}
}),new objj_method(sel_getUid("setAlignment:"),function(_6,_7,_8){
with(_6){
_alignment=_8;
objj_msgSend(_titleField,"setAlignment:",_8);
}
}),new objj_method(sel_getUid("alignment"),function(_9,_a){
with(_9){
return _alignment;
}
}),new objj_method(sel_getUid("setImagePosition:"),function(_b,_c,_d){
with(_b){
if(_imagePosition==_d){
return;
}
_imagePosition=_d;
if(_imagePosition==CPImageOnly){
objj_msgSend(_titleField,"setHidden:",YES);
}else{
objj_msgSend(_titleField,"setHidden:",NO);
}
objj_msgSend(_b,"tile");
}
}),new objj_method(sel_getUid("imagePosition"),function(_e,_f){
with(_e){
return _imagePosition;
}
}),new objj_method(sel_getUid("setImageScaling:"),function(_10,_11,_12){
with(_10){
if(_imageScaling==_12){
return;
}
_imageScaling=_12;
objj_msgSend(_10,"tile");
}
}),new objj_method(sel_getUid("imageScaling"),function(_13,_14){
with(_13){
return _imageScaling;
}
}),new objj_method(sel_getUid("setTextAlignment:"),function(_15,_16,_17){
with(_15){
if(_alignment==_17){
return;
}
_alignment=_17;
objj_msgSend(_titleField,"setTextAlignment:",_17);
}
}),new objj_method(sel_getUid("textAlignment"),function(_18,_19){
with(_18){
return _alignment;
}
}),new objj_method(sel_getUid("setTextColor:"),function(_1a,_1b,_1c){
with(_1a){
if(_textColor==_1c){
return;
}
_textColor=_1c;
objj_msgSend(_titleField,"setTextColor:",_1c);
}
}),new objj_method(sel_getUid("textColor"),function(_1d,_1e){
with(_1d){
return _textColor;
}
}),new objj_method(sel_getUid("setFont:"),function(_1f,_20,_21){
with(_1f){
if(_font==_21){
return;
}
_font=_21;
objj_msgSend(_titleField,"setFont:",_21);
objj_msgSend(_1f,"updateTitleSize");
objj_msgSend(_1f,"tile");
}
}),new objj_method(sel_getUid("font"),function(_22,_23){
with(_22){
return _font;
}
}),new objj_method(sel_getUid("setImage:"),function(_24,_25,_26){
with(_24){
if(_image==_26){
return;
}
var _27=objj_msgSend(_image,"size"),_28=objj_msgSend(_26,"size");
_image=_26;
if(_26){
if(!_DOMImageElement){
_DOMImageElement=document.createElement("img");
_DOMImageElement.style.top="0px";
_DOMImageElement.style.left="0px";
_DOMImageElement.style.position="absolute";
_DOMImageElement.style.zIndex=100;
_DOMElement.appendChild(_DOMImageElement);
}
_DOMImageElement.src=objj_msgSend(_image,"filename");
if(_27&&CGSizeEqualToSize(_28,_27)){
return;
}
_DOMImageElement.width=_28.width;
_DOMImageElement.height=_28.height;
_DOMImageElement.style.width=_28.width+"px";
_DOMImageElement.style.height=_28.height+"px";
}else{
_DOMElement.removeChild(_DOMImageElement);
_DOMImageElement=NULL;
}
objj_msgSend(_24,"tile");
}
}),new objj_method(sel_getUid("image"),function(_29,_2a){
with(_29){
return _image;
}
}),new objj_method(sel_getUid("setTitle:"),function(_2b,_2c,_2d){
with(_2b){
if(_title==_2d){
return;
}
_title=_2d;
if(objj_msgSend(_title,"length")){
if(!_titleField){
_titleField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_titleField,"setEditable:",NO);
objj_msgSend(_titleField,"setFont:",_font);
objj_msgSend(_titleField,"setAlignment:",_alignment);
objj_msgSend(_titleField,"setTextColor:",_textColor);
objj_msgSend(_titleField,"setHidden:",_imagePosition==CPImageOnly);
objj_msgSend(_titleField,"setHitTests:",NO);
objj_msgSend(_2b,"addSubview:",_titleField);
}
objj_msgSend(_titleField,"setStringValue:",_title);
objj_msgSend(_2b,"updateTitleSize");
}else{
objj_msgSend(_titleField,"removeFromSuperview");
_titleField=nil;
}
objj_msgSend(_2b,"tile");
}
}),new objj_method(sel_getUid("title"),function(_2e,_2f){
with(_2e){
return _title;
}
}),new objj_method(sel_getUid("updateTitleSize"),function(_30,_31){
with(_30){
if(!_titleField){
return;
}
var _32=_titleSize;
objj_msgSend(_titleField,"sizeToFit");
_titleSize=CGSizeMakeCopy(objj_msgSend(_titleField,"frame").size);
objj_msgSend(_titleField,"setFrameSize:",_32);
}
}),new objj_method(sel_getUid("tile"),function(_33,_34){
with(_33){
var _35=objj_msgSend(_33,"bounds").size,_36=_35.width/2,_37=_35.height/2,_38=_titleField?_titleSize.height:0,_39=CGRectMake(0,_37-_38/2,_35.width,_38);
if(_imagePosition!=CPNoImage&&_image){
var _3a=objj_msgSend(_image,"size"),_3b=_3a.width,_3c=_3a.height;
if(_imageScaling==CPScaleToFit){
_3b=_35.width;
_3c=_35.height;
}else{
if(_imageScaling==CPScaleProportionally){
var _3d=MIN(MIN(_35.width,_3b)/_3b,MIN(_35.height,_3c)/_3c);
_3b*=_3d;
_3c*=_3d;
}
}
_DOMImageElement.width=_3b;
_DOMImageElement.height=_3c;
_DOMImageElement.style.width=_3b+"px";
_DOMImageElement.style.height=_3c+"px";
if(_imagePosition==CPImageBelow){
_DOMImageElement.style.left=FLOOR(_36-_3b/2)+"px";
_DOMImageElement.style.top=FLOOR(_35.height-_3c)+"px";
_39.origin.y=(_35.height-_3c-_38)/2;
}else{
if(_imagePosition==CPImageAbove){
if(!_DOMImageElement.CPDOMDisplayContext){
_DOMImageElement.CPDOMDisplayContext=[];
}
var _3e=_DOMImageElement.CPDOMDisplayContext[0];
if(!(_3e>=0)){
_3e=_DOMImageElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_3e]=0;
CPDOMDisplayServerInstructions[_3e+1]=_DOMImageElement;
CPDOMDisplayServerInstructions[_3e+2]=NULL;
CPDOMDisplayServerInstructions[_3e+3]=FLOOR(_36-_3b/2);
CPDOMDisplayServerInstructions[_3e+4]=0;
_39.origin.y=_3c+(_35.height-_3c-_38)/2;
}else{
if(_imagePosition==CPImageLeft){
_DOMImageElement.style.top=FLOOR(_37-_3c/2)+"px";
_DOMImageElement.style.left="0px";
_39.origin.x+=_3b;
_39.size.width-=_3b;
}else{
if(_imagePosition==CPImageRight){
_DOMImageElement.style.top=FLOOR(_37-_3c/2)+"px";
_DOMImageElement.style.left=FLOOR(_35.width-_3b)+"px";
_39.size.width-=_3b;
}else{
if(_imagePosition==CPImageOnly){
_DOMImageElement.style.top=FLOOR(_37-_3c/2)+"px";
_DOMImageElement.style.left=FLOOR(_36-_3b/2)+"px";
}
}
}
}
}
}
objj_msgSend(_titleField,"setFrame:",_39);
}
}),new objj_method(sel_getUid("sizeToFit"),function(_3f,_40){
with(_3f){
var _41=CGSizeMakeZero();
if(_imagePosition!=CPNoImage&&_image){
var _42=objj_msgSend(_image,"size");
_41.width+=_42.width;
_41.height+=_42.height;
}
if(_imagePosition!=CPImageOnly&&objj_msgSend(_title,"length")){
if(_imagePosition==CPImageLeft||_imagePosition==CPImageRight){
_41.width+=_titleSize.width;
_41.height=MAX(_41.height,_titleSize.height);
}else{
if(_imagePosition==CPImageAbove||_imagePosition==CPImageBelow){
_41.width=MAX(_41.width,_titleSize.width);
_41.height+=_titleSize.height;
}else{
_41.width=MAX(_41.width,_titleSize.width);
_41.height=MAX(_41.height,_titleSize.height);
}
}
}
objj_msgSend(_3f,"setFrameSize:",_41);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_43,_44,_45){
with(_43){
objj_msgSend(_43,"tile");
}
})]);
p;15;_CPWindowView.ji;8;CPView.ji;13;CPImageView.jc;8920;
var _1=nil;
var _2=objj_allocateClassPair(CPView,"_CPWindowView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_styleMask"),new objj_ivar("_resizeIndicator"),new objj_ivar("_resizeIndicatorOffset"),new objj_ivar("_title")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:forStyleMask:"),function(_4,_5,_6,_7){
with(_4){
if(_7&CPHUDBackgroundWindowMask){
_4=objj_msgSend(_CPHUDWindowView,"alloc");
}
_4._styleMask=_7;
return objj_msgSend(_4,"initWithFrame:",_6);
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPView")},"initWithFrame:",_a);
if(_8){
_resizeIndicatorOffset=CGSizeMake(0,0);
objj_msgSend(_8,"setShowsResizeIndicator:",!(_styleMask&CPBorderlessBridgeWindowMask)&&(_styleMask&CPResizableWindowMask));
}
return _8;
}
}),new objj_method(sel_getUid("setTitle:"),function(_b,_c,_d){
with(_b){
}
}),new objj_method(sel_getUid("title"),function(_e,_f){
with(_e){
return nil;
}
}),new objj_method(sel_getUid("acceptsFirstMouse:"),function(_10,_11,_12){
with(_10){
return YES;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_13,_14,_15){
with(_13){
var _16=objj_msgSend(_13,"window");
if((_styleMask&CPResizableWindowMask)&&_resizeIndicator){
var _17=objj_msgSend(_resizeIndicator,"frame");
if(CGRectContainsPoint(_17,objj_msgSend(_13,"convertPoint:fromView:",objj_msgSend(_15,"locationInWindow"),nil))){
return objj_msgSend(_16,"trackResizeWithEvent:",_15);
}
}
if(objj_msgSend(_16,"isMovableByWindowBackground")){
objj_msgSend(_16,"trackMoveWithEvent:",_15);
}else{
objj_msgSendSuper({receiver:_13,super_class:objj_getClass("CPView")},"mouseDown:",_15);
}
}
}),new objj_method(sel_getUid("setShowsResizeIndicator:"),function(_18,_19,_1a){
with(_18){
if(_1a){
var _1b=objj_msgSend(_1,"size"),_1c=objj_msgSend(_18,"frame").size;
_resizeIndicator=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(_1c.width-_1b.width-_resizeIndicatorOffset.width,_1c.height-_1b.height-_resizeIndicatorOffset.height,_1b.width,_1b.height));
objj_msgSend(_resizeIndicator,"setImage:",_1);
objj_msgSend(_resizeIndicator,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin);
objj_msgSend(_18,"addSubview:positioned:relativeTo:",_resizeIndicator,CPWindowAbove,nil);
}else{
objj_msgSend(_resizeIndicator,"removeFromSuperview");
_resizeIndicator=nil;
}
}
}),new objj_method(sel_getUid("showsResizeIndicator"),function(_1d,_1e){
with(_1d){
return _resizeIndicator!=nil;
}
}),new objj_method(sel_getUid("setResizeIndicatorOffset:"),function(_1f,_20,_21){
with(_1f){
if(CGSizeEqualToSize(_resizeIndicatorOffset,_21)){
return;
}
_resizeIndicatorOffset=_21;
if(!_resizeIndicator){
return;
}
var _22=objj_msgSend(_resizeIndicator,"frame").size,_23=objj_msgSend(_1f,"frame").size;
objj_msgSend(_resizeIndicator,"setFrameOrigin:",CGPointMake(_23.width-_22.width-_21.width,_23.height-_22.height-_21.height));
}
}),new objj_method(sel_getUid("resizeIndicatorOffset"),function(_24,_25){
with(_24){
return _resizeIndicatorOffset;
}
}),new objj_method(sel_getUid("setTitle:"),function(_26,_27,_28){
with(_26){
_title=_28;
}
}),new objj_method(sel_getUid("title"),function(_29,_2a){
with(_29){
return _title;
}
}),new objj_method(sel_getUid("windowDidChangeDocumentEdited"),function(_2b,_2c){
with(_2b){
}
}),new objj_method(sel_getUid("windowDidChangeDocumentSaving"),function(_2d,_2e){
with(_2d){
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("initialize"),function(_2f,_30){
with(_2f){
if(_2f!=objj_msgSend(_CPWindowView,"class")){
return;
}
_1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",_2f),"pathForResource:","_CPWindowView/_CPWindowViewResizeIndicator.png"),CGSizeMake(12,12));
}
})]);
var _31=nil,_32=nil,_33=nil,_34=nil,_35=nil,_36=nil,_37=nil,_38=nil,_39=nil,_3a=nil,_3b=nil;
var _2=objj_allocateClassPair(_CPWindowView,"_CPHUDWindowView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_titleField"),new objj_ivar("_closeButton")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("hitTest:"),function(_3c,_3d,_3e){
with(_3c){
var _3f=objj_msgSendSuper({receiver:_3c,super_class:objj_getClass("_CPWindowView")},"hitTest:",_3e);
if(_3f==_titleField){
return _3c;
}
return _3f;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_40,_41,_42){
with(_40){
_40=objj_msgSendSuper({receiver:_40,super_class:objj_getClass("_CPWindowView")},"initWithFrame:",_42);
if(_40){
var _43=objj_msgSend(_40,"bounds");
objj_msgSend(_40,"setBackgroundColor:",_3a);
_titleField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMakeZero());
objj_msgSend(_titleField,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",11));
objj_msgSend(_titleField,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_titleField,"setTextShadow:",objj_msgSend(CPShadow,"shadowWithOffset:blurRadius:color:",CPSizeMake(0,1),2,objj_msgSend(CPColor,"blackColor")));
objj_msgSend(_titleField,"setAutoresizingMask:",CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(_40,"addSubview:",_titleField);
if(_styleMask&CPClosableWindowMask){
var _44=objj_msgSend(_CPHUDWindowViewCloseImage,"size");
_closeButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CPRectMake(10,7,_44.width,_44.height));
objj_msgSend(_closeButton,"setBordered:",NO);
objj_msgSend(_closeButton,"setImage:",_CPHUDWindowViewCloseImage);
objj_msgSend(_closeButton,"setAlternateImage:",_CPHUDWindowViewCloseActiveImage);
objj_msgSend(_closeButton,"setTarget:",_40);
objj_msgSend(_closeButton,"setAction:",sel_getUid("close:"));
objj_msgSend(_40,"addSubview:",_closeButton);
}
objj_msgSend(_40,"setResizeIndicatorOffset:",CGSizeMake(8,12));
}
return _40;
}
}),new objj_method(sel_getUid("close:"),function(_45,_46,_47){
with(_45){
objj_msgSend(objj_msgSend(_45,"window"),"performClose:",_45);
}
}),new objj_method(sel_getUid("setTitle:"),function(_48,_49,_4a){
with(_48){
objj_msgSend(_titleField,"setStringValue:",_4a);
objj_msgSend(_titleField,"sizeToFit");
var _4b=objj_msgSend(_titleField,"frame").size;
objj_msgSend(_titleField,"setFrameOrigin:",CPPointMake((CPRectGetWidth(objj_msgSend(_48,"frame"))-_4b.width)/2,(26-_4b.height)/2));
}
}),new objj_method(sel_getUid("title"),function(_4c,_4d){
with(_4c){
return objj_msgSend(_titleField,"stringValue");
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_4e,_4f,_50){
with(_4e){
objj_msgSendSuper({receiver:_4e,super_class:objj_getClass("_CPWindowView")},"setFrameSize:",_50);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("initialize"),function(_51,_52){
with(_51){
if(_51!=objj_msgSend(_CPHUDWindowView,"class")){
return;
}
var _53=objj_msgSend(CPBundle,"bundleForClass:",_51);
_3a=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_53,"pathForResource:","HUDTheme/WindowTopLeft.png"),CPSizeMake(15,86)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_53,"pathForResource:","HUDTheme/WindowTopCenter.png"),CPSizeMake(1,86)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_53,"pathForResource:","HUDTheme/WindowTopRight.png"),CPSizeMake(15,86)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_53,"pathForResource:","HUDTheme/WindowCenterLeft.png"),CPSizeMake(15,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_53,"pathForResource:","HUDTheme/WindowCenter.png"),CPSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_53,"pathForResource:","HUDTheme/WindowCenterRight.png"),CPSizeMake(15,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_53,"pathForResource:","HUDTheme/WindowBottomLeft.png"),CPSizeMake(15,39)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_53,"pathForResource:","HUDTheme/WindowBottomCenter.png"),CPSizeMake(1,39)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_53,"pathForResource:","HUDTheme/WindowBottomRight.png"),CPSizeMake(15,39))]));
_CPHUDWindowViewCloseImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_53,"pathForResource:","HUDTheme/WindowClose.png"),CPSizeMake(20,20));
_CPHUDWindowViewCloseActiveImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_53,"pathForResource:","HUDTheme/WindowCloseActive.png"),CPSizeMake(20,20));
}
})]);
p;8;AppKit.ji;9;CALayer.ji;9;CPAlert.ji;13;CPAnimation.ji;15;CPApplication.ji;10;CPButton.ji;12;CPClipView.ji;18;CPCollectionView.ji;9;CPColor.ji;14;CPColorPanel.ji;13;CPColorWell.ji;17;CPCompatibility.ji;11;CPControl.ji;10;CPCookie.ji;12;CPDocument.ji;22;CPDocumentController.ji;9;CPEvent.ji;14;CPFlashMovie.ji;13;CPFlashView.ji;8;CPFont.ji;15;CPFontManager.ji;12;CPGeometry.ji;9;CPImage.ji;13;CPImageView.ji;8;CPMenu.ji;12;CPMenuItem.ji;9;CPPanel.ji;14;CPPasteboard.ji;15;CPPopUpButton.ji;21;CPProgressIndicator.ji;13;CPResponder.ji;14;CPScrollView.ji;12;CPScroller.ji;19;CPSecureTextField.ji;20;CPSegmentedControl.ji;10;CPShadow.ji;10;CPSlider.ji;13;CPSplitView.ji;11;CPTabView.ji;13;CPTextField.ji;11;CPToolbar.ji;15;CPToolbarItem.ji;8;CPView.ji;11;CPWebView.ji;10;CPWindow.ji;20;CPWindowController.jp;13;CAAnimation.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;23;CAMediaTimingFunction.jc;3763;
var _1=objj_allocateClassPair(CPObject,"CAAnimation"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_isRemovedOnCompletion")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_isRemovedOnCompletion=YES;
}
return _3;
}
}),new objj_method(sel_getUid("shouldArchiveValueForKey:"),function(_5,_6,_7){
with(_5){
return YES;
}
}),new objj_method(sel_getUid("setRemovedOnCompletion:"),function(_8,_9,_a){
with(_8){
_isRemovedOnCompletion=_a;
}
}),new objj_method(sel_getUid("removedOnCompletion"),function(_b,_c){
with(_b){
return _isRemovedOnCompletion;
}
}),new objj_method(sel_getUid("isRemovedOnCompletion"),function(_d,_e){
with(_d){
return _isRemovedOnCompletion;
}
}),new objj_method(sel_getUid("timingFunction"),function(_f,_10){
with(_f){
return nil;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_11,_12,_13){
with(_11){
_delegate=_13;
}
}),new objj_method(sel_getUid("delegate"),function(_14,_15){
with(_14){
return _delegate;
}
}),new objj_method(sel_getUid("runActionForKey:object:arguments:"),function(_16,_17,_18,_19,_1a){
with(_16){
objj_msgSend(_19,"addAnimation:forKey:",_16,_18);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("animation"),function(_1b,_1c){
with(_1b){
return objj_msgSend(objj_msgSend(_1b,"alloc"),"init");
}
}),new objj_method(sel_getUid("defaultValueForKey:"),function(_1d,_1e,_1f){
with(_1d){
return nil;
}
})]);
var _1=objj_allocateClassPair(CAAnimation,"CAPropertyAnimation"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_keyPath"),new objj_ivar("_isCumulative"),new objj_ivar("_isAdditive")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("setKeyPath:"),function(_20,_21,_22){
with(_20){
_keyPath=_22;
}
}),new objj_method(sel_getUid("keyPath"),function(_23,_24){
with(_23){
return _keyPath;
}
}),new objj_method(sel_getUid("setCumulative:"),function(_25,_26,_27){
with(_25){
_isCumulative=_27;
}
}),new objj_method(sel_getUid("cumulative"),function(_28,_29){
with(_28){
return _isCumulative;
}
}),new objj_method(sel_getUid("isCumulative"),function(_2a,_2b){
with(_2a){
return _isCumulative;
}
}),new objj_method(sel_getUid("setAdditive:"),function(_2c,_2d,_2e){
with(_2c){
_isAdditive=_2e;
}
}),new objj_method(sel_getUid("additive"),function(_2f,_30){
with(_2f){
return _isAdditive;
}
}),new objj_method(sel_getUid("isAdditive"),function(_31,_32){
with(_31){
return _isAdditive;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("animationWithKeyPath:"),function(_33,_34,_35){
with(_33){
var _36=objj_msgSend(_33,"animation");
objj_msgSend(_36,"setKeypath:",_35);
return _36;
}
})]);
var _1=objj_allocateClassPair(CAPropertyAnimation,"CABasicAnimation"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_fromValue"),new objj_ivar("_toValue"),new objj_ivar("_byValue")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("setFromValue:"),function(_37,_38,_39){
with(_37){
_fromValue=_39;
}
}),new objj_method(sel_getUid("fromValue"),function(_3a,_3b){
with(_3a){
return _fromValue;
}
}),new objj_method(sel_getUid("setToValue:"),function(_3c,_3d,_3e){
with(_3c){
_toValue=_3e;
}
}),new objj_method(sel_getUid("toValue"),function(_3f,_40){
with(_3f){
return _toValue;
}
}),new objj_method(sel_getUid("setByValue:"),function(_41,_42,_43){
with(_41){
_byValue=_43;
}
}),new objj_method(sel_getUid("byValue"),function(_44,_45){
with(_44){
return _byValue;
}
})]);
p;16;CABackingStore.ji;12;CGGeometry.ji;17;CPCompatibility.jc;599;
CABackingStoreGetContext=function(_1){
return _1.context;
};
if(CPFeatureIsCompatible(CPHTMLCanvasFeature)){
CABackingStoreCreate=function(){
var _2=document.createElement("canvas");
_2.style.position="absolute";
return {context:_2.getContext("2d"),buffer:_2,_image:_2};
};
CABackingStoreSetSize=function(_3,_4){
var _5=_3.buffer;
_5.width=_4.width;
_5.height=_4.height;
_5.style.width=_4.width+"px";
_5.style.height=_4.height+"px";
};
}else{
CABackingStoreCreate=function(){
var _6=CGBitmapGraphicsContextCreate();
_6.buffer="";
return {context:_6};
};
CABackingStoreSetSize=function(_7,_8){
};
}
p;14;CAFlashLayer.ji;9;CALayer.ji;14;CPFlashMovie.jc;803;
var _1=objj_allocateClassPair(CALayer,"CAFlashLayer"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_flashMovie")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("setFlashMovie:"),function(_3,_4,_5){
with(_3){
if(_flashMovie==_5){
return;
}
_flashMovie=_5;
_DOMElement.innerHTML="<object width = \"100%\" height = \"100%\"><param name = \"movie\" value = \""+_5._fileName+"\"></param><param name = \"wmode\" value = \"transparent\"></param><embed src = \""+_5._fileName+"\" type = \"application/x-shockwave-flash\" wmode = \"transparent\" width = \"100%\" height = \"100%\"></embed></object>";
}
}),new objj_method(sel_getUid("flashMovie"),function(_6,_7){
with(_6){
return _flashMovie;
}
})]);
p;9;CALayer.jI;21;Foundation/CPObject.jI;23;AppKit/CABackingStore.jI;18;AppKit/CGContext.jI;19;AppKit/CGGeometry.ji;12;CGGeometry.jc;24770;
CGAffineTransformMake=function(a,b,c,d,tx,ty){
return {a:a,b:b,c:c,d:d,tx:tx,ty:ty};
};
CGAffineTransformMakeIdentity=function(){
return {a:1,b:0,c:0,d:1,tx:0,ty:0};
};
CGAffineTransformMakeCopy=function(_7){
return {a:_7.a,b:_7.b,c:_7.c,d:_7.d,tx:_7.tx,ty:_7.ty};
};
CGAffineTransformMakeScale=function(sx,sy){
return {a:sx,b:0,c:0,d:sy,tx:0,ty:0};
};
CGAffineTransformMakeTranslation=function(tx,ty){
return {a:1,b:0,c:0,d:1,tx:tx,ty:ty};
};
CGAffineTransformTranslate=function(_c,tx,ty){
return {a:_c.a,b:_c.b,c:_c.c,d:_c.d,tx:_c.tx+_c.a*tx+_c.c*ty,ty:_c.ty+_c.b*tx+_c.d*ty};
};
CGAffineTransformScale=function(_f,sx,sy){
return {a:_f.a*sx,b:_f.b*sx,c:_f.c*sy,d:_f.d*sy,tx:_f.tx,ty:_f.ty};
};
CGAffineTransformConcat=function(lhs,rhs){
return {a:lhs.a*rhs.a+lhs.b*rhs.c,b:lhs.a*rhs.b+lhs.b*rhs.d,c:lhs.c*rhs.a+lhs.d*rhs.c,d:lhs.c*rhs.b+lhs.d*rhs.d,tx:lhs.tx*rhs.a+lhs.ty*rhs.c+rhs.tx,ty:lhs.tx*rhs.b+lhs.ty*rhs.d+rhs.ty};
};
CGPointApplyAffineTransform=function(_14,_15){
return {x:_14.x*_15.a+_14.y*_15.c+_15.tx,y:_14.x*_15.b+_14.y*_15.d+_15.ty};
};
CGSizeApplyAffineTransform=function(_16,_17){
return {width:_16.width*_17.a+_16.height*_17.c,height:_16.width*_17.b+_16.height*_17.d};
};
CGAffineTransformIsIdentity=function(_18){
return (_18.a==1&&_18.b==0&&_18.c==0&&_18.d==1&&_18.tx==0&&_18.ty==0);
};
CGAffineTransformEqualToTransform=function(lhs,rhs){
return (lhs.a==rhs.a&&lhs.b==rhs.b&&lhs.c==rhs.c&&lhs.d==rhs.d&&lhs.tx==rhs.tx&&lhs.ty==rhs.ty);
};
CGStringCreateWithCGAffineTransform=function(_1b){
return (" [[ "+_1b.a+", "+_1b.b+", 0 ], [ "+_1b.c+", "+_1b.d+", 0 ], [ "+_1b.tx+", "+_1b.ty+", 1]]");
};
CGAffineTransformCreateCopy=function(_1c){
return {a:_1c.a,b:_1c.b,c:_1c.c,d:_1c.d,tx:_1c.tx,ty:_1c.ty};
};
CGAffineTransformMakeRotation=function(_1d){
var sin=SIN(_1d),cos=COS(_1d);
return {a:cos,b:sin,c:-sin,d:cos,tx:0,ty:0};
};
CGAffineTransformRotate=function(_20,_21){
var sin=SIN(_21),cos=COS(_21);
return {a:_20.a*cos+_20.c*sin,b:_20.b*cos+_20.d*sin,c:_20.c*cos-_20.a*sin,d:_20.d*cos-_20.b*sin,tx:_20.tx,ty:_20.ty};
};
CGAffineTransformInvert=function(_24){
var _25=1/(_24.a*_24.d-_24.b*_24.c);
return {a:_25*_24.d,b:-_25*_24.b,c:-_25*_24.c,d:_25*_24.a,tx:_25*(_24.c*_24.ty-_24.d*_24.tx),ty:_25*(_24.b*_24.tx-_24.a*_24.ty)};
};
CGRectApplyAffineTransform=function(_26,_27){
var top=(_26.origin.y),_29=(_26.origin.x),_2a=(_26.origin.x+_26.size.width),_2b=(_26.origin.y+_26.size.height),_2c=CGPointApplyAffineTransform({x:_29,y:top},_27),_2d=CGPointApplyAffineTransform({x:_2a,y:top},_27),_2e=CGPointApplyAffineTransform({x:_29,y:_2b},_27),_2f=CGPointApplyAffineTransform({x:_2a,y:_2b},_27),_30=MIN(_2c.x,_2d.x,_2e.x,_2f.x),_31=MAX(_2c.x,_2d.x,_2e.x,_2f.x),_32=MIN(_2c.y,_2d.y,_2e.y,_2f.y),_33=MAX(_2c.y,_2d.y,_2e.y,_2f.y);
return {origin:{x:_30,y:_32},size:{width:(_31-_30),height:(_33-_32)}};
};
CPStringFromCGAffineTransform=function(_34){
return "{"+_34.a+", "+_34.b+", "+_34.c+", "+_34.d+", "+_34.tx+", "+_34.ty+"}";
};
var _35=1,_36=2,_37=4,_38=8,_39=16;
var _3a=NO;
var _3b=1,_3c=2,_3d=4,_3e=8,_3f=16,_40=_3d|_3b|_3c;
var _41=nil;
var _42=objj_allocateClassPair(CPObject,"CALayer"),_43=_42.isa;
class_addIvars(_42,[new objj_ivar("_frame"),new objj_ivar("_bounds"),new objj_ivar("_position"),new objj_ivar("_zPosition"),new objj_ivar("_anchorPoint"),new objj_ivar("_affineTransform"),new objj_ivar("_sublayerTransform"),new objj_ivar("_sublayerTransformForSublayers"),new objj_ivar("_backingStoreFrame"),new objj_ivar("_standardBackingStoreFrame"),new objj_ivar("_hasSublayerTransform"),new objj_ivar("_hasCustomBackingStoreFrame"),new objj_ivar("_opacity"),new objj_ivar("_isHidden"),new objj_ivar("_backgroundColor"),new objj_ivar("_superlayer"),new objj_ivar("_sublayers"),new objj_ivar("_runLoopUpdateMask"),new objj_ivar("_needsDisplayOnBoundsChange"),new objj_ivar("_delegate"),new objj_ivar("_delegateRespondsToDisplayLayerSelector"),new objj_ivar("_delegateRespondsToDrawLayerInContextSelector"),new objj_ivar("_DOMElement"),new objj_ivar("_DOMContentsElement"),new objj_ivar("_contents"),new objj_ivar("_context"),new objj_ivar("_owningView"),new objj_ivar("_transformToLayer"),new objj_ivar("_transformFromLayer")]);
objj_registerClassPair(_42);
objj_addClassForBundle(_42,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_42,[new objj_method(sel_getUid("init"),function(_44,_45){
with(_44){
_44=objj_msgSendSuper({receiver:_44,super_class:objj_getClass("CPObject")},"init");
if(_44){
_frame=CGRectMakeZero();
_backingStoreFrame=CGRectMakeZero();
_standardBackingStoreFrame=CGRectMakeZero();
_bounds=CGRectMakeZero();
_position=CGPointMakeZero();
_zPosition=0;
_anchorPoint=CGPointMake(0.5,0.5);
_affineTransform=CGAffineTransformMakeIdentity();
_sublayerTransform=CGAffineTransformMakeIdentity();
_transformToLayer=CGAffineTransformMakeIdentity();
_transformFromLayer=CGAffineTransformMakeIdentity();
_opacity=1;
_isHidden=NO;
_masksToBounds=NO;
_sublayers=[];
_DOMElement=document.createElement("div");
_DOMElement.style.overflow="visible";
_DOMElement.style.position="absolute";
_DOMElement.style.visibility="visible";
_DOMElement.style.top="0px";
_DOMElement.style.left="0px";
_DOMElement.style.zIndex=0;
_DOMElement.style.width="0px";
_DOMElement.style.height="0px";
}
return _44;
}
}),new objj_method(sel_getUid("setBounds:"),function(_46,_47,_48){
with(_46){
if(CGRectEqualToRect(_bounds,_48)){
return;
}
var _49=_bounds.origin;
_bounds={origin:{x:_48.origin.x,y:_48.origin.y},size:{width:_48.size.width,height:_48.size.height}};
if(_hasSublayerTransform){
_CALayerUpdateSublayerTransformForSublayers(_46);
}
_CALayerRecalculateGeometry(_46,_35);
}
}),new objj_method(sel_getUid("bounds"),function(_4a,_4b){
with(_4a){
return _bounds;
}
}),new objj_method(sel_getUid("setPosition:"),function(_4c,_4d,_4e){
with(_4c){
if(CGPointEqualToPoint(_position,_4e)){
return;
}
_position={x:_4e.x,y:_4e.y};
_CALayerRecalculateGeometry(_4c,_36);
}
}),new objj_method(sel_getUid("position"),function(_4f,_50){
with(_4f){
return _position;
}
}),new objj_method(sel_getUid("setZPosition:"),function(_51,_52,_53){
with(_51){
if(_zPosition==_53){
return;
}
_zPosition=_53;
objj_msgSend(_51,"registerRunLoopUpdateWithMask:",_3d);
}
}),new objj_method(sel_getUid("setAnchorPoint:"),function(_54,_55,_56){
with(_54){
_56={x:_56.x,y:_56.y};
_56.x=MIN(1,MAX(0,_56.x));
_56.y=MIN(1,MAX(0,_56.y));
if(CGPointEqualToPoint(_anchorPoint,_56)){
return;
}
_anchorPoint=_56;
if(_hasSublayerTransform){
_CALayerUpdateSublayerTransformForSublayers(_54);
}
if(_owningView){
_position=CGPointMake((_bounds.size.width)*_anchorPoint.x,(_bounds.size.height)*_anchorPoint.y);
}
_CALayerRecalculateGeometry(_54,_37);
}
}),new objj_method(sel_getUid("anchorPoint"),function(_57,_58){
with(_57){
return _anchorPoint;
}
}),new objj_method(sel_getUid("setAffineTransform:"),function(_59,_5a,_5b){
with(_59){
if(CGAffineTransformEqualToTransform(_affineTransform,_5b)){
return;
}
_affineTransform={a:_5b.a,b:_5b.b,c:_5b.c,d:_5b.d,tx:_5b.tx,ty:_5b.ty};
_CALayerRecalculateGeometry(_59,_38);
}
}),new objj_method(sel_getUid("affineTransform"),function(_5c,_5d){
with(_5c){
return _affineTransform;
}
}),new objj_method(sel_getUid("setSublayerTransform:"),function(_5e,_5f,_60){
with(_5e){
if(CGAffineTransformEqualToTransform(_sublayerTransform,_60)){
return;
}
var _61=_hasSublayerTransform;
_sublayerTransform={a:_60.a,b:_60.b,c:_60.c,d:_60.d,tx:_60.tx,ty:_60.ty};
_hasSublayerTransform=!(_sublayerTransform.a==1&&_sublayerTransform.b==0&&_sublayerTransform.c==0&&_sublayerTransform.d==1&&_sublayerTransform.tx==0&&_sublayerTransform.ty==0);
if(_hasSublayerTransform){
_CALayerUpdateSublayerTransformForSublayers(_5e);
var _62=_sublayers.length;
while(_62--){
_CALayerRecalculateGeometry(_sublayers[_62],_39);
}
}
}
}),new objj_method(sel_getUid("sublayerTransform"),function(_63,_64){
with(_63){
return _sublayerTransform;
}
}),new objj_method(sel_getUid("transformToLayer"),function(_65,_66){
with(_65){
return _transformToLayer;
}
}),new objj_method(sel_getUid("setFrame:"),function(_67,_68,_69){
with(_67){
alert("FIXME IMPLEMENT");
}
}),new objj_method(sel_getUid("frame"),function(_6a,_6b){
with(_6a){
if(!_frame){
_frame=objj_msgSend(_6a,"convertRect:toLayer:",_bounds,_superlayer);
}
return _frame;
}
}),new objj_method(sel_getUid("backingStoreFrame"),function(_6c,_6d){
with(_6c){
return _backingStoreFrame;
}
}),new objj_method(sel_getUid("setBackingStoreFrame:"),function(_6e,_6f,_70){
with(_6e){
_hasCustomBackingStoreFrame=(_70!=nil);
if(_70==nil){
_70=CGRectMakeCopy(_standardBackingStoreFrame);
}else{
if(_superlayer){
_70=objj_msgSend(_superlayer,"convertRect:toLayer:",_70,nil);
var _71=objj_msgSend(_superlayer,"bounds"),_72=objj_msgSend(_superlayer,"convertRect:toLayer:",_71,nil);
_70.origin.x-=(_72.origin.x);
_70.origin.y-=(_72.origin.y);
}else{
_70=CGRectMakeCopy(_70);
}
}
if(!CGPointEqualToPoint(_backingStoreFrame.origin,_70.origin)){
objj_msgSend(_6e,"registerRunLoopUpdateWithMask:",_3b);
}
if(!CGSizeEqualToSize(_backingStoreFrame.size,_70.size)){
objj_msgSend(_6e,"registerRunLoopUpdateWithMask:",_3c);
}
_backingStoreFrame=_70;
}
}),new objj_method(sel_getUid("contents"),function(_73,_74){
with(_73){
return _contents;
}
}),new objj_method(sel_getUid("setContents:"),function(_75,_76,_77){
with(_75){
if(_contents==_77){
return;
}
_contents=_77;
objj_msgSend(_75,"composite");
}
}),new objj_method(sel_getUid("composite"),function(_78,_79){
with(_78){
if(_3a&&!_contents||!_context){
return;
}
CGContextClearRect(_context,{origin:{x:0,y:0},size:{width:(_backingStoreFrame.size.width),height:(_backingStoreFrame.size.height)}});
var _7a=_transformFromLayer;
if(_superlayer){
var _7b=_CALayerGetTransform(_superlayer,nil),_7c=CGPointApplyAffineTransform(_superlayer._bounds.origin,_7b);
_7a=CGAffineTransformConcat(_7a,_7b);
_7a.tx-=_7c.x;
_7a.ty-=_7c.y;
}
_7a.tx-=(_backingStoreFrame.origin.x);
_7a.ty-=(_backingStoreFrame.origin.y);
CGContextSaveGState(_context);
CGContextConcatCTM(_context,_7a);
if(_3a){
_context.drawImage(_contents.buffer,(_bounds.origin.x),(_bounds.origin.y));
}else{
objj_msgSend(_78,"drawInContext:",_context);
}
CGContextRestoreGState(_context);
}
}),new objj_method(sel_getUid("display"),function(_7d,_7e){
with(_7d){
if(!_context){
_context=CGBitmapGraphicsContextCreate();
_DOMContentsElement=_context.DOMElement;
_DOMContentsElement.style.zIndex=-100;
_DOMContentsElement.style.overflow="hidden";
_DOMContentsElement.style.position="absolute";
_DOMContentsElement.style.visibility="visible";
_DOMContentsElement.width=ROUND((_backingStoreFrame.size.width));
_DOMContentsElement.height=ROUND((_backingStoreFrame.size.height));
_DOMContentsElement.style.top="0px";
_DOMContentsElement.style.left="0px";
_DOMContentsElement.style.width=ROUND((_backingStoreFrame.size.width))+"px";
_DOMContentsElement.style.height=ROUND((_backingStoreFrame.size.height))+"px";
_DOMElement.appendChild(_DOMContentsElement);
}
if(_3a){
if(_delegateRespondsToDisplayLayerSelector){
return objj_msgSend(_delegate,"displayInLayer:",_7d);
}
if((_backingStoreFrame.size.width)==0||(_backingStoreFrame.size.height)==0){
return;
}
if(!_contents){
_contents=CABackingStoreCreate();
}
CABackingStoreSetSize(_contents,_bounds.size);
objj_msgSend(_7d,"drawInContext:",CABackingStoreGetContext(_contents));
}
objj_msgSend(_7d,"composite");
}
}),new objj_method(sel_getUid("drawInContext:"),function(_7f,_80,_81){
with(_7f){
if(_backgroundColor){
CGContextSetFillColor(_81,_backgroundColor);
CGContextFillRect(_81,_bounds);
}
if(_delegateRespondsToDrawLayerInContextSelector){
objj_msgSend(_delegate,"drawLayer:inContext:",_7f,_81);
}
}
}),new objj_method(sel_getUid("opacity"),function(_82,_83){
with(_82){
return _opacity;
}
}),new objj_method(sel_getUid("setOpacity:"),function(_84,_85,_86){
with(_84){
if(_opacity==_86){
return;
}
_opacity=_86;
_DOMElement.style.opacity=_86;
_DOMElement.style.filter="alpha(opacity="+_86*100+")";
}
}),new objj_method(sel_getUid("setHidden:"),function(_87,_88,_89){
with(_87){
_isHidden=_89;
_DOMElement.style.display=_89?"none":"block";
}
}),new objj_method(sel_getUid("hidden"),function(_8a,_8b){
with(_8a){
return _isHidden;
}
}),new objj_method(sel_getUid("isHidden"),function(_8c,_8d){
with(_8c){
return _isHidden;
}
}),new objj_method(sel_getUid("setMasksToBounds:"),function(_8e,_8f,_90){
with(_8e){
if(_masksToBounds==_90){
return;
}
_masksToBounds=_90;
_DOMElement.style.overflow=_masksToBounds?"hidden":"visible";
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_91,_92,_93){
with(_91){
_backgroundColor=_93;
objj_msgSend(_91,"setNeedsDisplay");
}
}),new objj_method(sel_getUid("backgroundColor"),function(_94,_95){
with(_94){
return _backgroundColor;
}
}),new objj_method(sel_getUid("sublayers"),function(_96,_97){
with(_96){
return _sublayers;
}
}),new objj_method(sel_getUid("superlayer"),function(_98,_99){
with(_98){
return _superlayer;
}
}),new objj_method(sel_getUid("addSublayer:"),function(_9a,_9b,_9c){
with(_9a){
objj_msgSend(_9a,"insertSublayer:atIndex:",_9c,_sublayers.length);
return;
if(_DOMContentsElement&&_9c._zPosition>_DOMContentsElement.style.zIndex){
_DOMContentsElement.style.zIndex-=100;
}
objj_msgSend(_sublayers,"addObject:",_9c);
_DOMElement.appendChild(_9c._DOMElement);
}
}),new objj_method(sel_getUid("removeFromSuperlayer"),function(_9d,_9e){
with(_9d){
if(_owningView){
objj_msgSend(_owningView,"setLayer:",nil);
}
if(!_superlayer){
return;
}
_superlayer._DOMElement.removeChild(_DOMElement);
objj_msgSend(_superlayer._sublayers,"removeObject:",_9d);
_superlayer=nil;
}
}),new objj_method(sel_getUid("insertSublayer:atIndex:"),function(_9f,_a0,_a1,_a2){
with(_9f){
if(!_a1){
return;
}
var _a3=objj_msgSend(_a1,"superlayer");
if(_a3==_9f){
var _a4=objj_msgSend(_sublayers,"indexOfObjectIdenticalTo:",_a1);
if(_a4==_a2){
return;
}
objj_msgSend(_sublayers,"removeObjectAtIndex:",_a4);
if(_a4<_a2){
--_a2;
}
}else{
if(_a3!=nil){
objj_msgSend(_a1,"removeFromSuperlayer");
}
}
if(_DOMContentsElement&&_a1._zPosition>_DOMContentsElement.style.zIndex){
_DOMContentsElement.style.zIndex-=100;
}
objj_msgSend(_sublayers,"insertObject:atIndex:",_a1,_a2);
if(_a2>=_sublayers.length-1){
_DOMElement.appendChild(_a1._DOMElement);
}else{
_DOMElement.insertBefore(_a1._DOMElement,_sublayers[_a2+1]._DOMElement);
}
_a1._superlayer=_9f;
if(_9f!=_a3){
_CALayerRecalculateGeometry(_a1,268435455);
}
}
}),new objj_method(sel_getUid("insertSublayer:below:"),function(_a5,_a6,_a7,_a8){
with(_a5){
var _a9=_a8?objj_msgSend(_sublayers,"indexOfObjectIdenticalTo:",_a8):0;
objj_msgSend(_a5,"insertSublayer:atIndex:",_a7,_a9==CPNotFound?_sublayers.length:_a9);
}
}),new objj_method(sel_getUid("insertSublayer:above:"),function(_aa,_ab,_ac,_ad){
with(_aa){
var _ae=_ad?objj_msgSend(_sublayers,"indexOfObjectIdenticalTo:",_ad):_sublayers.length;
if(_ae==CPNotFound){
objj_msgSend(CPException,"raise:reason:","CALayerNotFoundException","aSublayer is not a sublayer of this layer");
}
objj_msgSend(_sublayers,"insertObject:atIndex:",_ac,_ae==CPNotFound?_sublayers.length:_ae+1);
}
}),new objj_method(sel_getUid("replaceSublayer:with:"),function(_af,_b0,_b1,_b2){
with(_af){
if(_b1==_b2){
return;
}
if(_b1._superlayer!=_af){
alert("EXCEPTION");
return;
}
if(_DOMContentsElement&&_b2._zPosition>_DOMContentsElement.style.zIndex){
_DOMContentsElement.style.zIndex-=100;
}
objj_msgSend(_sublayers,"replaceObjectAtIndex:withObject:",objj_msgSend(_sublayers,"indexOfObjectIdenticalTo:",_b1),_b2);
_DOMElement.replaceChild(_b1._DOMElement,_b2._DOMElement);
}
}),new objj_method(sel_getUid("registerRunLoopUpdateWithMask:"),function(_b3,_b4,_b5){
with(_b3){
if(_41==nil){
_41={};
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("runLoopUpdateLayers"),CALayer,nil,0,[CPDefaultRunLoopMode]);
}
_runLoopUpdateMask|=_b5;
_41[objj_msgSend(_b3,"hash")]=_b3;
}
}),new objj_method(sel_getUid("setNeedsComposite"),function(_b6,_b7){
with(_b6){
objj_msgSend(_b6,"registerRunLoopUpdateWithMask:",_3f);
}
}),new objj_method(sel_getUid("setNeedsDisplay"),function(_b8,_b9){
with(_b8){
objj_msgSend(_b8,"registerRunLoopUpdateWithMask:",_3e);
}
}),new objj_method(sel_getUid("setNeedsDisplayOnBoundsChange:"),function(_ba,_bb,_bc){
with(_ba){
_needsDisplayOnBoundsChange=_bc;
}
}),new objj_method(sel_getUid("needsDisplayOnBoundsChange"),function(_bd,_be){
with(_bd){
return _needsDisplayOnBoundsChange;
}
}),new objj_method(sel_getUid("setNeedsDisplayInRect:"),function(_bf,_c0,_c1){
with(_bf){
_dirtyRect=_c1;
objj_msgSend(_bf,"display");
}
}),new objj_method(sel_getUid("convertPoint:fromLayer:"),function(_c2,_c3,_c4,_c5){
with(_c2){
return CGPointApplyAffineTransform(_c4,_CALayerGetTransform(_c5,_c2));
}
}),new objj_method(sel_getUid("convertPoint:toLayer:"),function(_c6,_c7,_c8,_c9){
with(_c6){
return CGPointApplyAffineTransform(_c8,_CALayerGetTransform(_c6,_c9));
}
}),new objj_method(sel_getUid("convertRect:fromLayer:"),function(_ca,_cb,_cc,_cd){
with(_ca){
return CGRectApplyAffineTransform(_cc,_CALayerGetTransform(_cd,_ca));
}
}),new objj_method(sel_getUid("convertRect:toLayer:"),function(_ce,_cf,_d0,_d1){
with(_ce){
return CGRectApplyAffineTransform(_d0,_CALayerGetTransform(_ce,_d1));
}
}),new objj_method(sel_getUid("containsPoint:"),function(_d2,_d3,_d4){
with(_d2){
return (_d4.x>=(_bounds.origin.x)&&_d4.y>=(_bounds.origin.y)&&_d4.x<(_bounds.origin.x+_bounds.size.width)&&_d4.y<(_bounds.origin.y+_bounds.size.height));
}
}),new objj_method(sel_getUid("hitTest:"),function(_d5,_d6,_d7){
with(_d5){
if(_isHidden){
return nil;
}
var _d8=CGPointApplyAffineTransform(_d7,_transformToLayer);
if(!(_d8.x>=(_bounds.origin.x)&&_d8.y>=(_bounds.origin.y)&&_d8.x<(_bounds.origin.x+_bounds.size.width)&&_d8.y<(_bounds.origin.y+_bounds.size.height))){
return nil;
}
var _d9=nil,_da=_sublayers.length;
while(_da--){
if(_d9=objj_msgSend(_sublayers[_da],"hitTest:",_d8)){
return _d9;
}
}
return _d5;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_db,_dc,_dd){
with(_db){
if(_delegate==_dd){
return;
}
_delegate=_dd;
_delegateRespondsToDisplayLayerSelector=objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("displayLayer:"));
_delegateRespondsToDrawLayerInContextSelector=objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("drawLayer:inContext:"));
if(_delegateRespondsToDisplayLayerSelector||_delegateRespondsToDrawLayerInContextSelector){
objj_msgSend(_db,"setNeedsDisplay");
}
}
}),new objj_method(sel_getUid("delegate"),function(_de,_df){
with(_de){
return _delegate;
}
}),new objj_method(sel_getUid("_setOwningView:"),function(_e0,_e1,_e2){
with(_e0){
_owningView=_e2;
if(_owningView){
_owningView=_e2;
_bounds.size=CGSizeMakeCopy(objj_msgSend(_owningView,"bounds").size);
_position=CGPointMake((_bounds.size.width)*_anchorPoint.x,(_bounds.size.height)*_anchorPoint.y);
}
_CALayerRecalculateGeometry(_e0,_36|_35);
}
}),new objj_method(sel_getUid("_owningViewBoundsChanged"),function(_e3,_e4){
with(_e3){
_bounds.size=CGSizeMakeCopy(objj_msgSend(_owningView,"bounds").size);
_position=CGPointMake((_bounds.size.width)*_anchorPoint.x,(_bounds.size.height)*_anchorPoint.y);
_CALayerRecalculateGeometry(_e3,_36|_35);
}
}),new objj_method(sel_getUid("_update"),function(_e5,_e6){
with(_e5){
window.loop=true;
var _e7=_runLoopUpdateMask;
if(_e7&_40){
_CALayerUpdateDOM(_e5,_e7);
}
if(_e7&_3e){
objj_msgSend(_e5,"display");
}else{
if(_e7&_3c||_e7&_3f){
objj_msgSend(_e5,"composite");
}
}
_runLoopUpdateMask=0;
window.loop=false;
}
})]);
class_addMethods(_43,[new objj_method(sel_getUid("layer"),function(_e8,_e9){
with(_e8){
return objj_msgSend(objj_msgSend(objj_msgSend(_e8,"class"),"alloc"),"init");
}
}),new objj_method(sel_getUid("runLoopUpdateLayers"),function(_ea,_eb){
with(_ea){
if(window.oops){
alert(window.latest);
objj_debug_print_backtrace();
}
window.loop=true;
for(hash in _41){
var _ec=_41[hash],_ed=_ec._runLoopUpdateMask;
if(_ed&_40){
_CALayerUpdateDOM(_ec,_ed);
}
if(_ed&_3e){
objj_msgSend(_ec,"display");
}else{
if(_ed&_3c||_ed&_3f){
objj_msgSend(_ec,"composite");
}
}
_ec._runLoopUpdateMask=0;
}
window.loop=false;
_41=nil;
}
})]);
_CALayerUpdateSublayerTransformForSublayers=function(_ee){
var _ef=_ee._bounds,_f0=_ee._anchorPoint,_f1=(_ef.size.width)*_f0.x,_f2=(_ef.size.height)*_f0.y;
_ee._sublayerTransformForSublayers=CGAffineTransformConcat(CGAffineTransformMakeTranslation(-_f1,-_f2),CGAffineTransformConcat(_ee._sublayerTransform,CGAffineTransformMakeTranslation(_f1,_f2)));
};
_CALayerUpdateDOM=function(_f3,_f4){
var _f5=_f3._DOMElement.style;
if(_f4&_3d){
_f5.zIndex=_f3._zPosition;
}
var _f6=_f3._backingStoreFrame;
if(_f4&_3b){
_f5.top=ROUND((_f6.origin.y))+"px";
_f5.left=ROUND((_f6.origin.x))+"px";
}
if(_f4&_3c){
var _f7=MAX(0,ROUND((_f6.size.width))),_f8=MAX(0,ROUND((_f6.size.height))),_f9=_f3._DOMContentsElement;
_f5.width=_f7+"px";
_f5.height=_f8+"px";
if(_f9){
_f9.width=_f7;
_f9.height=_f8;
_f9.style.width=_f7+"px";
_f9.style.height=_f8+"px";
}
}
};
_CALayerRecalculateGeometry=function(_fa,_fb){
var _fc=_fa._bounds,_fd=_fa._superlayer,_fe=(_fc.size.width),_ff=(_fc.size.height),_100=_fa._position,_101=_fa._anchorPoint,_102=_fa._affineTransform,_103={width:_fa._backingStoreFrame.width,height:_fa._backingStoreFrame.height},_104=_fa._hasCustomBackingStoreFrame;
_fa._transformFromLayer=CGAffineTransformConcat(CGAffineTransformMakeTranslation(-_fe*_101.x-(_fa._bounds.origin.x),-_ff*_101.y-(_fa._bounds.origin.y)),CGAffineTransformConcat(_102,CGAffineTransformMakeTranslation(_100.x,_100.y)));
if(_fd&&_fd._hasSublayerTransform){
var tx=_fa._transformFromLayer.tx*_fd._sublayerTransformForSublayers.a+_fa._transformFromLayer.ty*_fd._sublayerTransformForSublayers.c+_fd._sublayerTransformForSublayers.tx;
_fa._transformFromLayer.ty=_fa._transformFromLayer.tx*_fd._sublayerTransformForSublayers.b+_fa._transformFromLayer.ty*_fd._sublayerTransformForSublayers.d+_fd._sublayerTransformForSublayers.ty;
_fa._transformFromLayer.tx=tx;
var a=_fa._transformFromLayer.a*_fd._sublayerTransformForSublayers.a+_fa._transformFromLayer.b*_fd._sublayerTransformForSublayers.c,b=_fa._transformFromLayer.a*_fd._sublayerTransformForSublayers.b+_fa._transformFromLayer.b*_fd._sublayerTransformForSublayers.d,c=_fa._transformFromLayer.c*_fd._sublayerTransformForSublayers.a+_fa._transformFromLayer.d*_fd._sublayerTransformForSublayers.c;
_fa._transformFromLayer.d=_fa._transformFromLayer.c*_fd._sublayerTransformForSublayers.b+_fa._transformFromLayer.d*_fd._sublayerTransformForSublayers.d;
_fa._transformFromLayer.a=a;
_fa._transformFromLayer.b=b;
_fa._transformFromLayer.c=c;
}
_fa._transformToLayer=CGAffineTransformInvert(_fa._transformFromLayer);
_fa._frame=nil;
_fa._standardBackingStoreFrame=objj_msgSend(_fa,"convertRect:toLayer:",_fc,nil);
if(_fd){
var _fc=objj_msgSend(_fd,"bounds"),_109=objj_msgSend(_fd,"convertRect:toLayer:",_fc,nil);
_fa._standardBackingStoreFrame.origin.x-=(_109.origin.x);
_fa._standardBackingStoreFrame.origin.y-=(_109.origin.y);
}
var _10a=_fa._standardBackingStoreFrame.origin,size=_fa._standardBackingStoreFrame.size;
_10a.x=FLOOR(_10a.x);
_10a.y=FLOOR(_10a.y);
size.width=CEIL(size.width)+1;
size.height=CEIL(size.height)+1;
if(!_104){
var _10c=CGRectMakeCopy(_fa._standardBackingStoreFrame);
if(ROUND((_10c.origin.x))!=ROUND((_fa._backingStoreFrame.origin.x))||ROUND((_10c.origin.y))!=ROUND((_fa._backingStoreFrame.origin.y))){
objj_msgSend(_fa,"registerRunLoopUpdateWithMask:",_3b);
}
if(((_10c.size.width)!=ROUND((_fa._backingStoreFrame.size.width))||(_10c.size.height)!=ROUND((_fa._backingStoreFrame.size.height)))){
objj_msgSend(_fa,"registerRunLoopUpdateWithMask:",_3c);
}
_fa._backingStoreFrame=_10c;
}
if(_fb&_35&&_fa._needsDisplayOnBoundsChange){
objj_msgSend(_fa,"setNeedsDisplay");
}else{
if(_104||(_fb&~(_36|_37))){
objj_msgSend(_fa,"setNeedsComposite");
}
}
var _10d=_fa._sublayers,_10e=0,_10f=_10d.length;
for(;_10e<_10f;++_10e){
_CALayerRecalculateGeometry(_10d[_10e],_fb);
}
};
_CALayerGetTransform=function(_110,_111){
var _112=CGAffineTransformMakeIdentity();
if(_110){
var _113=_110;
while(_113&&_113!=_111){
var _114=_113._transformFromLayer;
var tx=_112.tx*_114.a+_112.ty*_114.c+_114.tx;
_112.ty=_112.tx*_114.b+_112.ty*_114.d+_114.ty;
_112.tx=tx;
var a=_112.a*_114.a+_112.b*_114.c,b=_112.a*_114.b+_112.b*_114.d,c=_112.c*_114.a+_112.d*_114.c;
_112.d=_112.c*_114.b+_112.d*_114.d;
_112.a=a;
_112.b=b;
_112.c=c;
_113=_113._superlayer;
}
if(_113==_111){
return _112;
}
}
var _119=[],_113=_111;
while(_113){
_119.push(_113);
_113=_113._superlayer;
}
var _11a=_119.length;
while(_11a--){
var _11b=_119[_11a]._transformToLayer;
var tx=_112.tx*_11b.a+_112.ty*_11b.c+_11b.tx;
_112.ty=_112.tx*_11b.b+_112.ty*_11b.d+_11b.ty;
_112.tx=tx;
var a=_112.a*_11b.a+_112.b*_11b.c,b=_112.a*_11b.b+_112.b*_11b.d,c=_112.c*_11b.a+_112.d*_11b.c;
_112.d=_112.c*_11b.b+_112.d*_11b.d;
_112.a=a;
_112.b=b;
_112.c=c;
}
return _112;
};
p;23;CAMediaTimingFunction.jI;21;Foundation/CPObject.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPString.jc;2072;
kCAMediaTimingFunctionLinear="kCAMediaTimingFunctionLinear";
kCAMediaTimingFunctionEaseIn="kCAMediaTimingFunctionEaseIn";
kCAMediaTimingFunctionEaseOut="kCAMediaTimingFunctionEaseOut";
kCAMediaTimingFunctionEaseInEaseOut="kCAMediaTimingFunctionEaseInEaseOut";
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CAMediaTimingFunction"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_c1x"),new objj_ivar("_c1y"),new objj_ivar("_c2x"),new objj_ivar("_c2y")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithControlPoints::::"),function(_4,_5,_6,_7,_8,_9){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_c1x=_6;
_c1y=_7;
_c2x=_8;
_c2y=_9;
}
return _4;
}
}),new objj_method(sel_getUid("getControlPointAtIndex:values:"),function(_a,_b,_c,_d){
with(_a){
if(_c==0){
_d[0]=0;
_d[1]=0;
}else{
if(_c==1){
_d[0]=_c1x;
_d[1]=_c1y;
}else{
if(_c==2){
_d[0]=_c2x;
_d[1]=_c2y;
}else{
_d[0]=1;
_d[0]=1;
}
}
}
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("functionWithName:"),function(_e,_f,_10){
with(_e){
if(!_1){
_1=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_1,"setObject:forKey:",objj_msgSend(CAMediaTimingFunction,"functionWithControlPoints::::",0,0,1,1),kCAMediaTimingFunctionLinear);
objj_msgSend(_1,"setObject:forKey:",objj_msgSend(CAMediaTimingFunction,"functionWithControlPoints::::",0.42,0,1,1),kCAMediaTimingFunctionEaseIn);
objj_msgSend(_1,"setObject:forKey:",objj_msgSend(CAMediaTimingFunction,"functionWithControlPoints::::",0,0,0.58,1),kCAMediaTimingFunctionEaseOut);
objj_msgSend(_1,"setObject:forKey:",objj_msgSend(CAMediaTimingFunction,"functionWithControlPoints::::",0.42,0,0.58,1),kCAMediaTimingFunctionEaseInEaseOut);
}
return objj_msgSend(_1,"objectForKey:",_10);
}
}),new objj_method(sel_getUid("functionWithControlPoints::::"),function(_11,_12,c1x,c1y,c2x,c2y){
with(_11){
return objj_msgSend(objj_msgSend(_11,"alloc"),"initWithControlPoints::::",c1x,c1y,c2x,c2y);
}
})]);
p;19;CGAffineTransform.ji;12;CGGeometry.jc;2950;
CGAffineTransformMake=function(a,b,c,d,tx,ty){
return {a:a,b:b,c:c,d:d,tx:tx,ty:ty};
};
CGAffineTransformMakeIdentity=function(){
return {a:1,b:0,c:0,d:1,tx:0,ty:0};
};
CGAffineTransformMakeCopy=function(_7){
return {a:_7.a,b:_7.b,c:_7.c,d:_7.d,tx:_7.tx,ty:_7.ty};
};
CGAffineTransformMakeScale=function(sx,sy){
return {a:sx,b:0,c:0,d:sy,tx:0,ty:0};
};
CGAffineTransformMakeTranslation=function(tx,ty){
return {a:1,b:0,c:0,d:1,tx:tx,ty:ty};
};
CGAffineTransformTranslate=function(_c,tx,ty){
return {a:_c.a,b:_c.b,c:_c.c,d:_c.d,tx:_c.tx+_c.a*tx+_c.c*ty,ty:_c.ty+_c.b*tx+_c.d*ty};
};
CGAffineTransformScale=function(_f,sx,sy){
return {a:_f.a*sx,b:_f.b*sx,c:_f.c*sy,d:_f.d*sy,tx:_f.tx,ty:_f.ty};
};
CGAffineTransformConcat=function(lhs,rhs){
return {a:lhs.a*rhs.a+lhs.b*rhs.c,b:lhs.a*rhs.b+lhs.b*rhs.d,c:lhs.c*rhs.a+lhs.d*rhs.c,d:lhs.c*rhs.b+lhs.d*rhs.d,tx:lhs.tx*rhs.a+lhs.ty*rhs.c+rhs.tx,ty:lhs.tx*rhs.b+lhs.ty*rhs.d+rhs.ty};
};
CGPointApplyAffineTransform=function(_14,_15){
return {x:_14.x*_15.a+_14.y*_15.c+_15.tx,y:_14.x*_15.b+_14.y*_15.d+_15.ty};
};
CGSizeApplyAffineTransform=function(_16,_17){
return {width:_16.width*_17.a+_16.height*_17.c,height:_16.width*_17.b+_16.height*_17.d};
};
CGAffineTransformIsIdentity=function(_18){
return (_18.a==1&&_18.b==0&&_18.c==0&&_18.d==1&&_18.tx==0&&_18.ty==0);
};
CGAffineTransformEqualToTransform=function(lhs,rhs){
return (lhs.a==rhs.a&&lhs.b==rhs.b&&lhs.c==rhs.c&&lhs.d==rhs.d&&lhs.tx==rhs.tx&&lhs.ty==rhs.ty);
};
CGStringCreateWithCGAffineTransform=function(_1b){
return (" [[ "+_1b.a+", "+_1b.b+", 0 ], [ "+_1b.c+", "+_1b.d+", 0 ], [ "+_1b.tx+", "+_1b.ty+", 1]]");
};
CGAffineTransformCreateCopy=function(_1c){
return {a:_1c.a,b:_1c.b,c:_1c.c,d:_1c.d,tx:_1c.tx,ty:_1c.ty};
};
CGAffineTransformMakeRotation=function(_1d){
var sin=SIN(_1d),cos=COS(_1d);
return {a:cos,b:sin,c:-sin,d:cos,tx:0,ty:0};
};
CGAffineTransformRotate=function(_20,_21){
var sin=SIN(_21),cos=COS(_21);
return {a:_20.a*cos+_20.c*sin,b:_20.b*cos+_20.d*sin,c:_20.c*cos-_20.a*sin,d:_20.d*cos-_20.b*sin,tx:_20.tx,ty:_20.ty};
};
CGAffineTransformInvert=function(_24){
var _25=1/(_24.a*_24.d-_24.b*_24.c);
return {a:_25*_24.d,b:-_25*_24.b,c:-_25*_24.c,d:_25*_24.a,tx:_25*(_24.c*_24.ty-_24.d*_24.tx),ty:_25*(_24.b*_24.tx-_24.a*_24.ty)};
};
CGRectApplyAffineTransform=function(_26,_27){
var top=(_26.origin.y),_29=(_26.origin.x),_2a=(_26.origin.x+_26.size.width),_2b=(_26.origin.y+_26.size.height),_2c=CGPointApplyAffineTransform({x:_29,y:top},_27),_2d=CGPointApplyAffineTransform({x:_2a,y:top},_27),_2e=CGPointApplyAffineTransform({x:_29,y:_2b},_27),_2f=CGPointApplyAffineTransform({x:_2a,y:_2b},_27),_30=MIN(_2c.x,_2d.x,_2e.x,_2f.x),_31=MAX(_2c.x,_2d.x,_2e.x,_2f.x),_32=MIN(_2c.y,_2d.y,_2e.y,_2f.y),_33=MAX(_2c.y,_2d.y,_2e.y,_2f.y);
return {origin:{x:_30,y:_32},size:{width:(_31-_30),height:(_33-_32)}};
};
CPStringFromCGAffineTransform=function(_34){
return "{"+_34.a+", "+_34.b+", "+_34.c+", "+_34.d+", "+_34.tx+", "+_34.ty+"}";
};
p;9;CGColor.ji;14;CGColorSpace.jc;2065;
var _1=0;
CFHashCode=function(_2){
if(!_2.hash){
_2.hash=++_1;
}
return _2;
};
kCGColorWhite="kCGColorWhite";
kCGColorBlack="kCGColorBlack";
kCGColorClear="kCGColorClear";
var _3={};
CGColorGetConstantColor=function(_4){
alert("FIX ME");
};
CGColorRetain=function(_5){
return _5;
};
CGColorRelease=function(){
};
CGColorCreate=function(_6,_7){
if(!_6||!_7){
return NULL;
}
var _7=_7.slice();
CGColorSpaceStandardizeComponents(_6,_7);
var _8=CFHashCode(_6)+_7.join("");
if(_3[_8]){
return _3[_8];
}
return _3[_8]={colorspace:_6,pattern:NULL,components:_7};
};
CGColorCreateCopy=function(_9){
return _9;
};
CGColorCreateGenericGray=function(_a,_b){
return CGColorCreate(0,[_a,_b]);
};
CGColorCreateGenericRGB=function(_c,_d,_e,_f){
return CGColorCreate(0,[_c,_d,_e,_f]);
};
CGColorCreateGenericCMYK=function(_10,_11,_12,_13,_14){
return CGColorCreate(0,[_10,_11,_12,_13,_14]);
};
CGColorCreateCopyWithAlpha=function(_15,_16){
var _17=_15.components;
if(!_15||_16==_17[_17.length-1]){
return _15;
}
if(_15.pattern){
var _18=CGColorCreateWithPattern(_15.colorspace,_15.pattern,_17);
}else{
var _18=CGColorCreate(_15.colorspace,_17);
}
_18.components[_17.length-1]=_16;
return _18;
};
CGColorCreateWithPattern=function(_19,_1a,_1b){
if(!_19||!_1a||!_1b){
return NULL;
}
return {colorspace:_19,pattern:_1a,components:_1b.slice()};
};
CGColorEqualToColor=function(lhs,rhs){
if(lhs==rhs){
return true;
}
if(!lhs||!rhs){
return false;
}
var _1e=lhs.components,_1f=rhs.components,_20=_1e.length;
if(_20!=_1f.length){
return false;
}
while(_20--){
if(_1e[_20]!=_1f[_20]){
return false;
}
}
if(lhs.pattern!=rhs.pattern){
return false;
}
if(CGColorSpaceEqualToColorSpace(lhs.colorspace,rhs.colorspace)){
return false;
}
return true;
};
CGColorGetAlpha=function(_21){
var _22=_21.components;
return _22[_22.length-1];
};
CGColorGetColorSpace=function(_23){
return _23.colorspace;
};
CGColorGetComponents=function(_24){
return _24.components;
};
CGColorGetNumberOfComponents=function(_25){
return _25.components.length;
};
CGColorGetPattern=function(_26){
return _26.pattern;
};
p;14;CGColorSpace.jc;3502;
kCGColorSpaceModelUnknown=-1;
kCGColorSpaceModelMonochrome=0;
kCGColorSpaceModelRGB=1;
kCGColorSpaceModelCMYK=2;
kCGColorSpaceModelLab=3;
kCGColorSpaceModelDeviceN=4;
kCGColorSpaceModelIndexed=5;
kCGColorSpaceModelPattern=6;
kCGColorSpaceGenericGray="CGColorSpaceGenericGray";
kCGColorSpaceGenericRGB="CGColorSpaceGenericRGB";
kCGColorSpaceGenericCMYK="CGColorSpaceGenericCMYK";
kCGColorSpaceGenericRGBLinear="CGColorSpaceGenericRGBLinear";
kCGColorSpaceGenericRGBHDR="CGColorSpaceGenericRGBHDR";
kCGColorSpaceAdobeRGB1998="CGColorSpaceAdobeRGB1998";
kCGColorSpaceSRGB="CGColorSpaceSRGB";
var _1={};
CGColorSpaceCreateCalibratedGray=function(_2,_3,_4){
return {model:kCGColorSpaceModelMonochrome,count:1,base:NULL};
};
CGColorSpaceCreateCalibratedRGB=function(_5,_6,_7){
return {model:kCGColorSpaceModelRGB,count:1,base:NULL};
};
CGColorSpaceCreateICCBased=function(_8,_9,_a,_b){
return NULL;
};
CGColorSpaceCreateLab=function(_c,_d,_e){
return NULL;
};
CGColorSpaceCreateDeviceCMYK=function(){
return CGColorSpaceCreateWithName(kCGColorSpaceGenericCMYK);
};
CGColorSpaceCreateDeviceGray=function(){
return CGColorSpaceCreateWithName(kCGColorSpaceGenericGray);
};
CGColorSpaceCreateDeviceRGB=function(){
return CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
};
CGColorSpaceCreateWithPlatformColorSpace=function(){
return NULL;
};
CGColorSpaceCreateIndexed=function(_f,_10,_11){
return NULL;
};
CGColorSpaceCreatePattern=function(_12){
if(_12){
return {model:kCGColorSpaceModelPattern,count:_12.count,base:_12};
}
return {model:kCGColorSpaceModelPattern,count:0,base:NULL};
};
CGColorSpaceCreateWithName=function(_13){
var _14=_1[_13];
if(_14){
return _14;
}
switch(_13){
case kCGColorSpaceGenericGray:
return _1[_13]={model:kCGColorSpaceModelMonochrome,count:1,base:NULL};
case kCGColorSpaceGenericRGB:
return _1[_13]={model:kCGColorSpaceModelRGB,count:3,base:NULL};
case kCGColorSpaceGenericCMYK:
return _1[_13]={model:kCGColorSpaceModelCMYK,count:4,base:NULL};
case kCGColorSpaceGenericRGBLinear:
return _1[_13]={model:kCGColorSpaceModelRGB,count:3,base:NULL};
case kCGColorSpaceGenericRGBHDR:
return _1[_13]={model:kCGColorSpaceModelRGB,count:3,base:NULL};
case kCGColorSpaceAdobeRGB1998:
return _1[_13]={model:kCGColorSpaceModelRGB,count:3,base:NULL};
case kCGColorSpaceSRGB:
return _1[_13]={model:kCGColorSpaceModelRGB,count:3,base:NULL};
}
return NULL;
};
CGColorSpaceCopyICCProfile=function(_15){
return NULL;
};
CGColorSpaceGetNumberOfComponents=function(_16){
return _16.count;
};
CGColorSpaceGetTypeID=function(_17){
};
CGColorSpaceGetModel=function(_18){
return _18.model;
};
CGColorSpaceGetBaseColorSpace=function(_19){
};
CGColorSpaceGetColorTableCount=function(_1a){
};
CGColorSpaceGetColorTable=function(_1b){
};
CGColorSpaceRelease=function(_1c){
};
CGColorSpaceRetain=function(_1d){
return _1d;
};
CGColorSpaceStandardizeComponents=function(_1e,_1f){
var _20=_1e.count;
if(_20>_1f.length){
_1f[_20]=1;
return;
}
var _21=_1f[_20];
if(_21<0){
_1f[_20]=0;
}else{
if(_21>1){
_1f[_20]=1;
}else{
_1f[_20]=ROUND(_21*1000)/1000;
}
}
if(_1e.base){
_1e=_1e.base;
}
switch(_1e.model){
case kCGColorSpaceModelMonochrome:
case kCGColorSpaceModelRGB:
case kCGColorSpaceModelCMYK:
case kCGColorSpaceModelDeviceN:
while(_20--){
if(_20>_1f.length){
_1f[_20]=1;
return;
}
var _21=_1f[_20];
if(_21<0){
_1f[_20]=0;
}else{
if(_21>1){
_1f[_20]=1;
}else{
_1f[_20]=ROUND(_21*255)/255;
}
}
}
break;
case kCGColorSpaceModelIndexed:
case kCGColorSpaceModelLab:
case kCGColorSpaceModelPattern:
break;
}
};
p;11;CGContext.ji;12;CGGeometry.ji;19;CGAffineTransform.ji;8;CGPath.jc;20458;
kCGLineCapButt=0;
kCGLineCapRound=1;
kCGLineCapSquare=2;
kCGLineJoinMiter=0;
kCGLineJoinRound=1;
kCGLineJoinBevel=2;
kCGPathFill=0;
kCGPathEOFill=1;
kCGPathStroke=2;
kCGPathFillStroke=3;
kCGPathEOFillStroke=4;
kCGBlendModeNormal=0;
kCGBlendModeMultiply=1;
kCGBlendModeScreen=2;
kCGBlendModeOverlay=3;
kCGBlendModeDarken=4;
kCGBlendModeLighten=5;
kCGBlendModeColorDodge=6;
kCGBlendModeColorBurn=7;
kCGBlendModeSoftLight=8;
kCGBlendModeHardLight=9;
kCGBlendModeDifference=10;
kCGBlendModeExclusion=11;
kCGBlendModeHue=12;
kCGBlendModeSaturation=13;
kCGBlendModeColor=14;
kCGBlendModeLuminosity=15;
kCGBlendModeClear=16;
kCGBlendModeCopy=17;
kCGBlendModeSourceIn=18;
kCGBlendModeSourceOut=19;
kCGBlendModeSourceAtop=20;
kCGBlendModeDestinationOver=21;
kCGBlendModeDestinationIn=22;
kCGBlendModeDestinationOut=23;
kCGBlendModeDestinationAtop=24;
kCGBlendModeXOR=25;
kCGBlendModePlusDarker=26;
kCGBlendModePlusLighter=27;
CGContextRelease=function(){
};
CGContextRetain=function(_1){
return _1;
};
if(!CPFeatureIsCompatible(CPHTMLCanvasFeature)){
CGGStateCreate=function(){
return {alpha:1,strokeStyle:"#000",fillStyle:"#ccc",lineWidth:1,lineJoin:kCGLineJoinMiter,lineCap:kCGLineCapButt,miterLimit:10,globalAlpha:1,blendMode:kCGBlendModeNormal,shadowOffset:{width:0,height:0},shadowBlur:0,shadowColor:NULL,CTM:{a:1,b:0,c:0,d:1,tx:0,ty:0}};
};
CGGStateCreateCopy=function(_2){
return {alpha:_2.alpha,strokeStyle:_2.strokeStyle,fillStyle:_2.fillStyle,lineWidth:_2.lineWidth,lineJoin:_2.lineJoin,lineCap:_2.lineCap,miterLimit:_2.miterLimit,globalAlpha:_2.globalAlpha,blendMode:_2.blendMode,shadowOffset:_2.shadowOffset,shadowBlur:_2.shadowBlur,shadowColor:_2.shadowColor,CTM:{a:_2.CTM.a,b:_2.CTM.b,c:_2.CTM.c,d:_2.CTM.d,tx:_2.CTM.tx,ty:_2.CTM.ty}};
};
CGBitmapGraphicsContextCreate=function(){
return {DOMElement:document.createElement("div"),path:NULL,gState:CGGStateCreate(),gStateStack:[]};
};
CGContextSaveGState=function(_3){
_3.gStateStack.push(CGGStateCreateCopy(_3.gState));
};
CGContextRestoreGState=function(_4){
_4.gState=_4.gStateStack.pop();
};
CGContextSetLineCap=function(_5,_6){
_5.gState.lineCap=_6;
};
CGContextSetLineJoin=function(_7,_8){
_7.gState.lineJoin=_8;
};
CGContextSetLineWidth=function(_9,_a){
_9.gState.lineWidth=_a;
};
CGContextSetMiterLimit=function(_b,_c){
_b.gState.miterLimit=_c;
};
CGContextSetBlendMode=function(_d,_e){
_d.gState.blendMode=_e;
};
CGContextAddArc=function(_f,x,y,_12,_13,_14,_15){
CGPathAddArc(_f.path,_f.gState.CTM,x,y,_12,_13,_14,_15);
};
CGContextAddArcToPoint=function(_16,x1,y1,x2,y2,_1b){
CGPathAddArcToPoint(_16.path,_16.gState.CTM,x1,y1,x2,y2,_1b);
};
CGContextAddCurveToPoint=function(_1c,_1d,_1e,_1f,_20,x,y){
CGPathAddCurveToPoint(_1c.path,_1c.gState.CTM,_1d,_1e,_1f,_20,x,y);
};
CGContextAddLines=function(_23,_24,_25){
CGPathAddLines(_23.path,_23.gState.CTM,_24,_25);
};
CGContextAddLineToPoint=function(_26,x,y){
CGPathAddLineToPoint(_26.path,_26.gState.CTM,x,y);
};
CGContextAddPath=function(_29,_2a){
if(!_29||CGPathIsEmpty(_2a)){
return;
}
if(!_29.path){
_29.path=CGPathCreateMutable();
}
CGPathAddPath(_29.path,_29.gState.CTM,_2a);
};
CGContextAddQuadCurveToPoint=function(_2b,cpx,cpy,x,y){
CGPathAddQuadCurveToPoint(_2b.path,_2b.gState.CTM,cpx,cpy,x,y);
};
CGContextAddRect=function(_30,_31){
CGPathAddRect(_30.path,_30.gState.CTM,_31);
};
CGContextAddRects=function(_32,_33,_34){
CGPathAddRects(_32.path,_32.gState.CTM,_33,_34);
};
CGContextBeginPath=function(_35){
_35.path=CGPathCreateMutable();
};
CGContextClosePath=function(_36){
CGPathCloseSubpath(_36.path);
};
CGContextMoveToPoint=function(_37,x,y){
if(!_37.path){
_37.path=CGPathCreateMutable();
}
CGPathMoveToPoint(_37.path,_37.gState.CTM,x,y);
};
CGContextFillRect=function(_3a,_3b){
CGContextFillRects(_3a,[_3b],1);
};
CGContextFillRects=function(_3c,_3d,_3e){
if(arguments["count"]==NULL){
var _3e=_3d.length;
}
CGContextBeginPath(_3c);
CGContextAddRects(_3c,_3d,_3e);
CGContextClosePath(_3c);
CGContextDrawPath(_3c,kCGPathFill);
};
CGContextStrokeRect=function(_3f,_40){
CGContextBeginPath(_3f);
CGContextAddRect(_3f,_40);
CGContextClosePath(_3f);
CGContextDrawPath(_3f,kCGPathStroke);
};
CGContextStrokeRectWithWidth=function(_41,_42,_43){
CGContextSaveGState(_41);
CGContextSetLineWidth(_41,_43);
CGContextStrokeRect(_41,_42);
CGContextRestoreGState(_41);
};
CGContextConcatCTM=function(_44,_45){
var CTM=_44.gState.CTM;
var tx=CTM.tx*_45.a+CTM.ty*_45.c+_45.tx;
CTM.ty=CTM.tx*_45.b+CTM.ty*_45.d+_45.ty;
CTM.tx=tx;
var a=CTM.a*_45.a+CTM.b*_45.c,b=CTM.a*_45.b+CTM.b*_45.d,c=CTM.c*_45.a+CTM.d*_45.c;
CTM.d=CTM.c*_45.b+CTM.d*_45.d;
CTM.a=a;
CTM.b=b;
CTM.c=c;
};
CGContextGetCTM=function(_4b){
return _4b.gState.CTM;
};
CGContextRotateCTM=function(_4c,_4d){
var _4e=_4c.gState;
_4e.CTM=CGAffineTransformRotate(_4e.CTM,_4d);
};
CGContextScaleCTM=function(_4f,sx,sy){
var _52=_4f.gState;
_52.CTM={a:_52.CTM.a*sx,b:_52.CTM.b*sx,c:_52.CTM.c*sy,d:_52.CTM.d*sy,tx:_52.CTM.tx,ty:_52.CTM.ty};
};
CGContextTranslateCTM=function(_53,tx,ty){
var _56=_53.gState;
_56.CTM={a:_56.CTM.a,b:_56.CTM.b,c:_56.CTM.c,d:_56.CTM.d,tx:_56.CTM.tx+_56.CTM.a*tx+_56.CTM.c*ty,ty:_56.CTM.ty+_56.CTM.b*tx+_56.CTM.d*ty};
};
CGContextSetShadow=function(_57,_58,_59){
var _5a=_57.gState;
_5a.shadowOffset={width:_58.width,height:_58.height};
_5a.shadowBlur=_59;
_5a.shadowColor=objj_msgSend(CPColor,"shadowColor");
};
CGContextSetShadowWithColor=function(_5b,_5c,_5d,_5e){
var _5f=_5b.gState;
_5f.shadowOffset={width:_5c.width,height:_5c.height};
_5f.shadowBlur=_5d;
_5f.shadowColor=_5e;
};
CGContextSetAlpha=function(_60,_61){
_60.gState.alpha=MAX(MIN(_61,1),0);
};
}
CGContextEOFillPath=function(_62){
CGContextDrawPath(_62,kCGPathEOFill);
};
CGContextFillPath=function(_63){
CGContextDrawPath(_63,kCGPathFill);
};
var _64=4*((SQRT2-1)/3);
CGContextAddEllipseInRect=function(_65,_66){
CGContextBeginPath(_65);
if((_66.size.width)==(_66.size.height)){
CGContextAddArc(_65,(_66.origin.x+(_66.size.width)/2),(_66.origin.y+(_66.size.height)/2),(_66.size.width)/2,0,2*PI,YES);
}else{
var _67={width:(_66.size.width)/2,height:(_66.size.height)/2},_68={x:(_66.origin.x)+_67.width,y:(_66.origin.y)+_67.height};
CGContextMoveToPoint(_65,_68.x,_68.y-_67.height);
CGContextAddCurveToPoint(_65,_68.x+(_64*_67.width),_68.y-_67.height,_68.x+_67.width,_68.y-(_64*_67.height),_68.x+_67.width,_68.y);
CGContextAddCurveToPoint(_65,_68.x+_67.width,_68.y+(_64*_67.height),_68.x+(_64*_67.width),_68.y+_67.height,_68.x,_68.y+_67.height);
CGContextAddCurveToPoint(_65,_68.x-(_64*_67.width),_68.y+_67.height,_68.x-_67.width,_68.y+(_64*_67.height),_68.x-_67.width,_68.y);
CGContextAddCurveToPoint(_65,_68.x-_67.width,_68.y-(_64*_67.height),_68.x-(_64*_67.width),_68.y-_67.height,_68.x,_68.y-_67.height);
}
CGContextClosePath(_65);
};
CGContextFillEllipseInRect=function(_69,_6a){
CGContextAddEllipseInRect(_69,_6a);
CGContextFillPath(_69);
};
CGContextStrokeEllipseInRect=function(_6b,_6c){
CGContextAddEllipseInRect(_6b,_6c);
CGContextStrokePath(_6b);
};
CGContextStrokePath=function(_6d){
CGContextDrawPath(_6d,kCGPathStroke);
};
CGContextStrokeLineSegments=function(_6e,_6f,_70){
var i=0;
if(arguments["count"]==NULL){
var _70=_6f.length;
}
CGContextBeginPath(_6e);
for(;i<_70;i+=2){
CGContextMoveToPoint(_6e,_6f[i].x,_6f[i].y);
CGContextAddLineToPoint(_6e,_6f[i+1].x,_6f[i+1].y);
}
CGContextStrokePath(_6e);
};
CGContextSetFillColor=function(_72,_73){
if(_73){
_72.gState.fillStyle=objj_msgSend(_73,"cssString");
}
};
CGContextSetStrokeColor=function(_74,_75){
if(_75){
_74.gState.strokeStyle=objj_msgSend(_75,"cssString");
}
};
CGContextFillRoundedRectangleInRect=function(_76,_77,_78,ne,se,sw,nw){
var _7d=(_77.origin.x),_7e=(_77.origin.x+_77.size.width),_7f=(_77.origin.y),_80=(_77.origin.y+_77.size.height);
CGContextBeginPath(_76);
CGContextMoveToPoint(_76,_7d+_78,_7f);
if(ne){
CGContextAddLineToPoint(_76,_7e-_78,_7f);
CGContextAddCurveToPoint(_76,_7e-_78,_7f,_7e,_7f,_7e,_7f+_78);
}else{
CGContextAddLineToPoint(_76,_7e,_7f);
}
if(se){
CGContextAddLineToPoint(_76,_7e,_80-_78);
CGContextAddCurveToPoint(_76,_7e,_80-_78,_7e,_80,_7e-_78,_80);
}else{
CGContextAddLineToPoint(_76,_7e,_80);
}
if(sw){
CGContextAddLineToPoint(_76,_7d+_78,_80);
CGContextAddCurveToPoint(_76,_7d+_78,_80,_7d,_80,_7d,_80-_78);
}else{
CGContextAddLineToPoint(_76,_7d,_80);
}
if(nw){
CGContextAddLineToPoint(_76,_7d,_7f+_78);
CGContextAddCurveToPoint(_76,_7d,_7f+_78,_7d,_7f,_7d+_78,_7f);
}else{
CGContextAddLineToPoint(_76,_7d,_7f);
}
CGContextClosePath(_76);
CGContextFillPath(_76);
};
if(CPFeatureIsCompatible(CPHTMLCanvasFeature)){
var _81=["butt","round","square"],_82=["miter","round","bevel"],_83=["source-over","source-over","source-over","source-over","darker","lighter","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","source-over","copy","source-in","source-out","source-atop","destination-over","destination-in","destination-out","destination-atop","xor","source-over","source-over"];
CGContextSaveGState=function(_84){
_84.save();
};
CGContextRestoreGState=function(_85){
_85.restore();
};
CGContextSetLineCap=function(_86,_87){
_86.lineCap=_81[_87];
};
CGContextSetLineJoin=function(_88,_89){
_88.lineJoin=_82[_89];
};
CGContextSetLineWidth=function(_8a,_8b){
_8a.lineWidth=_8b;
};
CGContextSetMiterLimit=function(_8c,_8d){
_8c.miterLimit=_8d;
};
CGContextSetBlendMode=function(_8e,_8f){
_8e.globalCompositeOperation=_83[_8f];
};
CGContextAddArc=function(_90,x,y,_93,_94,_95,_96){
_90.arc(x,y,_93,_94,_95,!_96);
};
CGContextAddArcToPoint=function(_97,x1,y1,x2,y2,_9c){
_97.arcTo(x1,y1,x2,y2,_9c);
};
CGContextAddCurveToPoint=function(_9d,_9e,_9f,_a0,_a1,x,y){
_9d.bezierCurveTo(_9e,_9f,_a0,_a1,x,y);
};
CGContextAddLineToPoint=function(_a4,x,y){
_a4.lineTo(x,y);
};
CGContextAddPath=function(_a7,_a8){
if(!_a7||CGPathIsEmpty(_a8)){
return;
}
var _a9=_a8.elements,i=0,_ab=_a8.count;
for(;i<_ab;++i){
var _ac=_a9[i],_ad=_ac.type;
switch(_ad){
case kCGPathElementMoveToPoint:
_a7.moveTo(_ac.x,_ac.y);
break;
case kCGPathElementAddLineToPoint:
_a7.lineTo(_ac.x,_ac.y);
break;
case kCGPathElementAddQuadCurveToPoint:
_a7.quadraticCurveTo(_ac.cpx,_ac.cpy,_ac.x,_ac.y);
break;
case kCGPathElementAddCurveToPoint:
_a7.bezierCurveTo(_ac.cp1x,_ac.cp1y,_ac.cp2x,_ac.cp2y,_ac.x,_ac.y);
break;
case kCGPathElementCloseSubpath:
_a7.closePath();
break;
case kCGPathElementAddArc:
_a7.arc(_ac.x,_ac.y,_ac.radius,_ac.startAngle,_ac.endAngle,_ac.clockwise);
break;
case kCGPathElementAddArcTo:
break;
}
}
};
CGContextAddRect=function(_ae,_af){
_ae.rect((_af.origin.x),(_af.origin.y),(_af.size.width),(_af.size.height));
};
CGContextAddRects=function(_b0,_b1,_b2){
var i=0;
if(arguments["count"]==NULL){
var _b2=_b1.length;
}
for(;i<_b2;++i){
var _b4=_b1[i];
_b0.rect((_b4.origin.x),(_b4.origin.y),(_b4.size.width),(_b4.size.height));
}
};
CGContextBeginPath=function(_b5){
_b5.beginPath();
};
CGContextClosePath=function(_b6){
_b6.closePath();
};
CGContextMoveToPoint=function(_b7,x,y){
_b7.moveTo(x,y);
};
CGContextClearRect=function(_ba,_bb){
_ba.clearRect((_bb.origin.x),(_bb.origin.y),(_bb.size.width),(_bb.size.height));
};
CGContextDrawPath=function(_bc,_bd){
if(_bd==kCGPathFill||_bd==kCGPathFillStroke){
_bc.fill();
}else{
if(_bd==kCGPathEOFill||_bd==kCGPathEOFillStroke){
alert("not implemented!!!");
}
}
if(_bd==kCGPathStroke||_bd==kCGPathFillStroke||_bd==kCGPathEOFillStroke){
_bc.stroke();
}
};
CGContextFillRect=function(_be,_bf){
_be.fillRect((_bf.origin.x),(_bf.origin.y),(_bf.size.width),(_bf.size.height));
};
CGContextFillRects=function(_c0,_c1,_c2){
var i=0;
if(arguments["count"]==NULL){
var _c2=_c1.length;
}
for(;i<_c2;++i){
var _c4=_c1[i];
_c0.fillRect((_c4.origin.x),(_c4.origin.y),(_c4.size.width),(_c4.size.height));
}
};
CGContextStrokeRect=function(_c5,_c6){
_c5.strokeRect((_c6.origin.x),(_c6.origin.y),(_c6.size.width),(_c6.size.height));
};
CGContextClip=function(_c7){
_c7.clip();
};
CGContextClipToRect=function(_c8,_c9){
_c8.beginPath();
_c8.rect((_c9.origin.x),(_c9.origin.y),(_c9.size.width),(_c9.size.height));
_c8.closePath();
_c8.clip();
};
CGContextClipToRects=function(_ca,_cb,_cc){
if(arguments["count"]==NULL){
var _cc=_cb.length;
}
_ca.beginPath();
CGContextAddRects(_ca,_cb,_cc);
_ca.clip();
};
CGContextSetAlpha=function(_cd,_ce){
_cd.globalAlpha=_ce;
};
CGContextSetFillColor=function(_cf,_d0){
_cf.fillStyle=objj_msgSend(_d0,"cssString");
};
CGContextSetStrokeColor=function(_d1,_d2){
_d1.strokeStyle=objj_msgSend(_d2,"cssString");
};
CGContextSetShadow=function(_d3,_d4,_d5){
_d3.shadowOffsetX=_d4.width;
_d3.shadowOffsetY=_d4.height;
_d3.shadowBlur=_d5;
};
CGContextSetShadowWithColor=function(_d6,_d7,_d8,_d9){
_d6.shadowOffsetX=_d7.width;
_d6.shadowOffsetY=_d7.height;
_d6.shadowBlur=_d8;
_d6.shadowColor=objj_msgSend(_d9,"cssString");
};
CGContextRotateCTM=function(_da,_db){
_da.rotate(_db);
};
CGContextScaleCTM=function(_dc,sx,sy){
_dc.scale(sx,sy);
};
CGContextTranslateCTM=function(_df,tx,ty){
_df.translate(tx,ty);
};
eigen=function(_e2){
alert("IMPLEMENT ME!");
};
if(CPFeatureIsCompatible(CPJavaScriptCanvasTransformFeature)){
CGContextConcatCTM=function(_e3,_e4){
_e3.transform(_e4.a,_e4.b,_e4.c,_e4.d,_e4.tx,_e4.ty);
};
}else{
CGContextConcatCTM=function(_e5,_e6){
var a=_e6.a,b=_e6.b,c=_e6.c,d=_e6.d,tx=_e6.tx,ty=_e6.ty,sx=1,sy=1,a1=0,a2=0;
if(b==0&&c==0){
sx=a;
sy=d;
}else{
if(a*b==-c*d){
var _f1=(a*d<0||b*c>0)?-1:1,a2=(ATAN2(b,d)+ATAN2(-_f1*c,_f1*a))/2,cos=COS(a2),sin=SIN(a2);
if(cos==0){
sx=-c/sin;
sy=b/sin;
}else{
if(sin==0){
sx=a/cos;
sy=d/cos;
}else{
abs_cos=ABS(cos);
abs_sin=ABS(sin);
sx=(abs_cos*a/cos+abs_sin*-c/sin)/(abs_cos+abs_sin);
sy=(abs_cos*d/cos+abs_sin*b/sin)/(abs_cos+abs_sin);
}
}
}else{
if(a*c==-b*d){
var _f1=(a*d<0||b*c>0)?-1:1;
a1=(Math.atan2(_f1*b,_f1*a)+Math.atan2(-c,d))/2,cos=COS(a1),sin=SIN(a1);
if(cos==0){
sx=b/sin;
sy=-c/sin;
}else{
if(sin==0){
sx=a/cos;
sy=d/cos;
}else{
abs_cos=ABS(cos);
abs_sin=ABS(sin);
sx=(abs_cos*a/cos+abs_sin*b/sin)/(abs_cos+abs_sin);
sy=(abs_cos*d/cos+abs_sin*-c/sin)/(abs_cos+abs_sin);
}
}
}else{
var _f4=CGAffineTransformMake(a,c,b,d,0,0),u=eigen(CGAffineTransformConcat(_e6,_f4)),v=eigen(CGAffineTransformConcat(_f4,_e6)),U=CGAffineTransformMake(u.vector_1.x,u.vector_2.x,u.vector_1.y,u.vector_2.y,0,0),VT=CGAffineTransformMake(v.vector_1.x,v.vector_1.y,v.vector_2.x,v.vector_2.y,0,0),S=CGAffineTransformConcat(CGAffineTransformConcat(CGAffineTransformInvert(U),_e6),CGAffineTransformInvert(VT));
a=VT.a;
b=VT.b;
c=VT.c;
d=VT.d;
var _f1=(a*d<0||b*c>0)?-1:1,a2=(ATAN2(b,d)+ATAN2(-_f1*c,_f1*a))/2,cos=COS(a2),sin=SIN(a2);
if(cos==0){
sx=-c/sin;
sy=b/sin;
}else{
if(sin==0){
sx=a/cos;
sy=d/cos;
}else{
abs_cos=ABS(cos);
abs_sin=ABS(sin);
sx=(abs_cos*a/cos+abs_sin*-c/sin)/(abs_cos+abs_sin);
sy=(abs_cos*d/cos+abs_sin*b/sin)/(abs_cos+abs_sin);
}
}
S.a*=sx;
S.d*=sy;
a=U.a;
b=U.b;
c=U.c;
d=U.d;
var _f1=(a*d<0||b*c>0)?-1:1;
a1=(Math.atan2(_f1*b,_f1*a)+Math.atan2(-c,d))/2,cos=COS(a1),sin=SIN(a1);
if(cos==0){
sx=b/sin;
sy=-c/sin;
}else{
if(sin==0){
sx=a/cos;
sy=d/cos;
}else{
abs_cos=ABS(cos);
abs_sin=ABS(sin);
sx=(abs_cos*a/cos+abs_sin*b/sin)/(abs_cos+abs_sin);
sy=(abs_cos*d/cos+abs_sin*-c/sin)/(abs_cos+abs_sin);
}
}
sx=S.a*sx;
sy=S.d*sy;
}
}
}
if(tx!=0||ty!=0){
CGContextTranslateCTM(_e5,tx,ty);
}
if(a1!=0){
CGContextRotateCTM(_e5,a1);
}
if(sx!=1||sy!=1){
CGContextScaleCTM(_e5,sx,sy);
}
if(a2!=0){
CGContextRotateCTM(_e5,a2);
}
};
}
CGContextDrawImage=function(_fa,_fb,_fc){
_fa.drawImage(_fc._image,(_fb.origin.x),(_fb.origin.y),(_fb.size.width),(_fb.size.height));
};
to_string=function(_fd){
return "rgba("+ROUND(_fd.components[0]*255)+", "+ROUND(_fd.components[1]*255)+", "+ROUND(255*_fd.components[2])+", "+_fd.components[3]+")";
};
CGContextDrawLinearGradient=function(_fe,_ff,_100,_101,_102){
var _103=_ff.colors,_104=_103.length,_105=_fe.createLinearGradient(_100.x,_100.y,_101.x,_101.y);
while(_104--){
_105.addColorStop(_ff.locations[_104],to_string(_103[_104]));
}
_fe.fillStyle=_105;
_fe.fill();
};
CGBitmapGraphicsContextCreate=function(){
var _106=document.createElement("canvas"),_107=_106.getContext("2d");
_107.DOMElement=_106;
return _107;
};
}else{
if(CPFeatureIsCompatible(CPVMLFeature)){
var _108=["f","t"],_109=["flat","round","square"],_10a=["miter","round","bevel"],_10b=[" m "," l ","qb"," c "," x ",[" at "," wa "]];
var _10c=CGBitmapGraphicsContextCreate;
CGBitmapGraphicsContextCreate=function(){
document.namespaces.add("cg_vml_","urn:schemas-microsoft-com:vml");
document.createStyleSheet().cssText="cg_vml_\\:*{behavior:url(#default#VML)}";
CGBitmapGraphicsContextCreate=_10c;
return _10c();
};
CGContextClearRect=function(_10d,_10e){
if(_10d.buffer!=nil){
_10d.buffer="";
}else{
_10d.DOMElement.innerHTML="";
}
_10d.path=NULL;
};
var W=10,H=10,Z=10,Z_2=Z/2;
CGContextDrawImage=function(_113,_114,_115){
var _116="";
if(_115.buffer!=nil){
_116=_115.buffer;
}else{
var ctm=_113.gState.CTM,_118=CGPointApplyAffineTransform(_114.origin,ctm),_119=ctm.a==ctm.d&&ctm.b==-ctm.c,vml=["<cg_vml_:group coordsize=\"1,1\" coordorigin=\"0,0\" style=\"width:1;height:1;position:absolute"];
var _11b=CGRectApplyAffineTransform(_114,ctm);
vml.push(";padding:0 ",ROUND((_11b.origin.x+_11b.size.width)),"px ",ROUND((_11b.origin.y+_11b.size.height)),"px 0;filter:progid:DXImageTransform.Microsoft.Matrix(","M11='",ctm.a,"',M12='",ctm.c,"',M21='",ctm.b,"',M22='",ctm.d,"',","Dx='",ROUND(_118.x),"', Dy='",ROUND(_118.y),"', sizingmethod='clip');");
vml.push("\"><cg_vml_:image src=\"",_115._image.src,"\" style=\"width:",(_114.size.width),"px;height:",(_114.size.height),"px;\"/></g_vml_:group>");
_116=vml.join("");
}
if(_113.buffer!=nil){
_113.buffer+=_116;
}else{
_113.DOMElement.insertAdjacentHTML("BeforeEnd",_116);
}
};
CGContextDrawPath=function(_11c,_11d){
if(!_11c||CGPathIsEmpty(_11c.path)){
return;
}
var _11e=_11c.path.elements,i=0,_120=_11c.path.count,_121=_11c.gState,fill=(_11d==kCGPathFill||_11d==kCGPathFillStroke)?1:0,_123=(_11d==kCGPathStroke||_11d==kCGPathFillStroke)?1:0,_124=_121.alpha,vml=["<cg_vml_:shape"," fillcolor=\"",_121.fillStyle,"\" filled=\"",_108[fill],"\" style=\"position:absolute;width:",W,";height:",H,";\" coordorigin=\"0 0\" coordsize=\"",Z*W," ",Z*H,"\" stroked=\"",_108[_123],"\" strokeweight=\"",_121.lineWidth,"\" strokecolor=\"",_121.strokeStyle,"\" path=\""];
for(;i<_120;++i){
var _126=_11e[i],type=_126.type;
switch(type){
case kCGPathElementMoveToPoint:
case kCGPathElementAddLineToPoint:
vml.push(_10b[type],(ROUND(Z*(_126.x)-Z_2)),",",(ROUND(Z*(_126.y)-Z_2)));
break;
case kCGPathElementAddQuadCurveToPoint:
vml.push(_10b[type],(ROUND(Z*(_126.cpx)-Z_2)),",",(ROUND(Z*(_126.cpy)-Z_2)),",",(ROUND(Z*(_126.x)-Z_2)),",",(ROUND(Z*(_126.y)-Z_2)));
break;
case kCGPathElementAddCurveToPoint:
vml.push(_10b[type],(ROUND(Z*(_126.cp1x)-Z_2)),",",(ROUND(Z*(_126.cp1y)-Z_2)),",",(ROUND(Z*(_126.cp2x)-Z_2)),",",(ROUND(Z*(_126.cp2y)-Z_2)),",",(ROUND(Z*(_126.x)-Z_2)),",",(ROUND(Z*(_126.y)-Z_2)));
break;
case kCGPathElementCloseSubpath:
vml.push(_10b[type]);
break;
case kCGPathElementAddArc:
var x=_126.x,y=_126.y,_12a=_126.radius,_12b=_126.clockwise?1:0,_12c=_126.endAngle,_12d=_126.startAngle,_12e={x:x+_12a*COS(_12d),y:y+_12a*SIN(_12d)};
if(_12d==_12c&&!_12b){
vml.push(_10b[kCGPathElementMoveToPoint],(ROUND(Z*(_12e.x)-Z_2)),",",(ROUND(Z*(_12e.y)-Z_2)));
continue;
}
var end={x:x+_12a*COS(_12c),y:y+_12a*SIN(_12c)};
if(_12b&&_12d!=_12c&&(_12e.x==end.x&&_12e.y==end.y)){
if(_12e.x>=x){
if(_12e.y<y){
_12e.x+=0.125;
}else{
_12e.y+=0.125;
}
}else{
if(end.y<=y){
end.x+=0.125;
}else{
end.y+=0.125;
}
}
}
vml.push(_10b[type][_12b],(ROUND(Z*(x-_12a)-Z_2)),",",(ROUND(Z*(y-_12a)-Z_2))," ",(ROUND(Z*(x+_12a)-Z_2)),",",(ROUND(Z*(y+_12a)-Z_2))," ",(ROUND(Z*(_12e.x)-Z_2)),",",(ROUND(Z*(_12e.y)-Z_2))," ",(ROUND(Z*(end.x)-Z_2)),",",(ROUND(Z*(end.y)-Z_2)));
break;
case kCGPathElementAddArcTo:
break;
}
}
vml.push("\">");
if(fill){
vml.push("<cg_vml_:fill color=\"",_121.fillStyle,"\" opacity=\"",_124,"\" />");
}
if(_123){
vml.push("<cg_vml_:stroke opacity=\"",_124,"\" joinstyle=\"",_10a[_121.lineJoin],"\" miterlimit=\"",_121.miterLimit,"\" endcap=\"",_109[_121.lineCap],"\" weight=\"",_121.lineWidth,"","px\" color=\"",_121.strokeStyle,"\" />");
}
var _130=_121.shadowColor;
if(_130){
var _131=_121.shadowOffset;
vml.push("<cg_vml_:shadow on=\"t\" offset=\"",_131.width,"pt ",_131.height,"pt\" opacity=\"",objj_msgSend(_130,"alphaComponent"),"\" color=black />");
}
vml.push("</cg_vml_:shape>");
_11c.path=NULL;
if(_11c.buffer!=nil){
_11c.buffer+=vml.join("");
}else{
_11c.DOMElement.insertAdjacentHTML("BeforeEnd",vml.join(""));
}
};
}
}
p;12;CGGeometry.jc;5073;
CGPointMake=function(x,y){
return {x:x,y:y};
};
CGPointMakeZero=function(){
return {x:0,y:0};
};
CGPointMakeCopy=function(_3){
return {x:_3.x,y:_3.y};
};
CGPointCreateCopy=function(_4){
return {x:_4.x,y:_4.y};
};
CGPointEqualToPoint=function(_5,_6){
return (_5.x==_6.x&&_5.y==_6.y);
};
CGStringFromPoint=function(_7){
return ("{"+_7.x+", "+_7.y+"}");
};
CGSizeMake=function(_8,_9){
return {width:_8,height:_9};
};
CGSizeMakeZero=function(){
return {width:0,height:0};
};
CGSizeMakeCopy=function(_a){
return {width:_a.width,height:_a.height};
};
CGSizeCreateCopy=function(_b){
return {width:_b.width,height:_b.height};
};
CGSizeEqualToSize=function(_c,_d){
return (_c.width==_d.width&&_c.height==_d.height);
};
CGStringFromSize=function(_e){
return ("{"+_e.width+", "+_e.height+"}");
};
CGRectMake=function(x,y,_11,_12){
return {origin:{x:x,y:y},size:{width:_11,height:_12}};
};
CGRectMakeZero=function(){
return {origin:{x:0,y:0},size:{width:0,height:0}};
};
CGRectMakeCopy=function(_13){
return {origin:{x:_13.origin.x,y:_13.origin.y},size:{width:_13.size.width,height:_13.size.height}};
};
CGRectCreateCopy=function(_14){
return {origin:{x:_14.origin.x,y:_14.origin.y},size:{width:_14.size.width,height:_14.size.height}};
};
CGRectEqualToRect=function(_15,_16){
return ((_15.origin.x==_16.origin.x&&_15.origin.y==_16.origin.y)&&(_15.size.width==_16.size.width&&_15.size.height==_16.size.height));
};
CGStringFromRect=function(_17){
return ("{"+("{"+_17.origin.x+", "+_17.origin.y+"}")+", "+("{"+_17.size.width+", "+_17.size.height+"}")+"}");
};
CGRectOffset=function(_18,dX,dY){
return {origin:{x:_18.origin.x+dX,y:_18.origin.y+dY},size:{width:_18.size.width,height:_18.size.height}};
};
CGRectInset=function(_1b,dX,dY){
return {origin:{x:_1b.origin.x+dX,y:_1b.origin.y+dY},size:{width:_1b.size.width-2*dX,height:_1b.size.height-2*dY}};
};
CGRectGetHeight=function(_1e){
return (_1e.size.height);
};
CGRectGetMaxX=function(_1f){
return (_1f.origin.x+_1f.size.width);
};
CGRectGetMaxY=function(_20){
return (_20.origin.y+_20.size.height);
};
CGRectGetMidX=function(_21){
return (_21.origin.x+(_21.size.width)/2);
};
CGRectGetMidY=function(_22){
return (_22.origin.y+(_22.size.height)/2);
};
CGRectGetMinX=function(_23){
return (_23.origin.x);
};
CGRectGetMinY=function(_24){
return (_24.origin.y);
};
CGRectGetWidth=function(_25){
return (_25.size.width);
};
CGRectIsEmpty=function(_26){
return (_26.size.width<=0||_26.size.height<=0);
};
CGRectIsNull=function(_27){
return (_27.size.width<=0||_27.size.height<=0);
};
CGRectContainsPoint=function(_28,_29){
return (_29.x>=(_28.origin.x)&&_29.y>=(_28.origin.y)&&_29.x<(_28.origin.x+_28.size.width)&&_29.y<(_28.origin.y+_28.size.height));
};
CGRectContainsRect=function(_2a,_2b){
var _2c=CGRectUnion(_2a,_2b);
return ((_2c.origin.x==_2a.origin.x&&_2c.origin.y==_2a.origin.y)&&(_2c.size.width==_2a.size.width&&_2c.size.height==_2a.size.height));
};
CGRectIntersectsRect=function(_2d,_2e){
var _2f=CGRectIntersection(_2d,_2e);
return !(_2f.size.width<=0||_2f.size.height<=0);
};
CGRectIntegral=function(_30){
_30=CGRectStandardize(_30);
var x=FLOOR((_30.origin.x)),y=FLOOR((_30.origin.y));
_30.size.width=CEIL((_30.origin.x+_30.size.width))-x;
_30.size.height=CEIL((_30.origin.y+_30.size.height))-y;
_30.origin.x=x;
_30.origin.y=y;
return _30;
};
CGRectIntersection=function(_33,_34){
var _35={origin:{x:MAX((_33.origin.x),(_34.origin.x)),y:MAX((_33.origin.y),(_34.origin.y))},size:{width:0,height:0}};
_35.size.width=MIN((_33.origin.x+_33.size.width),(_34.origin.x+_34.size.width))-(_35.origin.x);
_35.size.height=MIN((_33.origin.y+_33.size.height),(_34.origin.y+_34.size.height))-(_35.origin.y);
return (_35.size.width<=0||_35.size.height<=0)?{origin:{x:0,y:0},size:{width:0,height:0}}:_35;
};
CGRectStandardize=function(_36){
var _37=(_36.size.width),_38=(_36.size.height),_39=_36;
if(_37<0){
if(_39==_36){
_39={origin:{x:_36.origin.x,y:_36.origin.y},size:{width:_36.size.width,height:_36.size.height}};
}
_39.origin.x+=_37;
_39.size.width=-_37;
}
if(_38<0){
if(_39==_36){
_39={origin:{x:_36.origin.x,y:_36.origin.y},size:{width:_36.size.width,height:_36.size.height}};
}
_39.origin.y+=_38;
_39.size.height=-_38;
}
return _39;
};
CGRectUnion=function(_3a,_3b){
var _3c=MIN((_3a.origin.x),(_3b.origin.x)),_3d=MIN((_3a.origin.y),(_3b.origin.y)),_3e=MAX((_3a.origin.x+_3a.size.width),(_3b.origin.x+_3b.size.width)),_3f=MAX((_3a.origin.y+_3a.size.height),(_3b.origin.y+_3b.size.height));
return {origin:{x:_3c,y:_3d},size:{width:_3e-_3c,height:_3f-_3d}};
};
CGPointFromString=function(_40){
var _41=_40.indexOf(",");
return {x:parseInt(_40.substr(1,_41-1)),y:parseInt(_40.substring(_41+1,_40.length))};
};
CGSizeFromString=function(_42){
var _43=_42.indexOf(",");
return {width:parseInt(_42.substr(1,_43-1)),height:parseInt(_42.substring(_43+1,_42.length))};
};
CGRectFromString=function(_44){
var _45=_44.indexOf(",",_44.indexOf(",")+1);
return {origin:CGPointFromString(_44.substr(1,_45-1)),size:CGSizeFromString(_44.substring(_45+2,_44.length))};
};
CGPointFromEvent=function(_46){
return {x:_46.clientX,y:_46.clientY};
};
p;12;CGGradient.ji;9;CGColor.ji;14;CGColorSpace.jc;497;
kCGGradientDrawsBeforeStartLocation=1<<0;
kCGGradientDrawsAfterEndLocation=1<<1;
CGGradientCreateWithColorComponents=function(_1,_2,_3,_4){
if(arguments["count"]==NULL){
var _4=_3.length;
}
var _5=[];
while(_4--){
var _6=_4*4;
_5[_4]=CGColorCreate(_1,_2.slice(_6,_6+4));
}
return CGGradientCreateWithColors(_1,_5,_3);
};
CGGradientCreateWithColors=function(_7,_8,_9){
return {colorspace:_7,colors:_8,locations:_9};
};
CGGradientRelease=function(){
};
CGGradientRetain=function(_a){
return _a;
};
p;8;CGPath.ji;12;CGGeometry.ji;19;CGAffineTransform.jc;5005;
kCGPathElementMoveToPoint=0;
kCGPathElementAddLineToPoint=1;
kCGPathElementAddQuadCurveToPoint=2;
kCGPathElementAddCurveToPoint=3;
kCGPathElementCloseSubpath=4;
kCGPathElementAddArc=5;
kCGPathElementAddArcToPoint=6;
CGPathCreateMutable=function(){
return {count:0,start:NULL,current:NULL,elements:[]};
};
CGPathCreateMutableCopy=function(_1){
var _2=CGPathCreateMutable();
CGPathAddPath(_2,_1);
return _2;
};
CGPathCreateCopy=function(_3){
return CGPathCreateMutableCopy(_3);
};
CGPathRelease=function(_4){
};
CGPathRetain=function(_5){
return _5;
};
CGPathAddArc=function(_6,_7,x,y,_a,_b,_c,_d){
if(_7&&!(_7.a==1&&_7.b==0&&_7.c==0&&_7.d==1&&_7.tx==0&&_7.ty==0)){
var _e={x:x,y:y},_f={x:COS(_c),y:SIN(_c)},_10={x:COS(_b),y:SIN(_b)};
_f={x:_f.x*_7.a+_f.y*_7.c+_7.tx,y:_f.x*_7.b+_f.y*_7.d+_7.ty};
_10={x:_10.x*_7.a+_10.y*_7.c+_7.tx,y:_10.x*_7.b+_10.y*_7.d+_7.ty};
_e={x:_e.x*_7.a+_e.y*_7.c+_7.tx,y:_e.x*_7.b+_e.y*_7.d+_7.ty};
x=_e.x;
y=_e.y;
var _11=_c,_12=_b;
_c=ATAN2(_f.y-_7.ty,_f.x-_7.tx);
_b=ATAN2(_10.y-_7.ty,_10.x-_7.tx);
if(_c==_b&&_11!=_12){
if(_12>_11){
_c=_c-PI2;
}else{
_b=_b-PI2;
}
}
_a={width:_a,height:0};
_a={width:_a.width*_7.a+_a.height*_7.c,height:_a.width*_7.b+_a.height*_7.d};
_a=SQRT(_a.width*_a.width+_a.height*_a.height);
}
_6.current={x:x+_a*COS(_c),y:y+_a*SIN(_c)};
_6.elements[_6.count++]={type:kCGPathElementAddArc,x:x,y:y,radius:_a,startAngle:_b,endAngle:_c};
};
CGPathAddArcToPoint=function(_13,_14,x1,y1,x2,y2,_19){
};
CGPathAddCurveToPoint=function(_1a,_1b,_1c,_1d,_1e,_1f,x,y){
var cp1={x:_1c,y:_1d},cp2={x:_1e,y:_1f},end={x:x,y:y};
if(_1b){
cp1={x:cp1.x*_1b.a+cp1.y*_1b.c+_1b.tx,y:cp1.x*_1b.b+cp1.y*_1b.d+_1b.ty};
cp2={x:cp2.x*_1b.a+cp2.y*_1b.c+_1b.tx,y:cp2.x*_1b.b+cp2.y*_1b.d+_1b.ty};
end={x:end.x*_1b.a+end.y*_1b.c+_1b.tx,y:end.x*_1b.b+end.y*_1b.d+_1b.ty};
}
_1a.current=end;
_1a.elements[_1a.count++]={type:kCGPathElementAddCurveToPoint,cp1x:cp1.x,cp1y:cp1.y,cp2x:cp2.x,cp2y:cp2.y,x:end.x,y:end.y};
};
CGPathAddLines=function(_25,_26,_27,_28){
var i=1;
if(arguments["count"]==NULL){
var _28=_27.length;
}
if(!_25||_28<2){
return;
}
CGPathMoveToPoint(_25,_26,_27[0].x,_27[0].y);
for(;i<_28;++i){
CGPathAddLineToPoint(_25,_26,_27[i].x,_27[i].y);
}
};
CGPathAddLineToPoint=function(_2a,_2b,x,y){
var _2e={x:x,y:y};
if(_2b!=NULL){
_2e={x:_2e.x*_2b.a+_2e.y*_2b.c+_2b.tx,y:_2e.x*_2b.b+_2e.y*_2b.d+_2b.ty};
}
_2a.elements[_2a.count++]={type:kCGPathElementAddLineToPoint,x:_2e.x,y:_2e.y};
_2a.current=_2e;
};
CGPathAddPath=function(_2f,_30,_31){
var i=0,_33=_31.count;
for(;i<_33;++i){
var _34=_31[i];
_2f.elements[_2f.count++]={type:_34.type,points:_34.point.slice()};
if(_34.type==kCGPathElementAddArc||_34.type==kCGPathElementAddArcToPoint){
_2f.elements[_2f.count-1].radius=_34.radius;
}
}
_2f.current=_31.current;
};
CGPathAddQuadCurveToPoint=function(_35,_36,cpx,cpy,x,y){
var cp={x:cpx,y:cpy},end={x:x,y:y};
if(_36){
cp={x:control.x*_36.a+control.y*_36.c+_36.tx,y:control.x*_36.b+control.y*_36.d+_36.ty};
end={x:end.x*_36.a+end.y*_36.c+_36.tx,y:end.x*_36.b+end.y*_36.d+_36.ty};
}
_35.elements[_35.count++]={type:kCGPathElementAddQuadCurveToPoint,cpx:cp.x,cpy:cp.y,x:end.x,y:end.y};
_35.current=end;
};
CGPathAddRect=function(_3d,_3e,_3f){
CGPathAddRects(_3d,_3e,[_3f],1);
};
CGPathAddRects=function(_40,_41,_42,_43){
var i=0;
if(arguments["count"]==NULL){
var _43=_42.length;
}
for(;i<_43;++i){
var _45=_42[i];
CGPathMoveToPoint(_40,_41,(_45.origin.x),(_45.origin.y));
CGPathAddLineToPoint(_40,_41,(_45.origin.x+_45.size.width),(_45.origin.y));
CGPathAddLineToPoint(_40,_41,(_45.origin.x+_45.size.width),(_45.origin.y+_45.size.height));
CGPathAddLineToPoint(_40,_41,(_45.origin.x),(_45.origin.y+_45.size.height));
CGPathCloseSubpath(_40);
}
};
CGPathMoveToPoint=function(_46,_47,x,y){
var _4a={x:x,y:y},_4b=_46.count;
if(_47!=NULL){
_4a={x:_4a.x*_47.a+_4a.y*_47.c+_47.tx,y:_4a.x*_47.b+_4a.y*_47.d+_47.ty};
}
_46.start=_4a;
_46.current=_4a;
var _4c=_46.elements[_4b-1];
if(_4b!=0&&_4c.type==kCGPathElementMoveToPoint){
_4c.x=_4a.x;
_4c.y=_4a.y;
}else{
_46.elements[_46.count++]={type:kCGPathElementMoveToPoint,x:_4a.x,y:_4a.y};
}
};
CGPathCloseSubpath=function(_4d){
var _4e=_4d.count;
if(_4e==0||_4d.elements[_4e-1].type==kCGPathElementCloseSubpath){
return;
}
_4d.elements[_4d.count++]={type:kCGPathElementCloseSubpath,points:[_4d.start]};
};
CGPathEqualToPath=function(_4f,_50){
if(_4f==_50){
return YES;
}
if(_4f.count!=_50.count||!(_4f.start.x==_50.start.x&&_4f.start.y==_50.start.y)||!(_4f.current.x==_50.current.x&&_4f.current.y==_50.current.y)){
return NO;
}
var i=0,_52=_4f.count;
for(;i<_52;++i){
var _53=_4f[i],_54=_50[i];
if(_53.type!=_54.type){
return NO;
}
if((_53.type==kCGPathElementAddArc||_53.type==kCGPathElementAddArcToPoint)&&_53.radius!=_54.radius){
return NO;
}
var j=_53.points.length;
while(j--){
if(!(_53.points[j].x==_54.points[j].x&&_53.points[j].y==_54.points[j].y)){
return NO;
}
}
}
return YES;
};
CGPathGetCurrentPoint=function(_56){
return {x:_56.current.x,y:_56.current.y};
};
CGPathIsEmpty=function(_57){
return !_57||_57.count==0;
};
p;9;CPAlert.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;22;AppKit/CPApplication.jI;17;AppKit/CPButton.jI;16;AppKit/CPColor.jI;15;AppKit/CPFont.jI;16;AppKit/CPImage.jI;20;AppKit/CPImageView.jI;16;AppKit/CPPanel.jI;20;AppKit/CPTextField.jc;4166;
CPWarningAlertStyle=0;
CPInformationalAlertStyle=1;
CPCriticalAlertStyle=2;
var _1,_2,_3;
var _4=objj_allocateClassPair(CPObject,"CPAlert"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_alertPanel"),new objj_ivar("_messageLabel"),new objj_ivar("_alertImageView"),new objj_ivar("_alertStyle"),new objj_ivar("_buttonCount"),new objj_ivar("_delegate")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("init"),function(_6,_7){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPObject")},"init");
if(_6){
_buttonCount=0;
_alertStyle=CPWarningAlertStyle;
_alertPanel=objj_msgSend(objj_msgSend(CPPanel,"alloc"),"initWithContentRect:styleMask:",CGRectMake(0,0,300,150),CPHUDBackgroundWindowMask|CPTitledWindowMask);
objj_msgSend(_alertPanel,"setFloatingPanel:",YES);
objj_msgSend(_alertPanel,"center");
_messageLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(70,10,200,100));
objj_msgSend(_messageLabel,"setFont:",objj_msgSend(CPFont,"fontWithName:size:","Helvetica Neue",12));
objj_msgSend(_messageLabel,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_messageLabel,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(objj_msgSend(_alertPanel,"contentView"),"addSubview:",_messageLabel);
_alertImageView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(25,12,32,32));
objj_msgSend(objj_msgSend(_alertPanel,"contentView"),"addSubview:",_alertImageView);
}
return _6;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_8,_9,_a){
with(_8){
_delegate=_a;
}
}),new objj_method(sel_getUid("delegate"),function(_b,_c){
with(_b){
return _delegate;
}
}),new objj_method(sel_getUid("setAlertStyle:"),function(_d,_e,_f){
with(_d){
_alertStyle=_f;
}
}),new objj_method(sel_getUid("alertStyle"),function(_10,_11){
with(_10){
return _alertStyle;
}
}),new objj_method(sel_getUid("setMessageText:"),function(_12,_13,_14){
with(_12){
objj_msgSend(_messageLabel,"setStringValue:",_14);
}
}),new objj_method(sel_getUid("messageText"),function(_15,_16){
with(_15){
return objj_msgSend(_messageLabel,"stringValue");
}
}),new objj_method(sel_getUid("addButtonWithTitle:"),function(_17,_18,_19){
with(_17){
var _1a=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(190-(_buttonCount*90),80,80,18));
objj_msgSend(_1a,"setTitle:",_19);
objj_msgSend(_1a,"setTarget:",_17);
objj_msgSend(_1a,"setTag:",_buttonCount);
objj_msgSend(_1a,"setBezelStyle:",CPHUDBezelStyle);
objj_msgSend(_1a,"setAction:",sel_getUid("_notifyDelegate:"));
objj_msgSend(objj_msgSend(_alertPanel,"contentView"),"addSubview:",_1a);
_buttonCount++;
}
}),new objj_method(sel_getUid("runModal"),function(_1b,_1c){
with(_1b){
switch(_alertStyle){
case CPWarningAlertStyle:
objj_msgSend(_alertImageView,"setImage:",_1);
break;
case CPInformationalAlertStyle:
objj_msgSend(_alertImageView,"setImage:",_2);
break;
case CPCriticalAlertStyle:
objj_msgSend(_alertImageView,"setImage:",_3);
break;
}
objj_msgSend(CPApp,"runModalForWindow:",_alertPanel);
}
}),new objj_method(sel_getUid("_notifyDelegate:"),function(_1d,_1e,_1f){
with(_1d){
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("alertDidEnd:returnCode:"))){
objj_msgSend(_delegate,"alertDidEnd:returnCode:",_1d,objj_msgSend(_1f,"tag"));
}
objj_msgSend(CPApp,"abortModal");
objj_msgSend(_alertPanel,"close");
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("initialize"),function(_20,_21){
with(_20){
if(_20!=CPAlert){
return;
}
var _22=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_20,"class"));
_1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_22,"pathForResource:","CPAlert/dialog-warning.png"),CGSizeMake(32,32));
_2=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_22,"pathForResource:","CPAlert/dialog-information.png"),CGSizeMake(32,32));
_3=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_22,"pathForResource:","CPAlert/dialog-error.png"),CGSizeMake(32,32));
}
})]);
p;13;CPAnimation.jI;21;Foundation/CPObject.ji;23;CAMediaTimingFunction.jc;4092;
CPAnimationEaseInOut=0;
CPAnimationEaseIn=1;
CPAnimationEaseOut=2;
CPAnimationLinear=3;
ACTUAL_FRAME_RATE=0;
var _1=objj_allocateClassPair(CPObject,"CPAnimation"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_startTime"),new objj_ivar("_duration"),new objj_ivar("_animationCurve"),new objj_ivar("_timingFunction"),new objj_ivar("_frameRate"),new objj_ivar("_progress"),new objj_ivar("_delegate"),new objj_ivar("_timer")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithDuration:animationCurve:"),function(_3,_4,_5,_6){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_duration=MAX(0,_5);
_animationCurve=_6;
_frameRate=60;
}
return _3;
}
}),new objj_method(sel_getUid("setAnimationCurve:"),function(_7,_8,_9){
with(_7){
_animationCurve=_9;
var _a=kCAMediaTimingFunctionLinear;
switch(_animationCurve){
case CPAnimationEaseInOut:
_a=kCAMediaTimingFunctionEaseInEaseOut;
break;
case CPAnimationEaseIn:
_a=kCAMediaTimingFunctionEaseIn;
break;
case CPAnimationEaseOut:
_a=kCAMediaTimingFunctionEaseOut;
break;
default:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid value provided for animation curve");
break;
}
_timingFunction=objj_msgSend(CAMediaTimingFunction,"functionWithName:",_a);
}
}),new objj_method(sel_getUid("animationCurve"),function(_b,_c){
with(_b){
return _animationCurve;
}
}),new objj_method(sel_getUid("setDuration:"),function(_d,_e,_f){
with(_d){
if(_f<0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"aDuration can't be negative");
}
_duration=_f;
}
}),new objj_method(sel_getUid("duration"),function(_10,_11){
with(_10){
return _duration;
}
}),new objj_method(sel_getUid("setFrameRate:"),function(_12,_13,_14){
with(_12){
if(_14<0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"frameRate can't be negative");
}
_frameRate=_14;
}
}),new objj_method(sel_getUid("frameRate"),function(_15,_16){
with(_15){
return _frameRate;
}
}),new objj_method(sel_getUid("delegate"),function(_17,_18){
with(_17){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_19,_1a,_1b){
with(_19){
_delegate=_1b;
}
}),new objj_method(sel_getUid("startAnimation"),function(_1c,_1d){
with(_1c){
if(_timer||_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("animationShouldStart"))&&!objj_msgSend(_delegate,"animationShouldStart:",_1c)){
return;
}
_progress=0;
ACTUAL_FRAME_RATE=0;
_startTime=new Date();
_timer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0,_1c,sel_getUid("animationTimerDidFire:"),nil,YES);
}
}),new objj_method(sel_getUid("animationTimerDidFire:"),function(_1e,_1f,_20){
with(_1e){
var _21=new Date()-_startTime,_22=MIN(1,1-(_duration-_21/1000)/_duration);
++ACTUAL_FRAME_RATE;
objj_msgSend(_1e,"setCurrentProgress:",_22);
if(_22===1){
objj_msgSend(_timer,"invalidate");
_timer=nil;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("animationDidEnd:"))){
objj_msgSend(_delegate,"animationDidEnd:",_1e);
}
}
}
}),new objj_method(sel_getUid("stopAnimation"),function(_23,_24){
with(_23){
if(!_timer){
return;
}
objj_msgSend(_timer,"invalidate");
_timer=nil;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("animationDidStop:"))){
objj_msgSend(_delegate,"animationDidStop:",_23);
}
}
}),new objj_method(sel_getUid("isAnimating"),function(_25,_26){
with(_25){
return _timer;
}
}),new objj_method(sel_getUid("setCurrentProgress:"),function(_27,_28,_29){
with(_27){
_progress=_29;
}
}),new objj_method(sel_getUid("currentProgress"),function(_2a,_2b){
with(_2a){
return _progress;
}
}),new objj_method(sel_getUid("currentValue"),function(_2c,_2d){
with(_2c){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("animation:valueForProgress:"))){
return objj_msgSend(_delegate,"animation:valueForProgress:",_2c,_progress);
}
if(_animationCurve==CPAnimationLinear){
return _progress;
}
alert("IMPLEMENT ANIMATION CURVES!!!");
}
})]);
p;15;CPApplication.jI;21;Foundation/CPBundle.ji;17;CPCompatibility.ji;9;CPEvent.ji;8;CPMenu.ji;13;CPResponder.ji;22;CPDocumentController.jc;14553;
CPApp=nil;
CPApplicationWillFinishLaunchingNotification="CPApplicationWillFinishLaunchingNotification";
CPApplicationDidFinishLaunchingNotification="CPApplicationDidFinishLaunchingNotification";
CPRunStoppedResponse=-1000;
CPRunAbortedResponse=-1001;
CPRunContinuesResponse=-1002;
var _1=objj_allocateClassPair(CPResponder,"CPApplication"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_eventListeners"),new objj_ivar("_currentEvent"),new objj_ivar("_windows"),new objj_ivar("_keyWindow"),new objj_ivar("_mainWindow"),new objj_ivar("_mainMenu"),new objj_ivar("_documentController"),new objj_ivar("_currentSession"),new objj_ivar("_delegate"),new objj_ivar("_namedArgs"),new objj_ivar("_args")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPResponder")},"init");
if(_3){
_eventListeners=[];
_windows=[];
objj_msgSend(_windows,"addObject:",nil);
_mainMenu=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","MainMenu");
objj_msgSend(_mainMenu,"setAutoenablesItems:",NO);
var _5=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPApplication,"class")),_6=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","New",sel_getUid("newDocument:"),"N");
objj_msgSend(_6,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_5,"pathForResource:","CPApplication/New.png"),CGSizeMake(16,16)));
objj_msgSend(_6,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_5,"pathForResource:","CPApplication/NewHighlighted.png"),CGSizeMake(16,16)));
objj_msgSend(_mainMenu,"addItem:",_6);
var _7=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Open",sel_getUid("openDocument:"),"O");
objj_msgSend(_7,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_5,"pathForResource:","CPApplication/Open.png"),CGSizeMake(16,16)));
objj_msgSend(_7,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_5,"pathForResource:","CPApplication/OpenHighlighted.png"),CGSizeMake(16,16)));
objj_msgSend(_mainMenu,"addItem:",_7);
var _8=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","Save"),_9=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Save",sel_getUid("saveDocument:"),"");
objj_msgSend(_9,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_5,"pathForResource:","CPApplication/Save.png"),CGSizeMake(16,16)));
objj_msgSend(_9,"setAlternateImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_5,"pathForResource:","CPApplication/SaveHighlighted.png"),CGSizeMake(16,16)));
objj_msgSend(_8,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Save",sel_getUid("saveDocument:"),"S"));
objj_msgSend(_8,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Save As",sel_getUid("saveDocumentAs:"),""));
objj_msgSend(_9,"setSubmenu:",_8);
objj_msgSend(_mainMenu,"addItem:",_9);
var _a=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Edit",nil,""),_b=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","Edit"),_c=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Undo",sel_getUid("undo:"),CPUndoKeyEquivalent),_d=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Redo",sel_getUid("redo:"),CPRedoKeyEquivalent);
objj_msgSend(_c,"setKeyEquivalentModifierMask:",CPUndoKeyEquivalentModifierMask);
objj_msgSend(_d,"setKeyEquivalentModifierMask:",CPRedoKeyEquivalentModifierMask);
objj_msgSend(_b,"addItem:",_c);
objj_msgSend(_b,"addItem:",_d);
objj_msgSend(_b,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Cut",sel_getUid("cut:"),"X")),objj_msgSend(_b,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Copy",sel_getUid("copy:"),"C")),objj_msgSend(_b,"addItem:",objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Paste",sel_getUid("paste:"),"V"));
objj_msgSend(_a,"setSubmenu:",_b);
objj_msgSend(_a,"setHidden:",YES);
objj_msgSend(_mainMenu,"addItem:",_a);
objj_msgSend(_mainMenu,"addItem:",objj_msgSend(CPMenuItem,"separatorItem"));
}
return _3;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_e,_f,_10){
with(_e){
if(_delegate==_10){
return;
}
var _11=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
objj_msgSend(_11,"removeObserver:name:object:",_delegate,CPApplicationWillFinishLaunchingNotification,_e);
objj_msgSend(_11,"removeObserver:name:object:",_delegate,CPApplicationDidFinishLaunchingNotification,_e);
}
_delegate=_10;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("applicationWillFinishLaunching:"))){
objj_msgSend(_11,"addObserver:selector:name:object:",_delegate,sel_getUid("applicationWillFinishLaunching:"),CPApplicationWillFinishLaunchingNotification,_e);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("applicationDidFinishLaunching:"))){
objj_msgSend(_11,"addObserver:selector:name:object:",_delegate,sel_getUid("applicationDidFinishLaunching:"),CPApplicationDidFinishLaunchingNotification,_e);
}
}
}),new objj_method(sel_getUid("delegate"),function(_12,_13){
with(_12){
return _delegate;
}
}),new objj_method(sel_getUid("finishLaunching"),function(_14,_15){
with(_14){
var _16=objj_msgSend(CPBundle,"mainBundle"),_17=objj_msgSend(_16,"objectForInfoDictionaryKey:","CPBundleDocumentTypes");
if(objj_msgSend(_17,"count")>0){
_documentController=objj_msgSend(CPDocumentController,"sharedDocumentController");
}
var _18=objj_msgSend(_16,"objectForInfoDictionaryKey:","CPApplicationDelegateClass");
if(_18){
var _19=objj_getClass(_18);
if(_19){
if(objj_msgSend(_documentController,"class")==_19){
objj_msgSend(_14,"setDelegate:",_documentController);
}else{
objj_msgSend(_14,"setDelegate:",objj_msgSend(objj_msgSend(_19,"alloc"),"init"));
}
}
}
var _1a=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_1a,"postNotificationName:object:",CPApplicationWillFinishLaunchingNotification,_14);
if(_documentController){
objj_msgSend(_documentController,"newDocument:",_14);
}
objj_msgSend(_1a,"postNotificationName:object:",CPApplicationDidFinishLaunchingNotification,_14);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("run"),function(_1b,_1c){
with(_1b){
objj_msgSend(_1b,"finishLaunching");
}
}),new objj_method(sel_getUid("runModalForWindow:"),function(_1d,_1e,_1f){
with(_1d){
objj_msgSend(_1d,"runModalSession:",objj_msgSend(_1d,"beginModalSessionForWindow:",_1f));
}
}),new objj_method(sel_getUid("stopModalWithCode:"),function(_20,_21,_22){
with(_20){
if(!_currentSession){
return;
}
_currentSession._state=_22;
_currentSession=_currentSession._previous;
if(_22==CPRunAbortedResponse){
objj_msgSend(_20,"_removeRunModalLoop");
}
}
}),new objj_method(sel_getUid("_removeRunModalLoop"),function(_23,_24){
with(_23){
var _25=_eventListeners.length;
while(_25--){
if(_eventListeners[_25]._callback==_26){
_eventListeners.splice(_25,1);
return;
}
}
}
}),new objj_method(sel_getUid("stopModal"),function(_27,_28){
with(_27){
objj_msgSend(_27,"stopModalWithCode:",CPRunStoppedResponse);
}
}),new objj_method(sel_getUid("abortModal"),function(_29,_2a){
with(_29){
objj_msgSend(_29,"stopModalWithCode:",CPRunAbortedResponse);
}
}),new objj_method(sel_getUid("beginModalSessionForWindow:"),function(_2b,_2c,_2d){
with(_2b){
return _2e(_2d,0);
}
}),new objj_method(sel_getUid("runModalSession:"),function(_2f,_30,_31){
with(_2f){
_31._previous=_currentSession;
_currentSession=_31;
var _32=_31._window;
objj_msgSend(_32,"center");
objj_msgSend(_32,"makeKeyAndOrderFront:",_2f);
objj_msgSend(CPApp,"setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:",_26,CPAnyEventMask,nil,0,NO);
}
}),new objj_method(sel_getUid("modalWindow"),function(_33,_34){
with(_33){
if(!_currentSession){
return nil;
}
return _currentSession._window;
}
}),new objj_method(sel_getUid("_handleKeyEquivalent:"),function(_35,_36,_37){
with(_35){
if(objj_msgSend(_mainMenu,"performKeyEquivalent:",_37)){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("sendEvent:"),function(_38,_39,_3a){
with(_38){
if(objj_msgSend(_3a,"type")==CPKeyDown&&objj_msgSend(_3a,"modifierFlags")&(CPCommandKeyMask|CPControlKeyMask)&&objj_msgSend(objj_msgSend(_3a,"characters"),"length")>0&&objj_msgSend(_38,"_handleKeyEquivalent:",_3a)){
return;
}
if(_eventListeners.length){
if(_eventListeners[_eventListeners.length-1]._mask&(1<<objj_msgSend(_3a,"type"))){
_eventListeners.pop()._callback(_3a);
}
return;
}
objj_msgSend(objj_msgSend(_3a,"window"),"sendEvent:",_3a);
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_3b,_3c,_3d){
with(_3b){
if(objj_msgSend(_delegate,"respondsToSelector:",_3d)){
objj_msgSend(_delegate,"performSelector:",_3d);
}else{
objj_msgSendSuper({receiver:_3b,super_class:objj_getClass("CPResponder")},"doCommandBySelector:",_3d);
}
}
}),new objj_method(sel_getUid("keyWindow"),function(_3e,_3f){
with(_3e){
return _keyWindow;
}
}),new objj_method(sel_getUid("mainWindow"),function(_40,_41){
with(_40){
return _mainWindow;
}
}),new objj_method(sel_getUid("windowWithWindowNumber:"),function(_42,_43,_44){
with(_42){
return _windows[_44];
}
}),new objj_method(sel_getUid("windows"),function(_45,_46){
with(_45){
return _windows;
}
}),new objj_method(sel_getUid("mainMenu"),function(_47,_48){
with(_47){
return _mainMenu;
}
}),new objj_method(sel_getUid("setMainMenu:"),function(_49,_4a,_4b){
with(_49){
_mainMenu=_4b;
}
}),new objj_method(sel_getUid("tryToPerform:with:"),function(_4c,_4d,_4e,_4f){
with(_4c){
if(!_4e){
return NO;
}
if(objj_msgSend(_4c,"tryToPerform:with:",_4e,_4f)){
return YES;
}
if(objj_msgSend(_delegate,"respondsToSelector:",aSelector)){
objj_msgSend(_delegate,"performSelector:withObject:",aSelector,_4f);
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("sendAction:to:from:"),function(_50,_51,_52,_53,_54){
with(_50){
var _55=objj_msgSend(_50,"targetForAction:to:from:",_52,_53,_54);
if(!_55){
return NO;
}
objj_msgSend(_55,"performSelector:withObject:",_52,_54);
return YES;
}
}),new objj_method(sel_getUid("targetForAction:to:from:"),function(_56,_57,_58,_59,_5a){
with(_56){
if(!_58){
return nil;
}
if(_59){
return _59;
}
return objj_msgSend(_56,"targetForAction:",_58);
}
}),new objj_method(sel_getUid("_targetForWindow:action:"),function(_5b,_5c,_5d,_5e){
with(_5b){
var _5f=objj_msgSend(_5d,"firstResponder"),_60=YES;
while(_5f){
if(objj_msgSend(_5f,"respondsToSelector:",_5e)){
return _5f;
}
if(_5f==_5d){
_60=NO;
}
_5f=objj_msgSend(_5f,"nextResponder");
}
if(_60&&objj_msgSend(_5d,"respondsToSelector:",_5e)){
return _5d;
}
var _61=objj_msgSend(_5d,"delegate");
if(objj_msgSend(_61,"respondsToSelector:",_5e)){
return _61;
}
var _62=objj_msgSend(_5d,"windowController");
if(objj_msgSend(_62,"respondsToSelector:",_5e)){
return _62;
}
var _63=objj_msgSend(_62,"document");
if(_63!=_61&&objj_msgSend(_63,"respondsToSelector:",_5e)){
return _63;
}
return nil;
}
}),new objj_method(sel_getUid("targetForAction:"),function(_64,_65,_66){
with(_64){
if(!_66){
return nil;
}
var _67=objj_msgSend(_64,"_targetForWindow:action:",objj_msgSend(_64,"keyWindow"),_66);
if(_67){
return _67;
}
_67=objj_msgSend(_64,"_targetForWindow:action:",objj_msgSend(_64,"mainWindow"),_66);
if(_67){
return _67;
}
if(objj_msgSend(_64,"respondsToSelector:",_66)){
return _64;
}
if(objj_msgSend(_delegate,"respondsToSelector:",_66)){
return _delegate;
}
if(objj_msgSend(_documentController,"respondsToSelector:",_66)){
return _documentController;
}
return nil;
}
}),new objj_method(sel_getUid("setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:"),function(_68,_69,_6a,_6b,_6c,_6d,_6e){
with(_68){
_eventListeners.push(_6f(_6b,_6a));
if(_eventListeners.length==3){
objj_debug_print_backtrace();
}
}
}),new objj_method(sel_getUid("setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:"),function(_70,_71,_72,_73,_74,_75,_76,_77){
with(_70){
_eventListeners.push(_6f(_74,function(_78){
objj_msgSend(_72,_73,_78);
}));
}
}),new objj_method(sel_getUid("beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:"),function(_79,_7a,_7b,_7c,_7d,_7e,_7f){
with(_79){
objj_msgSend(_7c,"_attachSheet:modalDelegate:didEndSelector:contextInfo:",_7b,_7d,_7e,_7f);
}
}),new objj_method(sel_getUid("arguments"),function(_80,_81){
with(_80){
return _args;
}
}),new objj_method(sel_getUid("namedArguments"),function(_82,_83){
with(_82){
return _namedArgs;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("sharedApplication"),function(_84,_85){
with(_84){
if(!CPApp){
CPApp=objj_msgSend(objj_msgSend(CPApplication,"alloc"),"init");
}
return CPApp;
}
})]);
var _2e=function(_86,_87){
return {_window:_86,_state:CPRunContinuesResponse,_previous:nil};
};
var _6f=function(_88,_89){
return {_mask:_88,_callback:_89};
};
var _26=function(_8a){
objj_msgSend(CPApp,"setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:",_26,CPAnyEventMask,nil,0,NO);
var _8b=objj_msgSend(_8a,"window"),_8c=CPApp._currentSession;
if(_8b==_8c._window||objj_msgSend(_8b,"worksWhenModal")){
objj_msgSend(_8b,"sendEvent:",_8a);
}
if(_8c._state!=CPRunContinuesResponse){
objj_msgSend(CPApp,"_removeRunModalLoop");
}
};
CPApplicationMain=function(_8d,_8e){
var _8f=objj_msgSend(CPBundle,"mainBundle"),_90=objj_msgSend(_8f,"principalClass");
if(!_90){
_90=objj_msgSend(CPApplication,"class");
}
objj_msgSend(_90,"sharedApplication");
if(!_8d&&!_8e){
var _8d=window.location.hash.replace("#","").split("/").slice(0),_91=window.location.search.substring(1).split("&");
_8e=objj_msgSend(CPDictionary,"dictionary");
for(var i=0,_93=_8d.length;i<_93;i++){
_8d[i]=decodeURIComponent(_8d[i]);
}
if(objj_msgSend(_8d,"containsObject:","debug")){
CPLogRegister(CPLogPopup);
}
for(var i=0;i<_91.length;i++){
var _94=_91[i].indexOf("=");
if(_94==-1){
objj_msgSend(_8e,"setObject:forKey:","",_91[i]);
}else{
objj_msgSend(_8e,"setObject:forKey:",_91[i].substring(_94+1),_91[i].substring(0,_94));
}
}
}
CPApp._args=_8d;
CPApp._namedArgs=_8e;
objj_msgSend(CPApp,"run");
};
p;10;CPButton.ji;22;_CPImageAndTitleView.ji;12;CGGeometry.ji;11;CPControl.jc;14434;
CPScaleProportionally=0;
CPScaleToFit=1;
CPScaleNone=2;
CPNoImage=0;
CPImageOnly=1;
CPImageLeft=2;
CPImageRight=3;
CPImageBelow=4;
CPImageAbove=5;
CPImageOverlaps=6;
CPOnState=1;
CPOffState=0;
CPMixedState=-1;
CPRoundedBezelStyle=1;
CPRegularSquareBezelStyle=2;
CPThickSquareBezelStyle=3;
CPThickerSquareBezelStyle=4;
CPDisclosureBezelStyle=5;
CPShadowlessSquareBezelStyle=6;
CPCircularBezelStyle=7;
CPTexturedSquareBezelStyle=8;
CPHelpButtonBezelStyle=9;
CPSmallSquareBezelStyle=10;
CPTexturedRoundedBezelStyle=11;
CPRoundRectBezelStyle=12;
CPRecessedBezelStyle=13;
CPRoundedDisclosureBezelStyle=14;
CPHUDBezelStyle=-1;
CPMomentaryLightButton=0;
CPPushOnPushOffButton=1;
CPToggleButton=2;
CPSwitchButton=3;
CPRadioButton=4;
CPMomentaryChangeButton=5;
CPOnOffButton=6;
CPMomentaryPushInButton=7;
CPMomentaryPushButton=0;
CPMomentaryLight=7;
var _1=nil;
var _2=nil,_3={},_4={},_5="Highlighted";
var _6=objj_allocateClassPair(CPControl,"CPButton"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_tag"),new objj_ivar("_state"),new objj_ivar("_allowsMixedState"),new objj_ivar("_isHighlighted"),new objj_ivar("_image"),new objj_ivar("_alternateImage"),new objj_ivar("_imagePosition"),new objj_ivar("_imageScaling"),new objj_ivar("_title"),new objj_ivar("_alternateTitle"),new objj_ivar("_bezelStyle"),new objj_ivar("_isBordered"),new objj_ivar("_controlSize"),new objj_ivar("_bezelBorderNeedsUpdate"),new objj_ivar("_imageAndTitleView")]);
objj_registerClassPair(_6);
objj_addClassForBundle(_6,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_6,[new objj_method(sel_getUid("setButtonType:"),function(_8,_9,_a){
with(_8){
if(_a==CPSwitchButton){
objj_msgSend(_8,"setBordered:",NO);
objj_msgSend(_8,"setImage:",nil);
objj_msgSend(_8,"setAlternateImage:",nil);
objj_msgSend(_8,"setAlignment:",CPLeftTextAlignment);
}
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_b,_c,_d){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CPControl")},"initWithFrame:",_d);
if(_b){
_imagePosition=CPNoImage;
_imageScaling=CPScaleNone;
_controlSize=CPRegularControlSize;
objj_msgSend(_b,"setBezelStyle:",CPRoundRectBezelStyle);
objj_msgSend(_b,"setBordered:",YES);
objj_msgSend(_b,"setAlignment:",CPCenterTextAlignment);
}
return _b;
}
}),new objj_method(sel_getUid("setImagePosition:"),function(_e,_f,_10){
with(_e){
if(_imagePosition==_10){
return;
}
_imagePosition=_10;
objj_msgSend(_e,"drawContentsWithHighlight:",_isHighlighted);
}
}),new objj_method(sel_getUid("imagePosition"),function(_11,_12){
with(_11){
return _imagePosition;
}
}),new objj_method(sel_getUid("setImageScaling:"),function(_13,_14,_15){
with(_13){
if(_imageScaling==_15){
return;
}
_imageScaling=_15;
objj_msgSend(_13,"drawContentsWithHighlight:",_isHighlighted);
}
}),new objj_method(sel_getUid("imageScaling"),function(_16,_17){
with(_16){
return _imageScaling;
}
}),new objj_method(sel_getUid("setTextColor:"),function(_18,_19,_1a){
with(_18){
objj_msgSendSuper({receiver:_18,super_class:objj_getClass("CPControl")},"setTextColor:",_1a);
objj_msgSend(_18,"drawContentsWithHighlight:",_isHighlighted);
}
}),new objj_method(sel_getUid("setFont:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSendSuper({receiver:_1b,super_class:objj_getClass("CPControl")},"setFont:",_1d);
objj_msgSend(_1b,"drawContentsWithHighlight:",_isHighlighted);
}
}),new objj_method(sel_getUid("allowsMixedState"),function(_1e,_1f){
with(_1e){
return _allowsMixedState;
}
}),new objj_method(sel_getUid("setAllowsMixedState:"),function(_20,_21,_22){
with(_20){
_allowsMixedState=_22;
}
}),new objj_method(sel_getUid("setNextState"),function(_23,_24){
with(_23){
if(_state==CPOffState){
_state=CPOnState;
}else{
_state=(_state>=CPOnState&&_allowsMixedState)?CPMixedState:CPOffState;
}
}
}),new objj_method(sel_getUid("setState:"),function(_25,_26,_27){
with(_25){
_state=_27;
}
}),new objj_method(sel_getUid("state"),function(_28,_29){
with(_28){
return _state;
}
}),new objj_method(sel_getUid("setAlignment:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSendSuper({receiver:_2a,super_class:objj_getClass("CPControl")},"setAlignment:",_2c);
objj_msgSend(_2a,"drawContentsWithHighlight:",_isHighlighted);
}
}),new objj_method(sel_getUid("setImage:"),function(_2d,_2e,_2f){
with(_2d){
if(_image==_2f){
return;
}
_image=_2f;
objj_msgSend(_2d,"drawContentsWithHighlight:",_isHighlighted);
}
}),new objj_method(sel_getUid("image"),function(_30,_31){
with(_30){
return _image;
}
}),new objj_method(sel_getUid("setAlternateImage:"),function(_32,_33,_34){
with(_32){
_alternateImage=_34;
}
}),new objj_method(sel_getUid("alternateImage"),function(_35,_36){
with(_35){
return _alternateImage;
}
}),new objj_method(sel_getUid("setTitle:"),function(_37,_38,_39){
with(_37){
if(_title==_39){
return;
}
_title=_39;
objj_msgSend(_37,"drawContentsWithHighlight:",_isHighlighted);
}
}),new objj_method(sel_getUid("title"),function(_3a,_3b){
with(_3a){
return _title;
}
}),new objj_method(sel_getUid("tile"),function(_3c,_3d){
with(_3c){
var _3e=objj_msgSend(_3c,"bounds").size;
if(_isBordered){
var _3f=CGSizeMakeCopy(_3e);
if(_bezelStyle==CPHUDBezelStyle){
_3f.height-=4;
}else{
if(_bezelStyle==CPRoundRectBezelStyle){
_3f.height-=2;
}else{
if(_bezelStyle==CPTexturedRoundedBezelStyle){
_3f.height-=2;
}
}
}
objj_msgSend(_imageAndTitleView,"setFrameSize:",_3f);
}else{
objj_msgSend(_imageAndTitleView,"setFrameSize:",_3e);
}
}
}),new objj_method(sel_getUid("sizeToFit"),function(_40,_41){
with(_40){
objj_msgSend(_imageAndTitleView,"sizeToFit");
var _42=objj_msgSend(_imageAndTitleView,"frame"),_43=CGRectGetHeight(_42);
objj_msgSend(_40,"setFrameSize:",CGSizeMake(CGRectGetWidth(_42),_43));
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_44,_45,_46){
with(_44){
objj_msgSendSuper({receiver:_44,super_class:objj_getClass("CPControl")},"setFrameSize:",_46);
objj_msgSend(_44,"tile");
}
}),new objj_method(sel_getUid("highlight:"),function(_47,_48,_49){
with(_47){
objj_msgSend(_47,"drawBezelWithHighlight:",_49);
objj_msgSend(_47,"drawContentsWithHighlight:",_49);
}
}),new objj_method(sel_getUid("setTag:"),function(_4a,_4b,_4c){
with(_4a){
_tag=_4c;
}
}),new objj_method(sel_getUid("tag"),function(_4d,_4e){
with(_4d){
return _tag;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_4f,_50,_51){
with(_4f){
_isHighlighted=YES;
objj_msgSend(_4f,"highlight:",_isHighlighted);
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_52,_53,_54){
with(_52){
_isHighlighted=CGRectContainsPoint(objj_msgSend(_52,"bounds"),objj_msgSend(_52,"convertPoint:fromView:",objj_msgSend(_54,"locationInWindow"),nil));
objj_msgSend(_52,"highlight:",_isHighlighted);
}
}),new objj_method(sel_getUid("mouseUp:"),function(_55,_56,_57){
with(_55){
_isHighlighted=NO;
objj_msgSend(_55,"highlight:",_isHighlighted);
objj_msgSendSuper({receiver:_55,super_class:objj_getClass("CPControl")},"mouseUp:",_57);
}
}),new objj_method(sel_getUid("setControlSize:"),function(_58,_59,_5a){
with(_58){
if(_controlSize==_5a){
return;
}
_controlSize=_5a;
objj_msgSend(_58,"drawBezelWithHighlight:",_isHighlighted);
objj_msgSend(_58,"_updateTextAttributes");
}
}),new objj_method(sel_getUid("controlSize"),function(_5b,_5c){
with(_5b){
return _controlSize;
}
}),new objj_method(sel_getUid("setBordered:"),function(_5d,_5e,_5f){
with(_5d){
if(_isBordered==_5f){
return;
}
_isBordered=_5f;
objj_msgSend(_5d,"updateBackgroundColors");
objj_msgSend(_5d,"drawBezelWithHighlight:",_isHighlighted);
objj_msgSend(_5d,"tile");
}
}),new objj_method(sel_getUid("isBordered"),function(_60,_61){
with(_60){
return _isBordered;
}
}),new objj_method(sel_getUid("setBezelStyle:"),function(_62,_63,_64){
with(_62){
if(_64==CPRoundedBezelStyle||_64==CPRoundedBezelStyle||_64==CPRegularSquareBezelStyle||_64==CPThickSquareBezelStyle||_64==CPThickerSquareBezelStyle||_64==CPDisclosureBezelStyle||_64==CPShadowlessSquareBezelStyle||_64==CPCircularBezelStyle||_64==CPTexturedSquareBezelStyle||_64==CPHelpButtonBezelStyle||_64==CPSmallSquareBezelStyle||_64==CPRecessedBezelStyle||_64==CPRoundedDisclosureBezelStyle){
_64=CPRoundRectBezelStyle;
}
if(_bezelStyle==_64){
return;
}
_bezelStyle=_64;
objj_msgSend(_62,"updateBackgroundColors");
objj_msgSend(_62,"drawBezelWithHighlight:",_isHighlighted);
objj_msgSend(_62,"_updateTextAttributes");
objj_msgSend(_62,"tile");
}
}),new objj_method(sel_getUid("bezelStyle"),function(_65,_66){
with(_65){
return _bezelStyle;
}
}),new objj_method(sel_getUid("updateBackgroundColors"),function(_67,_68){
with(_67){
if(_isBordered){
objj_msgSend(_67,"setBackgroundColor:forName:",_CPControlThreePartImagePattern(NO,_3,_2,_4[_bezelStyle],_CPControlIdentifierForControlSize(_controlSize)),CPControlNormalBackgroundColor);
objj_msgSend(_67,"setBackgroundColor:forName:",_CPControlThreePartImagePattern(NO,_3,_2,_4[_bezelStyle],_CPControlIdentifierForControlSize(_controlSize),_5),CPControlHighlightedBackgroundColor);
}else{
objj_msgSend(_67,"setBackgroundColor:forName:",nil,CPControlNormalBackgroundColor);
objj_msgSend(_67,"setBackgroundColor:forName:",nil,CPControlHighlightedBackgroundColor);
}
}
}),new objj_method(sel_getUid("drawBezelWithHighlight:"),function(_69,_6a,_6b){
with(_69){
_bezelBorderNeedsUpdate=!objj_msgSend(_69,"window");
if(_bezelBorderNeedsUpdate){
return;
}
objj_msgSend(_69,"setBackgroundColorWithName:",_6b?CPControlHighlightedBackgroundColor:CPControlNormalBackgroundColor);
}
}),new objj_method(sel_getUid("drawContentsWithHighlight:"),function(_6c,_6d,_6e){
with(_6c){
if(!_title&&!_image&&!_alternateTitle&&!_alternateImage&&!_imageAndTitleView){
return;
}
if(!_imageAndTitleView){
_imageAndTitleView=objj_msgSend(objj_msgSend(_CPImageAndTitleView,"alloc"),"initWithFrame:",objj_msgSend(_6c,"bounds"));
objj_msgSend(_6c,"addSubview:",_imageAndTitleView);
objj_msgSend(_6c,"tile");
}
objj_msgSend(_imageAndTitleView,"setFont:",objj_msgSend(_6c,"font"));
objj_msgSend(_imageAndTitleView,"setTextColor:",objj_msgSend(_6c,"textColor"));
objj_msgSend(_imageAndTitleView,"setAlignment:",objj_msgSend(_6c,"alignment"));
objj_msgSend(_imageAndTitleView,"setImagePosition:",_imagePosition);
objj_msgSend(_imageAndTitleView,"setImageScaling:",_imageScaling);
objj_msgSend(_imageAndTitleView,"setTitle:",_6e&&_alternateTitle?_alternateTitle:_title);
objj_msgSend(_imageAndTitleView,"setImage:",_6e&&_alternateImage?_alternateImage:_image);
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_6f,_70){
with(_6f){
if(_bezelBorderNeedsUpdate){
objj_msgSend(_6f,"drawBezelWithHighlight:",_isHighlighted);
}
}
}),new objj_method(sel_getUid("_updateTextAttributes"),function(_71,_72){
with(_71){
if(_bezelStyle==CPHUDBezelStyle){
objj_msgSend(_71,"setTextColor:",_1);
}
if(_controlSize==CPRegularControlSize){
objj_msgSend(_71,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",11));
}
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("initialize"),function(_73,_74){
with(_73){
if(_73!=objj_msgSend(CPButton,"class")){
return;
}
_2=objj_msgSend(CPButton,"className");
_4[CPRoundedBezelStyle]="Rounded";
_4[CPRegularSquareBezelStyle]="RegularSquare";
_4[CPThickSquareBezelStyle]="ThickSquare";
_4[CPThickerSquareBezelStyle]="ThickerSquare";
_4[CPDisclosureBezelStyle]="Disclosure";
_4[CPShadowlessSquareBezelStyle]="ShadowlessSquare";
_4[CPCircularBezelStyle]="Circular";
_4[CPTexturedSquareBezelStyle]="TexturedSquare";
_4[CPHelpButtonBezelStyle]="HelpButton";
_4[CPSmallSquareBezelStyle]="SmallSquare";
_4[CPTexturedRoundedBezelStyle]="TexturedRounded";
_4[CPRoundRectBezelStyle]="RoundRect";
_4[CPRecessedBezelStyle]="Recessed";
_4[CPRoundedDisclosureBezelStyle]="RoundedDisclosure";
_4[CPHUDBezelStyle]="HUD";
var _75=_CPControlIdentifierForControlSize(CPRegularControlSize),_76=_CPControlIdentifierForControlSize(CPSmallControlSize),_77=_CPControlIdentifierForControlSize(CPMiniControlSize);
var _78=_2+_4[CPRoundRectBezelStyle];
_3[_78+_75]=[{width:10,height:18},{width:1,height:18},{width:10,height:18}];
_3[_78+_75+_5]=[{width:10,height:18},{width:1,height:18},{width:10,height:18}];
var _78=_2+_4[CPHUDBezelStyle];
_3[_78+_75]=[{width:13,height:20},{width:1,height:20},{width:13,height:20}];
_3[_78+_75+_5]=[{width:13,height:20},{width:1,height:20},{width:13,height:20}];
_1=objj_msgSend(CPColor,"whiteColor");
var _78=_2+_4[CPTexturedRoundedBezelStyle];
_3[_78+_75]=[{width:7,height:20},{width:1,height:20},{width:7,height:20}];
_3[_78+_75+_5]=[{width:7,height:20},{width:1,height:20},{width:7,height:20}];
}
})]);
var _79="CPButtonImageKey",_7a="CPButtonAlternateImageKey",_7b="CPButtonTitleKey",_7c="CPButtonAlternateTitleKey",_7d="CPButtonImageAndTitleViewKey",_7e="CPButtonImagePositionKey",_7f="CPButtonImageScalingKey",_80="CPButtonIsBorderedKey",_81="CPButtonBezelStyleKey",_7d="CPButtonImageAndTitleViewKey";
var _6=objj_getClass("CPButton");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPButton\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("initWithCoder:"),function(_82,_83,_84){
with(_82){
_82=objj_msgSendSuper({receiver:_82,super_class:objj_getClass("CPControl")},"initWithCoder:",_84);
if(_82){
_controlSize=CPRegularControlSize;
objj_msgSend(_82,"setImage:",objj_msgSend(_84,"decodeObjectForKey:",_79));
objj_msgSend(_82,"setAlternateImage:",objj_msgSend(_84,"decodeObjectForKey:",_7a));
objj_msgSend(_82,"setTitle:",objj_msgSend(_84,"decodeObjectForKey:",_7b));
objj_msgSend(_82,"setImagePosition:",objj_msgSend(_84,"decodeIntForKey:",_7e));
objj_msgSend(_82,"setImageScaling:",objj_msgSend(_84,"decodeIntForKey:",_7f));
objj_msgSend(_82,"setBezelStyle:",objj_msgSend(_84,"decodeIntForKey:",_81));
objj_msgSend(_82,"setBordered:",objj_msgSend(_84,"decodeBoolForKey:",_80));
}
return _82;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_85,_86,_87){
with(_85){
var _88=_subviews;
_subviews=objj_msgSend(_subviews,"copy");
objj_msgSend(_subviews,"removeObjectIdenticalTo:",_imageAndTitleView);
objj_msgSendSuper({receiver:_85,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_87);
_subviews=_88;
objj_msgSend(_87,"encodeObject:forKey:",_image,_79);
objj_msgSend(_87,"encodeObject:forKey:",_alternateImage,_7a);
objj_msgSend(_87,"encodeObject:forKey:",_title,_7b);
objj_msgSend(_87,"encodeInt:forKey:",_imagePosition,_7e);
objj_msgSend(_87,"encodeInt:forKey:",_imageScaling,_7f);
objj_msgSend(_87,"encodeBool:forKey:",_isBordered,_80);
objj_msgSend(_87,"encodeInt:forKey:",_bezelStyle,_81);
}
})]);
p;7;CPCib.jI;21;Foundation/CPObject.jI;28;Foundation/CPURLConnection.jI;25;Foundation/CPURLRequest.ji;20;_CPCibCustomObject.ji;18;_CPCibCustomView.ji;23;_CPCibKeyedUnarchiver.ji;18;_CPCibObjectData.ji;22;_CPCibWindowTemplate.jc;1573;
CPCibOwner="CPCibOwner",CPCibTopLevelObjects="CPCibTopLevelObjects";
var _1="CPCibObjectDataKey";
var _2=objj_allocateClassPair(CPObject,"CPCib"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_data")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithContentsOfURL:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_data=objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:error:",objj_msgSend(CPURLRequest,"requestWithURL:",_6),nil,nil);
}
return _4;
}
}),new objj_method(sel_getUid("instantiateCibWithExternalNameTable:"),function(_7,_8,_9){
with(_7){
var _a=objj_msgSend(objj_msgSend(_CPCibKeyedUnarchiver,"alloc"),"initForReadingWithData:",_data),_b=objj_msgSend(_a,"decodeObjectForKey:",_1);
if(!_b||!objj_msgSend(_b,"isKindOfClass:",objj_msgSend(_CPCibObjectData,"class"))){
return NO;
}
objj_msgSend(_b,"establishConnectionsWithExternalNameTable:",_9);
var _c=objj_msgSend(_9,"objectForKey:",CPCibOwner),_d=objj_msgSend(_9,"objectForKey:",CPCibTopLevelObjects);
var _e;
if((_e=objj_msgSend(_b,"mainMenu"))!=nil){
objj_msgSend(CPApp,"setMainMenu:",_e);
objj_msgSend(CPMenu,"setMenuBarVisible:",YES);
}
}
}),new objj_method(sel_getUid("instantiateCibWithOwner:topLevelObjects:"),function(_f,_10,_11,_12){
with(_f){
objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_11,CPCibOwner,_12,CPCibTopLevelObjects);
return objj_msgSend(_f,"instantiate");
}
})]);
p;12;CPClipView.ji;8;CPView.jc;2739;
var _1=objj_allocateClassPair(CPView,"CPClipView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_documentView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("setDocumentView:"),function(_3,_4,_5){
with(_3){
if(_documentView==_5){
return;
}
var _6=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_documentView){
objj_msgSend(_6,"removeObserver:name:object:",_3,CPViewFrameDidChangeNotification,_documentView);
objj_msgSend(_6,"removeObserver:name:object:",_3,CPViewBoundsDidChangeNotification,_documentView);
objj_msgSend(_documentView,"removeFromSuperview");
}
_documentView=_5;
if(_documentView){
objj_msgSend(_documentView,"setFrameOrigin:",CGPointMake(0,0));
objj_msgSend(_3,"addSubview:",_documentView);
objj_msgSend(_documentView,"setPostsFrameChangedNotifications:",YES);
objj_msgSend(_documentView,"setPostsBoundsChangedNotifications:",YES);
objj_msgSend(_6,"addObserver:selector:name:object:",_3,sel_getUid("viewFrameChanged:"),CPViewFrameDidChangeNotification,_documentView);
objj_msgSend(_6,"addObserver:selector:name:object:",_3,sel_getUid("viewBoundsChanged:"),CPViewBoundsDidChangeNotification,_documentView);
}
}
}),new objj_method(sel_getUid("documentView"),function(_7,_8){
with(_7){
return _documentView;
}
}),new objj_method(sel_getUid("constrainScrollPoint:"),function(_9,_a,_b){
with(_9){
var _c=objj_msgSend(_documentView,"frame");
_b.x=MAX(0,MIN(_b.x,MAX((_c.size.width)-(_bounds.size.width),0)));
_b.y=MAX(0,MIN(_b.y,MAX((_c.size.height)-(_bounds.size.height),0)));
return _b;
}
}),new objj_method(sel_getUid("setBoundsOrigin:"),function(_d,_e,_f){
with(_d){
if((_bounds.origin.x==_f.x&&_bounds.origin.y==_f.y)){
return;
}
objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPView")},"setBoundsOrigin:",_f);
var _10=objj_msgSend(_d,"superview");
if(objj_msgSend(_10,"isKindOfClass:",objj_msgSend(CPScrollView,"class"))){
objj_msgSend(_10,"reflectScrolledClipView:",_d);
}
}
}),new objj_method(sel_getUid("scrollToPoint:"),function(_11,_12,_13){
with(_11){
objj_msgSend(_11,"setBoundsOrigin:",objj_msgSend(_11,"constrainScrollPoint:",_13));
}
}),new objj_method(sel_getUid("viewBoundsChanged:"),function(_14,_15,_16){
with(_14){
objj_msgSend(_14,"viewFrameChanged:",_16);
}
}),new objj_method(sel_getUid("viewFrameChanged:"),function(_17,_18,_19){
with(_17){
var _1a=objj_msgSend(_17,"bounds").origin;
objj_msgSend(_17,"scrollToPoint:",_1a);
if(!CGPointEqualToPoint(_1a,objj_msgSend(_17,"bounds").origin)){
return;
}
var _1b=objj_msgSend(_17,"superview");
if(objj_msgSend(_1b,"isKindOfClass:",objj_msgSend(CPScrollView,"class"))){
objj_msgSend(_1b,"reflectScrolledClipView:",_17);
}
}
})]);
p;18;CPCollectionView.jI;20;Foundation/CPArray.jI;19;Foundation/CPData.jI;23;Foundation/CPIndexSet.jI;28;Foundation/CPKeyedArchiver.jI;30;Foundation/CPKeyedUnarchiver.jI;15;AppKit/CPView.jc;11577;
var _1=objj_allocateClassPair(CPView,"CPCollectionView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_content"),new objj_ivar("_items"),new objj_ivar("_itemData"),new objj_ivar("_itemPrototype"),new objj_ivar("_itemForDragging"),new objj_ivar("_cachedItems"),new objj_ivar("_maxNumberOfRows"),new objj_ivar("_maxNumberOfColumns"),new objj_ivar("_minItemSize"),new objj_ivar("_maxItemSize"),new objj_ivar("_tileWidth"),new objj_ivar("_isSelectable"),new objj_ivar("_allowsMultipleSelection"),new objj_ivar("_selectionIndexes"),new objj_ivar("_itemSize"),new objj_ivar("_horizontalMargin"),new objj_ivar("_verticalMargin"),new objj_ivar("_numberOfRows"),new objj_ivar("_numberOfColumns"),new objj_ivar("_delegate")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPView")},"initWithFrame:",_5);
if(_3){
_items=[];
_content=[];
_cachedItems=[];
_itemSize=CGSizeMakeZero();
_minItemSize=CGSizeMakeZero();
_maxItemSize=CGSizeMakeZero();
_verticalMargin=5;
_tileWidth=-1;
_selectionIndexes=objj_msgSend(CPIndexSet,"indexSet");
}
return _3;
}
}),new objj_method(sel_getUid("setItemPrototype:"),function(_6,_7,_8){
with(_6){
_itemData=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_8);
_itemForDragging=_8;
objj_msgSend(_6,"reloadContent");
}
}),new objj_method(sel_getUid("itemPrototype"),function(_9,_a){
with(_9){
return _itemPrototype;
}
}),new objj_method(sel_getUid("newItemForRepresentedObject:"),function(_b,_c,_d){
with(_b){
var _e=nil;
if(_cachedItems.length){
_e=_cachedItems.pop();
}else{
_e=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_itemData);
}
objj_msgSend(_e,"setRepresentedObject:",_d);
objj_msgSend(objj_msgSend(_e,"view"),"setFrameSize:",_itemSize);
return _e;
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_f,_10){
with(_f){
return YES;
}
}),new objj_method(sel_getUid("isFirstResponder"),function(_11,_12){
with(_11){
return objj_msgSend(objj_msgSend(_11,"window"),"firstResponder")==_11;
}
}),new objj_method(sel_getUid("setContent:"),function(_13,_14,_15){
with(_13){
if(_content==_15){
return;
}
_content=_15;
objj_msgSend(_13,"reloadContent");
}
}),new objj_method(sel_getUid("content"),function(_16,_17){
with(_16){
return _content;
}
}),new objj_method(sel_getUid("items"),function(_18,_19){
with(_18){
return _items;
}
}),new objj_method(sel_getUid("setSelectable:"),function(_1a,_1b,_1c){
with(_1a){
if(_isSelectable==_1c){
return;
}
_isSelectable=_1c;
if(!_isSelectable){
var _1d=CPNotFound;
while((_1d=objj_msgSend(_selectionIndexes,"indexGreaterThanIndex:",_1d))!=CPNotFound){
objj_msgSend(_items[_1d],"setSelected:",NO);
}
}
}
}),new objj_method(sel_getUid("isSelected"),function(_1e,_1f){
with(_1e){
return _isSelected;
}
}),new objj_method(sel_getUid("setAllowsMultipleSelection:"),function(_20,_21,_22){
with(_20){
_allowsMultipleSelection=_22;
}
}),new objj_method(sel_getUid("allowsMultipleSelection"),function(_23,_24){
with(_23){
return _allowsMultipleSelection;
}
}),new objj_method(sel_getUid("setSelectionIndexes:"),function(_25,_26,_27){
with(_25){
if(_selectionIndexes==_27){
return;
}
var _28=CPNotFound;
while((_28=objj_msgSend(_selectionIndexes,"indexGreaterThanIndex:",_28))!=CPNotFound){
objj_msgSend(_items[_28],"setSelected:",NO);
}
_selectionIndexes=_27;
var _28=CPNotFound;
while((_28=objj_msgSend(_selectionIndexes,"indexGreaterThanIndex:",_28))!=CPNotFound){
objj_msgSend(_items[_28],"setSelected:",YES);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("collectionViewDidChangeSelection:"))){
objj_msgSend(_delegate,"collectionViewDidChangeSelection:",_25);
}
}
}),new objj_method(sel_getUid("selectionIndexes"),function(_29,_2a){
with(_29){
return _selectionIndexes;
}
}),new objj_method(sel_getUid("reloadContent"),function(_2b,_2c){
with(_2b){
var _2d=_items.length;
while(_2d--){
objj_msgSend(objj_msgSend(_items[_2d],"view"),"removeFromSuperview");
_cachedItems.push(_items[_2d]);
}
_items=[];
if(!_itemData||!_content){
return;
}
var _2e=0;
_2d=_content.length;
for(;_2e<_2d;++_2e){
_items.push(objj_msgSend(_2b,"newItemForRepresentedObject:",_content[_2e]));
objj_msgSend(_2b,"addSubview:",objj_msgSend(_items[_2e],"view"));
}
objj_msgSend(_2b,"tile");
}
}),new objj_method(sel_getUid("tile"),function(_2f,_30){
with(_2f){
var _31=CGRectGetWidth(objj_msgSend(_2f,"bounds"));
if(!objj_msgSend(_content,"count")||_31==_tileWidth){
return;
}
var _32=CGSizeMakeCopy(_minItemSize);
_numberOfColumns=MAX(1,FLOOR(_31/_32.width));
if(_maxNumberOfColumns>0){
_numberOfColumns=MIN(_maxNumberOfColumns,_numberOfColumns);
}
var _33=_31-_numberOfColumns*_32.width,_34=NO;
if(_33>0&&_32.width<_maxItemSize.width){
_32.width=MIN(_maxItemSize.width,_32.width+FLOOR(_33/_numberOfColumns));
}
if(!CGSizeEqualToSize(_itemSize,_32)){
_itemSize=_32;
_34=YES;
}
var _35=0,_36=_items.length;
if(_maxNumberOfColumns>0&&_maxNumberOfRows>0){
_36=MIN(_36,_maxNumberOfColumns*_maxNumberOfRows);
}
_numberOfRows=CEIL(_36/_numberOfColumns);
_horizontalMargin=FLOOR((_31-_numberOfColumns*_32.width)/(_numberOfColumns+1));
var x=_horizontalMargin,y=-_32.height;
for(;_35<_36;++_35){
if(_35%_numberOfColumns==0){
x=_horizontalMargin;
y+=_verticalMargin+_32.height;
}
var _39=objj_msgSend(_items[_35],"view");
objj_msgSend(_39,"setFrameOrigin:",CGPointMake(x,y));
if(_34){
objj_msgSend(_39,"setFrameSize:",_itemSize);
}
x+=_32.width+_horizontalMargin;
}
_tileWidth=_31;
objj_msgSend(_2f,"setFrameSize:",CGSizeMake(_31,y+_32.height+_verticalMargin));
_tileWidth=-1;
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_3a,_3b,_3c){
with(_3a){
objj_msgSend(_3a,"tile");
}
}),new objj_method(sel_getUid("setMaxNumberOfRows:"),function(_3d,_3e,_3f){
with(_3d){
if(_maxNumberOfRows==_3f){
return;
}
_maxNumberOfRows=_3f;
objj_msgSend(_3d,"tile");
}
}),new objj_method(sel_getUid("maxNumberOfRows"),function(_40,_41){
with(_40){
return _maxNumberOfRows;
}
}),new objj_method(sel_getUid("setMaxNumberOfColumns:"),function(_42,_43,_44){
with(_42){
if(_maxNumberOfColumns==_44){
return;
}
_maxNumberOfColumns=_44;
objj_msgSend(_42,"tile");
}
}),new objj_method(sel_getUid("maxNumberOfColumns"),function(_45,_46){
with(_45){
return _maxNumberOfColumns;
}
}),new objj_method(sel_getUid("setMinItemSize:"),function(_47,_48,_49){
with(_47){
if(CGSizeEqualToSize(_minItemSize,_49)){
return;
}
_minItemSize=CGSizeMakeCopy(_49);
objj_msgSend(_47,"tile");
}
}),new objj_method(sel_getUid("minItemSize"),function(_4a,_4b){
with(_4a){
return _minItemSize;
}
}),new objj_method(sel_getUid("setMaxItemSize:"),function(_4c,_4d,_4e){
with(_4c){
if(CGSizeEqualToSize(_maxItemSize,_4e)){
return;
}
_maxItemSize=CGSizeMakeCopy(_4e);
objj_msgSend(_4c,"tile");
}
}),new objj_method(sel_getUid("maxItemSize"),function(_4f,_50){
with(_4f){
return _maxItemSize;
}
}),new objj_method(sel_getUid("mouseUp:"),function(_51,_52,_53){
with(_51){
if(objj_msgSend(_selectionIndexes,"count")&&objj_msgSend(_53,"clickCount")==2&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("collectionView:didDoubleClickOnItemAtIndex:"))){
objj_msgSend(_delegate,"collectionView:didDoubleClickOnItemAtIndex:",_51,objj_msgSend(_selectionIndexes,"firstIndex"));
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_54,_55,_56){
with(_54){
var _57=objj_msgSend(_54,"convertPoint:fromView:",objj_msgSend(_56,"locationInWindow"),nil),row=FLOOR(_57.y/(_itemSize.height+_verticalMargin)),_59=FLOOR(_57.x/(_itemSize.width+_horizontalMargin)),_5a=row*_numberOfColumns+_59;
if(_5a>=0&&_5a<_items.length){
objj_msgSend(_54,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_5a));
}
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_5b,_5c,_5d){
with(_5b){
if(!objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("collectionView:dragTypesForItemsAtIndexes:"))){
return;
}
if(!objj_msgSend(_selectionIndexes,"count")){
return;
}
var _5e=objj_msgSend(_delegate,"collectionView:dragTypesForItemsAtIndexes:",_5b,_selectionIndexes);
objj_msgSend(objj_msgSend(CPPasteboard,"pasteboardWithName:",CPDragPboard),"declareTypes:owner:",_5e,_5b);
var _5f=objj_msgSend(_5b,"convertPoint:fromView:",objj_msgSend(_5d,"locationInWindow"),nil);
objj_msgSend(_itemForDragging,"setRepresentedObject:",_content[objj_msgSend(_selectionIndexes,"firstIndex")]);
var _60=objj_msgSend(_itemForDragging,"view"),_61=objj_msgSend(_60,"frame");
objj_msgSend(_60,"setFrameSize:",_itemSize);
objj_msgSend(_5b,"dragView:at:offset:event:pasteboard:source:slideBack:",_60,objj_msgSend(objj_msgSend(_items[objj_msgSend(_selectionIndexes,"firstIndex")],"view"),"frame").origin,CGPointMakeZero(),_5d,nil,_5b,YES);
}
}),new objj_method(sel_getUid("pasteboard:provideDataForType:"),function(_62,_63,_64,_65){
with(_62){
objj_msgSend(_64,"setData:forType:",objj_msgSend(_delegate,"collectionView:dataForItemsAtIndexes:forType:",_62,_selectionIndexes,_65),_65);
}
}),new objj_method(sel_getUid("setVerticalMargin:"),function(_66,_67,_68){
with(_66){
if(_verticalMargin==_68){
return;
}
_verticalMargin=_68;
objj_msgSend(_66,"tile");
}
}),new objj_method(sel_getUid("setDelegate:"),function(_69,_6a,_6b){
with(_69){
_delegate=_6b;
}
}),new objj_method(sel_getUid("delegate"),function(_6c,_6d){
with(_6c){
return _delegate;
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPCollectionViewItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_representedObject"),new objj_ivar("_view"),new objj_ivar("_isSelected")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("setRepresentedObject:"),function(_6e,_6f,_70){
with(_6e){
if(_representedObject==_70){
return;
}
_representedObject=_70;
objj_msgSend(_view,"setRepresentedObject:",_70);
}
}),new objj_method(sel_getUid("representedObject"),function(_71,_72){
with(_71){
return _representedObject;
}
}),new objj_method(sel_getUid("setView:"),function(_73,_74,_75){
with(_73){
_view=_75;
}
}),new objj_method(sel_getUid("view"),function(_76,_77){
with(_76){
return _view;
}
}),new objj_method(sel_getUid("setSelected:"),function(_78,_79,_7a){
with(_78){
if(_isSelected==_7a){
return;
}
_isSelected=_7a;
objj_msgSend(_view,"setSelected:",_isSelected);
}
}),new objj_method(sel_getUid("isSelected"),function(_7b,_7c){
with(_7b){
return _isSelected;
}
}),new objj_method(sel_getUid("collectionView"),function(_7d,_7e){
with(_7d){
return objj_msgSend(_view,"superview");
}
})]);
var _7f="CPCollectionViewItemViewKey";
var _1=objj_getClass("CPCollectionViewItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPCollectionViewItem\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("copy"),function(_80,_81){
with(_80){
}
})]);
var _7f="CPCollectionViewItemViewKey";
var _1=objj_getClass("CPCollectionViewItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPCollectionViewItem\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_82,_83,_84){
with(_82){
_82=objj_msgSendSuper({receiver:_82,super_class:objj_getClass("CPObject")},"init");
if(_82){
_view=objj_msgSend(_84,"decodeObjectForKey:",_7f);
}
return _82;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_85,_86,_87){
with(_85){
objj_msgSend(_87,"encodeObject:forKey:",_view,_7f);
}
})]);
p;9;CPColor.jI;21;Foundation/CPObject.ji;9;CGColor.ji;17;CPCompatibility.ji;9;CPImage.jc;10595;
var _1=0,_2=1,_3=2,_4=3;
var _5=0,_6=1,_7=2;
var _8=objj_allocateClassPair(CPObject,"CPColor"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_components"),new objj_ivar("_patternImage"),new objj_ivar("_cssString")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("_initWithCSSString:"),function(_a,_b,_c){
with(_a){
if(_c.indexOf("rgb")==CPNotFound){
return nil;
}
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPObject")},"init");
var _d=_c.indexOf("(");
var _e=_c.substring(_d+1).split(",");
_components=[parseInt(_e[0],10)/255,parseInt(_e[1],10)/255,parseInt(_e[2],10)/255,_e[3]?parseInt(_e[3],10)/255:1];
_cssString=_c;
return _a;
}
}),new objj_method(sel_getUid("_initWithRGBA:"),function(_f,_10,_11){
with(_f){
_f=objj_msgSendSuper({receiver:_f,super_class:objj_getClass("CPObject")},"init");
if(_f){
_components=_11;
if(!CPFeatureIsCompatible(CPCSSRGBAFeature)&&_components[3]!=1&&window.Base64&&window.CRC32){
var _12=[137,80,78,71,13,10,26,10,0,0,0,13,73,72,68,82,0,0,0,1,0,0,0,1,8,3,0,0,0,40,203,52,187,0,0,3,0,80,76,84,69,255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23,137,153,85,0,0,0,1,116,82,78,83,0,64,230,216,102,0,0,0,16,73,68,65,84,120,218,98,96,0,0,0,0,255,255,3,0,0,2,0,1,36,127,36,241,0,0,0,0,73,69,78,68,174,66,96,130,255];
var _13=41;
var _14=42;
var _15=43;
var _16=821;
var _17=809;
var _18=822;
var _19=37;
var _1a=817;
_12[_13]=Math.round(_components[0]*255);
_12[_14]=Math.round(_components[1]*255);
_12[_15]=Math.round(_components[2]*255);
_12[_16]=Math.round(_components[3]*255);
var _1b=integerToBytes(CRC32.getCRC(_12,_19,4+768),4);
var _1c=integerToBytes(CRC32.getCRC(_12,_1a,4+1),4);
for(var i=0;i<4;i++){
_12[_17+i]=_1b[i];
_12[_18+i]=_1c[i];
}
var _1e=Base64.encode(_12);
_cssString="url(\"data:image/png;base64,"+_1e+"\")";
}else{
var _1f=CPFeatureIsCompatible(CPCSSRGBAFeature)&&_components[3]!=1;
_cssString=(_1f?"rgba(":"rgb(")+parseInt(_components[0]*255)+", "+parseInt(_components[1]*255)+", "+parseInt(_components[2]*255)+(_1f?(", "+_components[3]):"")+")";
}
}
return _f;
}
}),new objj_method(sel_getUid("_initWithPatternImage:"),function(_20,_21,_22){
with(_20){
_20=objj_msgSendSuper({receiver:_20,super_class:objj_getClass("CPObject")},"init");
if(_20){
_patternImage=_22;
_cssString="url(\""+_patternImage._filename+"\")";
}
return _20;
}
}),new objj_method(sel_getUid("patternImage"),function(_23,_24){
with(_23){
return _patternImage;
}
}),new objj_method(sel_getUid("alphaComponent"),function(_25,_26){
with(_25){
return _components[3];
}
}),new objj_method(sel_getUid("blueComponent"),function(_27,_28){
with(_27){
return _components[2];
}
}),new objj_method(sel_getUid("greenComponent"),function(_29,_2a){
with(_29){
return _components[1];
}
}),new objj_method(sel_getUid("redComponent"),function(_2b,_2c){
with(_2b){
return _components[0];
}
}),new objj_method(sel_getUid("components"),function(_2d,_2e){
with(_2d){
return _components;
}
}),new objj_method(sel_getUid("colorWithAlphaComponent:"),function(_2f,_30,_31){
with(_2f){
var _32=_components.slice();
_32[_32.length-1]=_31;
return objj_msgSend(objj_msgSend(objj_msgSend(_2f,"class"),"alloc"),"_initWithRGBA:",_32);
}
}),new objj_method(sel_getUid("hsbComponents"),function(_33,_34){
with(_33){
var red=ROUND(_components[_1]*255),_36=ROUND(_components[_2]*255),_37=ROUND(_components[_3]*255);
var max=MAX(red,_36,_37),min=MIN(red,_36,_37),_3a=max-min;
var _3b=max/255,_3c=(max!=0)?_3a/max:0;
var hue;
if(_3c==0){
hue=0;
}else{
var rr=(max-red)/_3a;
var gr=(max-_36)/_3a;
var br=(max-_37)/_3a;
if(red==max){
hue=br-gr;
}else{
if(_36==max){
hue=2+rr-br;
}else{
hue=4+gr-rr;
}
}
hue/=6;
if(hue<0){
hue++;
}
}
return [ROUND(hue*360),ROUND(_3c*100),ROUND(_3b*100)];
}
}),new objj_method(sel_getUid("cssString"),function(_41,_42){
with(_41){
return _cssString;
}
}),new objj_method(sel_getUid("hexString"),function(_43,_44){
with(_43){
return rgbToHex(objj_msgSend(_43,"redComponent"),objj_msgSend(_43,"greenComponent"),objj_msgSend(_43,"blueComponent"));
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("colorWithCalibratedRed:green:blue:alpha:"),function(_45,_46,red,_48,_49,_4a){
with(_45){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[red,_48,_49,_4a]);
}
}),new objj_method(sel_getUid("colorWithCalibratedWhite:alpha:"),function(_4b,_4c,_4d,_4e){
with(_4b){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[_4d,_4d,_4d,_4e]);
}
}),new objj_method(sel_getUid("colorWithHue:saturation:brightness:"),function(_4f,_50,hue,_52,_53){
with(_4f){
if(_52==0){
return objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",_53/100,1);
}
var f=hue%60,p=(_53*(100-_52))/10000,q=(_53*(6000-_52*f))/600000,t=(_53*(6000-_52*(60-f)))/600000,b=_53/100;
switch(FLOOR(hue/60)){
case 0:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",b,t,p,1);
case 1:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",q,b,p,1);
case 2:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",p,b,t,1);
case 3:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",p,q,b,1);
case 4:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",t,p,b,1);
case 5:
return objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",b,p,q,1);
}
}
}),new objj_method(sel_getUid("colorWithHexString:"),function(_59,_5a,hex){
with(_59){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",hexToRGB(hex));
}
}),new objj_method(sel_getUid("blackColor"),function(_5c,_5d){
with(_5c){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,0,0,1]);
}
}),new objj_method(sel_getUid("blueColor"),function(_5e,_5f){
with(_5e){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,0,1,1]);
}
}),new objj_method(sel_getUid("darkGrayColor"),function(_60,_61){
with(_60){
return objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",1/3,1);
}
}),new objj_method(sel_getUid("grayColor"),function(_62,_63){
with(_62){
return objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",0.5,1);
}
}),new objj_method(sel_getUid("greenColor"),function(_64,_65){
with(_64){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,1,0,1]);
}
}),new objj_method(sel_getUid("lightGrayColor"),function(_66,_67){
with(_66){
return objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",2/3,1);
}
}),new objj_method(sel_getUid("redColor"),function(_68,_69){
with(_68){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,0,0,1]);
}
}),new objj_method(sel_getUid("whiteColor"),function(_6a,_6b){
with(_6a){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,1,1,1]);
}
}),new objj_method(sel_getUid("yellowColor"),function(_6c,_6d){
with(_6c){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[1,1,0,1]);
}
}),new objj_method(sel_getUid("shadowColor"),function(_6e,_6f){
with(_6e){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithRGBA:",[0,0,0,1/3]);
}
}),new objj_method(sel_getUid("colorWithPatternImage:"),function(_70,_71,_72){
with(_70){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithPatternImage:",_72);
}
}),new objj_method(sel_getUid("colorWithCSSString:"),function(_73,_74,_75){
with(_73){
return objj_msgSend(objj_msgSend(CPColor,"alloc"),"_initWithCSSString:",_75);
}
})]);
var _76="CPColorComponentsKey",_77="CPColorPatternImageKey";
var _8=objj_getClass("CPColor");
if(!_8){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPColor\""));
}
var _9=_8.isa;
class_addMethods(_8,[new objj_method(sel_getUid("initWithCoder:"),function(_78,_79,_7a){
with(_78){
if(objj_msgSend(_7a,"containsValueForKey:",_77)){
return objj_msgSend(_78,"_initWithPatternImage:",objj_msgSend(_7a,"decodeObjectForKey:",_77));
}
return objj_msgSend(_78,"_initWithRGBA:",objj_msgSend(_7a,"decodeObjectForKey:",_76));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7b,_7c,_7d){
with(_7b){
if(_patternImage){
objj_msgSend(_7d,"encodeObject:forKey:",_patternImage,_77);
}else{
objj_msgSend(_7d,"encodeObject:forKey:",_components,_76);
}
}
})]);
var _7e="0123456789ABCDEF";
hexToRGB=function(hex){
if(hex.length!=6){
return null;
}
hex=hex.toUpperCase();
for(var i=0;i<hex.length;i++){
if(_7e.indexOf(hex.charAt(i))==-1){
return null;
}
}
var red=(_7e.indexOf(hex.charAt(0))*16+_7e.indexOf(hex.charAt(1)))/255;
var _82=(_7e.indexOf(hex.charAt(2))*16+_7e.indexOf(hex.charAt(3)))/255;
var _83=(_7e.indexOf(hex.charAt(4))*16+_7e.indexOf(hex.charAt(5)))/255;
return [red,_82,_83,1];
};
integerToBytes=function(_84,_85){
if(!_85){
_85=(_84==0)?1:Math.round((Math.log(_84)/Math.log(2))/8+0.5);
}
var _86=new Array(_85);
for(var i=_85-1;i>=0;i--){
_86[i]=_84&255;
_84=_84>>8;
}
return _86;
};
rgbToHex=function(r,g,b){
return byteToHex(r)+byteToHex(g)+byteToHex(b);
};
byteToHex=function(n){
if(!n||isNaN(n)){
return "00";
}
n=ROUND(MIN(255,MAX(0,256*n)));
return _7e.charAt((n-n%16)/16)+_7e.charAt(n%16);
};
p;14;CPColorPanel.ji;10;CPButton.ji;10;CPCookie.ji;9;CPPanel.ji;8;CPView.jc;14905;
CPColorPanelColorDidChangeNotification="CPColorPanelColorDidChangeNotification";
var _1=20,_2=32,_3=14,_4=32,_5=12;
var _6=nil,_7=[];
CPWheelColorPickerMode=1;
CPSliderColorPickerMode=2;
CPColorPickerViewWidth=265,CPColorPickerViewHeight=370;
var _8=objj_allocateClassPair(CPPanel,"CPColorPanel"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_toolbar"),new objj_ivar("_swatchView"),new objj_ivar("_previewView"),new objj_ivar("_previewLabel"),new objj_ivar("_swatchLabel"),new objj_ivar("_colorPickers"),new objj_ivar("_currentView"),new objj_ivar("_color"),new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_mode")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("init"),function(_a,_b){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPPanel")},"initWithContentRect:styleMask:",CGRectMake(500,50,218,360),(CPHUDBackgroundWindowMask|CPTitledWindowMask|CPClosableWindowMask|CPResizableWindowMask));
if(_a){
objj_msgSend(_a,"setTitle:","Color Panel");
objj_msgSend(_a,"setLevel:",CPFloatingWindowLevel);
objj_msgSend(_a,"setFloatingPanel:",YES);
objj_msgSend(_a,"setBecomesKeyOnlyIfNeeded:",YES);
objj_msgSend(_a,"setMinSize:",CGSizeMake(218,360));
objj_msgSend(_a,"setMaxSize:",CGSizeMake(327,540));
}
return _a;
}
}),new objj_method(sel_getUid("setColor:"),function(_c,_d,_e){
with(_c){
_color=_e;
objj_msgSend(_previewView,"setBackgroundColor:",_color);
objj_msgSend(CPApp,"sendAction:to:from:",sel_getUid("changeColor:"),nil,_c);
if(_target&&_action){
objj_msgSend(CPApp,"sendAction:to:from:",_action,_target,_c);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPColorPanelColorDidChangeNotification,_c);
}
}),new objj_method(sel_getUid("setColor:updatePicker:"),function(_f,_10,_11,_12){
with(_f){
objj_msgSend(_f,"setColor:",_11);
if(_12){
objj_msgSend(_activePicker,"setColor:",_color);
}
}
}),new objj_method(sel_getUid("color"),function(_13,_14){
with(_13){
return _color;
}
}),new objj_method(sel_getUid("setTarget:"),function(_15,_16,_17){
with(_15){
_target=_17;
}
}),new objj_method(sel_getUid("target"),function(_18,_19){
with(_18){
return _target;
}
}),new objj_method(sel_getUid("setAction:"),function(_1a,_1b,_1c){
with(_1a){
_action=_1c;
}
}),new objj_method(sel_getUid("action"),function(_1d,_1e){
with(_1d){
return _action;
}
}),new objj_method(sel_getUid("setMode:"),function(_1f,_20,_21){
with(_1f){
_mode=_21;
}
}),new objj_method(sel_getUid("_setPicker:"),function(_22,_23,_24){
with(_22){
var _25=_colorPickers[objj_msgSend(_24,"tag")],_26=objj_msgSend(_25,"provideNewView:",NO);
if(!_26){
_26=objj_msgSend(_25,"provideNewView:",YES);
}
if(_26==_currentView){
return;
}
if(_currentView){
objj_msgSend(_26,"setFrame:",objj_msgSend(_currentView,"frame"));
}else{
var _27=(_2+10+_1+5+_3+10),_28=objj_msgSend(objj_msgSend(_22,"contentView"),"bounds");
objj_msgSend(_26,"setFrameSize:",CPSizeMake(_28.size.width-10,_28.size.height-_27));
objj_msgSend(_26,"setFrameOrigin:",CPPointMake(5,_27));
}
objj_msgSend(_currentView,"removeFromSuperview");
objj_msgSend(objj_msgSend(_22,"contentView"),"addSubview:",_26);
_currentView=_26;
_activePicker=_25;
objj_msgSend(_25,"setColor:",objj_msgSend(_22,"color"));
}
}),new objj_method(sel_getUid("mode"),function(_29,_2a){
with(_29){
return _mode;
}
}),new objj_method(sel_getUid("orderFront:"),function(_2b,_2c,_2d){
with(_2b){
objj_msgSend(_2b,"_loadContentsIfNecessary");
objj_msgSendSuper({receiver:_2b,super_class:objj_getClass("CPPanel")},"orderFront:",_2d);
}
}),new objj_method(sel_getUid("_loadContentsIfNecessary"),function(_2e,_2f){
with(_2e){
if(_toolbar){
return;
}
_colorPickers=[];
var _30=objj_msgSend(_7,"count");
for(var i=0;i<_30;i++){
var _32=_7[i],_33=objj_msgSend(objj_msgSend(_32,"alloc"),"initWithPickerMask:colorPanel:",0,_2e);
_colorPickers.push(_33);
}
var _34=objj_msgSend(_2e,"contentView"),_35=objj_msgSend(_34,"bounds");
_toolbar=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_35),_2));
objj_msgSend(_toolbar,"setAutoresizingMask:",CPViewWidthSizable);
var _36=_30*_4+(_30-1)*_5,_37=(CGRectGetWidth(_35)-_36)/2,_38=nil;
for(var i=0;i<_30;i++){
var _39=objj_msgSend(_colorPickers[i],"provideNewButtonImage"),_3a=objj_msgSend(_colorPickers[i],"provideNewAlternateButtonImage"),_3b=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(_37+i*(_4+_5),0,_4,_4));
objj_msgSend(_3b,"setTag:",i);
objj_msgSend(_3b,"setTarget:",_2e);
objj_msgSend(_3b,"setAction:",sel_getUid("_setPicker:"));
objj_msgSend(_3b,"setBordered:",NO);
objj_msgSend(_3b,"setAutoresizingMask:",CPViewMinXMargin|CPViewMaxXMargin);
objj_msgSend(_3b,"setImage:",_39);
objj_msgSend(_3b,"setAlternateImage:",_3a);
objj_msgSend(_toolbar,"addSubview:",_3b);
if(!_38){
_38=_3b;
}
}
var _3c=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(76,_2+10,CGRectGetWidth(_35)-86,_1));
_previewView=objj_msgSend(objj_msgSend(_CPColorPanelPreview,"alloc"),"initWithFrame:",CGRectInset(objj_msgSend(_3c,"bounds"),2,2));
objj_msgSend(_previewView,"setColorPanel:",_2e);
objj_msgSend(_previewView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_3c,"setBackgroundColor:",objj_msgSend(CPColor,"grayColor"));
objj_msgSend(_3c,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_3c,"addSubview:",_previewView);
_previewLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(10,_2+14,60,15));
objj_msgSend(_previewLabel,"setStringValue:","Preview:");
objj_msgSend(_previewLabel,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_previewLabel,"setAlignment:",CPRightTextAlignment);
var _3d=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(76,_2+10+_1+5,CGRectGetWidth(_35)-86,_3+2));
objj_msgSend(_3d,"setBackgroundColor:",objj_msgSend(CPColor,"grayColor"));
objj_msgSend(_3d,"setAutoresizingMask:",CPViewWidthSizable);
_swatchView=objj_msgSend(objj_msgSend(_CPColorPanelSwatches,"alloc"),"initWithFrame:",CGRectInset(objj_msgSend(_3d,"bounds"),1,1));
objj_msgSend(_swatchView,"setColorPanel:",_2e);
objj_msgSend(_swatchView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_3d,"addSubview:",_swatchView);
_swatchLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(10,_2+8+_1+5,60,15));
objj_msgSend(_swatchLabel,"setStringValue:","Swatches:");
objj_msgSend(_swatchLabel,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_swatchLabel,"setAlignment:",CPRightTextAlignment);
objj_msgSend(_34,"addSubview:",_toolbar);
objj_msgSend(_34,"addSubview:",_3c);
objj_msgSend(_34,"addSubview:",_previewLabel);
objj_msgSend(_34,"addSubview:",_3d);
objj_msgSend(_34,"addSubview:",_swatchLabel);
_target=nil;
_action=nil;
_activePicker=nil;
objj_msgSend(_2e,"setColor:",objj_msgSend(CPColor,"whiteColor"));
if(_38){
objj_msgSend(_2e,"_setPicker:",_38);
}
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("provideColorPickerClass:"),function(_3e,_3f,_40){
with(_3e){
_7.push(_40);
}
}),new objj_method(sel_getUid("sharedColorPanel"),function(_41,_42){
with(_41){
if(!_6){
_6=objj_msgSend(objj_msgSend(CPColorPanel,"alloc"),"init");
}
return _6;
}
}),new objj_method(sel_getUid("setPickerMode:"),function(_43,_44,_45){
with(_43){
var _46=objj_msgSend(CPColorPanel,"sharedColorPanel");
objj_msgSend(_46,"setMode:",_45);
}
})]);
CPColorDragType="CPColorDragType";
var _47="CPColorPanelSwatchesCookie";
var _8=objj_allocateClassPair(CPView,"_CPColorPanelSwatches"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_swatches"),new objj_ivar("_dragColor"),new objj_ivar("_colorPanel"),new objj_ivar("_swatchCookie")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("initWithFrame:"),function(_48,_49,_4a){
with(_48){
_48=objj_msgSendSuper({receiver:_48,super_class:objj_getClass("CPView")},"initWithFrame:",_4a);
objj_msgSend(_48,"setBackgroundColor:",objj_msgSend(CPColor,"grayColor"));
objj_msgSend(_48,"registerForDraggedTypes:",objj_msgSend(CPArray,"arrayWithObjects:",CPColorDragType));
var _4b=objj_msgSend(CPColor,"whiteColor");
_swatchCookie=objj_msgSend(objj_msgSend(CPCookie,"alloc"),"initWithName:",_47);
var _4c=objj_msgSend(_48,"startingColorList");
_swatches=[];
for(var i=0;i<50;i++){
var _4e=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(13*i+1,1,12,12)),_4f=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectInset(objj_msgSend(_4e,"bounds"),1,1));
objj_msgSend(_4e,"setBackgroundColor:",_4b);
objj_msgSend(_4f,"setBackgroundColor:",(i<_4c.length)?_4c[i]:_4b);
objj_msgSend(_4e,"addSubview:",_4f);
objj_msgSend(_48,"addSubview:",_4e);
_swatches.push(_4e);
}
return _48;
}
}),new objj_method(sel_getUid("isOpaque"),function(_50,_51){
with(_50){
return YES;
}
}),new objj_method(sel_getUid("startingColorList"),function(_52,_53){
with(_52){
var _54=objj_msgSend(_swatchCookie,"value");
if(_54==""){
return [objj_msgSend(CPColor,"blackColor"),objj_msgSend(CPColor,"darkGrayColor"),objj_msgSend(CPColor,"grayColor"),objj_msgSend(CPColor,"lightGrayColor"),objj_msgSend(CPColor,"whiteColor"),objj_msgSend(CPColor,"redColor"),objj_msgSend(CPColor,"greenColor"),objj_msgSend(CPColor,"blueColor"),objj_msgSend(CPColor,"yellowColor")];
}
var _54=eval(_54);
var _55=[];
for(var i=0;i<_54.length;i++){
_55.push(objj_msgSend(CPColor,"colorWithHexString:",_54[i]));
}
return _55;
}
}),new objj_method(sel_getUid("saveColorList"),function(_57,_58){
with(_57){
var _59=[];
for(var i=0;i<_swatches.length;i++){
_59.push(objj_msgSend(objj_msgSend(objj_msgSend(_swatches[i],"subviews")[0],"backgroundColor"),"hexString"));
}
var _5b=new Date();
_5b.setYear(2019);
objj_msgSend(_swatchCookie,"setValue:expires:domain:",CPJSObjectCreateJSON(_59),_5b,nil);
}
}),new objj_method(sel_getUid("setColorPanel:"),function(_5c,_5d,_5e){
with(_5c){
_colorPanel=_5e;
}
}),new objj_method(sel_getUid("colorPanel"),function(_5f,_60){
with(_5f){
return _colorPanel;
}
}),new objj_method(sel_getUid("colorAtIndex:"),function(_61,_62,_63){
with(_61){
return objj_msgSend(objj_msgSend(_swatches[_63],"subviews")[0],"backgroundColor");
}
}),new objj_method(sel_getUid("setColor:atIndex:"),function(_64,_65,_66,_67){
with(_64){
objj_msgSend(objj_msgSend(_swatches[_67],"subviews")[0],"setBackgroundColor:",_66);
objj_msgSend(_64,"saveColorList");
}
}),new objj_method(sel_getUid("mouseUp:"),function(_68,_69,_6a){
with(_68){
var _6b=objj_msgSend(_68,"convertPoint:fromView:",objj_msgSend(_6a,"locationInWindow"),nil);
if(_6b.x>objj_msgSend(_68,"bounds").size.width-1||_6b.x<1){
return NO;
}
objj_msgSend(_colorPanel,"setColor:updatePicker:",objj_msgSend(_68,"colorAtIndex:",FLOOR(_6b.x/13)),YES);
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_6c,_6d,_6e){
with(_6c){
var _6f=objj_msgSend(_6c,"convertPoint:fromView:",objj_msgSend(_6e,"locationInWindow"),nil);
if(_6f.x>objj_msgSend(_6c,"bounds").size.width-1||_6f.x<1){
return NO;
}
objj_msgSend(objj_msgSend(CPPasteboard,"pasteboardWithName:",CPDragPboard),"declareTypes:owner:",objj_msgSend(CPArray,"arrayWithObject:",CPColorDragType),_6c);
var _70=_swatches[FLOOR(_6f.x/13)];
_dragColor=objj_msgSend(objj_msgSend(_70,"subviews")[0],"backgroundColor");
var _71=CPRectCreateCopy(objj_msgSend(_70,"bounds"));
var _72=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_71);
dragFillView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectInset(_71,1,1));
objj_msgSend(_72,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(dragFillView,"setBackgroundColor:",_dragColor);
objj_msgSend(_72,"addSubview:",dragFillView);
objj_msgSend(_6c,"dragView:at:offset:event:pasteboard:source:slideBack:",_72,CPPointMake(_6f.x-_71.size.width/2,_6f.y-_71.size.height/2),CPPointMake(0,0),_6e,nil,_6c,YES);
}
}),new objj_method(sel_getUid("pasteboard:provideDataForType:"),function(_73,_74,_75,_76){
with(_73){
if(_76==CPColorDragType){
objj_msgSend(_75,"setData:forType:",_dragColor,_76);
}
}
}),new objj_method(sel_getUid("performDragOperation:"),function(_77,_78,_79){
with(_77){
var _7a=objj_msgSend(_77,"convertPoint:fromView:",objj_msgSend(_79,"draggingLocation"),nil),_7b=objj_msgSend(_79,"draggingPasteboard"),_7c=nil;
if(!objj_msgSend(_7b,"availableTypeFromArray:",[CPColorDragType])||_7a.x>objj_msgSend(_77,"bounds").size.width-1||_7a.x<1){
return NO;
}
objj_msgSend(_77,"setColor:atIndex:",objj_msgSend(_7b,"dataForType:",CPColorDragType),FLOOR(_7a.x/13));
}
})]);
var _8=objj_allocateClassPair(CPView,"_CPColorPanelPreview"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_colorPanel")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("initWithFrame:"),function(_7d,_7e,_7f){
with(_7d){
_7d=objj_msgSendSuper({receiver:_7d,super_class:objj_getClass("CPView")},"initWithFrame:",_7f);
objj_msgSend(_7d,"registerForDraggedTypes:",objj_msgSend(CPArray,"arrayWithObjects:",CPColorDragType));
return _7d;
}
}),new objj_method(sel_getUid("setColorPanel:"),function(_80,_81,_82){
with(_80){
_colorPanel=_82;
}
}),new objj_method(sel_getUid("colorPanel"),function(_83,_84){
with(_83){
return _colorPanel;
}
}),new objj_method(sel_getUid("performDragOperation:"),function(_85,_86,_87){
with(_85){
var _88=objj_msgSend(_87,"draggingPasteboard");
if(!objj_msgSend(_88,"availableTypeFromArray:",[CPColorDragType])){
return NO;
}
var _89=objj_msgSend(_88,"dataForType:",CPColorDragType);
objj_msgSend(_colorPanel,"setColor:updatePicker:",_89,YES);
}
}),new objj_method(sel_getUid("isOpaque"),function(_8a,_8b){
with(_8a){
return YES;
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_8c,_8d,_8e){
with(_8c){
var _8f=objj_msgSend(_8c,"convertPoint:fromView:",objj_msgSend(_8e,"locationInWindow"),nil);
objj_msgSend(objj_msgSend(CPPasteboard,"pasteboardWithName:",CPDragPboard),"declareTypes:owner:",objj_msgSend(CPArray,"arrayWithObject:",CPColorDragType),_8c);
var _90=CPRectMake(0,0,15,15);
var _91=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_90);
dragFillView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectInset(_90,1,1));
objj_msgSend(_91,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(dragFillView,"setBackgroundColor:",objj_msgSend(_8c,"backgroundColor"));
objj_msgSend(_91,"addSubview:",dragFillView);
objj_msgSend(_8c,"dragView:at:offset:event:pasteboard:source:slideBack:",_91,CPPointMake(_8f.x-_90.size.width/2,_8f.y-_90.size.height/2),CPPointMake(0,0),_8e,nil,_8c,YES);
}
}),new objj_method(sel_getUid("pasteboard:provideDataForType:"),function(_92,_93,_94,_95){
with(_92){
if(_95==CPColorDragType){
objj_msgSend(_94,"setData:forType:",objj_msgSend(_92,"backgroundColor"),_95);
}
}
})]);
i;15;CPColorPicker.ji;21;CPSliderColorPicker.jc;155;
objj_msgSend(CPColorPanel,"provideColorPickerClass:",CPColorWheelColorPicker);
objj_msgSend(CPColorPanel,"provideColorPickerClass:",CPSliderColorPicker);
p;15;CPColorPicker.jI;21;Foundation/CPObject.ji;14;CPColorPanel.jc;10371;
var _1=objj_allocateClassPair(CPObject,"CPColorPicker"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_panel"),new objj_ivar("_mask")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithPickerMask:colorPanel:"),function(_3,_4,_5,_6){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
_panel=_6;
_mask=_5;
return _3;
}
}),new objj_method(sel_getUid("colorPanel"),function(_7,_8){
with(_7){
return _panel;
}
}),new objj_method(sel_getUid("provideNewButtonImage"),function(_9,_a){
with(_9){
return nil;
}
}),new objj_method(sel_getUid("setMode:"),function(_b,_c,_d){
with(_b){
return;
}
}),new objj_method(sel_getUid("setColor:"),function(_e,_f,_10){
with(_e){
return;
}
})]);
var _1=objj_allocateClassPair(CPColorPicker,"CPColorWheelColorPicker"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_pickerView"),new objj_ivar("_brightnessSlider"),new objj_ivar("_brightnessBarImage"),new objj_ivar("_hueSaturationView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithPickerMask:colorPanel:"),function(_11,_12,_13,_14){
with(_11){
return objj_msgSendSuper({receiver:_11,super_class:objj_getClass("CPColorPicker")},"initWithPickerMask:colorPanel:",_13,_14);
}
}),new objj_method(sel_getUid("initView"),function(_15,_16){
with(_15){
aFrame=CPRectMake(0,0,CPColorPickerViewWidth,CPColorPickerViewHeight);
_pickerView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",aFrame);
objj_msgSend(_pickerView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _17=objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",CPColorPicker),"pathForResource:","brightness_bar.png");
_brightnessBarImage=new Image();
_brightnessBarImage.src=_17;
_brightnessBarImage.style.width="100%";
_brightnessBarImage.style.height="100%";
_brightnessBarImage.style.position="absolute";
_brightnessBarImage.style.top="0px";
_brightnessBarImage.style.left="0px";
var _18=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(0,(aFrame.size.height-34),aFrame.size.width,15));
objj_msgSend(_18,"setAutoresizingMask:",(CPViewWidthSizable|CPViewMinYMargin));
_18._DOMElement.appendChild(_brightnessBarImage);
_brightnessSlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CPRectMake(0,aFrame.size.height-22,aFrame.size.width,12));
objj_msgSend(_brightnessSlider,"setMaxValue:",100);
objj_msgSend(_brightnessSlider,"setMinValue:",0);
objj_msgSend(_brightnessSlider,"setFloatValue:",100);
objj_msgSend(_brightnessSlider,"setTarget:",_15);
objj_msgSend(_brightnessSlider,"setAction:",sel_getUid("brightnessSliderDidChange:"));
objj_msgSend(_brightnessSlider,"setAutoresizingMask:",(CPViewWidthSizable|CPViewMinYMargin));
_hueSaturationView=objj_msgSend(objj_msgSend(__CPColorWheel,"alloc"),"initWithFrame:",CPRectMake(0,0,aFrame.size.width,aFrame.size.height-38));
objj_msgSend(_hueSaturationView,"setDelegate:",_15);
objj_msgSend(_hueSaturationView,"setAutoresizingMask:",(CPViewWidthSizable|CPViewHeightSizable));
objj_msgSend(_pickerView,"addSubview:",_18);
objj_msgSend(_pickerView,"addSubview:",_hueSaturationView);
objj_msgSend(_pickerView,"addSubview:",_brightnessSlider);
}
}),new objj_method(sel_getUid("brightnessSliderDidChange:"),function(_19,_1a,_1b){
with(_19){
objj_msgSend(_19,"updateColor");
}
}),new objj_method(sel_getUid("colorWheelDidChange:"),function(_1c,_1d,_1e){
with(_1c){
objj_msgSend(_1c,"updateColor");
}
}),new objj_method(sel_getUid("updateColor"),function(_1f,_20){
with(_1f){
var hue=objj_msgSend(_hueSaturationView,"angle"),_22=objj_msgSend(_hueSaturationView,"distance"),_23=objj_msgSend(_brightnessSlider,"floatValue");
objj_msgSend(_hueSaturationView,"setWheelBrightness:",_23/100);
_brightnessBarImage.style.backgroundColor="#"+objj_msgSend(objj_msgSend(CPColor,"colorWithHue:saturation:brightness:",hue,_22,100),"hexString");
objj_msgSend(objj_msgSend(_1f,"colorPanel"),"setColor:",objj_msgSend(CPColor,"colorWithHue:saturation:brightness:",hue,_22,_23));
}
}),new objj_method(sel_getUid("supportsMode:"),function(_24,_25,_26){
with(_24){
return (_26==CPWheelColorPickerMode)?YES:NO;
}
}),new objj_method(sel_getUid("currentMode"),function(_27,_28){
with(_27){
return CPWheelColorPickerMode;
}
}),new objj_method(sel_getUid("provideNewView:"),function(_29,_2a,_2b){
with(_29){
if(_2b){
objj_msgSend(_29,"initView");
}
return _pickerView;
}
}),new objj_method(sel_getUid("setColor:"),function(_2c,_2d,_2e){
with(_2c){
var hsb=objj_msgSend(_2e,"hsbComponents");
objj_msgSend(_hueSaturationView,"setPositionToColor:",_2e);
objj_msgSend(_brightnessSlider,"setFloatValue:",hsb[2]);
objj_msgSend(_hueSaturationView,"setWheelBrightness:",hsb[2]/100);
_brightnessBarImage.style.backgroundColor="#"+objj_msgSend(objj_msgSend(CPColor,"colorWithHue:saturation:brightness:",hsb[0],hsb[1],100),"hexString");
}
}),new objj_method(sel_getUid("provideNewButtonImage"),function(_30,_31){
with(_30){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",CPColorPicker),"pathForResource:","wheel_button.png"),CGSizeMake(32,32));
}
}),new objj_method(sel_getUid("provideNewAlternateButtonImage"),function(_32,_33){
with(_32){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",CPColorPicker),"pathForResource:","wheel_button_h.png"),CGSizeMake(32,32));
}
})]);
var _1=objj_allocateClassPair(CPView,"__CPColorWheel"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_wheelImage"),new objj_ivar("_blackWheelImage"),new objj_ivar("_crosshair"),new objj_ivar("_delegate"),new objj_ivar("_angle"),new objj_ivar("_distance"),new objj_ivar("_radius")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_34,_35,_36){
with(_34){
_34=objj_msgSendSuper({receiver:_34,super_class:objj_getClass("CPView")},"initWithFrame:",_36);
var _37=objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",CPColorPicker),"pathForResource:","wheel.png");
_wheelImage=new Image();
_wheelImage.src=_37;
_wheelImage.style.position="absolute";
_37=objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",CPColorPicker),"pathForResource:","wheel_black.png");
_blackWheelImage=new Image();
_blackWheelImage.src=_37;
_blackWheelImage.style.opacity="0";
_blackWheelImage.style.filter="alpha(opacity=0)";
_blackWheelImage.style.position="absolute";
_DOMElement.appendChild(_wheelImage);
_DOMElement.appendChild(_blackWheelImage);
objj_msgSend(_34,"setWheelSize:",_36.size);
_crosshair=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(_radius-2,_radius-2,4,4));
objj_msgSend(_crosshair,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
var _38=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectInset(objj_msgSend(_crosshair,"bounds"),1,1));
objj_msgSend(_38,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_crosshair,"addSubview:",_38);
objj_msgSend(_34,"addSubview:",_crosshair);
return _34;
}
}),new objj_method(sel_getUid("setWheelBrightness:"),function(_39,_3a,_3b){
with(_39){
_blackWheelImage.style.opacity=1-_3b;
_blackWheelImage.style.filter="alpha(opacity="+(1-_3b)*100+")";
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_3c,_3d,_3e){
with(_3c){
objj_msgSendSuper({receiver:_3c,super_class:objj_getClass("CPView")},"setFrameSize:",_3e);
objj_msgSend(_3c,"setWheelSize:",_3e);
}
}),new objj_method(sel_getUid("setWheelSize:"),function(_3f,_40,_41){
with(_3f){
var min=MIN(_41.width,_41.height);
_blackWheelImage.style.width=min;
_blackWheelImage.style.height=min;
_blackWheelImage.width=min;
_blackWheelImage.height=min;
_blackWheelImage.style.top=(_41.height-min)/2+"px";
_blackWheelImage.style.left=(_41.width-min)/2+"px";
_wheelImage.style.width=min;
_wheelImage.style.height=min;
_wheelImage.width=min;
_wheelImage.height=min;
_wheelImage.style.top=(_41.height-min)/2+"px";
_wheelImage.style.left=(_41.width-min)/2+"px";
_radius=min/2;
objj_msgSend(_3f,"setAngle:distance:",objj_msgSend(_3f,"degreesToRadians:",_angle),(_distance/100)*_radius);
}
}),new objj_method(sel_getUid("setDelegate:"),function(_43,_44,_45){
with(_43){
_delegate=_45;
}
}),new objj_method(sel_getUid("delegate"),function(_46,_47){
with(_46){
return _delegate;
}
}),new objj_method(sel_getUid("angle"),function(_48,_49){
with(_48){
return _angle;
}
}),new objj_method(sel_getUid("distance"),function(_4a,_4b){
with(_4a){
return _distance;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_4c,_4d,_4e){
with(_4c){
objj_msgSend(_4c,"reposition:",_4e);
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_4f,_50,_51){
with(_4f){
objj_msgSend(_4f,"reposition:",_51);
}
}),new objj_method(sel_getUid("reposition:"),function(_52,_53,_54){
with(_52){
var _55=objj_msgSend(_52,"bounds"),_56=objj_msgSend(_52,"convertPoint:fromView:",objj_msgSend(_54,"locationInWindow"),nil);
var _57=CGRectGetMidX(_55);
var _58=CGRectGetMidY(_55);
var _59=MIN(SQRT((_56.x-_57)*(_56.x-_57)+(_56.y-_58)*(_56.y-_58)),_radius);
var _5a=ATAN2(_56.y-_58,_56.x-_57);
objj_msgSend(_52,"setAngle:distance:",_5a,_59);
if(_delegate){
objj_msgSend(_delegate,"colorWheelDidChange:",_52);
}
}
}),new objj_method(sel_getUid("setAngle:distance:"),function(_5b,_5c,_5d,_5e){
with(_5b){
var _5f=objj_msgSend(_5b,"bounds");
var _60=CGRectGetMidX(_5f);
var _61=CGRectGetMidY(_5f);
_angle=objj_msgSend(_5b,"radiansToDegrees:",_5d);
_distance=(_5e/_radius)*100;
objj_msgSend(_crosshair,"setFrameOrigin:",CPPointMake(COS(_5d)*_5e+_60-2,SIN(_5d)*_5e+_61-2));
}
}),new objj_method(sel_getUid("setPositionToColor:"),function(_62,_63,_64){
with(_62){
var hsb=objj_msgSend(_64,"hsbComponents"),_66=objj_msgSend(_62,"bounds");
var _67=objj_msgSend(_62,"degreesToRadians:",hsb[0]),_68=(hsb[1]/100)*_radius;
objj_msgSend(_62,"setAngle:distance:",_67,_68);
}
}),new objj_method(sel_getUid("radiansToDegrees:"),function(_69,_6a,_6b){
with(_69){
return ((-_6b/PI)*180+360)%360;
}
}),new objj_method(sel_getUid("degreesToRadians:"),function(_6c,_6d,_6e){
with(_6c){
return -(((_6e-360)/180)*PI);
}
})]);
p;13;CPColorWell.jI;21;Foundation/CPString.ji;8;CPView.ji;9;CPColor.ji;14;CPColorPanel.jc;5916;
var _1="_CPColorWellDidBecomeExclusiveNotification";
var _2=objj_allocateClassPair(CPControl,"CPColorWell"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_active"),new objj_ivar("_bordered"),new objj_ivar("_color"),new objj_ivar("_wellView")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPControl")},"initWithFrame:",_6);
if(_4){
_active=NO;
_bordered=YES;
_color=objj_msgSend(CPColor,"whiteColor");
objj_msgSend(_4,"drawBezelWithHighlight:",NO);
objj_msgSend(_4,"drawWellInside:",CGRectInset(objj_msgSend(_4,"bounds"),3,3));
objj_msgSend(_4,"_registerForNotifications");
}
return _4;
}
}),new objj_method(sel_getUid("_registerForNotifications"),function(_7,_8){
with(_7){
var _9=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_9,"addObserver:selector:name:object:",_7,sel_getUid("colorWellDidBecomeExclusive:"),_1,nil);
objj_msgSend(_9,"addObserver:selector:name:object:",_7,sel_getUid("colorPanelWillClose:"),CPWindowWillCloseNotification,objj_msgSend(CPColorPanel,"sharedColorPanel"));
}
}),new objj_method(sel_getUid("isBordered"),function(_a,_b){
with(_a){
return _bordered;
}
}),new objj_method(sel_getUid("setBordered:"),function(_c,_d,_e){
with(_c){
if(_bordered==_e){
return;
}
_bordered=_e;
objj_msgSend(_c,"drawWellInside:",CGRectInset(objj_msgSend(_c,"bounds"),3,3));
}
}),new objj_method(sel_getUid("color"),function(_f,_10){
with(_f){
return _color;
}
}),new objj_method(sel_getUid("setColor:"),function(_11,_12,_13){
with(_11){
if(_color==_13){
return;
}
_color=_13;
objj_msgSend(_11,"drawWellInside:",CGRectInset(objj_msgSend(_11,"bounds"),3,3));
}
}),new objj_method(sel_getUid("takeColorFrom:"),function(_14,_15,_16){
with(_14){
objj_msgSend(_14,"setColor:",objj_msgSend(_16,"color"));
}
}),new objj_method(sel_getUid("activate:"),function(_17,_18,_19){
with(_17){
if(_19){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_1,_17);
}
if(objj_msgSend(_17,"isActive")){
return;
}
_active=YES;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_17,sel_getUid("colorPanelDidChangeColor:"),CPColorPanelColorDidChangeNotification,objj_msgSend(CPColorPanel,"sharedColorPanel"));
}
}),new objj_method(sel_getUid("deactivate"),function(_1a,_1b){
with(_1a){
if(!objj_msgSend(_1a,"isActive")){
return;
}
_active=NO;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_1a,CPColorPanelColorDidChangeNotification,objj_msgSend(CPColorPanel,"sharedColorPanel"));
}
}),new objj_method(sel_getUid("isActive"),function(_1c,_1d){
with(_1c){
return _active;
}
}),new objj_method(sel_getUid("drawBezelWithHighlight:"),function(_1e,_1f,_20){
with(_1e){
}
}),new objj_method(sel_getUid("drawWellInside:"),function(_21,_22,_23){
with(_21){
if(!_wellView){
_wellView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_23);
objj_msgSend(_wellView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_21,"addSubview:",_wellView);
}else{
objj_msgSend(_wellView,"setFrame:",_23);
}
objj_msgSend(_wellView,"setBackgroundColor:",_color);
}
}),new objj_method(sel_getUid("colorPanelDidChangeColor:"),function(_24,_25,_26){
with(_24){
objj_msgSend(_24,"takeColorFrom:",objj_msgSend(_26,"object"));
objj_msgSend(_24,"sendAction:to:",objj_msgSend(_24,"action"),objj_msgSend(_24,"target"));
}
}),new objj_method(sel_getUid("colorWellDidBecomeExclusive:"),function(_27,_28,_29){
with(_27){
if(_27!=objj_msgSend(_29,"object")){
objj_msgSend(_27,"deactivate");
}
}
}),new objj_method(sel_getUid("colorPanelWillClose:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_2a,"deactivate");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_2d,_2e,_2f){
with(_2d){
objj_msgSend(_2d,"drawBezelWithHighlight:",YES);
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_30,_31,_32){
with(_30){
objj_msgSend(_30,"drawBezelWithHighlight:",CGRectContainsPoint(objj_msgSend(_30,"bounds"),objj_msgSend(_30,"convertPoint:fromView:",objj_msgSend(_32,"locationInWindow"),nil)));
}
}),new objj_method(sel_getUid("mouseUp:"),function(_33,_34,_35){
with(_33){
objj_msgSend(_33,"drawBezelWithHighlight:",NO);
if(!CGRectContainsPoint(objj_msgSend(_33,"bounds"),objj_msgSend(_33,"convertPoint:fromView:",objj_msgSend(_35,"locationInWindow"),nil))){
return;
}
objj_msgSend(_33,"activate:",YES);
var _36=objj_msgSend(CPColorPanel,"sharedColorPanel");
objj_msgSend(_36,"setColor:",_color);
objj_msgSend(_36,"orderFront:",_33);
}
})]);
var _37="CPColorWellColorKey",_38="CPColorWellBorderedKey";
var _2=objj_getClass("CPColorWell");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPColorWell\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_39,_3a,_3b){
with(_39){
_39=objj_msgSendSuper({receiver:_39,super_class:objj_getClass("CPControl")},"initWithCoder:",_3b);
if(_39){
_active=NO;
_bordered=objj_msgSend(_3b,"decodeObjectForKey:",_38);
_color=objj_msgSend(_3b,"decodeObjectForKey:",_37);
objj_msgSend(_39,"drawBezelWithHighlight:",NO);
objj_msgSend(_39,"drawWellInside:",CGRectInset(objj_msgSend(_39,"bounds"),3,3));
objj_msgSend(_39,"_registerForNotifications");
}
return _39;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_3c,_3d,_3e){
with(_3c){
var _3f=_subviews;
_subviews=objj_msgSend(_subviews,"copy");
objj_msgSend(_subviews,"removeObjectIdenticalTo:",_wellView);
objj_msgSendSuper({receiver:_3c,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_3e);
_subviews=_3f;
objj_msgSend(_3e,"encodeObject:forKey:",_color,_37);
objj_msgSend(_3e,"encodeObject:forKey:",_bordered,_38);
}
})]);
p;17;CPCompatibility.ji;9;CPEvent.jc;3177;
CPUnknownBrowserEngine=0;
CPGeckoBrowserEngine=1;
CPInternetExplorerBrowserEngine=2;
CPKHTMLBrowserEngine=3;
CPOperaBrowserEngine=4;
CPWebKitBrowserEngine=5;
CPCSSRGBAFeature=1<<5;
CPHTMLCanvasFeature=1<<6;
CPHTMLContentEditableFeature=1<<7;
CPJavascriptInnerTextFeature=1<<8;
CPJavascriptTextContentFeature=1<<9;
CPJavascriptClipboardEventsFeature=1<<10;
CPJavascriptClipboardAccessFeature=1<<11;
CPJavaScriptCanvasDrawFeature=1<<12;
CPJavaScriptCanvasTransformFeature=1<<13;
CPVMLFeature=1<<14;
CPJavascriptRemedialKeySupport=1<<15;
CPJavaScriptShadowFeature=1<<20;
CPJavaScriptNegativeMouseWheelValues=1<<22;
CPOpacityRequiresFilterFeature=1<<23;
var _1="";
PLATFORM_ENGINE=CPUnknownBrowserEngine,PLATFORM_FEATURES=0;
if(typeof window!="undfined"&&typeof window.navigator!="undefined"){
_1=window.navigator.userAgent;
}
if(window.opera){
PLATFORM_ENGINE=CPOperaBrowserEngine;
PLATFORM_FEATURES|=CPJavaScriptCanvasDrawFeature;
}else{
if(window.attachEvent){
PLATFORM_ENGINE=CPInternetExplorerBrowserEngine;
PLATFORM_FEATURES|=CPVMLFeature;
PLATFORM_FEATURES|=CPJavascriptRemedialKeySupport;
PLATFORM_FEATURES|=CPJavaScriptShadowFeature;
PLATFORM_FEATURES|=CPOpacityRequiresFilterFeature;
}else{
if(_1.indexOf("AppleWebKit/")!=-1){
PLATFORM_ENGINE=CPWebKitBrowserEngine;
PLATFORM_FEATURES|=CPCSSRGBAFeature;
PLATFORM_FEATURES|=CPHTMLContentEditableFeature;
PLATFORM_FEATURES|=CPJavascriptClipboardEventsFeature;
PLATFORM_FEATURES|=CPJavascriptClipboardAccessFeature;
PLATFORM_FEATURES|=CPJavaScriptShadowFeature;
var _2=_1.indexOf("AppleWebKit/")+"AppleWebKit/".length,_3=_1.indexOf(" ",_2),_4=parseFloat(_1.substring(_2,_3),10);
if(_1.indexOf("Plainview")==-1&&_4>=525.14||_1.indexOf("Chrome")!=-1){
PLATFORM_FEATURES|=CPJavascriptRemedialKeySupport;
}
}else{
if(_1.indexOf("KHTML")!=-1){
PLATFORM_ENGINE=CPKHTMLBrowserEngine;
}else{
if(_1.indexOf("Gecko")!=-1){
PLATFORM_ENGINE=CPGeckoBrowserEngine;
PLATFORM_FEATURES|=CPJavaScriptCanvasDrawFeature;
var _5=_1.indexOf("Firefox"),_4=(_5==-1)?2:parseFloat(_1.substring(_5+"Firefox".length+1));
if(_4>=3){
PLATFORM_FEATURES|=CPCSSRGBAFeature;
}
}
}
}
}
}
if(typeof document!="undefined"){
var _6=document.createElement("canvas");
if(_6&&_6.getContext){
PLATFORM_FEATURES|=CPHTMLCanvasFeature;
var _7=document.createElement("canvas").getContext("2d");
if(_7&&_7.setTransform&&_7.transform){
PLATFORM_FEATURES|=CPJavaScriptCanvasTransformFeature;
}
}
var _8=document.createElement("div");
if(_8.innerText!=undefined){
PLATFORM_FEATURES|=CPJavascriptInnerTextFeature;
}else{
if(_8.textContent!=undefined){
PLATFORM_FEATURES|=CPJavascriptTextContentFeature;
}
}
}
CPFeatureIsCompatible=function(_9){
return PLATFORM_FEATURES&_9;
};
CPBrowserIsEngine=function(_a){
return PLATFORM_ENGINE==_a;
};
if(_1.indexOf("Mac")!=-1){
CPPlatformActionKeyMask=CPCommandKeyMask;
CPUndoKeyEquivalent="Z";
CPRedoKeyEquivalent="Z";
CPUndoKeyEquivalentModifierMask=CPCommandKeyMask;
CPRedoKeyEquivalentModifierMask=CPCommandKeyMask|CPShiftKeyMask;
}else{
CPPlatformActionKeyMask=CPControlKeyMask;
CPUndoKeyEquivalent="Z";
CPRedoKeyEquivalent="Y";
CPUndoKeyEquivalentModifierMask=CPControlKeyMask;
CPRedoKeyEquivalentModifierMask=CPControlKeyMask;
}
p;11;CPControl.ji;8;CPFont.ji;10;CPShadow.ji;8;CPView.jc;13588;
CPLeftTextAlignment=0;
CPRightTextAlignment=1;
CPCenterTextAlignment=2;
CPJustifiedTextAlignment=3;
CPNaturalTextAlignment=4;
CPRegularControlSize=0;
CPSmallControlSize=1;
CPMiniControlSize=2;
CPControlNormalBackgroundColor="CPControlNormalBackgroundColor";
CPControlSelectedBackgroundColor="CPControlSelectedBackgroundColor";
CPControlHighlightedBackgroundColor="CPControlHighlightedBackgroundColor";
CPControlDisabledBackgroundColor="CPControlDisabledBackgroundColor";
CPControlTextDidBeginEditingNotification="CPControlTextDidBeginEditingNotification";
CPControlTextDidChangeNotification="CPControlTextDidChangeNotification";
CPControlTextDidEndEditingNotification="CPControlTextDidEndEditingNotification";
var _1=objj_msgSend(CPColor,"blackColor");
var _2=objj_allocateClassPair(CPView,"CPControl"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_value"),new objj_ivar("_isEnabled"),new objj_ivar("_alignment"),new objj_ivar("_font"),new objj_ivar("_textColor"),new objj_ivar("_textShadow"),new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_sendActionOn"),new objj_ivar("_backgroundColors"),new objj_ivar("_currentBackgroundColorName")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPView")},"initWithFrame:",_6);
if(_4){
_sendActionOn=CPLeftMouseUpMask;
_isEnabled=YES;
objj_msgSend(_4,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",12));
objj_msgSend(_4,"setTextColor:",_1);
_backgroundColors=objj_msgSend(CPDictionary,"dictionary");
}
return _4;
}
}),new objj_method(sel_getUid("setEnabled:"),function(_7,_8,_9){
with(_7){
objj_msgSend(_7,"setAlphaValue:",(_isEnabled=_9)?1:0.3);
}
}),new objj_method(sel_getUid("isEnabled"),function(_a,_b){
with(_a){
return _isEnabled;
}
}),new objj_method(sel_getUid("setTextColor:"),function(_c,_d,_e){
with(_c){
if(_textColor==_e){
return;
}
_textColor=_e;
_DOMElement.style.color=objj_msgSend(_e,"cssString");
}
}),new objj_method(sel_getUid("textColor"),function(_f,_10){
with(_f){
return _textColor;
}
}),new objj_method(sel_getUid("alignment"),function(_11,_12){
with(_11){
return _alignment;
}
}),new objj_method(sel_getUid("setAlignment:"),function(_13,_14,_15){
with(_13){
_alignment=_15;
}
}),new objj_method(sel_getUid("setFont:"),function(_16,_17,_18){
with(_16){
if(_font==_18){
return;
}
_font=_18;
_DOMElement.style.font=objj_msgSend(_font?_font:objj_msgSend(CPFont,"systemFontOfSize:",12),"cssString");
}
}),new objj_method(sel_getUid("font"),function(_19,_1a){
with(_19){
return _font;
}
}),new objj_method(sel_getUid("setTextShadow:"),function(_1b,_1c,_1d){
with(_1b){
_DOMElement.style.textShadow=objj_msgSend(_textShadow=_1d,"cssString");
}
}),new objj_method(sel_getUid("textShadow"),function(_1e,_1f){
with(_1e){
return _textShadow;
}
}),new objj_method(sel_getUid("action"),function(_20,_21){
with(_20){
return _action;
}
}),new objj_method(sel_getUid("setAction:"),function(_22,_23,_24){
with(_22){
_action=_24;
}
}),new objj_method(sel_getUid("target"),function(_25,_26){
with(_25){
return _target;
}
}),new objj_method(sel_getUid("setTarget:"),function(_27,_28,_29){
with(_27){
_target=_29;
}
}),new objj_method(sel_getUid("mouseUp:"),function(_2a,_2b,_2c){
with(_2a){
if(_sendActionOn&CPLeftMouseUpMask&&CPRectContainsPoint(objj_msgSend(_2a,"bounds"),objj_msgSend(_2a,"convertPoint:fromView:",objj_msgSend(_2c,"locationInWindow"),nil))){
objj_msgSend(_2a,"sendAction:to:",_action,_target);
}
objj_msgSendSuper({receiver:_2a,super_class:objj_getClass("CPView")},"mouseUp:",_2c);
}
}),new objj_method(sel_getUid("sendAction:to:"),function(_2d,_2e,_2f,_30){
with(_2d){
objj_msgSend(CPApp,"sendAction:to:from:",_2f,_30,_2d);
}
}),new objj_method(sel_getUid("sendActionOn:"),function(_31,_32,_33){
with(_31){
var _34=_sendActionOn;
_sendActionOn=_33;
return _34;
}
}),new objj_method(sel_getUid("isContinuous"),function(_35,_36){
with(_35){
return (_sendActionOn&CPPeriodicMask)!=0;
}
}),new objj_method(sel_getUid("setContinuous:"),function(_37,_38,_39){
with(_37){
if(_39){
_sendActionOn|=CPPeriodicMask;
}else{
_sendActionOn&=~CPPeriodicMask;
}
}
}),new objj_method(sel_getUid("objectValue"),function(_3a,_3b){
with(_3a){
return _value;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_3c,_3d,_3e){
with(_3c){
_value=_3e;
}
}),new objj_method(sel_getUid("floatValue"),function(_3f,_40){
with(_3f){
var _41=parseFloat(_value,10);
return isNaN(_41)?0:_41;
}
}),new objj_method(sel_getUid("setFloatValue:"),function(_42,_43,_44){
with(_42){
objj_msgSend(_42,"setObjectValue:",_44);
}
}),new objj_method(sel_getUid("doubleValue"),function(_45,_46){
with(_45){
var _47=parseFloat(_value,10);
return isNaN(_47)?0:_47;
}
}),new objj_method(sel_getUid("setDoubleValue:"),function(_48,_49,_4a){
with(_48){
objj_msgSend(_48,"setObjectValue:",_4a);
}
}),new objj_method(sel_getUid("intValue"),function(_4b,_4c){
with(_4b){
var _4d=parseInt(_value,10);
return isNaN(_4d)?0:_4d;
}
}),new objj_method(sel_getUid("setIntValue:"),function(_4e,_4f,_50){
with(_4e){
objj_msgSend(_4e,"setObjectValue:",_50);
}
}),new objj_method(sel_getUid("integerValue"),function(_51,_52){
with(_51){
var _53=parseInt(_value,10);
return isNaN(_53)?0:_53;
}
}),new objj_method(sel_getUid("setIntegerValue:"),function(_54,_55,_56){
with(_54){
objj_msgSend(_54,"setObjectValue:",_56);
}
}),new objj_method(sel_getUid("stringValue"),function(_57,_58){
with(_57){
return _value?String(_value):"";
}
}),new objj_method(sel_getUid("setStringValue:"),function(_59,_5a,_5b){
with(_59){
objj_msgSend(_59,"setObjectValue:",_5b);
}
}),new objj_method(sel_getUid("takeDoubleValueFrom:"),function(_5c,_5d,_5e){
with(_5c){
if(objj_msgSend(_5e,"respondsToSelector:",sel_getUid("doubleValue"))){
objj_msgSend(_5c,"setDoubleValue:",objj_msgSend(_5e,"doubleValue"));
}
}
}),new objj_method(sel_getUid("takeFloatValueFrom:"),function(_5f,_60,_61){
with(_5f){
if(objj_msgSend(_61,"respondsToSelector:",sel_getUid("floatValue"))){
objj_msgSend(_5f,"setFloatValue:",objj_msgSend(_61,"floatValue"));
}
}
}),new objj_method(sel_getUid("takeIntegerValueFrom:"),function(_62,_63,_64){
with(_62){
if(objj_msgSend(_64,"respondsToSelector:",sel_getUid("integerValue"))){
objj_msgSend(_62,"setIntegerValue:",objj_msgSend(_64,"integerValue"));
}
}
}),new objj_method(sel_getUid("takeIntValueFrom:"),function(_65,_66,_67){
with(_65){
if(objj_msgSend(_67,"respondsToSelector:",sel_getUid("intValue"))){
objj_msgSend(_65,"setIntValue:",objj_msgSend(_67,"intValue"));
}
}
}),new objj_method(sel_getUid("takeObjectValueFrom:"),function(_68,_69,_6a){
with(_68){
if(objj_msgSend(_6a,"respondsToSelector:",sel_getUid("objectValue"))){
objj_msgSend(_68,"setObjectValue:",objj_msgSend(_6a,"objectValue"));
}
}
}),new objj_method(sel_getUid("takeStringValueFrom:"),function(_6b,_6c,_6d){
with(_6b){
if(objj_msgSend(_6d,"respondsToSelector:",sel_getUid("stringValue"))){
objj_msgSend(_6b,"setStringValue:",objj_msgSend(_6d,"stringValue"));
}
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_6e,_6f,_70){
with(_6e){
_backgroundColors=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_6e,"setBackgroundColor:forName:",_70,CPControlNormalBackgroundColor);
objj_msgSendSuper({receiver:_6e,super_class:objj_getClass("CPView")},"setBackgroundColor:",_70);
}
}),new objj_method(sel_getUid("setBackgroundColor:forName:"),function(_71,_72,_73,_74){
with(_71){
if(!_73){
objj_msgSend(_backgroundColors,"removeObjectForKey:",_74);
}else{
objj_msgSend(_backgroundColors,"setObject:forKey:",_73,_74);
}
if(_currentBackgroundColorName==_74){
objj_msgSend(_71,"setBackgroundColorWithName:",_currentBackgroundColorName);
}
}
}),new objj_method(sel_getUid("backgroundColorForName:"),function(_75,_76,_77){
with(_75){
var _78=objj_msgSend(_backgroundColors,"objectForKey:",_77);
if(!_78&&_77!=CPControlNormalBackgroundColor){
return objj_msgSend(_backgroundColors,"objectForKey:",CPControlNormalBackgroundColor);
}
return _78;
}
}),new objj_method(sel_getUid("setBackgroundColorWithName:"),function(_79,_7a,_7b){
with(_79){
_currentBackgroundColorName=_7b;
objj_msgSendSuper({receiver:_79,super_class:objj_getClass("CPView")},"setBackgroundColor:",objj_msgSend(_79,"backgroundColorForName:",_7b));
}
}),new objj_method(sel_getUid("textDidBeginEditing:"),function(_7c,_7d,_7e){
with(_7c){
if(objj_msgSend(_7e,"object")!=_7c){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidBeginEditingNotification,_7c,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_7e,"object"),"CPFieldEditor"));
}
}),new objj_method(sel_getUid("textDidChange:"),function(_7f,_80,_81){
with(_7f){
if(objj_msgSend(_81,"object")!=_7f){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidChangeNotification,_7f,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_81,"object"),"CPFieldEditor"));
}
}),new objj_method(sel_getUid("textDidEndEditing:"),function(_82,_83,_84){
with(_82){
if(objj_msgSend(_84,"object")!=_82){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPControlTextDidEndEditingNotification,_82,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_84,"object"),"CPFieldEditor"));
}
})]);
var _85="CPControlValueKey",_86="CPControlIsEnabledKey",_87="CPControlAlignmentKey",_88="CPControlFontKey",_89="CPControlTextColorKey",_8a="CPControlTargetKey",_8b="CPControlActionKey",_8c="CPControlSendActionOnKey";
var _2=objj_getClass("CPControl");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPControl\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_8d,_8e,_8f){
with(_8d){
_8d=objj_msgSendSuper({receiver:_8d,super_class:objj_getClass("CPView")},"initWithCoder:",_8f);
if(_8d){
objj_msgSend(_8d,"setObjectValue:",objj_msgSend(_8f,"decodeObjectForKey:",_85));
objj_msgSend(_8d,"setEnabled:",objj_msgSend(_8f,"decodeBoolForKey:",_86));
objj_msgSend(_8d,"setAlignment:",objj_msgSend(_8f,"decodeIntForKey:",_87));
objj_msgSend(_8d,"setFont:",objj_msgSend(_8f,"decodeObjectForKey:",_88));
objj_msgSend(_8d,"setTextColor:",objj_msgSend(_8f,"decodeObjectForKey:",_89));
objj_msgSend(_8d,"setTarget:",objj_msgSend(_8f,"decodeObjectForKey:",_8a));
objj_msgSend(_8d,"setAction:",objj_msgSend(_8f,"decodeObjectForKey:",_8b));
objj_msgSend(_8d,"sendActionOn:",objj_msgSend(_8f,"decodeIntForKey:",_8c));
}
return _8d;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_90,_91,_92){
with(_90){
objj_msgSendSuper({receiver:_90,super_class:objj_getClass("CPView")},"encodeWithCoder:",_92);
objj_msgSend(_92,"encodeObject:forKey:",_value,_85);
objj_msgSend(_92,"encodeBool:forKey:",_isEnabled,_86);
objj_msgSend(_92,"encodeInt:forKey:",_alignment,_87);
objj_msgSend(_92,"encodeObject:forKey:",_font,_88);
objj_msgSend(_92,"encodeObject:forKey:",_textColor,_89);
objj_msgSend(_92,"encodeConditionalObject:forKey:",_target,_8a);
objj_msgSend(_92,"encodeObject:forKey:",_action,_8b);
objj_msgSend(_92,"encodeInt:forKey:",_sendActionOn,_8c);
}
})]);
var _93=[],_94={},_95={},_96={};
_93[CPRegularControlSize]="Regular";
_93[CPSmallControlSize]="Small";
_93[CPMiniControlSize]="Mini";
_CPControlIdentifierForControlSize=function(_97){
return _93[_97];
};
_CPControlColorWithPatternImage=function(_98,_99){
var _9a=1,_9b=arguments.length,_9c="";
for(;_9a<_9b;++_9a){
_9c+=arguments[_9a];
}
var _9d=_95[_9c];
if(!_9d){
var _9e=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPControl,"class"));
_9d=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_9e,"pathForResource:",_99+"/"+_9c+".png"),_98[_9c]));
_95[_9c]=_9d;
}
return _9d;
};
_CPControlThreePartImages=function(_9f,_a0){
var _a1=1,_a2=arguments.length,_a3="";
for(;_a1<_a2;++_a1){
_a3+=arguments[_a1];
}
var _a4=_94[_a3];
if(!_a4){
var _a5=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPControl,"class")),_a6=_a0+"/"+_a3;
_9f=_9f[_a3];
_a4=[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_a5,"pathForResource:",_a6+"0.png"),_9f[0]),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_a5,"pathForResource:",_a6+"1.png"),_9f[1]),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_a5,"pathForResource:",_a6+"2.png"),_9f[2])];
_94[_a3]=_a4;
}
return _a4;
};
_CPControlThreePartImagePattern=function(_a7,_a8,_a9){
var _aa=2,_ab=arguments.length,_ac="";
for(;_aa<_ab;++_aa){
_ac+=arguments[_aa];
}
var _ad=_96[_ac];
if(!_ad){
var _ae=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPControl,"class")),_af=_a9+"/"+_ac;
_a8=_a8[_ac];
_ad=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ae,"pathForResource:",_af+"0.png"),_a8[0]),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ae,"pathForResource:",_af+"1.png"),_a8[1]),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ae,"pathForResource:",_af+"2.png"),_a8[2])],_a7));
_96[_ac]=_ad;
}
return _ad;
};
p;10;CPCookie.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jc;1385;
var _1=objj_allocateClassPair(CPObject,"CPCookie"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_cookieName"),new objj_ivar("_cookieValue"),new objj_ivar("_expires")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithName:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
_cookieName=_5;
_cookieValue=objj_msgSend(_3,"_readCookieValue");
return _3;
}
}),new objj_method(sel_getUid("value"),function(_6,_7){
with(_6){
return _cookieValue;
}
}),new objj_method(sel_getUid("name"),function(_8,_9){
with(_8){
return _cookieName;
}
}),new objj_method(sel_getUid("expires"),function(_a,_b){
with(_a){
return _expires;
}
}),new objj_method(sel_getUid("setValue:expires:domain:"),function(_c,_d,_e,_f,_10){
with(_c){
if(_f){
var _11="; expires="+_f.toGMTString();
}else{
var _11="";
}
if(_10){
_10="; domain="+_10;
}else{
_10="";
}
document.cookie=_cookieName+"="+_e+_11+"; path=/"+_10;
}
}),new objj_method(sel_getUid("_readCookieValue"),function(_12,_13){
with(_12){
var _14=_cookieName+"=";
var ca=document.cookie.split(";");
for(var i=0;i<ca.length;i++){
var c=ca[i];
while(c.charAt(0)==" "){
c=c.substring(1,c.length);
}
if(c.indexOf(_14)==0){
return c.substring(_14.length,c.length);
}
}
return "";
}
})]);
p;12;CPDocument.jI;21;Foundation/CPString.jI;20;Foundation/CPArray.ji;13;CPResponder.ji;20;CPWindowController.jc;12287;
CPSaveOperation=0;
CPSaveAsOperation=1;
CPSaveToOperation=2;
CPAutosaveOperation=3;
CPChangeDone=0;
CPChangeUndone=1;
CPChangeCleared=2;
CPChangeReadOtherContents=3;
CPChangeAutosaved=4;
CPDocumentWillSaveNotification="CPDocumentWillSaveNotification";
CPDocumentDidSaveNotification="CPDocumentDidSaveNotification";
CPDocumentDidFailToSaveNotification="CPDocumentDidFailToSaveNotification";
var _1=0;
var _2=objj_allocateClassPair(CPResponder,"CPDocument"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_fileURL"),new objj_ivar("_fileType"),new objj_ivar("_windowControllers"),new objj_ivar("_untitledDocumentIndex"),new objj_ivar("_hasUndoManager"),new objj_ivar("_undoManager"),new objj_ivar("_changeCount"),new objj_ivar("_readConnection"),new objj_ivar("_writeRequest")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPResponder")},"init");
if(_4){
_windowControllers=[];
_hasUndoManager=YES;
_changeCount=0;
objj_msgSend(_4,"setNextResponder:",CPApp);
}
return _4;
}
}),new objj_method(sel_getUid("initWithType:error:"),function(_6,_7,_8,_9){
with(_6){
_6=objj_msgSend(_6,"init");
if(_6){
objj_msgSend(_6,"setFileType:",_8);
}
return _6;
}
}),new objj_method(sel_getUid("initWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"),function(_a,_b,_c,_d,_e,_f,_10){
with(_a){
_a=objj_msgSend(_a,"init");
if(_a){
objj_msgSend(_a,"readFromURL:ofType:delegate:didReadSelector:contextInfo:",_c,_d,_e,_f,_10);
objj_msgSend(_a,"setFileURL:",_c);
objj_msgSend(_a,"setFileType:",_d);
}
return _a;
}
}),new objj_method(sel_getUid("initForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"),function(_11,_12,_13,_14,_15,_16,_17,_18){
with(_11){
_11=objj_msgSend(_11,"init");
if(_11){
objj_msgSend(_11,"readFromURL:ofType:delegate:didReadSelector:contextInfo:",_14,_15,_16,_17,_18);
objj_msgSend(_11,"setFileURL:",_13);
objj_msgSend(_11,"setFileType:",_15);
}
return _11;
}
}),new objj_method(sel_getUid("dataOfType:error:"),function(_19,_1a,_1b,_1c){
with(_19){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"dataOfType:error: must be overridden by the document subclass.");
}
}),new objj_method(sel_getUid("readFromData:ofType:error:"),function(_1d,_1e,_1f,_20,_21){
with(_1d){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"readFromData:ofType: must be overridden by the document subclass.");
}
}),new objj_method(sel_getUid("makeWindowControllers"),function(_22,_23){
with(_22){
var _24=objj_msgSend(objj_msgSend(CPWindowController,"alloc"),"initWithWindowCibName:",nil);
objj_msgSend(_22,"addWindowController:",_24);
}
}),new objj_method(sel_getUid("windowControllers"),function(_25,_26){
with(_25){
return _windowControllers;
}
}),new objj_method(sel_getUid("addWindowController:"),function(_27,_28,_29){
with(_27){
objj_msgSend(_windowControllers,"addObject:",_29);
if(objj_msgSend(_29,"document")!=_27){
objj_msgSend(_29,"setNextResponder:",_27);
objj_msgSend(_29,"setDocument:",_27);
}
}
}),new objj_method(sel_getUid("showWindows"),function(_2a,_2b){
with(_2a){
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("showWindow:"),_2a);
}
}),new objj_method(sel_getUid("displayName"),function(_2c,_2d){
with(_2c){
if(_fileURL){
return objj_msgSend(_fileURL,"lastPathComponent");
}
if(!_untitledDocumentIndex){
_untitledDocumentIndex=++_1;
}
if(_untitledDocumentIndex==1){
return "Untitled";
}
return "Untitled "+_untitledDocumentIndex;
}
}),new objj_method(sel_getUid("windowCibName"),function(_2e,_2f){
with(_2e){
return nil;
}
}),new objj_method(sel_getUid("windowControllerDidLoadNib:"),function(_30,_31,_32){
with(_30){
}
}),new objj_method(sel_getUid("windowControllerWillLoadNib:"),function(_33,_34,_35){
with(_33){
}
}),new objj_method(sel_getUid("readFromURL:ofType:delegate:didReadSelector:contextInfo:"),function(_36,_37,_38,_39,_3a,_3b,_3c){
with(_36){
objj_msgSend(_readConnection,"cancel");
_readConnection=objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",objj_msgSend(CPURLRequest,"requestWithURL:",_38),_36);
_readConnection.session=_3d(_39,_3a,_3b,_3c);
}
}),new objj_method(sel_getUid("fileURL"),function(_3e,_3f){
with(_3e){
return _fileURL;
}
}),new objj_method(sel_getUid("setFileURL:"),function(_40,_41,_42){
with(_40){
if(_fileURL==_42){
return;
}
_fileURL=_42;
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:",sel_getUid("synchronizeWindowTitleWithDocumentName"));
}
}),new objj_method(sel_getUid("saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:"),function(_43,_44,_45,_46,_47,_48,_49,_4a){
with(_43){
var _4b=objj_msgSend(_43,"dataOfType:error:",objj_msgSend(_43,"fileType"),nil),_4c=_changeCount;
_writeRequest=objj_msgSend(CPURLRequest,"requestWithURL:",_45);
objj_msgSend(_writeRequest,"setHTTPMethod:","POST");
objj_msgSend(_writeRequest,"setHTTPBody:",objj_msgSend(_4b,"string"));
objj_msgSend(_writeRequest,"setValue:forHTTPHeaderField:","close","Connection");
if(_47==CPSaveOperation){
objj_msgSend(_writeRequest,"setValue:forHTTPHeaderField:","true","x-cappuccino-overwrite");
}
if(_47!=CPSaveToOperation){
objj_msgSend(_43,"updateChangeCount:",CPChangeCleared);
}
var _4d=objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",_writeRequest,_43);
_4d.session=_4e(_45,_47,_4c,_48,_49,_4a,_4d);
}
}),new objj_method(sel_getUid("connection:didReceiveResponse:"),function(_4f,_50,_51,_52){
with(_4f){
var _53=objj_msgSend(_52,"statusCode");
if(_53==200){
return;
}
var _54=_51.session;
if(_51==_readConnection){
objj_msgSend(_51,"cancel");
alert("There was an error retrieving the document.");
objj_msgSend(_54.delegate,_54.didReadSelector,_4f,NO,_54.contextInfo);
}else{
if(_53==409){
objj_msgSend(_51,"cancel");
if(confirm("There already exists a file with that name, would you like to overwrite it?")){
objj_msgSend(_writeRequest,"setValue:forHTTPHeaderField:","true","x-cappuccino-overwrite");
objj_msgSend(_51,"start");
}else{
if(_54.saveOperation!=CPSaveToOperation){
_changeCount+=_54.changeCount;
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("setDocumentEdited:"),objj_msgSend(_4f,"isDocumentEdited"));
}
_writeRequest=nil;
objj_msgSend(_54.delegate,_54.didSaveSelector,_4f,NO,_54.contextInfo);
}
}
}
}
}),new objj_method(sel_getUid("connection:didReceiveData:"),function(_55,_56,_57,_58){
with(_55){
var _59=_57.session;
if(_57==_readConnection){
objj_msgSend(_55,"readFromData:ofType:error:",objj_msgSend(CPData,"dataWithString:",_58),_59.fileType,nil);
objj_msgSend(_59.delegate,_59.didReadSelector,_55,YES,_59.contextInfo);
}else{
if(_59.saveOperation!=CPSaveToOperation){
objj_msgSend(_55,"setFileURL:",_59.absoluteURL);
}
_writeRequest=nil;
objj_msgSend(_59.delegate,_59.didSaveSelector,_55,YES,_59.contextInfo);
}
}
}),new objj_method(sel_getUid("connection:didFailWithError:"),function(_5a,_5b,_5c,_5d){
with(_5a){
var _5e=_5c.session;
if(_readConnection==_5c){
objj_msgSend(_5e.delegate,_5e.didReadSelector,_5a,NO,_5e.contextInfo);
}else{
if(_5e.saveOperation!=CPSaveToOperation){
_changeCount+=_5e.changeCount;
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("setDocumentEdited:"),objj_msgSend(_5a,"isDocumentEdited"));
}
_writeRequest=nil;
alert("There was an error saving the document.");
objj_msgSend(_5e.delegate,_5e.didSaveSelector,_5a,NO,_5e.contextInfo);
}
}
}),new objj_method(sel_getUid("connectionDidFinishLoading:"),function(_5f,_60,_61){
with(_5f){
if(_readConnection==_61){
_readConnection=nil;
}
}
}),new objj_method(sel_getUid("isDocumentEdited"),function(_62,_63){
with(_62){
return _changeCount!=0;
}
}),new objj_method(sel_getUid("updateChangeCount:"),function(_64,_65,_66){
with(_64){
if(_66==CPChangeDone){
++_changeCount;
}else{
if(_66==CPChangeUndone){
--_changeCount;
}else{
if(_66==CPChangeCleared){
_changeCount=0;
}
}
}
objj_msgSend(_windowControllers,"makeObjectsPerformSelector:withObject:",sel_getUid("setDocumentEdited:"),objj_msgSend(_64,"isDocumentEdited"));
}
}),new objj_method(sel_getUid("setFileType:"),function(_67,_68,_69){
with(_67){
_fileType=_69;
}
}),new objj_method(sel_getUid("fileType"),function(_6a,_6b){
with(_6a){
return _fileType;
}
}),new objj_method(sel_getUid("hasUndoManager"),function(_6c,_6d){
with(_6c){
return _hasUndoManager;
}
}),new objj_method(sel_getUid("setHasUndoManager:"),function(_6e,_6f,_70){
with(_6e){
if(_hasUndoManager==_70){
return;
}
_hasUndoManager=_70;
if(!_hasUndoManager){
objj_msgSend(_6e,"setUndoManager:",nil);
}
}
}),new objj_method(sel_getUid("_undoManagerWillCloseGroup:"),function(_71,_72,_73){
with(_71){
var _74=objj_msgSend(_73,"object");
if(objj_msgSend(_74,"isUndoing")||objj_msgSend(_74,"isRedoing")){
return;
}
objj_msgSend(_71,"updateChangeCount:",CPChangeDone);
}
}),new objj_method(sel_getUid("_undoManagerDidUndoChange:"),function(_75,_76,_77){
with(_75){
objj_msgSend(_75,"updateChangeCount:",CPChangeUndone);
}
}),new objj_method(sel_getUid("_undoManagerDidRedoChange:"),function(_78,_79,_7a){
with(_78){
objj_msgSend(_78,"updateChangeCount:",CPChangeDone);
}
}),new objj_method(sel_getUid("setUndoManager:"),function(_7b,_7c,_7d){
with(_7b){
var _7e=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_undoManager){
objj_msgSend(_7e,"removeObserver:name:object:",_7b,CPUndoManagerDidUndoChangeNotification,_undoManager);
objj_msgSend(_7e,"removeObserver:name:object:",_7b,CPUndoManagerDidRedoChangeNotification,_undoManager);
objj_msgSend(_7e,"removeObserver:name:object:",_7b,CPUndoManagerWillCloseUndoGroupNotification,_undoManager);
}
_undoManager=_7d;
if(_undoManager){
objj_msgSend(_7e,"addObserver:selector:name:object:",_7b,sel_getUid("_undoManagerDidUndoChange:"),CPUndoManagerDidUndoChangeNotification,_undoManager);
objj_msgSend(_7e,"addObserver:selector:name:object:",_7b,sel_getUid("_undoManagerDidRedoChange:"),CPUndoManagerDidRedoChangeNotification,_undoManager);
objj_msgSend(_7e,"addObserver:selector:name:object:",_7b,sel_getUid("_undoManagerWillCloseGroup:"),CPUndoManagerWillCloseUndoGroupNotification,_undoManager);
}
}
}),new objj_method(sel_getUid("undoManager"),function(_7f,_80){
with(_7f){
if(_hasUndoManager&&!_undoManager){
objj_msgSend(_7f,"setUndoManager:",objj_msgSend(objj_msgSend(CPUndoManager,"alloc"),"init"));
}
return _undoManager;
}
}),new objj_method(sel_getUid("windowWillReturnUndoManager:"),function(_81,_82,_83){
with(_81){
return objj_msgSend(_81,"undoManager");
}
}),new objj_method(sel_getUid("saveDocument:"),function(_84,_85,_86){
with(_84){
if(_fileURL){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPDocumentWillSaveNotification,_84);
objj_msgSend(_84,"saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:",_fileURL,objj_msgSend(_84,"fileType"),CPSaveOperation,_84,sel_getUid("document:didSave:contextInfo:"),NULL);
}else{
objj_msgSend(_84,"saveDocumentAs:",_84);
}
}
}),new objj_method(sel_getUid("saveDocumentAs:"),function(_87,_88,_89){
with(_87){
_documentName=window.prompt("Document Name:");
if(!_documentName){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPDocumentWillSaveNotification,_87);
objj_msgSend(_87,"saveToURL:ofType:forSaveOperation:delegate:didSaveSelector:contextInfo:",objj_msgSend(_87,"proposedFileURL"),objj_msgSend(_87,"fileType"),CPSaveAsOperation,_87,sel_getUid("document:didSave:contextInfo:"),NULL);
}
}),new objj_method(sel_getUid("document:didSave:contextInfo:"),function(_8a,_8b,_8c,_8d,_8e){
with(_8a){
if(_8d){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPDocumentDidSaveNotification,_8a);
}else{
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPDocumentDidFailToSaveNotification,_8a);
}
}
})]);
var _3d=function(_8f,_90,_91,_92){
return {fileType:_8f,delegate:_90,didReadSelector:_91,contextInfo:_92};
};
var _4e=function(_93,_94,_95,_96,_97,_98,_99){
return {absoluteURL:_93,saveOperation:_94,changeCount:_95,delegate:_96,didSaveSelector:_97,contextInfo:_98,connection:_99};
};
p;22;CPDocumentController.jI;21;Foundation/CPObject.jI;21;Foundation/CPBundle.ji;12;CPDocument.jc;5371;
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPDocumentController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_documents"),new objj_ivar("_documentTypes")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_documents=objj_msgSend(objj_msgSend(CPArray,"alloc"),"init");
if(!_1){
_1=_4;
}
_documentTypes=objj_msgSend(objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"infoDictionary"),"objectForKey:","CPBundleDocumentTypes");
}
return _4;
}
}),new objj_method(sel_getUid("documentForURL:"),function(_6,_7,_8){
with(_6){
var _9=0,_a=objj_msgSend(_documents,"count");
for(;_9<_a;++_9){
var _b=_documents[_9];
if(objj_msgSend(objj_msgSend(_b,"fileURL"),"isEqual:",_8)){
return _b;
}
}
return nil;
}
}),new objj_method(sel_getUid("openUntitledDocumentOfType:display:"),function(_c,_d,_e,_f){
with(_c){
var _10=objj_msgSend(_c,"makeUntitledDocumentOfType:error:",_e,nil);
if(_10){
objj_msgSend(_c,"addDocument:",_10);
}
if(_f){
objj_msgSend(_10,"makeWindowControllers");
objj_msgSend(_10,"showWindows");
}
return _10;
}
}),new objj_method(sel_getUid("makeUntitledDocumentOfType:error:"),function(_11,_12,_13,_14){
with(_11){
return objj_msgSend(objj_msgSend(objj_msgSend(_11,"documentClassForType:",_13),"alloc"),"initWithType:error:",_13,_14);
}
}),new objj_method(sel_getUid("openDocumentWithContentsOfURL:display:error:"),function(_15,_16,_17,_18,_19){
with(_15){
var _1a=objj_msgSend(_15,"documentForURL:",_17);
if(!_1a){
var _1b=objj_msgSend(_15,"typeForContentsOfURL:error:",_17,_19);
_1a=objj_msgSend(_15,"makeDocumentWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:",_17,_1b,_15,sel_getUid("document:didRead:contextInfo:"),objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_18,"shouldDisplay"));
}else{
if(_18){
objj_msgSend(_1a,"showWindows");
}
}
return _1a;
}
}),new objj_method(sel_getUid("reopenDocumentForURL:withContentsOfURL:error:"),function(_1c,_1d,_1e,_1f,_20){
with(_1c){
return objj_msgSend(_1c,"makeDocumentForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:",_1e,_1f,objj_msgSend(objj_msgSend(_documentTypes,"objectAtIndex:",0),"objectForKey:","CPBundleTypeName"),_1c,sel_getUid("document:didRead:contextInfo:"),nil);
}
}),new objj_method(sel_getUid("makeDocumentWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"),function(_21,_22,_23,_24,_25,_26,_27){
with(_21){
return objj_msgSend(objj_msgSend(objj_msgSend(_21,"documentClassForType:",_24),"alloc"),"initWithContentsOfURL:ofType:delegate:didReadSelector:contextInfo:",_23,_24,_25,_26,_27);
}
}),new objj_method(sel_getUid("makeDocumentForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:"),function(_28,_29,_2a,_2b,_2c,_2d,_2e,_2f){
with(_28){
return objj_msgSend(objj_msgSend(objj_msgSend(_28,"documentClassForType:",_2c),"alloc"),"initForURL:withContentsOfURL:ofType:delegate:didReadSelector:contextInfo:",_2a,_2b,_2c,_2d,_2e,_2f);
}
}),new objj_method(sel_getUid("document:didRead:contextInfo:"),function(_30,_31,_32,_33,_34){
with(_30){
if(!_33){
return;
}
objj_msgSend(_30,"addDocument:",_32);
objj_msgSend(_32,"makeWindowControllers");
if(objj_msgSend(_34,"objectForKey:","shouldDisplay")){
objj_msgSend(_32,"showWindows");
}
}
}),new objj_method(sel_getUid("newDocument:"),function(_35,_36,_37){
with(_35){
objj_msgSend(_35,"openUntitledDocumentOfType:display:",objj_msgSend(objj_msgSend(_documentTypes,"objectAtIndex:",0),"objectForKey:","CPBundleTypeName"),YES);
}
}),new objj_method(sel_getUid("documents"),function(_38,_39){
with(_38){
return _documents;
}
}),new objj_method(sel_getUid("addDocument:"),function(_3a,_3b,_3c){
with(_3a){
objj_msgSend(_documents,"addObject:",_3c);
}
}),new objj_method(sel_getUid("removeDocument:"),function(_3d,_3e,_3f){
with(_3d){
objj_msgSend(_documents,"removeObjectIdenticalTo:",_3f);
}
}),new objj_method(sel_getUid("defaultType"),function(_40,_41){
with(_40){
return objj_msgSend(_documentTypes[0],"objectForKey:","CPBundleTypeName");
}
}),new objj_method(sel_getUid("typeForContentsOfURL:error:"),function(_42,_43,_44,_45){
with(_42){
var _46=0,_47=_documentTypes.length,_48=objj_msgSend(objj_msgSend(_44,"pathExtension"),"lowercaseString");
for(;_46<_47;++_46){
var _49=_documentTypes[_46],_4a=objj_msgSend(_49,"objectForKey:","CFBundleTypeExtensions"),_4b=0,_4c=_4a.length;
for(;_4b<_4c;++_4b){
if(objj_msgSend(_4a[_4b],"lowercaseString")==_48){
return objj_msgSend(_49,"objectForKey:","CPBundleTypeName");
}
}
}
return objj_msgSend(_42,"defaultType");
}
}),new objj_method(sel_getUid("_infoForType:"),function(_4d,_4e,_4f){
with(_4d){
var i=0,_51=objj_msgSend(_documentTypes,"count");
for(;i<_51;++i){
var _52=_documentTypes[i];
if(objj_msgSend(_52,"objectForKey:","CPBundleTypeName")==_4f){
return _52;
}
}
return nil;
}
}),new objj_method(sel_getUid("documentClassForType:"),function(_53,_54,_55){
with(_53){
var _56=objj_msgSend(objj_msgSend(_53,"_infoForType:",_55),"objectForKey:","CPDocumentClass");
return _56?CPClassFromString(_56):nil;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("sharedDocumentController"),function(_57,_58){
with(_57){
if(!_1){
objj_msgSend(objj_msgSend(_57,"alloc"),"init");
}
return _1;
}
})]);
p;20;CPDOMDisplayServer.jI;22;Foundation/CPRunLoop.jc;3171;
var _1=nil;
CPDOMDisplayServerInstructions=[];
CPDOMDisplayServerInstructionCount=0;
CPDOMDisplayServerViews=[];
CPDOMDisplayServerViewsCount=0;
CPDOMDisplayServerViewsContext={};
var _2=objj_allocateClassPair(CPObject,"CPDOMDisplayServer"),_3=_2.isa;
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("start"),function(_4,_5){
with(_4){
_1=objj_msgSend(CPRunLoop,"currentRunLoop");
objj_msgSend(_1,"performSelector:target:argument:order:modes:",sel_getUid("run"),CPDOMDisplayServer,nil,0,[CPDefaultRunLoopMode]);
}
}),new objj_method(sel_getUid("run"),function(_6,_7){
with(_6){
while(CPDOMDisplayServerInstructionCount||CPDOMDisplayServerViewsCount){
var _8=0;
while(_8<CPDOMDisplayServerInstructionCount){
var _9=CPDOMDisplayServerInstructions[_8++];
try{
switch(_9){
case 0:
case 1:
case 2:
case 3:
var _a=CPDOMDisplayServerInstructions[_8],_b=_a.style,x=(_9==0||_9==2)?"left":"right",y=(_9==0||_9==1)?"top":"bottom";
CPDOMDisplayServerInstructions[_8++]=nil;
var _e=CPDOMDisplayServerInstructions[_8++];
if(_e){
var _f={x:CPDOMDisplayServerInstructions[_8++],y:CPDOMDisplayServerInstructions[_8++]},_10={x:_f.x*_e.a+_f.y*_e.c+_e.tx,y:_f.x*_e.b+_f.y*_e.d+_e.ty};
_b[x]=ROUND(_10.x)+"px";
_b[y]=ROUND(_10.y)+"px";
}else{
_b[x]=ROUND(CPDOMDisplayServerInstructions[_8++])+"px";
_b[y]=ROUND(CPDOMDisplayServerInstructions[_8++])+"px";
}
_a.CPDOMDisplayContext[0]=-1;
break;
case 4:
var _a=CPDOMDisplayServerInstructions[_8],_b=_a.style;
CPDOMDisplayServerInstructions[_8++]=nil;
_a.CPDOMDisplayContext[4]=-1;
_b.width=MAX(0,ROUND(CPDOMDisplayServerInstructions[_8++]))+"px";
_b.height=MAX(0,ROUND(CPDOMDisplayServerInstructions[_8++]))+"px";
break;
case 5:
var _a=CPDOMDisplayServerInstructions[_8];
CPDOMDisplayServerInstructions[_8++]=nil;
_a.CPDOMDisplayContext[5]=-1;
_a.width=MAX(0,ROUND(CPDOMDisplayServerInstructions[_8++]));
_a.height=MAX(0,ROUND(CPDOMDisplayServerInstructions[_8++]));
break;
case 6:
CPDOMDisplayServerInstructions[_8].appendChild(CPDOMDisplayServerInstructions[_8+1]);
CPDOMDisplayServerInstructions[_8++]=nil;
CPDOMDisplayServerInstructions[_8++]=nil;
break;
case 7:
CPDOMDisplayServerInstructions[_8].insertBefore(CPDOMDisplayServerInstructions[_8+1],CPDOMDisplayServerInstructions[_8+2]);
CPDOMDisplayServerInstructions[_8++]=nil;
CPDOMDisplayServerInstructions[_8++]=nil;
CPDOMDisplayServerInstructions[_8++]=nil;
break;
case 8:
CPDOMDisplayServerInstructions[_8].removeChild(CPDOMDisplayServerInstructions[_8+1]);
CPDOMDisplayServerInstructions[_8++]=nil;
CPDOMDisplayServerInstructions[_8++]=nil;
break;
}
}
catch(e){
CPLog("here?"+_9);
}
}
CPDOMDisplayServerInstructionCount=0;
var _11=CPDOMDisplayServerViews,_8=0,_12=CPDOMDisplayServerViewsCount;
CPDOMDisplayServerViews=[];
CPDOMDisplayServerViewsCount=0;
for(;_8<_12;++_8){
var _13=_11[_8];
delete CPDOMDisplayServerViewsContext[objj_msgSend(_13,"hash")];
objj_msgSend(_13,"displayIfNeeded");
}
}
objj_msgSend(_1,"performSelector:target:argument:order:modes:",sel_getUid("run"),CPDOMDisplayServer,nil,0,[CPDefaultRunLoopMode]);
}
})]);
objj_msgSend(CPDOMDisplayServer,"start");
p;19;CPDOMWindowBridge.jI;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.ji;9;CPEvent.ji;17;CPCompatibility.ji;18;CPDOMWindowLayer.jc;17556;
CPSharedDOMWindowBridge=nil;
var _1=[];
var _2,_3,_4;
var _5=objj_allocateClassPair(CPObject,"CPDOMWindowBridge"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_orderedWindows"),new objj_ivar("_mouseDownWindow"),new objj_ivar("_DOMWindow"),new objj_ivar("_DOMBodyElement"),new objj_ivar("_DOMFocusElement"),new objj_ivar("_windowLevels"),new objj_ivar("_windowLayers"),new objj_ivar("_frame"),new objj_ivar("_contentBounds"),new objj_ivar("_mouseIsDown"),new objj_ivar("_lastMouseUp"),new objj_ivar("_lastMouseDown"),new objj_ivar("_currentMousePosition"),new objj_ivar("_charCodes"),new objj_ivar("_keyCode"),new objj_ivar("_DOMEventMode"),new objj_ivar("_DOMPasteboardElement"),new objj_ivar("_pasteboardKeyDownEvent"),new objj_ivar("_overriddenEventType")]);
objj_registerClassPair(_5);
objj_addClassForBundle(_5,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_5,[new objj_method(sel_getUid("initWithFrame:"),function(_7,_8,_9){
with(_7){
alert("unimplemented");
}
}),new objj_method(sel_getUid("_initWithDOMWindow:"),function(_a,_b,_c){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPObject")},"init");
if(_a){
_DOMWindow=_c;
_windowLevels=[];
_windowLayers=objj_msgSend(CPDictionary,"dictionary");
_DOMBodyElement=document.getElementsByTagName("body")[0];
_DOMBodyElement.innerHTML="";
_DOMBodyElement.style.overflow="hidden";
if(document.documentElement){
document.documentElement.style.overflow="hidden";
}
_frame=_2(_DOMWindow);
_contentBounds=CGRectMake(0,0,CPRectGetWidth(_frame),CPRectGetHeight(_frame));
_DOMFocusElement=document.createElement("input");
_DOMFocusElement.style.position="absolute";
_DOMFocusElement.style.zIndex="-1000";
_DOMFocusElement.style.opacity="0";
_DOMFocusElement.style.filter="alpha(opacity=0)";
_DOMBodyElement.appendChild(_DOMFocusElement);
_DOMPasteboardElement=document.createElement("input");
_DOMPasteboardElement.style.position="absolute";
_DOMPasteboardElement.style.top="-10000px";
_DOMPasteboardElement.style.zIndex="99";
_DOMBodyElement.appendChild(_DOMPasteboardElement);
_DOMPasteboardElement.blur();
_charCodes={};
var _d=objj_msgSend(_a,"class"),_e=sel_getUid("_bridgeKeyEvent:"),_f=class_getMethodImplementation(_d,_e),_10=function(_11){
_f(_a,nil,_11);
},_12=sel_getUid("_bridgeMouseEvent:"),_13=class_getMethodImplementation(_d,_12),_14=function(_15){
_13(_a,nil,_15);
},_16=sel_getUid("_bridgeScrollEvent:"),_17=class_getMethodImplementation(_d,_16),_18=function(_19){
_17(_a,nil,_19);
},_1a=sel_getUid("_bridgeResizeEvent:"),_1b=class_getMethodImplementation(_d,_1a),_1c=function(_1d){
_1b(_a,nil,_1d);
},_1e=_DOMWindow.document;
if(document.addEventListener){
_DOMWindow.addEventListener("resize",_1c,NO);
_1e.addEventListener(CPDOMEventMouseUp,_14,NO);
_1e.addEventListener(CPDOMEventMouseDown,_14,NO);
_1e.addEventListener(CPDOMEventMouseMoved,_14,NO);
_1e.addEventListener(CPDOMEventKeyUp,_10,NO);
_1e.addEventListener(CPDOMEventKeyDown,_10,NO);
_1e.addEventListener(CPDOMEventKeyPress,_10,NO);
_DOMWindow.addEventListener("DOMMouseScroll",_18,NO);
_DOMWindow.addEventListener(CPDOMEventScrollWheel,_18,NO);
}else{
if(document.attachEvent){
_DOMWindow.attachEvent("onresize",_1c);
_1e.attachEvent("on"+CPDOMEventMouseUp,_14);
_1e.attachEvent("on"+CPDOMEventMouseDown,_14);
_1e.attachEvent("on"+CPDOMEventMouseMoved,_14);
_1e.attachEvent("on"+CPDOMEventDoubleClick,_14);
_1e.attachEvent("on"+CPDOMEventKeyUp,_10);
_1e.attachEvent("on"+CPDOMEventKeyDown,_10);
_1e.attachEvent("on"+CPDOMEventKeyPress,_10);
_DOMWindow.onmousewheel=_18;
_1e.onmousewheel=_18;
_1e.body.ondrag=function(){
return NO;
};
_1e.body.onselectstart=function(){
return window.event.srcElement==_DOMPasteboardElement;
};
}
}
_1["INPUT"]=YES;
_1["SELECT"]=YES;
_1["TEXTAREA"]=YES;
_1["OPTION"]=YES;
}
return _a;
}
}),new objj_method(sel_getUid("frame"),function(_1f,_20){
with(_1f){
return CGRectMakeCopy(_frame);
}
}),new objj_method(sel_getUid("visibleFrame"),function(_21,_22){
with(_21){
var _23=objj_msgSend(_21,"frame");
_23.origin=CGPointMakeZero();
if(objj_msgSend(CPMenu,"menuBarVisible")){
var _24=objj_msgSend(objj_msgSend(CPApp,"mainMenu"),"menuBarHeight");
_23.origin.y+=_24;
_23.size.height-=_24;
}
return _23;
}
}),new objj_method(sel_getUid("contentBounds"),function(_25,_26){
with(_25){
return CPRectCreateCopy(_contentBounds);
}
}),new objj_method(sel_getUid("layerAtLevel:create:"),function(_27,_28,_29,_2a){
with(_27){
var _2b=objj_msgSend(_windowLayers,"objectForKey:",_29);
if(!_2b&&_2a){
_2b=objj_msgSend(objj_msgSend(CPDOMWindowLayer,"alloc"),"initWithLevel:",_29);
objj_msgSend(_windowLayers,"setObject:forKey:",_2b,_29);
var low=0,_2d=_windowLevels.length-1,_2e;
while(low<=_2d){
_2e=FLOOR((low+_2d)/2);
if(_windowLevels[_2e]>_29){
_2d=_2e-1;
}else{
low=_2e+1;
}
}
objj_msgSend(_windowLevels,"insertObject:atIndex:",_29,_windowLevels[_2e]>_29?_2e:_2e+1);
_2b._DOMElement.style.zIndex=_29;
_DOMBodyElement.appendChild(_2b._DOMElement);
}
return _2b;
}
}),new objj_method(sel_getUid("order:window:relativeTo:"),function(_2f,_30,_31,_32,_33){
with(_2f){
var _34=objj_msgSend(_2f,"layerAtLevel:create:",objj_msgSend(_32,"level"),_31!=CPWindowOut);
if(_31==CPWindowOut){
return objj_msgSend(_34,"removeWindow:",_32);
}
objj_msgSend(_34,"insertWindow:atIndex:",_32,(_33?(_31==CPWindowAbove?_33._index+1:_33._index):CPNotFound));
}
}),new objj_method(sel_getUid("_dragHitTest:pasteboard:"),function(_35,_36,_37,_38){
with(_35){
var _39=nil,_3a=_windowLevels,_3b=_windowLayers,_3c=_3a.length;
while(_3c--&&!_39){
if(_3a[_3c]>=CPDraggingWindowLevel){
continue;
}
var _3d=objj_msgSend(_3b,"objectForKey:",_3a[_3c])._windows,_3e=_3d.length;
while(_3e--){
var _3f=_3d[_3e],_40=_3f._frame;
if(CPRectContainsPoint(_40,_37)){
if(_39=objj_msgSend(_3f._windowView,"_dragHitTest:pasteboard:",CGPointMake(_37.x-_40.origin.x,_37.y-_40.origin.y),_38)){
return _39;
}else{
return nil;
}
}
}
}
return _39;
}
}),new objj_method(sel_getUid("_propagateCurrentDOMEvent:"),function(_41,_42,_43){
with(_41){
StopDOMEventPropagation=!_43;
}
}),new objj_method(sel_getUid("hitTest:"),function(_44,_45,_46){
with(_44){
var _47=_windowLevels,_48=_windowLayers,_49=_47.length,_4a=nil;
while(_49--&&!_4a){
var _4b=objj_msgSend(_48,"objectForKey:",_47[_49])._windows,_4c=_4b.length;
while(_4c--&&!_4a){
if(CPRectContainsPoint(_4b[_4c]._frame,_46)){
_4a=_4b[_4c];
}
}
}
return _4a;
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("sharedDOMWindowBridge"),function(_4d,_4e){
with(_4d){
if(!CPSharedDOMWindowBridge){
CPSharedDOMWindowBridge=objj_msgSend(objj_msgSend(CPDOMWindowBridge,"alloc"),"_initWithDOMWindow:",window);
}
return CPSharedDOMWindowBridge;
}
})]);
var _2=function(_4f){
var _50=nil;
if(_4f.outerWidth){
_50=CGRectMake(0,0,_4f.outerWidth,_4f.outerHeight);
}else{
_50=CGRectMake(0,0,-1,-1);
}
if(window.screenTop){
_50.origin=CGPointMake(_4f.screenLeft,_4f.screenTop,0);
}else{
if(window.screenX){
_50.origin=CGPointMake(_4f.screenX,_4f.screenY,0);
}
}
if(_4f.innerWidth){
_50.size=CGSizeMake(_4f.innerWidth,_4f.innerHeight);
}else{
if(document.documentElement&&document.documentElement.clientWidth){
_50.size=CGSizeMake(_4f.document.documentElement.clientWidth,_4f.document.documentElement.clientHeight);
}else{
_50.size=CGSizeMake(_4f.document.body.clientWidth,_4f.document.body.clientHeight);
}
}
return _50;
};
var _51={},_52={},_53={"8":1,"9":1,"37":1,"38":1,"39":1,"40":1,"46":1,"33":1,"34":1};
var _54=17;
var _5=objj_getClass("CPDOMWindowBridge");
if(!_5){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPDOMWindowBridge\""));
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("preventCharacterKeysFromPropagating:"),function(_55,_56,_57){
with(_55){
for(var i=_57.length;i>0;i--){
_52[""+_57[i-1].toLowerCase()]=YES;
}
}
}),new objj_method(sel_getUid("preventCharacterKeyFromPropagating:"),function(_59,_5a,_5b){
with(_59){
_52[_5b.toLowerCase()]=YES;
}
}),new objj_method(sel_getUid("clearCharacterKeysToPreventFromPropagating"),function(_5c,_5d){
with(_5c){
_52={};
}
}),new objj_method(sel_getUid("preventKeyCodesFromPropagating:"),function(_5e,_5f,_60){
with(_5e){
for(var i=_60.length;i>0;i--){
_51[_60[i-1]]=YES;
}
}
}),new objj_method(sel_getUid("preventKeyCodeFromPropagating:"),function(_62,_63,_64){
with(_62){
_51[_64]=YES;
}
}),new objj_method(sel_getUid("clearKeyCodesToPreventFromPropagating"),function(_65,_66){
with(_65){
_51={};
}
}),new objj_method(sel_getUid("_bridgeMouseEvent:"),function(_67,_68,_69){
with(_67){
var _6a=_overriddenEventType||_69.type;
if(_6a==CPDOMEventDoubleClick){
_overriddenEventType=CPDOMEventMouseDown;
objj_msgSend(_67,"_bridgeMouseEvent:",_69);
_overriddenEventType=CPDOMEventMouseUp;
objj_msgSend(_67,"_bridgeMouseEvent:",_69);
_overriddenEventType=nil;
return;
}
try{
var _6b,_6c={x:_69.clientX,y:_69.clientY},_6d=_69.timeStamp?_69.timeStamp:new Date(),_6e=(_69.target||_69.srcElement),_6f=0,_70=(_69.shiftKey?CPShiftKeyMask:0)|(_69.ctrlKey?CPControlKeyMask:0)|(_69.altKey?CPAlternateKeyMask:0)|(_69.metaKey?CPCommandKeyMask:0);
StopDOMEventPropagation=YES;
if(_mouseDownWindow){
_6f=objj_msgSend(_mouseDownWindow,"windowNumber");
}else{
var _71=objj_msgSend(_67,"hitTest:",_6c);
if(_69.type==CPDOMEventMouseDown&&_71){
_mouseDownWindow=_71;
}
_6f=objj_msgSend(_71,"windowNumber");
}
if(_6f){
var _72=CPApp._windows[_6f]._frame;
_6c.x-=(_72.origin.x);
_6c.y-=(_72.origin.y);
}
switch(_6a){
case CPDOMEventMouseUp:
if(_mouseIsDown){
_6b=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPLeftMouseUp,_6c,_70,_6d,_6f,nil,-1,_3(_lastMouseUp,_6d,_6c),0);
_mouseIsDown=NO;
_lastMouseUp=_6b;
_mouseDownWindow=nil;
}
if(_DOMEventMode){
_DOMEventMode=NO;
return;
}
break;
case CPDOMEventMouseDown:
if(_1[_6e.tagName]&&_6e!=_DOMFocusElement){
_DOMEventMode=YES;
_mouseIsDown=YES;
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPLeftMouseDown,_6c,_70,_6d,_6f,nil,-1,_3(_lastMouseDown,_6d,_6c),0));
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPLeftMouseUp,_6c,_70,_6d,_6f,nil,-1,_3(_lastMouseDown,_6d,_6c),0));
return;
}
_6b=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPLeftMouseDown,_6c,_70,_6d,_6f,nil,-1,_3(_lastMouseDown,_6d,_6c),0);
_mouseIsDown=YES;
_lastMouseDown=_6b;
break;
case CPDOMEventMouseMoved:
if(_DOMEventMode){
return;
}
_6b=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",_mouseIsDown?CPLeftMouseDragged:CPMouseMoved,_6c,_70,_6d,_6f,nil,-1,1,0);
_currentMousePosition={x:_69.clientX,y:_69.clientY};
break;
}
if(_6b){
_6b._DOMEvent=_69;
objj_msgSend(CPApp,"sendEvent:",_6b);
}
if(StopDOMEventPropagation){
_4(_69);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
catch(anException){
objj_exception_report(anException,{path:"CPDOMWindowBridge.j"});
}
}
}),new objj_method(sel_getUid("_bridgeKeyEvent:"),function(_73,_74,_75){
with(_73){
try{
var _76,_77=_75.timeStamp?_75.timeStamp:new Date(),_78=(_75.target||_75.srcElement),_79=objj_msgSend(objj_msgSend(CPApp,"keyWindow"),"windowNumber"),_7a=(_75.shiftKey?CPShiftKeyMask:0)|(_75.ctrlKey?CPControlKeyMask:0)|(_75.altKey?CPAlternateKeyMask:0)|(_75.metaKey?CPCommandKeyMask:0);
if(_1[_78.tagName]&&_78!=_DOMFocusElement&&_78!=_DOMPasteboardElement){
return;
}
StopDOMEventPropagation=!(_7a&(CPControlKeyMask|CPCommandKeyMask))||_52[String.fromCharCode(_75.keyCode||_75.charCode).toLowerCase()]||_51[_75.keyCode];
var _7b=NO,_7c=NO;
switch(_75.type){
case CPDOMEventKeyDown:
_keyCode=_75.keyCode;
var _7d=String.fromCharCode(_keyCode).toLowerCase();
if(_7d=="v"&&(_7a&CPPlatformActionKeyMask)){
_DOMPasteboardElement.select();
_DOMPasteboardElement.value="";
_7b=YES;
}else{
if((_7d=="c"||_7d=="x")&&(_7a&CPPlatformActionKeyMask)){
_7c=YES;
}else{
if(!CPFeatureIsCompatible(CPJavascriptRemedialKeySupport)){
return;
}else{
if(!_53[_keyCode]&&(_keyCode==_54||!(_7a&CPControlKeyMask))){
return;
}
}
}
}
case CPDOMEventKeyPress:
if((_75.target||_75.srcElement)==_DOMPasteboardElement){
return;
}
var _7e=_keyCode,_7f=_75.keyCode||_75.charCode,_80=(_charCodes[_7e]!=nil);
_charCodes[_7e]=_7f;
var _7d=String.fromCharCode(_7f),_81=_7d.toLowerCase();
_76=objj_msgSend(CPEvent,"keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",CPKeyDown,location,_7a,_77,_79,nil,_7d,_81,_80,_7e);
if(_7b){
_pasteboardKeyDownEvent=_76;
window.setTimeout(function(){
objj_msgSend(_73,"_checkPasteboardElement");
},0);
return;
}
break;
case CPDOMEventKeyUp:
var _7e=_75.keyCode,_7f=_charCodes[_7e];
_charCodes[_7e]=nil;
var _7d=String.fromCharCode(_7f),_81=_7d.toLowerCase();
if(!(_7a&CPShiftKeyMask)){
_7d=_81;
}
_76=objj_msgSend(CPEvent,"keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",CPKeyUp,location,_7a,_77,_79,nil,_7d,_81,NO,_7e);
break;
}
if(_76){
_76._DOMEvent=_75;
objj_msgSend(CPApp,"sendEvent:",_76);
if(_7c){
var _82=objj_msgSend(CPPasteboard,"generalPasteboard"),_83=objj_msgSend(_82,"types");
if(_83.length){
if(objj_msgSend(_83,"indexOfObjectIdenticalTo:",CPStringPboardType)!=CPNotFound){
_DOMPasteboardElement.value=objj_msgSend(_82,"stringForType:",CPStringPboardType);
}else{
_DOMPasteboardElement.value=objj_msgSend(_82,"_generateStateUID");
}
_DOMPasteboardElement.select();
window.setTimeout(function(){
objj_msgSend(_73,"_clearPasteboardElement");
},0);
}
return;
}
}
if(StopDOMEventPropagation){
_4(_75);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
catch(anException){
objj_exception_report(anException,{path:"CPDOMWindowBridge.j"});
}
}
}),new objj_method(sel_getUid("_bridgeScrollEvent:"),function(_84,_85,_86){
with(_84){
if(!_86){
_86=window.event;
}
try{
var _87=0,_88=0,_89=0,_8a=CGPointMake(_currentMousePosition.x,_currentMousePosition.y),_8b=_86.timeStamp?_86.timeStamp:new Date(),_8c=(_86.shiftKey?CPShiftKeyMask:0)|(_86.ctrlKey?CPControlKeyMask:0)|(_86.altKey?CPAlternateKeyMask:0)|(_86.metaKey?CPCommandKeyMask:0);
StopDOMEventPropagation=YES;
_89=objj_msgSend(objj_msgSend(_84,"hitTest:",_8a),"windowNumber");
if(!_89){
return;
}
var _8d=CPApp._windows[_89]._frame;
_8a.x-=CGRectGetMinX(_8d);
_8a.y-=CGRectGetMinY(_8d);
if(typeof _86.wheelDeltaX!="undefined"){
_87=_86.wheelDeltaX/120;
_88=_86.wheelDeltaY/120;
}else{
if(_86.wheelDelta){
_88=_86.wheelDelta/120;
}else{
if(_86.detail){
_88=-_86.detail/3;
}else{
return;
}
}
}
if(!CPFeatureIsCompatible(CPJavaScriptNegativeMouseWheelValues)){
_87=-_87;
_88=-_88;
}
var _8e=objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPScrollWheel,_8a,_8c,_8b,_89,nil,-1,1,0);
_8e._DOMEvent=_86;
_8e._deltaX=ROUND(_87*1.5);
_8e._deltaY=ROUND(_88*1.5);
objj_msgSend(CPApp,"sendEvent:",_8e);
if(StopDOMEventPropagation){
_4(_86);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
catch(anException){
objj_exception_report(anException,{path:"CPDOMWindowBridge.j"});
}
}
}),new objj_method(sel_getUid("_bridgeResizeEvent:"),function(_8f,_90,_91){
with(_8f){
try{
var _92=_frame.size;
_frame=_2(_DOMWindow);
_contentBounds.size=CGSizeCreateCopy(_frame.size);
var _93=_windowLevels,_94=_windowLayers,_95=_93.length;
while(_95--){
var _96=objj_msgSend(_94,"objectForKey:",_93[_95])._windows,_97=_96.length;
while(_97--){
objj_msgSend(_96[_97],"resizeWithOldBridgeSize:",_92);
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
catch(anException){
objj_exception_report(anException,{path:"CPDOMWindowBridge.j"});
}
}
}),new objj_method(sel_getUid("_checkPasteboardElement"),function(_98,_99){
with(_98){
try{
var _9a=_DOMPasteboardElement.value;
if(objj_msgSend(_9a,"length")){
var _9b=objj_msgSend(CPPasteboard,"generalPasteboard");
if(objj_msgSend(_9b,"_stateUID")!=_9a){
objj_msgSend(_9b,"declareTypes:owner:",[CPStringPboardType],_98);
objj_msgSend(_9b,"setString:forType:",_9a,CPStringPboardType);
}
}
objj_msgSend(_98,"_clearPasteboardElement");
objj_msgSend(CPApp,"sendEvent:",_pasteboardKeyDownEvent);
_pasteboardKeyDownEvent=nil;
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
catch(anException){
objj_exception_report(anException,{path:"CPDOMWindowBridge.j"});
}
}
}),new objj_method(sel_getUid("_clearPasteboardElement"),function(_9c,_9d){
with(_9c){
_DOMPasteboardElement.value="";
_DOMPasteboardElement.blur();
}
})]);
var _9e=5,_9f=(typeof document!="undefined"&&document.addEventListener)?350:1000;
var _3=function(_a0,_a1,_a2){
if(!_a0){
return 1;
}
var _a3=objj_msgSend(_a0,"locationInWindow");
return (_a1-objj_msgSend(_a0,"timestamp")<_9f&&ABS(_a3.x-_a2.x)<_9e&&ABS(_a3.y-_a2.y)<_9e)?objj_msgSend(_a0,"clickCount")+1:1;
};
var _4=function(_a4){
_a4.cancelBubble=true;
_a4.returnValue=false;
if(_a4.preventDefault){
_a4.preventDefault();
}
if(_a4.stopPropagation){
_a4.stopPropagation();
}
if(_a4.type==CPDOMEventMouseDown){
CPSharedDOMWindowBridge._DOMFocusElement.focus();
CPSharedDOMWindowBridge._DOMFocusElement.blur();
}
};
p;18;CPDOMWindowLayer.jI;20;Foundation/CPArray.jI;21;Foundation/CPObject.jc;2316;
var _1=objj_allocateClassPair(CPObject,"CPDOMWindowLayer"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_level"),new objj_ivar("_windows"),new objj_ivar("_DOMElement")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithLevel:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_level=_5;
_windows=[];
_DOMElement=document.createElement("div");
_DOMElement.style.position="absolute";
_DOMElement.style.top="0px";
_DOMElement.style.left="0px";
_DOMElement.style.width="1px";
_DOMElement.style.height="1px";
}
return _3;
}
}),new objj_method(sel_getUid("level"),function(_6,_7){
with(_6){
return _level;
}
}),new objj_method(sel_getUid("removeWindow:"),function(_8,_9,_a){
with(_8){
var _b=_a._index,_c=_windows.length-1;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=8;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_a._DOMElement;
objj_msgSend(_windows,"removeObjectAtIndex:",_a._index);
for(;_b<_c;++_b){
_windows[_b]._index=_b;
_windows[_b]._DOMElement.style.zIndex=_b;
}
_a._isVisible=NO;
}
}),new objj_method(sel_getUid("insertWindow:atIndex:"),function(_d,_e,_f,_10){
with(_d){
var _11=objj_msgSend(_windows,"count"),_12=(_10==CPNotFound?_11:_10),_13=_f._isVisible;
if(_13){
_12=MIN(_12,_f._index);
objj_msgSend(_windows,"removeObjectAtIndex:",_f._index);
}else{
++_11;
}
if(_10==CPNotFound||_10>=_11){
objj_msgSend(_windows,"addObject:",_f);
}else{
objj_msgSend(_windows,"insertObject:atIndex:",_f,_10);
}
for(;_12<_11;++_12){
_windows[_12]._index=_12;
_windows[_12]._DOMElement.style.zIndex=_12;
}
if(!_13){
if(_f._DOMElement.CPDOMDisplayContext){
_f._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=6;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_f._DOMElement;
_f._isVisible=YES;
if(objj_msgSend(_f,"styleMask")&CPBorderlessBridgeWindowMask){
objj_msgSend(_f,"setFrame:",objj_msgSend(_f._bridge,"contentBounds"));
}
}
}
})]);
p;14;CPDragServer.jI;15;AppKit/CPView.jI;16;AppKit/CPEvent.jI;21;AppKit/CPPasteboard.jI;20;AppKit/CPImageView.jc;6449;
var _1=nil;
var _2=nil,_3=nil,_4=nil,_5=nil,_6=nil,_7=nil,_8=nil,_9=nil;
var _a=NO,_b=NO,_c=NO,_d=NO,_e=NO;
var _f=function(_10){
_11(_10);
};
var _11=function(_12){
if(objj_msgSend(_12,"type")==CPLeftMouseUp){
_6=objj_msgSend(objj_msgSend(_8,"window"),"convertBridgeToBase:",objj_msgSend(objj_msgSend(_12,"window"),"convertBaseToBridge:",objj_msgSend(_12,"locationInWindow")));
objj_msgSend(_2,"removeFromSuperview");
objj_msgSend(_1._dragWindow,"orderOut:",nil);
if(_8&&(!objj_msgSend(_8,"respondsToSelector:",sel_getUid("prepareForDragOperation:"))||objj_msgSend(_8,"prepareForDragOperation:",_9))&&(!objj_msgSend(_8,"respondsToSelector:",sel_getUid("performDragOperation:"))||objj_msgSend(_8,"performDragOperation:",_9))&&objj_msgSend(_8,"respondsToSelector:",sel_getUid("concludeDragOperation:"))){
objj_msgSend(_8,"concludeDragOperation:",_9);
}
if(_e){
objj_msgSend(_3,"draggedImage:endedAt:operation:",objj_msgSend(_2,"image"),_6,NO);
}else{
if(_d){
objj_msgSend(_3,"draggedView:endedAt:operation:",_2,_6,NO);
}
}
_a=NO;
_8=nil;
return;
}
objj_msgSend(CPApp,"setCallback:forNextEventMatchingMask:untilDate:inMode:dequeue:",_11,CPMouseMovedMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,0,NO);
var _13=objj_msgSend(_12,"locationInWindow"),_14=bridgeLocation=objj_msgSend(objj_msgSend(_12,"window"),"convertBaseToBridge:",_13);
var _15=objj_msgSend(objj_msgSend(CPDOMWindowBridge,"sharedDOMWindowBridge"),"_dragHitTest:pasteboard:",bridgeLocation,_7);
_6=objj_msgSend(objj_msgSend(_8,"window"),"convertBridgeToBase:",bridgeLocation);
if(_15!=_8){
if(_8&&objj_msgSend(_8,"respondsToSelector:",sel_getUid("draggingExited:"))){
objj_msgSend(_8,"draggingExited:",_9);
}
_8=_15;
if(_8&&objj_msgSend(_8,"respondsToSelector:",sel_getUid("draggingEntered:"))){
objj_msgSend(_8,"draggingEntered:",_9);
}
}else{
if(_8&&objj_msgSend(_8,"respondsToSelector:",sel_getUid("draggingUpdated:"))){
objj_msgSend(_8,"draggingUpdated:",_9);
}
}
_13.x-=_5.x;
_13.y-=_5.y;
objj_msgSend(_2,"setFrameOrigin:",_13);
if(_c){
objj_msgSend(_3,"draggedImage:movedTo:",objj_msgSend(_2,"image"),_13);
}else{
if(_b){
objj_msgSend(_3,"draggedView:movedTo:",_2,_13);
}
}
};
var _16=objj_allocateClassPair(CPObject,"CPDraggingInfo"),_17=_16.isa;
class_addIvars(_16,[new objj_ivar("_window")]);
objj_registerClassPair(_16);
objj_addClassForBundle(_16,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_16,[new objj_method(sel_getUid("initWithWindow:"),function(_18,_19,_1a){
with(_18){
_18=objj_msgSendSuper({receiver:_18,super_class:objj_getClass("CPObject")},"init");
if(_18){
_window=_1a;
}
return this;
}
}),new objj_method(sel_getUid("draggingSource"),function(_1b,_1c){
with(_1b){
return _3;
}
}),new objj_method(sel_getUid("draggingLocation"),function(_1d,_1e){
with(_1d){
return _6;
}
}),new objj_method(sel_getUid("draggingPasteboard"),function(_1f,_20){
with(_1f){
return _7;
}
})]);
var _16=objj_allocateClassPair(CPObject,"CPDragServer"),_17=_16.isa;
class_addIvars(_16,[new objj_ivar("_dragWindow"),new objj_ivar("_imageView")]);
objj_registerClassPair(_16);
objj_addClassForBundle(_16,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_16,[new objj_method(sel_getUid("init"),function(_21,_22){
with(_21){
_21=objj_msgSendSuper({receiver:_21,super_class:objj_getClass("CPObject")},"init");
if(_21){
_dragWindow=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CPRectMakeZero(),CPBorderlessWindowMask);
objj_msgSend(_dragWindow,"setLevel:",CPDraggingWindowLevel);
}
return _21;
}
}),new objj_method(sel_getUid("dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:"),function(_23,_24,_25,_26,_27,_28,_29,_2a,_2b,_2c){
with(_23){
var _2d=objj_msgSend(_29,"locationInWindow");
_2=_25;
_3=_2b;
_4=_26;
_5=CPPointMake(_2d.x-_27.x,_2d.y-_27.y);
_7=objj_msgSend(CPPasteboard,"pasteboardWithName:",CPDragPboard);
objj_msgSend(_dragWindow,"setFrameSize:",CGSizeMakeCopy(objj_msgSend(objj_msgSend(CPDOMWindowBridge,"sharedDOMWindowBridge"),"frame").size));
objj_msgSend(_dragWindow,"orderFront:",_23);
objj_msgSend(_25,"setFrameOrigin:",_27);
objj_msgSend(objj_msgSend(_dragWindow,"contentView"),"addSubview:",_25);
if(_a){
if(objj_msgSend(_3,"respondsToSelector:",sel_getUid("draggedImage:beganAt:"))){
objj_msgSend(_3,"draggedImage:beganAt:",objj_msgSend(_25,"image"),_27);
}
_c=objj_msgSend(_3,"respondsToSelector:",sel_getUid("draggedImage:movedTo:"));
_e=objj_msgSend(_3,"respondsToSelector:",sel_getUid("draggedImage:endAt:operation:"));
_b=NO;
_d=NO;
}else{
if(objj_msgSend(_3,"respondsToSelector:",sel_getUid("draggedView:beganAt:"))){
objj_msgSend(_3,"draggedView:beganAt:",_25,_27);
}
_b=objj_msgSend(_3,"respondsToSelector:",sel_getUid("draggedView:movedTo:"));
_d=objj_msgSend(_3,"respondsToSelector:",sel_getUid("draggedView:endedAt:operation:"));
_c=NO;
_e=NO;
}
_f(_29);
}
}),new objj_method(sel_getUid("dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:"),function(_2e,_2f,_30,_31,_32,_33,_34,_35,_36,_37){
with(_2e){
_a=YES;
if(!_imageView){
_imageView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CPRectMakeZero());
}
objj_msgSend(_imageView,"setImage:",_30);
objj_msgSend(_imageView,"setFrameSize:",CGSizeMakeCopy(objj_msgSend(_30,"size")));
objj_msgSend(_2e,"dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:",_imageView,_31,_32,_33,_34,_35,_36,_37);
}
})]);
class_addMethods(_17,[new objj_method(sel_getUid("initialize"),function(_38,_39){
with(_38){
if(_38!=objj_msgSend(CPDragServer,"class")){
return;
}
_9=objj_msgSend(objj_msgSend(CPDraggingInfo,"alloc"),"init");
}
}),new objj_method(sel_getUid("sharedDragServer"),function(_3a,_3b){
with(_3a){
if(!_1){
_1=objj_msgSend(objj_msgSend(CPDragServer,"alloc"),"init");
}
return _1;
}
})]);
var _16=objj_getClass("CPView");
if(!_16){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _17=_16.isa;
class_addMethods(_16,[new objj_method(sel_getUid("_dragHitTest:pasteboard:"),function(_3c,_3d,_3e,_3f){
with(_3c){
if(!CPRectContainsPoint(_frame,_3e)||_3c==_2){
return nil;
}
var _40=nil,i=objj_msgSend(_subviews,"count"),_42=CPPointMake(_3e.x-CPRectGetMinX(_frame),_3e.y-CPRectGetMinY(_frame));
while(i--){
if(_40=objj_msgSend(_subviews[i],"_dragHitTest:pasteboard:",_42,_3f)){
return _40;
}
}
if(objj_msgSend(_3f,"availableTypeFromArray:",_registeredDraggedTypes)){
return _3c;
}
return nil;
}
})]);
p;9;CPEvent.jI;21;Foundation/CPObject.jc;7467;
CPLeftMouseDown=1;
CPLeftMouseUp=2;
CPRightMouseDown=3;
CPRightMouseUp=4;
CPMouseMoved=5;
CPLeftMouseDragged=6;
CPRightMouseDragged=7;
CPMouseEntered=8;
CPMouseExited=9;
CPKeyDown=10;
CPKeyUp=11;
CPFlagsChanged=12;
CPAppKitDefined=13;
CPSystemDefined=14;
CPApplicationDefined=15;
CPPeriodic=16;
CPCursorUpdate=17;
CPScrollWheel=22;
CPOtherMouseDown=25;
CPOtherMouseUp=26;
CPOtherMouseDragged=27;
CPAlphaShiftKeyMask=1<<16;
CPShiftKeyMask=1<<17;
CPControlKeyMask=1<<18;
CPAlternateKeyMask=1<<19;
CPCommandKeyMask=1<<20;
CPNumericPadKeyMask=1<<21;
CPHelpKeyMask=1<<22;
CPFunctionKeyMask=1<<23;
CPDeviceIndependentModifierFlagsMask=4294901760;
CPLeftMouseDownMask=1<<CPLeftMouseDown;
CPLeftMouseUpMask=1<<CPLeftMouseUp;
CPRightMouseDownMask=1<<CPRightMouseDown;
CPRightMouseUpMask=1<<CPRightMouseUp;
CPOtherMouseDownMask=1<<CPOtherMouseDown;
CPOtherMouseUpMask=1<<CPOtherMouseUp;
CPMouseMovedMask=1<<CPMouseMoved;
CPLeftMouseDraggedMask=1<<CPLeftMouseDragged;
CPRightMouseDraggedMask=1<<CPRightMouseDragged;
CPOtherMouseDragged=1<<CPOtherMouseDragged;
CPMouseEnteredMask=1<<CPMouseEntered;
CPMouseExitedMask=1<<CPMouseExited;
CPCursorUpdateMask=1<<CPCursorUpdate;
CPKeyDownMask=1<<CPKeyDown;
CPKeyUpMask=1<<CPKeyUp;
CPFlagsChangedMask=1<<CPFlagsChanged;
CPAppKitDefinedMask=1<<CPAppKitDefined;
CPSystemDefinedMask=1<<CPSystemDefined;
CPApplicationDefinedMask=1<<CPApplicationDefined;
CPPeriodicMask=1<<CPPeriodic;
CPScrollWheelMask=1<<CPScrollWheel;
CPAnyEventMask=4294967295;
CPDOMEventDoubleClick="dblclick",CPDOMEventMouseDown="mousedown",CPDOMEventMouseUp="mouseup",CPDOMEventMouseMoved="mousemove",CPDOMEventMouseDragged="mousedrag",CPDOMEventKeyUp="keyup",CPDOMEventKeyDown="keydown",CPDOMEventKeyPress="keypress";
CPDOMEventCopy="copy";
CPDOMEventPaste="paste";
CPDOMEventScrollWheel="mousewheel";
var _1=0,_2=nil;
var _3=objj_allocateClassPair(CPObject,"CPEvent"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_type"),new objj_ivar("_location"),new objj_ivar("_modifierFlags"),new objj_ivar("_timestamp"),new objj_ivar("_context"),new objj_ivar("_eventNumber"),new objj_ivar("_clickCount"),new objj_ivar("_pressure"),new objj_ivar("_window"),new objj_ivar("_characters"),new objj_ivar("_isARepeat"),new objj_ivar("_keyCode"),new objj_ivar("_DOMEvent"),new objj_ivar("_deltaX"),new objj_ivar("_deltaY"),new objj_ivar("_deltaZ")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("_initMouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:"),function(_5,_6,_7,_8,_9,_a,_b,_c,_d,_e,_f){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_type=_7;
_location=CPPointCreateCopy(_8);
_modifierFlags=_9;
_timestamp=_a;
_context=_c;
_eventNumber=_d;
_clickCount=_e;
_pressure=_f;
_window=objj_msgSend(CPApp,"windowWithWindowNumber:",_b);
}
return _5;
}
}),new objj_method(sel_getUid("_initKeyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:"),function(_10,_11,_12,_13,_14,_15,_16,_17,_18,_19,_1a,_1b){
with(_10){
_10=objj_msgSendSuper({receiver:_10,super_class:objj_getClass("CPObject")},"init");
if(_10){
_type=_12;
_location=CPPointCreateCopy(_13);
_modifierFlags=_14;
_timestamp=_15;
_context=_17;
_characters=_18;
_charactersIgnoringModifiers=_19;
_isARepeat=_1a;
_keyCode=_1b;
_window=objj_msgSend(CPApp,"windowWithWindowNumber:",_16);
}
return _10;
}
}),new objj_method(sel_getUid("_initOtherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:"),function(_1c,_1d,_1e,_1f,_20,_21,_22,_23,_24,_25,_26){
with(_1c){
_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("CPObject")},"init");
if(_1c){
_type=_1e;
_location=CPPointCreateCopy(_1f);
_modifierFlags=_20;
_timestamp=_21;
_context=_23;
_subtype=_24;
_data1=_25;
_data2=_26;
}
return _1c;
}
}),new objj_method(sel_getUid("locationInWindow"),function(_27,_28){
with(_27){
return _location;
}
}),new objj_method(sel_getUid("modifierFlags"),function(_29,_2a){
with(_29){
return _modifierFlags;
}
}),new objj_method(sel_getUid("timestamp"),function(_2b,_2c){
with(_2b){
return _timestamp;
}
}),new objj_method(sel_getUid("type"),function(_2d,_2e){
with(_2d){
return _type;
}
}),new objj_method(sel_getUid("window"),function(_2f,_30){
with(_2f){
return _window;
}
}),new objj_method(sel_getUid("windowNumber"),function(_31,_32){
with(_31){
return _windowNumber;
}
}),new objj_method(sel_getUid("buttonNumber"),function(_33,_34){
with(_33){
return _buttonNumber;
}
}),new objj_method(sel_getUid("clickCount"),function(_35,_36){
with(_35){
return _clickCount;
}
}),new objj_method(sel_getUid("characters"),function(_37,_38){
with(_37){
return _characters;
}
}),new objj_method(sel_getUid("charactersIgnoringModifiers"),function(_39,_3a){
with(_39){
return _charactersIgnoringModifiers;
}
}),new objj_method(sel_getUid("isARepeat"),function(_3b,_3c){
with(_3b){
return _isARepeat;
}
}),new objj_method(sel_getUid("keyCode"),function(_3d,_3e){
with(_3d){
return _keyCode;
}
}),new objj_method(sel_getUid("pressure"),function(_3f,_40){
with(_3f){
return _pressure;
}
}),new objj_method(sel_getUid("_DOMEvent"),function(_41,_42){
with(_41){
return _DOMEvent;
}
}),new objj_method(sel_getUid("deltaX"),function(_43,_44){
with(_43){
return _deltaX;
}
}),new objj_method(sel_getUid("deltaY"),function(_45,_46){
with(_45){
return _deltaY;
}
}),new objj_method(sel_getUid("deltaZ"),function(_47,_48){
with(_47){
return _deltaZ;
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("keyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:"),function(_49,_4a,_4b,_4c,_4d,_4e,_4f,_50,_51,_52,_53,_54){
with(_49){
return objj_msgSend(objj_msgSend(_49,"alloc"),"_initKeyEventWithType:location:modifierFlags:timestamp:windowNumber:context:characters:charactersIgnoringModifiers:isARepeat:keyCode:",_4b,_4c,_4d,_4e,_4f,_50,_51,_52,_53,_54);
}
}),new objj_method(sel_getUid("mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:"),function(_55,_56,_57,_58,_59,_5a,_5b,_5c,_5d,_5e,_5f){
with(_55){
return objj_msgSend(objj_msgSend(_55,"alloc"),"_initMouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",_57,_58,_59,_5a,_5b,_5c,_5d,_5e,_5f);
}
}),new objj_method(sel_getUid("otherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:"),function(_60,_61,_62,_63,_64,_65,_66,_67,_68,_69,_6a){
with(_60){
return objj_msgSend(objj_msgSend(_60,"alloc"),"_initOtherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:",_62,_63,_64,_65,_66,_67,_68,_69,_6a);
}
}),new objj_method(sel_getUid("startPeriodicEventsAfterDelay:withPeriod:"),function(_6b,_6c,_6d,_6e){
with(_6b){
_1=_6e;
_2=window.setTimeout(function(){
_2=window.setInterval(_CPEventFirePeriodEvent,_6e*1000);
},_6d*1000);
}
}),new objj_method(sel_getUid("stopPeriodicEvents"),function(_6f,_70){
with(_6f){
if(_2===nil){
return;
}
window.clearTimeout(_2);
_2=nil;
}
})]);
_CPEventFirePeriodEvent=function(){
objj_msgSend(CPApp,"sendEvent:",objj_msgSend(CPEvent,"otherEventWithType:location:modifierFlags:timestamp:windowNumber:context:subtype:data1:data2:",CPPeriodic,{x:0,y:0},0,0,0,nil,0,0,0));
};
p;14;CPFlashMovie.jI;21;Foundation/CPObject.jc;616;
var _1=objj_allocateClassPair(CPObject,"CPFlashMovie"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_fileName")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFile:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_fileName=_5;
}
return _3;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("flashMovieWithFile:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(objj_msgSend(_6,"alloc"),"initWithFile:",_8);
}
})]);
p;13;CPFlashView.ji;19;CPDOMWindowBridge.ji;14;CPFlashMovie.ji;8;CPView.jc;2132;
var _1=objj_allocateClassPair(CPView,"CPFlashView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_flashMovie"),new objj_ivar("_DOMEmbedElement"),new objj_ivar("_DOMMParamElement"),new objj_ivar("_DOMObjectElement")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPView")},"initWithFrame:",_5);
if(_3){
_DOMObjectElement=document.createElement("object");
_DOMObjectElement.width="100%";
_DOMObjectElement.height="100%";
_DOMObjectElement.style.top="0px";
_DOMObjectElement.style.left="0px";
_DOMParamElement=document.createElement("param");
_DOMParamElement.name="movie";
_DOMObjectElement.appendChild(_DOMParamElement);
var _6=document.createElement("param");
_6.name="wmode";
_6.value="transparent";
_DOMObjectElement.appendChild(_6);
_DOMEmbedElement=document.createElement("embed");
_DOMEmbedElement.type="application/x-shockwave-flash";
_DOMEmbedElement.wmode="transparent";
_DOMEmbedElement.width="100%";
_DOMEmbedElement.height="100%";
_DOMElement.appendChild(_DOMEmbedElement);
_DOMElement.appendChild(_DOMObjectElement);
}
return _3;
}
}),new objj_method(sel_getUid("setFlashMovie:"),function(_7,_8,_9){
with(_7){
if(_flashMovie==_9){
return;
}
_flashMovie=_9;
_DOMParamElement.value=_9._fileName;
if(_DOMEmbedElement){
_DOMEmbedElement.src=_9._fileName;
}
}
}),new objj_method(sel_getUid("flashMovie"),function(_a,_b){
with(_a){
return _flashMovie;
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_c,_d,_e){
with(_c){
objj_msgSend(objj_msgSend(CPDOMWindowBridge,"sharedDOMWindowBridge"),"_propagateCurrentDOMEvent:",YES);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_f,_10,_11){
with(_f){
objj_msgSend(objj_msgSend(CPDOMWindowBridge,"sharedDOMWindowBridge"),"_propagateCurrentDOMEvent:",YES);
}
}),new objj_method(sel_getUid("mouseUp:"),function(_12,_13,_14){
with(_12){
objj_msgSend(objj_msgSend(CPDOMWindowBridge,"sharedDOMWindowBridge"),"_propagateCurrentDOMEvent:",YES);
}
})]);
p;8;CPFont.jc;2706;
var _1={};
_CPFontSystemFontFace="Arial";
var _2=objj_allocateClassPair(CPObject,"CPFont"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_name"),new objj_ivar("_size"),new objj_ivar("_isBold"),new objj_ivar("_cssString")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("_initWithName:size:bold:"),function(_4,_5,_6,_7,_8){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_name=_6;
_size=_7;
_isBold=_8;
_cssString=(_isBold?"bold ":"")+ROUND(_7)+"px '"+_6+"'";
_1[_cssString]=_4;
}
return _4;
}
}),new objj_method(sel_getUid("size"),function(_9,_a){
with(_9){
return _size;
}
}),new objj_method(sel_getUid("cssString"),function(_b,_c){
with(_b){
return _cssString;
}
}),new objj_method(sel_getUid("familyName"),function(_d,_e){
with(_d){
return _name;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("fontWithName:size:"),function(_f,_10,_11,_12){
with(_f){
return _1[(NO?"bold ":"")+ROUND(_12)+"px '"+_11+"'"]||objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:",_11,_12,NO);
}
}),new objj_method(sel_getUid("boldFontWithName:size:"),function(_13,_14,_15,_16){
with(_13){
return _1[(YES?"bold ":"")+ROUND(_16)+"px '"+_15+"'"]||objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:",_15,_16,YES);
}
}),new objj_method(sel_getUid("systemFontOfSize:"),function(_17,_18,_19){
with(_17){
return _1[(NO?"bold ":"")+ROUND(_19)+"px '"+_CPFontSystemFontFace+"'"]||objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:",_CPFontSystemFontFace,_19,NO);
}
}),new objj_method(sel_getUid("boldSystemFontOfSize:"),function(_1a,_1b,_1c){
with(_1a){
return _1[(YES?"bold ":"")+ROUND(_1c)+"px '"+_CPFontSystemFontFace+"'"]||objj_msgSend(objj_msgSend(CPFont,"alloc"),"_initWithName:size:bold:",_CPFontSystemFontFace,_1c,YES);
}
})]);
var _1d="CPFontNameKey",_1e="CPFontSizeKey",_1f="CPFontIsBoldKey";
var _2=objj_getClass("CPFont");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPFont\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_20,_21,_22){
with(_20){
return objj_msgSend(_20,"_initWithName:size:bold:",objj_msgSend(_22,"decodeObjectForKey:",_1d),objj_msgSend(_22,"decodeFloatForKey:",_1e),objj_msgSend(_22,"decodeBoolForKey:",_1f));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_23,_24,_25){
with(_23){
objj_msgSend(_25,"encodeObject:forKey:",_name,_1d);
objj_msgSend(_25,"encodeFloat:forKey:",_size,_1e);
objj_msgSend(_25,"encodeBool:forKey:",_isBold,_1f);
}
})]);
p;15;CPFontManager.jI;21;Foundation/CPObject.jI;15;AppKit/CPFont.jc;3249;
var _1=nil,_2=Nil;
var _3=objj_allocateClassPair(CPObject,"CPFontManager"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_availableFonts")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("availableFonts"),function(_5,_6){
with(_5){
if(!_availableFonts){
_7=document.createElement("span");
_7.fontSize="24px";
_7.appendChild(document.createTextNode("mmmmmmmmmml"));
var _8=document.createElement("div");
_8.style.position="absolute";
_8.style.top="-1000px";
_8.appendChild(_7);
document.getElementsByTagName("body")[0].appendChild(_8);
_9=_a(["monospace","serif","sans-serif","cursive"]);
_availableFonts=[];
for(var i=0;i<_c.length;i++){
var _d=_e(_c[i]);
if(_d){
_availableFonts.push(_c[i]);
}
}
}
return _availableFonts;
}
}),new objj_method(sel_getUid("fontWithNameIsAvailable:"),function(_f,_10,_11){
with(_f){
return _e(_11);
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("sharedFontManager"),function(_12,_13){
with(_12){
if(!_1){
_1=objj_msgSend(objj_msgSend(_2,"alloc"),"init");
}
return _1;
}
}),new objj_method(sel_getUid("setFontManagerFactory:"),function(_14,_15,_16){
with(_14){
_2=_16;
}
})]);
var _7,_9,_c=["American Typewriter","Apple Chancery","Arial","Arial Black","Arial Narrow","Arial Rounded MT Bold","Arial Unicode MS","Big Caslon","Bitstream Vera Sans","Bitstream Vera Sans Mono","Bitstream Vera Serif","Brush Script MT","Cambria","Caslon","Castellar","Cataneo BT","Centaur","Century Gothic","Century Schoolbook","Century Schoolbook L","Comic Sans","Comic Sans MS","Consolas","Constantia","Cooper Black","Copperplate","Copperplate Gothic Bold","Copperplate Gothic Light","Corbel","Courier","Courier New","Futura","Geneva","Georgia","Georgia Ref","Geeza Pro","Gigi","Gill Sans","Gill Sans MT","Gill Sans MT Condensed","Gill Sans MT Ext Condensed Bold","Gill Sans Ultra Bold","Gill Sans Ultra Bold Condensed","Helvetica","Helvetica Narrow","Helvetica Neue","Herculanum","High Tower Text","Highlight LET","Hoefler Text","Impact","Imprint MT Shadow","Lucida","Lucida Bright","Lucida Calligraphy","Lucida Console","Lucida Fax","Lucida Grande","Lucida Handwriting","Lucida Sans","Lucida Sans Typewriter","Lucida Sans Unicode","Marker Felt","Microsoft Sans Serif","Milano LET","Minion Web","MisterEarl BT","Mistral","Monaco","Monotype Corsiva","Monotype.com","New Century Schoolbook","New York","News Gothic MT","Papyrus","Tahoma","Techno","Tempus Sans ITC","Terminal","Textile","Times","Times New Roman","Tiranti Solid LET","Trebuchet MS","Verdana","Verdana Ref","Zapfino"];
var _e=function(_17){
for(var i=0;i<_9.length;i++){
if(_19(_9[i],_17)){
return true;
}
}
return false;
};
var _1a={};
var _19=function(_1b,_1c){
var a;
if(_1a[_1b]){
a=_1a[_1b];
}else{
_7.style.fontFamily="\""+_1b+"\"";
_1a[_1b]=a={w:_7.offsetWidth,h:_7.offsetHeight};
}
_7.style.fontFamily="\""+_1c+"\", \""+_1b+"\"";
var _1e=_7.offsetWidth;
var _1f=_7.offsetHeight;
return (a.w!=_1e||a.h!=_1f);
};
var _a=function(_20){
for(var i=0;i<_20.length;i++){
for(var j=0;j<i;j++){
if(_19(_20[i],_20[j])){
return [_20[i],_20[j]];
}
}
}
return [_20[0]];
};
objj_msgSend(CPFontManager,"setFontManagerFactory:",objj_msgSend(CPFontManager,"class"));
p;12;CPGeometry.ji;12;CGGeometry.jc;4107;
CPMinXEdge=0;
CPMinYEdge=1;
CPMaxXEdge=2;
CPMaxYEdge=3;
CPMakePoint=CGPointMake;
CPMakeSize=CGSizeMake;
CPMakeRect=CGRectMake;
CPPointCreateCopy=function(_1){
return {x:_1.x,y:_1.y};
};
CPPointMake=function(x,y){
return {x:x,y:y};
};
CPRectInset=function(_4,dX,dY){
return CPRectMake(_4.origin.x+dX,_4.origin.y+dY,_4.size.width-2*dX,_4.size.height-2*dY);
};
CPRectIntegral=function(_7){
alert("CPRectIntegral unimplemented");
};
CPRectIntersection=function(_8,_9){
var _a=CPRectMake(Math.max(CPRectGetMinX(_8),CPRectGetMinX(_9)),Math.max(CPRectGetMinY(_8),CPRectGetMinY(_9)),0,0);
_a.size.width=Math.min(CPRectGetMaxX(_8),CPRectGetMaxX(_9))-CPRectGetMinX(_a);
_a.size.height=Math.min(CPRectGetMaxY(_8),CPRectGetMaxY(_9))-CPRectGetMinY(_a);
return CPRectIsEmpty(_a)?CPRectMakeZero():_a;
};
CPRectCreateCopy=function(_b){
return {origin:CPPointCreateCopy(_b.origin),size:CPSizeCreateCopy(_b.size)};
};
CPRectMake=function(x,y,_e,_f){
return {origin:CPPointMake(x,y),size:CPSizeMake(_e,_f)};
};
CPRectOffset=function(_10,dX,dY){
return CPRectMake(_10.origin.x+dX,_10.origin.y+dY,_10.size.width,_10.size.height);
};
CPRectStandardize=function(_13){
var _14=CPRectGetWidth(_13),_15=CPRectGetHeight(_13),_16=CPRectCreateCopy(_13);
if(_14<0){
_16.origin.x+=_14;
_16.size.width=-_14;
}
if(_15<0){
_16.origin.y+=_15;
_16.size.height=-_15;
}
return _16;
};
CPRectUnion=function(_17,_18){
var _19=Math.min(CPRectGetMinX(_17),CPRectGetMinX(_18)),_1a=Math.min(CPRectGetMinY(_17),CPRectGetMinY(_18)),_1b=Math.max(CPRectGetMaxX(_17),CPRectGetMaxX(_18)),_1c=Math.max(CPRectGetMaxY(_17),CPRectGetMaxY(_18));
return CPRectMake(_19,_1a,_1b-_19,_1c-_1a);
};
CPSizeCreateCopy=function(_1d){
return {width:_1d.width,height:_1d.height};
};
CPSizeMake=function(_1e,_1f){
return {width:_1e,height:_1f};
};
CPRectContainsPoint=function(_20,_21){
return _21.x>=CPRectGetMinX(_20)&&_21.y>=CPRectGetMinY(_20)&&_21.x<CPRectGetMaxX(_20)&&_21.y<CPRectGetMaxY(_20);
};
CPRectContainsRect=function(_22,_23){
return CPRectEqualToRect(CPUnionRect(_22,_23),_23);
};
CPPointEqualToPoint=function(_24,_25){
return _24.x==_25.x&&_24.y==_25.y;
};
CPRectEqualToRect=function(_26,_27){
return CPPointEqualToPoint(_26.origin,_27.origin)&&CPSizeEqualToSize(_26.size,_27.size);
};
CPRectGetHeight=function(_28){
return _28.size.height;
};
CPRectGetMaxX=function(_29){
return _29.origin.x+_29.size.width;
};
CPRectGetMaxY=function(_2a){
return _2a.origin.y+_2a.size.height;
};
CPRectGetMidX=function(_2b){
return _2b.origin.x+(_2b.size.width)/2;
};
CPRectGetMidY=function(_2c){
return _2c.origin.y+(_2c.size.height)/2;
};
CPRectGetMinX=function(_2d){
return _2d.origin.x;
};
CPRectGetMinY=function(_2e){
return _2e.origin.y;
};
CPRectGetWidth=function(_2f){
return _2f.size.width;
};
CPRectIntersectsRect=function(_30,_31){
return !CPRectIsEmpty(CPRectIntersection(_30,_31));
};
CPRectIsEmpty=function(_32){
return _32.size.width<=0||_32.size.height<=0;
};
CPRectIsNull=function(_33){
return _33.size.width<=0||_33.size.height<=0;
};
CPSizeEqualToSize=function(_34,_35){
return _34.width==_35.width&&_34.height==_35.height;
};
CPStringFromPoint=function(_36){
return "{"+_36.x+", "+_36.y+"}";
};
CPStringFromSize=function(_37){
return "{"+_37.width+", "+_37.height+"}";
};
CPStringFromRect=function(_38){
return "{"+CPStringFromPoint(_38.origin)+", "+CPStringFromSize(_38.size)+"}";
};
CPPointFromString=function(_39){
var _3a=_39.indexOf(",");
return {x:parseFloat(_39.substr(1,_3a-1),10),y:parseFloat(_39.substring(_3a+1,_39.length),10)};
};
CPSizeFromString=function(_3b){
var _3c=_3b.indexOf(",");
return {width:parseFloat(_3b.substr(1,_3c-1),10),height:parseFloat(_3b.substring(_3c+1,_3b.length),10)};
};
CPRectFromString=function(_3d){
var _3e=_3d.indexOf(",",_3d.indexOf(",")+1);
return {origin:CPPointFromString(_3d.substr(1,_3e-1)),size:CPSizeFromString(_3d.substring(_3e+2,_3d.length))};
};
CPPointFromEvent=function(_3f){
return CPPointMake(_3f.clientX,_3f.clientY,0);
};
CPSizeMakeZero=function(){
return CPSizeMake(0,0);
};
CPRectMakeZero=function(){
return CPRectMake(0,0,0,0);
};
CPPointMakeZero=function(){
return CPPointMake(0,0,0);
};
p;19;CPGraphicsContext.jc;960;
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPGraphicsContext"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_graphicsPort")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithGraphicsPort:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_graphicsPort=_6;
}
return _4;
}
}),new objj_method(sel_getUid("graphicsPort"),function(_7,_8){
with(_7){
return _graphicsPort;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("currentContext"),function(_9,_a){
with(_9){
return _1;
}
}),new objj_method(sel_getUid("setCurrentContext:"),function(_b,_c,_d){
with(_b){
_1=_d;
}
}),new objj_method(sel_getUid("graphicsContextWithGraphicsPort:flipped:"),function(_e,_f,_10,_11){
with(_e){
return objj_msgSend(objj_msgSend(_e,"alloc"),"initWithGraphicsPort:",_10);
}
})]);
p;9;CPImage.jI;21;Foundation/CPBundle.jI;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.jI;21;Foundation/CPString.ji;12;CPGeometry.jc;8160;
CPImageLoadStatusInitialized=0;
CPImageLoadStatusLoading=1;
CPImageLoadStatusCompleted=2;
CPImageLoadStatusCancelled=3;
CPImageLoadStatusInvalidData=4;
CPImageLoadStatusUnexpectedEOF=5;
CPImageLoadStatusReadError=6;
CPImageDidLoadNotification="CPImageDidLoadNotification";
var _1=objj_getClass("CPBundle");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPBundle\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("pathForResource:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(_3,"resourcePath")+"/"+_5;
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPImage"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_size"),new objj_ivar("_filename"),new objj_ivar("_delegate"),new objj_ivar("_loadStatus"),new objj_ivar("_image")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initByReferencingFile:size:"),function(_6,_7,_8,_9){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPObject")},"init");
if(_6){
_size=CPSizeCreateCopy(_9);
_filename=_8;
_loadStatus=CPImageLoadStatusInitialized;
}
return _6;
}
}),new objj_method(sel_getUid("initWithContentsOfFile:size:"),function(_a,_b,_c,_d){
with(_a){
_a=objj_msgSend(_a,"initByReferencingFile:size:",_c,_d);
if(_a){
objj_msgSend(_a,"load");
}
return _a;
}
}),new objj_method(sel_getUid("initWithContentsOfFile:"),function(_e,_f,_10){
with(_e){
_e=objj_msgSend(_e,"initByReferencingFile:size:",_10,CGSizeMake(-1,-1));
if(_e){
objj_msgSend(_e,"load");
}
return _e;
}
}),new objj_method(sel_getUid("filename"),function(_11,_12){
with(_11){
return _filename;
}
}),new objj_method(sel_getUid("setSize:"),function(_13,_14,_15){
with(_13){
_size=CGSizeMakeCopy(_15);
}
}),new objj_method(sel_getUid("size"),function(_16,_17){
with(_16){
return _size;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_18,_19,_1a){
with(_18){
_delegate=_1a;
}
}),new objj_method(sel_getUid("delegate"),function(_1b,_1c){
with(_1b){
return _delegate;
}
}),new objj_method(sel_getUid("loadStatus"),function(_1d,_1e){
with(_1d){
return _loadStatus;
}
}),new objj_method(sel_getUid("load"),function(_1f,_20){
with(_1f){
if(_loadStatus==CPImageLoadStatusLoading||_loadStatus==CPImageLoadStatusCompleted){
return;
}
_loadStatus=CPImageLoadStatusLoading;
_image=new Image();
var _21=YES;
_image.onload=function(){
if(_21){
window.setTimeout(function(){
objj_msgSend(_1f,"_imageDidLoad");
},0);
}else{
objj_msgSend(_1f,"_imageDidLoad");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
};
_image.onerror=function(){
if(_21){
window.setTimeout(function(){
objj_msgSend(_1f,"_imageDidError");
},0);
}else{
objj_msgSend(_1f,"_imageDidError");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
};
_image.onabort=function(){
if(_21){
window.setTimeout(function(){
objj_msgSend(_1f,"_imageDidAbort");
},0);
}else{
objj_msgSend(_1f,"_imageDidAbort");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
};
_image.src=_filename;
_21=NO;
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_22,_23){
with(_22){
return NO;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_24,_25){
with(_24){
return NO;
}
}),new objj_method(sel_getUid("_imageDidLoad"),function(_26,_27){
with(_26){
_loadStatus=CPImageLoadStatusCompleted;
if(!_size||(_size.width==-1&&_size.height==-1)){
_size=CGSizeMake(_image.width,_image.height);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPImageDidLoadNotification,_26);
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imageDidLoad:"))){
objj_msgSend(_delegate,"imageDidLoad:",_26);
}
}
}),new objj_method(sel_getUid("_imageDidError"),function(_28,_29){
with(_28){
_loadStatus=CPImageLoadStatusReadError;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imageDidError:"))){
objj_msgSend(_delegate,"imageDidError:",_28);
}
}
}),new objj_method(sel_getUid("_imageDidAbort"),function(_2a,_2b){
with(_2a){
_loadStatus=CPImageLoadStatusCancelled;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imageDidAbort:"))){
objj_msgSend(_delegate,"imageDidAbort:",_2a);
}
}
})]);
var _1=objj_getClass("CPImage");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPImage\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_2c,_2d,_2e){
with(_2c){
return objj_msgSend(_2c,"initWithContentsOfFile:size:",objj_msgSend(_2e,"decodeObjectForKey:","CPFilename"),objj_msgSend(_2e,"decodeSizeForKey:","CPSize"));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_2f,_30,_31){
with(_2f){
objj_msgSend(_31,"encodeObject:forKey:",_filename,"CPFilename");
objj_msgSend(_31,"encodeSize:forKey:",_size,"CPSize");
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPThreePartImage"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_imageSlices"),new objj_ivar("_isVertical")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithImageSlices:isVertical:"),function(_32,_33,_34,_35){
with(_32){
_32=objj_msgSendSuper({receiver:_32,super_class:objj_getClass("CPObject")},"init");
if(_32){
_imageSlices=_34;
_isVertical=_35;
}
return _32;
}
}),new objj_method(sel_getUid("imageSlices"),function(_36,_37){
with(_36){
return _imageSlices;
}
}),new objj_method(sel_getUid("isVertical"),function(_38,_39){
with(_38){
return _isVertical;
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_3a,_3b){
with(_3a){
return YES;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_3c,_3d){
with(_3c){
return NO;
}
})]);
var _3e="CPThreePartImageImageSlicesKey",_3f="CPThreePartImageIsVerticalKey";
var _1=objj_getClass("CPThreePartImage");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPThreePartImage\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_40,_41,_42){
with(_40){
_40=objj_msgSendSuper({receiver:_40,super_class:objj_getClass("CPObject")},"init");
if(_40){
_imageSlices=objj_msgSend(_42,"decodeObjectForKey:",_3e);
_isVertical=objj_msgSend(_42,"decodeBoolForKey:",_3f);
}
return _40;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_43,_44,_45){
with(_43){
objj_msgSend(_45,"encodeObject:forKey:",_imageSlices,_3e);
objj_msgSend(_45,"encodeBool:forKey:",_isVertical,_3f);
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPNinePartImage"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_imageSlices")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithImageSlices:"),function(_46,_47,_48){
with(_46){
_46=objj_msgSendSuper({receiver:_46,super_class:objj_getClass("CPObject")},"init");
if(_46){
_imageSlices=_48;
}
return _46;
}
}),new objj_method(sel_getUid("imageSlices"),function(_49,_4a){
with(_49){
return _imageSlices;
}
}),new objj_method(sel_getUid("isThreePartImage"),function(_4b,_4c){
with(_4b){
return NO;
}
}),new objj_method(sel_getUid("isNinePartImage"),function(_4d,_4e){
with(_4d){
return YES;
}
})]);
var _4f="CPNinePartImageImageSlicesKey";
var _1=objj_getClass("CPNinePartImage");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPNinePartImage\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_50,_51,_52){
with(_50){
_50=objj_msgSendSuper({receiver:_50,super_class:objj_getClass("CPObject")},"init");
if(_50){
_imageSlices=objj_msgSend(_52,"decodeObjectForKey:",_4f);
}
return _50;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_53,_54,_55){
with(_53){
objj_msgSend(_55,"encodeObject:forKey:",_imageSlices,_4f);
}
})]);
p;13;CPImageView.jI;33;Foundation/CPNotificationCenter.ji;11;CPControl.ji;9;CPImage.ji;14;CPShadowView.jc;7204;
CPScaleProportionally=0;
CPScaleToFit=1;
CPScaleNone=2;
var _1=nil;
var _2=3,_3=3,_4=3,_5=5,_6=_4+_5,_7=_2+_3;
var _8=objj_allocateClassPair(CPControl,"CPImageView"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_image"),new objj_ivar("_DOMImageElement"),new objj_ivar("_imageScaling"),new objj_ivar("_hasShadow"),new objj_ivar("_shadowView"),new objj_ivar("_imageRect")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("initWithFrame:"),function(_a,_b,_c){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPControl")},"initWithFrame:",_c);
if(_a){
_DOMImageElement=document.createElement("img");
_DOMImageElement.style.position="absolute";
_DOMImageElement.style.left="0px";
_DOMImageElement.style.top="0px";
if(_DOMImageElement.CPDOMDisplayContext){
_DOMImageElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=6;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMImageElement;
_DOMImageElement.style.visibility="hidden";
}
return _a;
}
}),new objj_method(sel_getUid("image"),function(_d,_e){
with(_d){
return _image;
}
}),new objj_method(sel_getUid("setImage:"),function(_f,_10,_11){
with(_f){
if(_image==_11){
return;
}
var _12=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_image){
objj_msgSend(_12,"removeObserver:name:object:",_f,CPImageDidLoadNotification,_image);
}
_image=_11;
_DOMImageElement.src=objj_msgSend(_11,"filename");
var _13=objj_msgSend(_image,"size");
if(_13&&_13.width==-1&&_13.height==-1){
objj_msgSend(_12,"addObserver:selector:name:object:",_f,sel_getUid("imageDidLoad:"),CPImageDidLoadNotification,_image);
_DOMImageElement.width=0;
_DOMImageElement.height=0;
objj_msgSend(_shadowView,"setHidden:",YES);
}else{
objj_msgSend(_f,"hideOrDisplayContents");
objj_msgSend(_f,"tile");
}
}
}),new objj_method(sel_getUid("imageDidLoad:"),function(_14,_15,_16){
with(_14){
objj_msgSend(_14,"hideOrDisplayContents");
objj_msgSend(_14,"tile");
}
}),new objj_method(sel_getUid("hasShadow"),function(_17,_18){
with(_17){
return _hasShadow;
}
}),new objj_method(sel_getUid("setHasShadow:"),function(_19,_1a,_1b){
with(_19){
if(_hasShadow==_1b){
return;
}
_hasShadow=_1b;
if(_hasShadow){
_shadowView=objj_msgSend(objj_msgSend(CPShadowView,"alloc"),"initWithFrame:",objj_msgSend(_19,"bounds"));
objj_msgSend(_19,"addSubview:",_shadowView);
objj_msgSend(_19,"tile");
}else{
objj_msgSend(_shadowView,"removeFromSuperview");
_shadowView=nil;
}
objj_msgSend(_19,"hideOrDisplayContents");
}
}),new objj_method(sel_getUid("setImageScaling:"),function(_1c,_1d,_1e){
with(_1c){
if(_imageScaling==_1e){
return;
}
_imageScaling=_1e;
if(_imageScaling==CPScaleToFit){
if(!_DOMImageElement.CPDOMDisplayContext){
_DOMImageElement.CPDOMDisplayContext=[];
}
var _1f=_DOMImageElement.CPDOMDisplayContext[0];
if(!(_1f>=0)){
_1f=_DOMImageElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_1f]=0;
CPDOMDisplayServerInstructions[_1f+1]=_DOMImageElement;
CPDOMDisplayServerInstructions[_1f+2]=NULL;
CPDOMDisplayServerInstructions[_1f+3]=0;
CPDOMDisplayServerInstructions[_1f+4]=0;
}
objj_msgSend(_1c,"tile");
}
}),new objj_method(sel_getUid("imageScaling"),function(_20,_21){
with(_20){
return _imageScaling;
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_22,_23,_24){
with(_22){
objj_msgSendSuper({receiver:_22,super_class:objj_getClass("CPControl")},"setFrameSize:",_24);
objj_msgSend(_22,"tile");
}
}),new objj_method(sel_getUid("hideOrDisplayContents"),function(_25,_26){
with(_25){
if(!_image){
_DOMImageElement.style.visibility="hidden";
objj_msgSend(_shadowView,"setHidden:",YES);
}else{
_DOMImageElement.style.visibility="visible";
objj_msgSend(_shadowView,"setHidden:",NO);
}
}
}),new objj_method(sel_getUid("imageRect"),function(_27,_28){
with(_27){
return _imageRect;
}
}),new objj_method(sel_getUid("tile"),function(_29,_2a){
with(_29){
if(!_image){
return;
}
var _2b=objj_msgSend(_29,"bounds"),x=0,y=0,_2e=(_hasShadow?_7:0),_2f=(_hasShadow?_6:0),_30=(_2b.size.width),_31=(_2b.size.height),_32=_30-_2e,_33=_31-_2f;
if(_imageScaling==CPScaleToFit){
_DOMImageElement.width=ROUND(_32);
_DOMImageElement.height=ROUND(_33);
}else{
var _34=objj_msgSend(_image,"size");
if(_34.width==-1&&_34.height==-1){
return;
}
if(_imageScaling==CPScaleProportionally){
if(_32>=_34.width&&_33>=_34.height){
_32=_34.width;
_33=_34.height;
}else{
var _35=_34.width/_34.height,_36=_32/_33;
if(_36>_35){
_32=_33*_35;
}else{
_33=_32/_35;
}
}
_DOMImageElement.width=ROUND(_32);
_DOMImageElement.height=ROUND(_33);
}else{
_32=_34.width;
_33=_34.height;
}
if(_imageScaling==CPScaleNone){
_DOMImageElement.width=ROUND(_34.width);
_DOMImageElement.height=ROUND(_34.height);
}
var x=(_30-_32)/2,y=(_31-_33)/2;
if(!_DOMImageElement.CPDOMDisplayContext){
_DOMImageElement.CPDOMDisplayContext=[];
}
var _37=_DOMImageElement.CPDOMDisplayContext[0];
if(!(_37>=0)){
_37=_DOMImageElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_37]=0;
CPDOMDisplayServerInstructions[_37+1]=_DOMImageElement;
CPDOMDisplayServerInstructions[_37+2]=NULL;
CPDOMDisplayServerInstructions[_37+3]=x;
CPDOMDisplayServerInstructions[_37+4]=y;
}
_imageRect={origin:{x:x,y:y},size:{width:_32,height:_33}};
if(_hasShadow){
objj_msgSend(_shadowView,"setFrame:",{origin:{x:x-_2,y:y-_4},size:{width:_32+_2e,height:_33+_2f}});
}
}
})]);
var _38="CPImageViewImageKey",_39="CPImageViewImageScalingKey",_3a="CPImageViewHasShadowKey";
var _8=objj_getClass("CPImageView");
if(!_8){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPImageView\""));
}
var _9=_8.isa;
class_addMethods(_8,[new objj_method(sel_getUid("initWithCoder:"),function(_3b,_3c,_3d){
with(_3b){
_3b=objj_msgSendSuper({receiver:_3b,super_class:objj_getClass("CPControl")},"initWithCoder:",_3d);
if(_3b){
_DOMImageElement=document.createElement("img");
_DOMImageElement.style.position="absolute";
_DOMImageElement.style.left="0px";
_DOMImageElement.style.top="0px";
_DOMElement.appendChild(_DOMImageElement);
_DOMImageElement.style.visibility="hidden";
objj_msgSend(_3b,"setImage:",objj_msgSend(_3d,"decodeObjectForKey:",_38));
objj_msgSend(_3b,"setImageScaling:",objj_msgSend(_3d,"decodeIntForKey:",_39));
objj_msgSend(_3b,"setHasShadow:",objj_msgSend(_3d,"decodeBoolForKey:",_3a));
objj_msgSend(_3b,"tile");
}
return _3b;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_3e,_3f,_40){
with(_3e){
if(_shadowView){
var _41=_subviews;
_subviews=objj_msgSend(_subviews,"copy");
objj_msgSend(_subviews,"removeObjectIdenticalTo:",_shadowView);
}
objj_msgSendSuper({receiver:_3e,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_40);
if(_shadowView){
_subviews=_41;
}
objj_msgSend(_40,"encodeObject:forKey:",_image,_38);
objj_msgSend(_40,"encodeInt:forKey:",_imageScaling,_39);
objj_msgSend(_40,"encodeBool:forKey:",_hasShadow,_3a);
}
})]);
p;8;CPMenu.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;33;Foundation/CPNotificationCenter.jI;21;Foundation/CPString.ji;15;CPApplication.ji;12;CPClipView.ji;12;CPMenuItem.ji;9;CPPanel.jc;43045;
CPMenuDidAddItemNotification="CPMenuDidAddItemNotification";
CPMenuDidChangeItemNotification="CPMenuDidChangeItemNotification";
CPMenuDidRemoveItemNotification="CPMenuDidRemoveItemNotification";
CPMenuDidEndTrackingNotification="CPMenuDidEndTrackingNotification";
var _1=19;
var _2=NO,_3="",_4=nil,_5=1,_6=nil,_7=nil;
var _8=objj_allocateClassPair(CPObject,"CPMenu"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_title"),new objj_ivar("_items"),new objj_ivar("_attachedMenu"),new objj_ivar("_autoenablesItems"),new objj_ivar("_showsStateColumn"),new objj_ivar("_delegate"),new objj_ivar("_highlightedIndex"),new objj_ivar("_menuWindow")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("menuBarHeight"),function(_a,_b){
with(_a){
if(_a==objj_msgSend(CPApp,"mainMenu")){
return _1;
}
return 0;
}
}),new objj_method(sel_getUid("initWithTitle:"),function(_c,_d,_e){
with(_c){
_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("CPObject")},"init");
if(_c){
_title=_e;
_items=[];
_autoenablesItems=YES;
_showsStateColumn=YES;
}
return _c;
}
}),new objj_method(sel_getUid("insertItem:atIndex:"),function(_f,_10,_11,_12){
with(_f){
var _13=objj_msgSend(_11,"menu");
if(_13){
if(_13!=_f){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Attempted to insert item into menu that was already in another menu.");
}else{
return;
}
}
objj_msgSend(_11,"setMenu:",_f);
objj_msgSend(_items,"insertObject:atIndex:",_11,_12);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPMenuDidAddItemNotification,_f,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_12,"CPMenuItemIndex"));
}
}),new objj_method(sel_getUid("insertItemWithTitle:action:keyEquivalent:atIndex:"),function(_14,_15,_16,_17,_18,_19){
with(_14){
var _1a=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",_16,_17,_18);
objj_msgSend(_14,"insertItem:atIndex:",_1a,_19);
return _1a;
}
}),new objj_method(sel_getUid("addItem:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSend(_1b,"insertItem:atIndex:",_1d,objj_msgSend(_items,"count"));
}
}),new objj_method(sel_getUid("addItemWithTitle:action:keyEquivalent:"),function(_1e,_1f,_20,_21,_22){
with(_1e){
return objj_msgSend(_1e,"insertItemWithTitle:action:keyEquivalent:atIndex:",_20,_21,_22,objj_msgSend(_items,"count"));
}
}),new objj_method(sel_getUid("removeItem:"),function(_23,_24,_25){
with(_23){
objj_msgSend(_23,"removeItemAtIndex:",objj_msgSend(_items,"indexOfObjectIdenticalTo:",_25));
}
}),new objj_method(sel_getUid("removeItemAtIndex:"),function(_26,_27,_28){
with(_26){
if(_28<0||_28>=_items.length){
return;
}
objj_msgSend(_items[_28],"setMenu:",nil);
objj_msgSend(_items,"removeObjectAtIndex:",_28);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPMenuDidRemoveItemNotification,_26,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_28,"CPMenuItemIndex"));
}
}),new objj_method(sel_getUid("itemChanged:"),function(_29,_2a,_2b){
with(_29){
if(objj_msgSend(_2b,"menu")!=_29){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPMenuDidChangeItemNotification,_29,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_items,"indexOfObjectIdenticalTo:",_2b),"CPMenuItemIndex"));
}
}),new objj_method(sel_getUid("menuWithTag:"),function(_2c,_2d,_2e){
with(_2c){
var _2f=objj_msgSend(_2c,"indexOfItemWithTag:",_2e);
if(_2f==CPNotFound){
return nil;
}
return _items[_2f];
}
}),new objj_method(sel_getUid("menuWithTitle:"),function(_30,_31,_32){
with(_30){
var _33=objj_msgSend(_30,"indexOfItemWithTitle:",_32);
if(_33==CPNotFound){
return nil;
}
return _items[_33];
}
}),new objj_method(sel_getUid("itemAtIndex:"),function(_34,_35,_36){
with(_34){
return objj_msgSend(_items,"objectAtIndex:",_36);
}
}),new objj_method(sel_getUid("numberOfItems"),function(_37,_38){
with(_37){
return objj_msgSend(_items,"count");
}
}),new objj_method(sel_getUid("itemArray"),function(_39,_3a){
with(_39){
return _items;
}
}),new objj_method(sel_getUid("indexOfItem:"),function(_3b,_3c,_3d){
with(_3b){
if(objj_msgSend(_3d,"menu")!=_3b){
return CPNotFound;
}
return objj_msgSend(_items,"indexOfObjectIdenticalTo:",_3d);
}
}),new objj_method(sel_getUid("indexOfItemWithTitle:"),function(_3e,_3f,_40){
with(_3e){
var _41=0,_42=_items.length;
for(;_41<_42;++_41){
if(objj_msgSend(_items[_41],"title")===_40){
return _41;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfItemWithTag:"),function(_43,_44,_45){
with(_43){
var _46=0,_47=_items.length;
for(;_46<_47;++_46){
if(objj_msgSend(_items[_46],"tag")==_45){
return _46;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfItemWithTarget:andAction:"),function(_48,_49,_4a,_4b){
with(_48){
var _4c=0,_4d=_items.length;
for(;_4c<_4d;++_4c){
var _4e=_items[_4c];
if(objj_msgSend(_4e,"target")==_4a&&(!_4b||objj_msgSend(_4e,"action")==_4b)){
return _4c;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfItemWithRepresentedObject:"),function(_4f,_50,_51){
with(_4f){
var _52=0,_53=_items.length;
for(;_52<_53;++_52){
if(objj_msgSend(objj_msgSend(_items[_52],"representedObject"),"isEqual:",_51)){
return _52;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("indexOfItemWithSubmenu:"),function(_54,_55,_56){
with(_54){
var _57=0,_58=_items.length;
for(;_57<_58;++_57){
if(objj_msgSend(_items[_57],"submenu")==_56){
return _57;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("setSubmenu:forItem:"),function(_59,_5a,_5b,_5c){
with(_59){
objj_msgSend(_5c,"setTarget:",_5c);
objj_msgSend(_5c,"setAction:",sel_getUid("submenuAction:"));
objj_msgSend(_5c,"setSubmenu:",_5b);
}
}),new objj_method(sel_getUid("submenuAction:"),function(_5d,_5e,_5f){
with(_5d){
}
}),new objj_method(sel_getUid("attachedMenu"),function(_60,_61){
with(_60){
return _attachedMenu;
}
}),new objj_method(sel_getUid("isAttached"),function(_62,_63){
with(_62){
return _isAttached;
}
}),new objj_method(sel_getUid("locationOfSubmenu:"),function(_64,_65,_66){
with(_64){
}
}),new objj_method(sel_getUid("supermenu"),function(_67,_68){
with(_67){
return _supermenu;
}
}),new objj_method(sel_getUid("setSupermenu:"),function(_69,_6a,_6b){
with(_69){
_supermenu=_6b;
}
}),new objj_method(sel_getUid("isTornOff"),function(_6c,_6d){
with(_6c){
return !_supermenu||_6c==objj_msgSend(CPApp,"mainMenu");
}
}),new objj_method(sel_getUid("setAutoenablesItems:"),function(_6e,_6f,_70){
with(_6e){
_autoenablesItems=_70;
}
}),new objj_method(sel_getUid("autoenablesItems"),function(_71,_72){
with(_71){
return _autoenablesItems;
}
}),new objj_method(sel_getUid("update"),function(_73,_74){
with(_73){
}
}),new objj_method(sel_getUid("setTitle:"),function(_75,_76,_77){
with(_75){
_title=_77;
}
}),new objj_method(sel_getUid("title"),function(_78,_79){
with(_78){
return _title;
}
}),new objj_method(sel_getUid("setShowsStateColumn:"),function(_7a,_7b,_7c){
with(_7a){
_showsStateColumn=_7c;
}
}),new objj_method(sel_getUid("showsStateColumn"),function(_7d,_7e){
with(_7d){
return _showsStateColumn;
}
}),new objj_method(sel_getUid("highlightedItem"),function(_7f,_80){
with(_7f){
return _highlightedIndex>=0?_items[_highlightedIndex]:nil;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_81,_82,_83){
with(_81){
_delegate=_83;
}
}),new objj_method(sel_getUid("delegate"),function(_84,_85){
with(_84){
return _delegate;
}
}),new objj_method(sel_getUid("cancelTracking"),function(_86,_87){
with(_86){
objj_msgSend(_menuWindow,"cancelTracking");
}
}),new objj_method(sel_getUid("_setMenuWindow:"),function(_88,_89,_8a){
with(_88){
_menuWindow=_8a;
}
}),new objj_method(sel_getUid("performKeyEquivalent:"),function(_8b,_8c,_8d){
with(_8b){
if(_autoenablesItems){
objj_msgSend(_8b,"update");
}
var _8e=0,_8f=_items.length,_90=objj_msgSend(_8d,"charactersIgnoringModifiers"),_91=objj_msgSend(_8d,"modifierFlags");
for(;_8e<_8f;++_8e){
var _92=_items[_8e],_93=objj_msgSend(_92,"keyEquivalentModifierMask");
if((_91&(CPShiftKeyMask|CPAlternateKeyMask|CPCommandKeyMask|CPControlKeyMask))==_93&&objj_msgSend(_90,"caseInsensitiveCompare:",objj_msgSend(_92,"keyEquivalent"))==CPOrderedSame){
if(objj_msgSend(_92,"isEnabled")){
objj_msgSend(_8b,"performActionForItemAtIndex:",_8e);
}else{
}
return YES;
}
if(objj_msgSend(objj_msgSend(_92,"submenu"),"performKeyEquivalent:",_8d)){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("performActionForItemAtIndex:"),function(_94,_95,_96){
with(_94){
var _97=_items[_96];
objj_msgSend(CPApp,"sendAction:to:from:",objj_msgSend(_97,"action"),objj_msgSend(_97,"target"),_97);
}
}),new objj_method(sel_getUid("_itemIsHighlighted:"),function(_98,_99,_9a){
with(_98){
return _items[_highlightedIndex]==_9a;
}
}),new objj_method(sel_getUid("_highlightItemAtIndex:"),function(_9b,_9c,_9d){
with(_9b){
var _9e=_highlightedIndex;
_highlightedIndex=_9d;
if(_9e!=CPNotFound){
objj_msgSend(objj_msgSend(_items[_9e],"_menuItemView"),"highlight:",NO);
}
if(_highlightedIndex!=CPNotFound){
objj_msgSend(objj_msgSend(_items[_highlightedIndex],"_menuItemView"),"highlight:",YES);
}
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("menuBarVisible"),function(_9f,_a0){
with(_9f){
return _2;
}
}),new objj_method(sel_getUid("setMenuBarVisible:"),function(_a1,_a2,_a3){
with(_a1){
if(_2==_a3){
return;
}
_2=_a3;
if(_a3){
if(!_7){
_7=objj_msgSend(objj_msgSend(_CPMenuBarWindow,"alloc"),"init");
}
objj_msgSend(_7,"setMenu:",objj_msgSend(CPApp,"mainMenu"));
objj_msgSend(_7,"setTitle:",_3);
objj_msgSend(_7,"setIconImage:",_4);
objj_msgSend(_7,"setIconImageAlphaValue:",_5);
objj_msgSend(_7,"setColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarBackgroundColor"));
objj_msgSend(_7,"setTextColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTextColor"));
objj_msgSend(_7,"setTitleColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTitleColor"));
objj_msgSend(_7,"orderFront:",_a1);
}else{
objj_msgSend(_CPMenuBarWindow,"orderOut:",_a1);
}
objj_msgSend(objj_msgSend(CPDOMWindowBridge,"sharedDOMWindowBridge"),"_bridgeResizeEvent:",nil);
}
}),new objj_method(sel_getUid("setMenuBarTitle:"),function(_a4,_a5,_a6){
with(_a4){
_3=_a6;
objj_msgSend(_7,"setTitle:",_3);
}
}),new objj_method(sel_getUid("menuBarTitle"),function(_a7,_a8){
with(_a7){
return _3;
}
}),new objj_method(sel_getUid("setMenuBarIconImage:"),function(_a9,_aa,_ab){
with(_a9){
_CPMenuBarImage=_ab;
objj_msgSend(_7,"setIconImage:",_ab);
}
}),new objj_method(sel_getUid("menuBarIconImage"),function(_ac,_ad){
with(_ac){
return _CPMenuBarImage;
}
}),new objj_method(sel_getUid("setMenuBarAttributes:"),function(_ae,_af,_b0){
with(_ae){
if(_6==_b0){
return;
}
_6=objj_msgSend(_b0,"copy");
var _b1=objj_msgSend(_b0,"objectForKey:","CPMenuBarTextColor"),_b2=objj_msgSend(_b0,"objectForKey:","CPMenuBarTitleColor");
if(!_b1&&_b2){
objj_msgSend(_6,"setObject:forKey:",_b2,"CPMenuBarTextColor");
}else{
if(_b1&&!_b2){
objj_msgSend(_6,"setObject:forKey:",_b1,"CPMenuBarTitleColor");
}else{
if(!_b1&&!_b2){
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"blackColor"),"CPMenuBarTextColor");
objj_msgSend(_6,"setObject:forKey:",objj_msgSend(CPColor,"blackColor"),"CPMenuBarTitleColor");
}
}
}
if(_7){
objj_msgSend(_7,"setColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarBackgroundColor"));
objj_msgSend(_7,"setTextColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTextColor"));
objj_msgSend(_7,"setTitleColor:",objj_msgSend(_6,"objectForKey:","CPMenuBarTitleColor"));
}
}
}),new objj_method(sel_getUid("menuBarAttributes"),function(_b3,_b4){
with(_b3){
return _6;
}
}),new objj_method(sel_getUid("_setMenuBarIconImageAlphaValue:"),function(_b5,_b6,_b7){
with(_b5){
_5=_b7;
objj_msgSend(_7,"setIconImageAlphaValue:",_b7);
}
}),new objj_method(sel_getUid("popUpContextMenu:withEvent:forView:"),function(_b8,_b9,_ba,_bb,_bc){
with(_b8){
objj_msgSend(_b8,"popUpContextMenu:withEvent:forView:withFont:",_ba,_bb,_bc,nil);
}
}),new objj_method(sel_getUid("popUpContextMenu:withEvent:forView:withFont:"),function(_bd,_be,_bf,_c0,_c1,_c2){
with(_bd){
objj_msgSend(_bd,"_popUpContextMenu:withEvent:forView:withFont:forMenuBar:",_bf,_c0,_c1,_c2,NO);
}
}),new objj_method(sel_getUid("_popUpContextMenu:withEvent:forView:withFont:forMenuBar:"),function(_c3,_c4,_c5,_c6,_c7,_c8,_c9){
with(_c3){
var _ca=objj_msgSend(_c5,"delegate");
if(objj_msgSend(_ca,"respondsToSelector:",sel_getUid("menuWillOpen:"))){
objj_msgSend(_ca,"menuWillOpen:",_c5);
}
if(!_c8){
_c8=objj_msgSend(CPFont,"systemFontOfSize:",12);
}
var _cb=objj_msgSend(_c7,"window"),_cc=objj_msgSend(_CPMenuWindow,"menuWindowWithMenu:font:",_c5,_c8);
objj_msgSend(_cc,"setDelegate:",_c3);
objj_msgSend(_cc,"setBackgroundStyle:",_c9?_CPMenuWindowMenuBarBackgroundStyle:_CPMenuWindowPopUpBackgroundStyle);
objj_msgSend(_cc,"setFrameOrigin:",objj_msgSend(objj_msgSend(_c6,"window"),"convertBaseToBridge:",objj_msgSend(_c6,"locationInWindow")));
objj_msgSend(_cc,"orderFront:",_c3);
objj_msgSend(_cc,"beginTrackingWithEvent:sessionDelegate:didEndSelector:",_c6,_c3,sel_getUid("_menuWindowDidFinishTracking:highlightedItem:"));
}
}),new objj_method(sel_getUid("_menuWindowDidFinishTracking:highlightedItem:"),function(_cd,_ce,_cf,_d0){
with(_cd){
objj_msgSend(_CPMenuWindow,"poolMenuWindow:",_cf);
var _d1=nil,_d2=objj_msgSend(_d0,"action");
if(!_d2){
}else{
_d1=objj_msgSend(_d0,"target");
}
objj_msgSend(CPApp,"sendAction:to:from:",_d2,_d1,nil);
}
})]);
var _d3="CPMenuTitleKey",_d4="CPMenuItemsKey";
var _8=objj_getClass("CPMenu");
if(!_8){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPMenu\""));
}
var _9=_8.isa;
class_addMethods(_8,[new objj_method(sel_getUid("initWithCoder:"),function(_d5,_d6,_d7){
with(_d5){
_d5=objj_msgSendSuper({receiver:_d5,super_class:objj_getClass("CPObject")},"init");
if(_d5){
_title=objj_msgSend(_d7,"decodeObjectForKey:",_d3);
_items=objj_msgSend(_d7,"decodeObjectForKey:",_d4);
}
return _d5;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_d8,_d9,_da){
with(_d8){
objj_msgSend(_da,"encodeObject:forKey:",_title,_d3);
objj_msgSend(_da,"encodeObject:forKey:",_items,_d4);
}
})]);
var _db=[],_dc=5,_dd=[],_de=-1,_df=1,_e0=0;
_CPMenuWindowMenuBarBackgroundStyle=0;
_CPMenuWindowPopUpBackgroundStyle=1;
_CPMenuWindowAttachedMenuBackgroundStyle=2;
var _e1=500,_e2=5,_e3=1,_e4=1,_e5=5,_e6=16;
var _8=objj_allocateClassPair(CPWindow,"_CPMenuWindow"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_menuView"),new objj_ivar("_menuClipView"),new objj_ivar("_lastMouseOverMenuView"),new objj_ivar("_moreAboveView"),new objj_ivar("_moreBelowView"),new objj_ivar("_sessionDelegate"),new objj_ivar("_didEndSelector"),new objj_ivar("_startTime"),new objj_ivar("_scrollingState"),new objj_ivar("_lastScreenLocation"),new objj_ivar("_isShowingTopScrollIndicator"),new objj_ivar("_isShowingBottomScrollIndicator"),new objj_ivar("_trackingCanceled"),new objj_ivar("_unconstrainedFrame")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("init"),function(_e7,_e8){
with(_e7){
_e7=objj_msgSendSuper({receiver:_e7,super_class:objj_getClass("CPWindow")},"initWithContentRect:styleMask:",CGRectMakeZero(),CPBorderlessWindowMask);
if(_e7){
objj_msgSend(_e7,"setLevel:",CPTornOffMenuWindowLevel);
objj_msgSend(_e7,"setHasShadow:",YES);
objj_msgSend(_e7,"setAcceptsMouseMovedEvents:",YES);
_unconstrainedFrame=CGRectMakeZero();
var _e9=objj_msgSend(_e7,"contentView");
_menuView=objj_msgSend(objj_msgSend(_CPMenuView,"alloc"),"initWithFrame:",CGRectMakeZero());
_menuClipView=objj_msgSend(objj_msgSend(CPClipView,"alloc"),"initWithFrame:",CGRectMake(_e3,_e2,0,0));
objj_msgSend(_menuClipView,"setDocumentView:",_menuView);
objj_msgSend(_e9,"addSubview:",_menuClipView);
_moreAboveView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_moreAboveView,"setImage:",_CPMenuWindowMoreAboveImage);
objj_msgSend(_moreAboveView,"setFrameSize:",objj_msgSend(_CPMenuWindowMoreAboveImage,"size"));
objj_msgSend(_e9,"addSubview:",_moreAboveView);
_moreBelowView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_moreBelowView,"setImage:",_CPMenuWindowMoreBelowImage);
objj_msgSend(_moreBelowView,"setFrameSize:",objj_msgSend(_CPMenuWindowMoreBelowImage,"size"));
objj_msgSend(_e9,"addSubview:",_moreBelowView);
}
return _e7;
}
}),new objj_method(sel_getUid("setFont:"),function(_ea,_eb,_ec){
with(_ea){
objj_msgSend(_menuView,"setFont:",_ec);
}
}),new objj_method(sel_getUid("setBackgroundStyle:"),function(_ed,_ee,_ef){
with(_ed){
var _f0=_dd[_ef];
if(!_f0){
var _f1=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_ed,"class"));
if(_ef==_CPMenuWindowPopUpBackgroundStyle){
_f0=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f1,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded0.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f1,"pathForResource:","_CPMenuWindow/_CPMenuWindow1.png"),CGSizeMake(1,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f1,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded2.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f1,"pathForResource:","_CPMenuWindow/_CPMenuWindow3.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f1,"pathForResource:","_CPMenuWindow/_CPMenuWindow4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f1,"pathForResource:","_CPMenuWindow/_CPMenuWindow5.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f1,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded6.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f1,"pathForResource:","_CPMenuWindow/_CPMenuWindow7.png"),CGSizeMake(1,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f1,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded8.png"),CGSizeMake(4,4))]));
}else{
if(_ef==_CPMenuWindowMenuBarBackgroundStyle){
_f0=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f1,"pathForResource:","_CPMenuWindow/_CPMenuWindow3.png"),CGSizeMake(4,0)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f1,"pathForResource:","_CPMenuWindow/_CPMenuWindow4.png"),CGSizeMake(1,0)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f1,"pathForResource:","_CPMenuWindow/_CPMenuWindow5.png"),CGSizeMake(4,0)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f1,"pathForResource:","_CPMenuWindow/_CPMenuWindow3.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f1,"pathForResource:","_CPMenuWindow/_CPMenuWindow4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f1,"pathForResource:","_CPMenuWindow/_CPMenuWindow5.png"),CGSizeMake(4,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f1,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded6.png"),CGSizeMake(4,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f1,"pathForResource:","_CPMenuWindow/_CPMenuWindow7.png"),CGSizeMake(1,4)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f1,"pathForResource:","_CPMenuWindow/_CPMenuWindowRounded8.png"),CGSizeMake(4,4))]));
}
}
_dd[_ef]=_f0;
}
objj_msgSend(_ed,"setBackgroundColor:",_f0);
}
}),new objj_method(sel_getUid("setMenu:"),function(_f2,_f3,_f4){
with(_f2){
objj_msgSend(_f4,"_setMenuWindow:",_f2);
objj_msgSend(_menuView,"setMenu:",_f4);
var _f5=objj_msgSend(_menuView,"frame").size;
objj_msgSend(_f2,"setFrameSize:",CGSizeMake(_e3+_f5.width+_e4,_e2+_f5.height+_e5));
objj_msgSend(_menuView,"scrollPoint:",CGPointMake(0,0));
objj_msgSend(_menuClipView,"setFrame:",CGRectMake(_e3,_e2,_f5.width,_f5.height));
}
}),new objj_method(sel_getUid("setMinWidth:"),function(_f6,_f7,_f8){
with(_f6){
var _f9=objj_msgSend(_f6,"frame").size;
objj_msgSend(_f6,"setFrameSize:",CGSizeMake(MAX(_f9.width,_f8),_f9.height));
}
}),new objj_method(sel_getUid("rectForItemAtIndex:"),function(_fa,_fb,_fc){
with(_fa){
return objj_msgSend(_menuView,"convertRect:toView:",objj_msgSend(_menuView,"rectForItemAtIndex:",_fc),nil);
}
}),new objj_method(sel_getUid("orderFront:"),function(_fd,_fe,_ff){
with(_fd){
objj_msgSend(_fd,"constrainToScreen");
objj_msgSendSuper({receiver:_fd,super_class:objj_getClass("CPWindow")},"orderFront:",_ff);
}
}),new objj_method(sel_getUid("constrainToScreen"),function(self,_cmd){
with(self){
_unconstrainedFrame=CGRectMakeCopy(objj_msgSend(self,"frame"));
var _102=CGRectInset(objj_msgSend(objj_msgSend(CPDOMWindowBridge,"sharedDOMWindowBridge"),"contentBounds"),5,5),_103=CGRectIntersection(_unconstrainedFrame,_102),_104=objj_msgSend(self,"convertBaseToBridge:",CGPointMake(_e3,_e2));
_103.origin.x=CGRectGetMinX(_unconstrainedFrame);
_103.size.width=CGRectGetWidth(_unconstrainedFrame);
if(CGRectGetWidth(_103)>CGRectGetWidth(_102)){
_103.size.width=CGRectGetWidth(_102);
}
if(CGRectGetMaxX(_103)>CGRectGetMaxX(_102)){
_103.origin.x-=CGRectGetMaxX(_103)-CGRectGetMaxX(_102);
}
if(CGRectGetMinX(_103)<CGRectGetMinX(_102)){
_103.origin.x=CGRectGetMinX(_102);
}
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPWindow")},"setFrame:",_103);
var _105=_e2,_106=_e5,_107=objj_msgSend(self,"contentView"),_108=objj_msgSend(_107,"bounds");
var _109=_104.y<CGRectGetMinY(_103)+_e2,_10a=_104.y+CGRectGetHeight(objj_msgSend(_menuView,"frame"))>CGRectGetMaxY(_103)-_e5;
if(_109){
_105+=_e6;
var _10b=objj_msgSend(_moreAboveView,"frame");
objj_msgSend(_moreAboveView,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_108)-CGRectGetWidth(_10b))/2,(_e2+_e6-CGRectGetHeight(_10b))/2));
}
objj_msgSend(_moreAboveView,"setHidden:",!_109);
if(_10a){
_106+=_e6;
objj_msgSend(_moreBelowView,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_108)-CGRectGetWidth(objj_msgSend(_moreBelowView,"frame")))/2,CGRectGetHeight(_108)-_e6-_e5));
}
objj_msgSend(_moreBelowView,"setHidden:",!_10a);
var _10c=CGRectMake(_e3,_105,CGRectGetWidth(_103)-_e3-_e4,CGRectGetHeight(_103)-_105-_106);
objj_msgSend(_menuClipView,"setFrame:",_10c);
objj_msgSend(_menuView,"setFrameSize:",CGSizeMake(CGRectGetWidth(_10c),CGRectGetHeight(objj_msgSend(_menuView,"frame"))));
objj_msgSend(_menuView,"scrollPoint:",CGPointMake(0,objj_msgSend(self,"convertBaseToBridge:",_10c.origin).y-_104.y));
}
}),new objj_method(sel_getUid("cancelTracking"),function(self,_cmd){
with(self){
_trackingCanceled=YES;
}
}),new objj_method(sel_getUid("beginTrackingWithEvent:sessionDelegate:didEndSelector:"),function(self,_cmd,_111,_112,_113){
with(self){
_startTime=objj_msgSend(_111,"timestamp");
_scrollingState=_e0;
_trackingCanceled=NO;
_sessionDelegate=_112;
_didEndSelector=_113;
objj_msgSend(self,"trackEvent:",_111);
}
}),new objj_method(sel_getUid("trackEvent:"),function(self,_cmd,_116){
with(self){
var type=objj_msgSend(_116,"type"),_118=objj_msgSend(_116,"window"),_119=_118?objj_msgSend(_118,"convertBaseToBridge:",objj_msgSend(_116,"locationInWindow")):objj_msgSend(_116,"locationInWindow");
if(type==CPPeriodic){
var _11a=CGRectInset(objj_msgSend(objj_msgSend(CPDOMWindowBridge,"sharedDOMWindowBridge"),"contentBounds"),5,5);
if(_scrollingState==_de){
if(CGRectGetMinY(_unconstrainedFrame)<CGRectGetMinY(_11a)){
_unconstrainedFrame.origin.y+=10;
}
}else{
if(_scrollingState==_df){
if(CGRectGetMaxY(_unconstrainedFrame)>CGRectGetHeight(_11a)){
_unconstrainedFrame.origin.y-=10;
}
}
}
objj_msgSend(self,"setFrame:",_unconstrainedFrame);
objj_msgSend(self,"constrainToScreen");
_119=_lastScreenLocation;
}
_lastScreenLocation=_119;
var menu=objj_msgSend(_menuView,"menu"),_11c=objj_msgSend(self,"convertBridgeToBase:",_119),_11d=objj_msgSend(_menuView,"itemIndexAtPoint:",objj_msgSend(_menuView,"convertPoint:fromView:",_11c,nil)),_11e=objj_msgSend(objj_msgSend(menu,"itemAtIndex:",_11d),"view");
if(_11e){
if(!_lastMouseOverMenuView){
objj_msgSend(menu,"_highlightItemAtIndex:",CPNotFound);
}
if(_lastMouseOverMenuView!=_11e){
objj_msgSend(_11e,"mouseExited:",_116);
objj_msgSend(_lastMouseOverMenuView,"mouseEntered:",_116);
_lastMouseOverMenuView=_11e;
}
objj_msgSend(self,"sendEvent:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",type,_11c,objj_msgSend(_116,"modifierFlags"),objj_msgSend(_116,"timestamp"),objj_msgSend(self,"windowNumber"),nil,0,objj_msgSend(_116,"clickCount"),objj_msgSend(_116,"pressure")));
}else{
if(_lastMouseOverMenuView){
objj_msgSend(_lastMouseOverMenuView,"mouseExited:",_116);
_lastMouseOverMenuView=nil;
}
objj_msgSend(menu,"_highlightItemAtIndex:",objj_msgSend(_menuView,"itemIndexAtPoint:",objj_msgSend(_menuView,"convertPoint:fromView:",objj_msgSend(self,"convertBridgeToBase:",_119),nil)));
if(type==CPMouseMoved||type==CPLeftMouseDragged||type==CPLeftMouseDown){
var _11f=objj_msgSend(self,"frame"),_120=_scrollingState;
_scrollingState=_e0;
if(_119.y<CGRectGetMinY(_11f)+_e2+_e6){
_scrollingState=_de;
}else{
if(_119.y>CGRectGetMaxY(_11f)-_e5-_e6){
_scrollingState=_df;
}
}
if(_scrollingState!=_120){
if(_scrollingState==_e0){
objj_msgSend(CPEvent,"stopPeriodicEvents");
}else{
if(_120==_e0){
objj_msgSend(CPEvent,"startPeriodicEventsAfterDelay:withPeriod:",0,0.04);
}
}
}
}else{
if(type==CPLeftMouseUp&&(objj_msgSend(_116,"timestamp")-_startTime>_e1)){
if(_scrollingState!=_e0){
objj_msgSend(CPEvent,"stopPeriodicEvents");
}
objj_msgSend(self,"cancelTracking");
}
}
}
if(_trackingCanceled){
objj_msgSend(CPEvent,"stopPeriodicEvents");
var _121=objj_msgSend(objj_msgSend(_menuView,"menu"),"highlightedItem");
objj_msgSend(menu,"_highlightItemAtIndex:",CPNotFound);
objj_msgSend(_menuView,"setMenu:",nil);
objj_msgSend(self,"orderOut:",self);
if(_sessionDelegate&&_didEndSelector){
objj_msgSend(_sessionDelegate,_didEndSelector,self,_121);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPMenuDidEndTrackingNotification,menu);
var _122=objj_msgSend(menu,"delegate");
if(objj_msgSend(_122,"respondsToSelector:",sel_getUid("menuDidClose:"))){
objj_msgSend(_122,"menuDidClose:",menu);
}
return;
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",self,sel_getUid("trackEvent:"),CPPeriodicMask|CPMouseMovedMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("menuWindowWithMenu:font:"),function(self,_cmd,_125,_126){
with(self){
var _127=nil;
if(_db.length){
_127=_db.pop();
}else{
_127=objj_msgSend(objj_msgSend(_CPMenuWindow,"alloc"),"init");
}
objj_msgSend(_127,"setFont:",_126);
objj_msgSend(_127,"setMenu:",_125);
return _127;
}
}),new objj_method(sel_getUid("poolMenuWindow:"),function(self,_cmd,_12a){
with(self){
if(!_12a||_db.length>=_dc){
return;
}
_db.push(_12a);
}
}),new objj_method(sel_getUid("initialize"),function(self,_cmd){
with(self){
if(self!=objj_msgSend(_CPMenuWindow,"class")){
return;
}
var _12d=objj_msgSend(CPBundle,"bundleForClass:",self);
_CPMenuWindowMoreAboveImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_12d,"pathForResource:","_CPMenuWindow/_CPMenuWindowMoreAbove.png"),CGSizeMake(38,18));
_CPMenuWindowMoreBelowImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_12d,"pathForResource:","_CPMenuWindow/_CPMenuWindowMoreBelow.png"),CGSizeMake(38,18));
}
})]);
var _8=objj_allocateClassPair(CPView,"_CPMenuView"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_menuItemViews"),new objj_ivar("_font")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("setFont:"),function(self,_cmd,_130){
with(self){
_font=_130;
}
}),new objj_method(sel_getUid("rectForItemAtIndex:"),function(self,_cmd,_133){
with(self){
return objj_msgSend(_menuItemViews[_133==CPNotFound?0:_133],"frame");
}
}),new objj_method(sel_getUid("itemIndexAtPoint:"),function(self,_cmd,_136){
with(self){
var _137=0,_138=_menuItemViews.length;
for(;_137<_138;++_137){
var view=_menuItemViews[_137];
if(objj_msgSend(view,"isHidden")){
continue;
}
if(CGRectContainsPoint(objj_msgSend(view,"frame"),_136)){
return _137;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("setMenu:"),function(self,_cmd,_13c){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPView")},"setMenu:",_13c);
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:",sel_getUid("removeFromSuperview"));
_menuItemViews=[];
var menu=objj_msgSend(self,"menu");
if(!menu){
return;
}
var _13e=objj_msgSend(menu,"itemArray"),_13f=0,_140=objj_msgSend(_13e,"count"),_141=0,y=0,_143=objj_msgSend(menu,"showsStateColumn");
for(;_13f<_140;++_13f){
var item=_13e[_13f],view=objj_msgSend(item,"_menuItemView");
_menuItemViews.push(view);
if(objj_msgSend(item,"isHidden")){
continue;
}
objj_msgSend(view,"setFont:",_font);
objj_msgSend(view,"setShowsStateColumn:",_143);
objj_msgSend(view,"synchronizeWithMenuItem");
objj_msgSend(view,"setFrameOrigin:",CGPointMake(0,y));
objj_msgSend(self,"addSubview:",view);
var size=objj_msgSend(view,"minSize"),_147=size.width;
if(_141<_147){
_141=_147;
}
y+=size.height;
}
for(_13f=0;_13f<_140;++_13f){
var view=_menuItemViews[_13f];
objj_msgSend(view,"setFrameSize:",CGSizeMake(_141,CGRectGetHeight(objj_msgSend(view,"frame"))));
}
objj_msgSend(self,"setAutoresizesSubviews:",NO);
objj_msgSend(self,"setFrameSize:",CGSizeMake(_141,y));
objj_msgSend(self,"setAutoresizesSubviews:",YES);
}
})]);
var _1=29,_148=10,_149=10,_14a=10;
var _14b=nil,_14c=nil;
var _8=objj_allocateClassPair(CPPanel,"_CPMenuBarWindow"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("_menu"),new objj_ivar("_highlightView"),new objj_ivar("_menuItemViews"),new objj_ivar("_trackingMenuItem"),new objj_ivar("_iconImageView"),new objj_ivar("_titleField"),new objj_ivar("_textColor"),new objj_ivar("_titleColor")]);
objj_registerClassPair(_8);
objj_addClassForBundle(_8,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_8,[new objj_method(sel_getUid("init"),function(self,_cmd){
with(self){
var _14f=CGRectGetWidth(objj_msgSend(objj_msgSend(CPDOMWindowBridge,"sharedDOMWindowBridge"),"contentBounds"));
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPPanel")},"initWithContentRect:styleMask:",CGRectMake(0,0,_14f,_1),CPBorderlessWindowMask);
if(self){
objj_msgSend(self,"setLevel:",-1);
objj_msgSend(self,"setAutoresizingMask:",CPWindowWidthSizable);
var _150=objj_msgSend(self,"contentView");
objj_msgSend(_150,"setAutoresizesSubviews:",NO);
objj_msgSend(self,"setBecomesKeyOnlyIfNeeded:",YES);
_iconImageView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(0,0,16,16));
objj_msgSend(_150,"addSubview:",_iconImageView);
_titleField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_titleField,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(_titleField,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_150,"addSubview:",_titleField);
}
return self;
}
}),new objj_method(sel_getUid("setTitle:"),function(self,_cmd,_153){
with(self){
var _154=objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"objectForInfoDictionaryKey:","CPBundleName");
if(!objj_msgSend(_154,"length")){
document.title=_153;
}else{
if(objj_msgSend(_153,"length")){
document.title=_153+" - "+_154;
}else{
document.title=_154;
}
}
objj_msgSend(_titleField,"setStringValue:",_153);
objj_msgSend(_titleField,"sizeToFit");
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("setIconImage:"),function(self,_cmd,_157){
with(self){
objj_msgSend(_iconImageView,"setImage:",_157);
objj_msgSend(_iconImageView,"setHidden:",_157==nil);
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("setIconImageAlphaValue:"),function(self,_cmd,_15a){
with(self){
objj_msgSend(_iconImageView,"setAlphaValue:",_15a);
}
}),new objj_method(sel_getUid("setColor:"),function(self,_cmd,_15d){
with(self){
if(!_15d){
if(!_14b){
_14b=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_CPMenuBarWindow,"class")),"pathForResource:","_CPMenuBarWindow/_CPMenuBarWindowBackground.png"),CGSizeMake(1,18)));
}
objj_msgSend(objj_msgSend(self,"contentView"),"setBackgroundColor:",_14b);
}else{
objj_msgSend(objj_msgSend(self,"contentView"),"setBackgroundColor:",_15d);
}
}
}),new objj_method(sel_getUid("setTextColor:"),function(self,_cmd,_160){
with(self){
if(_textColor==_160){
return;
}
_textColor=_160;
objj_msgSend(_menuItemViews,"makeObjectsPerformSelector:withObject:",sel_getUid("setTextColor:"),_textColor);
}
}),new objj_method(sel_getUid("setTitleColor:"),function(self,_cmd,_163){
with(self){
if(_titleColor==_163){
return;
}
_titleColor=_163;
objj_msgSend(_titleField,"setTextColor:",_163?_163:objj_msgSend(CPColor,"blackColor"));
}
}),new objj_method(sel_getUid("setMenu:"),function(self,_cmd,_166){
with(self){
if(_menu==_166){
return;
}
var _167=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_menu){
objj_msgSend(_167,"removeObserver:name:object:",self,CPMenuDidAddItemNotification,_menu);
objj_msgSend(_167,"removeObserver:name:object:",self,CPMenuDidChangeItemNotification,_menu);
objj_msgSend(_167,"removeObserver:name:object:",self,CPMenuDidRemoveItemNotification,_menu);
var _168=objj_msgSend(_menu,"itemArray"),_169=_168.length;
while(_169--){
objj_msgSend(objj_msgSend(_168[_169],"_menuItemView"),"removeFromSuperview");
}
}
_menu=_166;
if(_menu){
objj_msgSend(_167,"addObserver:selector:name:object:",self,sel_getUid("menuDidAddItem:"),CPMenuDidAddItemNotification,_menu);
objj_msgSend(_167,"addObserver:selector:name:object:",self,sel_getUid("menuDidChangeItem:"),CPMenuDidChangeItemNotification,_menu);
objj_msgSend(_167,"addObserver:selector:name:object:",self,sel_getUid("menuDidRemoveItem:"),CPMenuDidRemoveItemNotification,_menu);
}
_menuItemViews=[];
var _16a=objj_msgSend(self,"contentView"),_168=objj_msgSend(_menu,"itemArray"),_169=_168.length;
for(index=0;index<_169;++index){
var item=_168[index],_16c=objj_msgSend(item,"_menuItemView");
_menuItemViews.push(_16c);
objj_msgSend(_16c,"setShowsStateColumn:",NO);
objj_msgSend(_16c,"setBelongsToMenuBar:",YES);
objj_msgSend(_16c,"setFont:",_14c);
objj_msgSend(_16c,"setTextColor:",_textColor);
objj_msgSend(_16c,"setHidden:",objj_msgSend(item,"isHidden"));
objj_msgSend(_16c,"synchronizeWithMenuItem");
objj_msgSend(_16a,"addSubview:",_16c);
}
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("menuDidChangeItem:"),function(self,_cmd,_16f){
with(self){
var _170=objj_msgSend(_menu,"itemAtIndex:",objj_msgSend(objj_msgSend(_16f,"userInfo"),"objectForKey:","CPMenuItemIndex")),_171=objj_msgSend(_170,"_menuItemView");
objj_msgSend(_171,"setHidden:",objj_msgSend(_170,"isHidden"));
objj_msgSend(_171,"synchronizeWithMenuItem");
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("menuDidAddItem:"),function(self,_cmd,_174){
with(self){
var _175=objj_msgSend(objj_msgSend(_174,"userInfo"),"objectForKey:","CPMenuItemIndex"),_176=objj_msgSend(_menu,"itemAtIndex:",_175),_177=objj_msgSend(_176,"_menuItemView");
objj_msgSend(_menuItemViews,"insertObject:atIndex:",_177,_175);
objj_msgSend(_177,"setShowsStateColumn:",NO);
objj_msgSend(_177,"setBelongsToMenuBar:",YES);
objj_msgSend(_177,"setFont:",_14c);
objj_msgSend(_177,"setTextColor:",_textColor);
objj_msgSend(_177,"setHidden:",objj_msgSend(_176,"isHidden"));
objj_msgSend(_177,"synchronizeWithMenuItem");
objj_msgSend(objj_msgSend(self,"contentView"),"addSubview:",_177);
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("menuDidRemoveItem:"),function(self,_cmd,_17a){
with(self){
var _17b=objj_msgSend(objj_msgSend(_17a,"userInfo"),"objectForKey:","CPMenuItemIndex"),_17c=objj_msgSend(_menuItemViews,"objectAtIndex:",_17b);
objj_msgSend(_menuItemViews,"removeObjectAtIndex:",_17b);
objj_msgSend(_17c,"removeFromSuperview");
objj_msgSend(self,"tile");
}
}),new objj_method(sel_getUid("frameForMenuItem:"),function(self,_cmd,_17f){
with(self){
var _180=objj_msgSend(objj_msgSend(_17f,"_menuItemView"),"frame");
_180.origin.x-=5;
_180.origin.y=0;
_180.size.width+=10;
_180.size.height=_1;
return _180;
}
}),new objj_method(sel_getUid("menuItemAtPoint:"),function(self,_cmd,_183){
with(self){
var _184=objj_msgSend(_menu,"itemArray"),_185=_184.length;
while(_185--){
var item=_184[_185];
if(objj_msgSend(item,"isHidden")||objj_msgSend(item,"isSeparatorItem")){
continue;
}
if(CGRectContainsPoint(objj_msgSend(self,"frameForMenuItem:",item),_183)){
return item;
}
}
return nil;
}
}),new objj_method(sel_getUid("mouseDown:"),function(self,_cmd,_189){
with(self){
_trackingMenuItem=objj_msgSend(self,"menuItemAtPoint:",objj_msgSend(_189,"locationInWindow"));
if(!objj_msgSend(_trackingMenuItem,"isEnabled")){
return;
}
if(objj_msgSend(objj_msgSend(_trackingMenuItem,"_menuItemView"),"eventOnSubmenu:",_189)){
return objj_msgSend(self,"showMenu:",_189);
}
if(objj_msgSend(_trackingMenuItem,"isEnabled")){
objj_msgSend(self,"trackEvent:",_189);
}
}
}),new objj_method(sel_getUid("trackEvent:"),function(self,_cmd,_18c){
with(self){
var type=objj_msgSend(_18c,"type");
if(type===CPPeriodic){
return objj_msgSend(self,"showMenu:",_18c);
}
var _18e=objj_msgSend(self,"frameForMenuItem:",_trackingMenuItem),_18f=objj_msgSend(_trackingMenuItem,"_menuItemView"),_190=CGRectContainsPoint(_18e,objj_msgSend(_18c,"locationInWindow"));
if(type==CPLeftMouseDown){
if(objj_msgSend(_trackingMenuItem,"submenu")!=nil){
if(!objj_msgSend(_trackingMenuItem,"action")){
return objj_msgSend(self,"showMenu:",_18c);
}
objj_msgSend(CPEvent,"startPeriodicEventsAfterDelay:withPeriod:",0,0.5);
}
objj_msgSend(_18f,"highlight:",_190);
}else{
if(type==CPLeftMouseDragged){
if(!_190&&objj_msgSend(_trackingMenuItem,"submenu")){
return objj_msgSend(self,"showMenu:",_18c);
}
objj_msgSend(_18f,"highlight:",_190);
}else{
objj_msgSend(CPEvent,"stopPeriodicEvents");
objj_msgSend(_18f,"highlight:",NO);
if(_190){
objj_msgSend(CPApp,"sendAction:to:from:",objj_msgSend(_trackingMenuItem,"action"),objj_msgSend(_trackingMenuItem,"target"),nil);
}
return;
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",self,sel_getUid("trackEvent:"),CPPeriodicMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("showMenu:"),function(self,_cmd,_193){
with(self){
objj_msgSend(CPEvent,"stopPeriodicEvents");
var _194=objj_msgSend(self,"frameForMenuItem:",_trackingMenuItem),_195=objj_msgSend(_trackingMenuItem,"_menuItemView");
if(!_highlightView){
_highlightView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_194);
objj_msgSend(_highlightView,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",81/255,83/255,109/255,1));
}else{
objj_msgSend(_highlightView,"setFrame:",_194);
}
objj_msgSend(objj_msgSend(self,"contentView"),"addSubview:positioned:relativeTo:",_highlightView,CPWindowBelow,_195);
objj_msgSend(_195,"activate:",YES);
var _196=objj_msgSend(_trackingMenuItem,"submenu");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",self,sel_getUid("menuDidEndTracking:"),CPMenuDidEndTrackingNotification,_196);
objj_msgSend(CPMenu,"_popUpContextMenu:withEvent:forView:withFont:forMenuBar:",_196,objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPLeftMouseDown,CGPointMake(CGRectGetMinX(_194),CGRectGetMaxY(_194)),objj_msgSend(_193,"modifierFlags"),objj_msgSend(_193,"timestamp"),objj_msgSend(self,"windowNumber"),nil,0,objj_msgSend(_193,"clickCount"),objj_msgSend(_193,"pressure")),objj_msgSend(self,"contentView"),nil,YES);
}
}),new objj_method(sel_getUid("menuDidEndTracking:"),function(self,_cmd,_199){
with(self){
objj_msgSend(_highlightView,"removeFromSuperview");
objj_msgSend(objj_msgSend(_trackingMenuItem,"_menuItemView"),"activate:",NO);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",self,CPMenuDidEndTrackingNotification,objj_msgSend(_199,"object"));
}
}),new objj_method(sel_getUid("tile"),function(self,_cmd){
with(self){
var _19c=objj_msgSend(_menu,"itemArray"),_19d=0,_19e=_19c.length,x=_149,y=0,_1a1=YES;
for(;_19d<_19e;++_19d){
var item=_19c[_19d];
if(objj_msgSend(item,"isSeparatorItem")){
x=CGRectGetWidth(objj_msgSend(self,"frame"))-_14a;
_1a1=NO;
continue;
}
if(objj_msgSend(item,"isHidden")){
continue;
}
var _1a3=objj_msgSend(item,"_menuItemView"),_1a4=objj_msgSend(_1a3,"frame");
if(_1a1){
objj_msgSend(_1a3,"setFrameOrigin:",CGPointMake(x,(_1-1-CGRectGetHeight(_1a4))/2));
x+=CGRectGetWidth(objj_msgSend(_1a3,"frame"))+_148;
}else{
objj_msgSend(_1a3,"setFrameOrigin:",CGPointMake(x-CGRectGetWidth(_1a4),(_1-1-CGRectGetHeight(_1a4))/2));
x=CGRectGetMinX(objj_msgSend(_1a3,"frame"))-_148;
}
}
var _1a5=objj_msgSend(objj_msgSend(self,"contentView"),"bounds"),_1a6=objj_msgSend(_titleField,"frame");
if(objj_msgSend(_iconImageView,"isHidden")){
objj_msgSend(_titleField,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_1a5)-CGRectGetWidth(_1a6))/2,(CGRectGetHeight(_1a5)-CGRectGetHeight(_1a6))/2));
}else{
var _1a7=objj_msgSend(_iconImageView,"frame"),_1a8=CGRectGetWidth(_1a7),_1a9=_1a8+CGRectGetWidth(_1a6);
objj_msgSend(_iconImageView,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_1a5)-_1a9)/2,(CGRectGetHeight(_1a5)-CGRectGetHeight(_1a7))/2));
objj_msgSend(_titleField,"setFrameOrigin:",CGPointMake((CGRectGetWidth(_1a5)-_1a9)/2+_1a8,(CGRectGetHeight(_1a5)-CGRectGetHeight(_1a6))/2));
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(self,_cmd,_1ac){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPPanel")},"setFrameSize:",_1ac);
objj_msgSend(self,"tile");
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("initialize"),function(self,_cmd){
with(self){
if(self!=objj_msgSend(_CPMenuBarWindow,"class")){
return;
}
var _1af=objj_msgSend(CPBundle,"bundleForClass:",self);
_14c=objj_msgSend(CPFont,"systemFontOfSize:",11);
}
})]);
p;12;CPMenuItem.jI;20;Foundation/CPCoder.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;16;AppKit/CPImage.jI;15;AppKit/CPMenu.jI;15;AppKit/CPView.jc;19382;
var _1=objj_allocateClassPair(CPObject,"CPMenuItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_title"),new objj_ivar("_font"),new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_isEnabled"),new objj_ivar("_isHidden"),new objj_ivar("_tag"),new objj_ivar("_state"),new objj_ivar("_image"),new objj_ivar("_alternateImage"),new objj_ivar("_onStateImage"),new objj_ivar("_offStateImage"),new objj_ivar("_mixedStateImage"),new objj_ivar("_submenu"),new objj_ivar("_menu"),new objj_ivar("_keyEquivalent"),new objj_ivar("_keyEquivalentModifierMask"),new objj_ivar("_mnemonicLocation"),new objj_ivar("_isAlternate"),new objj_ivar("_indentationLevel"),new objj_ivar("_toolTip"),new objj_ivar("_representedObject"),new objj_ivar("_view"),new objj_ivar("_menuItemView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithTitle:action:keyEquivalent:"),function(_3,_4,_5,_6,_7){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_title=_5;
_action=_6;
_isEnabled=YES;
_state=CPOffState;
_keyEquivalent=_7||"";
_keyEquivalentModifierMask=CPPlatformActionKeyMask;
_mnemonicLocation=CPNotFound;
}
return _3;
}
}),new objj_method(sel_getUid("setEnabled:"),function(_8,_9,_a){
with(_8){
if(objj_msgSend(_menu,"autoenablesItems")){
return;
}
_isEnabled=_a;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_8);
}
}),new objj_method(sel_getUid("isEnabled"),function(_b,_c){
with(_b){
return _isEnabled;
}
}),new objj_method(sel_getUid("setHidden:"),function(_d,_e,_f){
with(_d){
if(_isHidden==_f){
return;
}
_isHidden=_f;
objj_msgSend(_menu,"itemChanged:",_d);
}
}),new objj_method(sel_getUid("isHidden"),function(_10,_11){
with(_10){
return _isHidden;
}
}),new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"),function(_12,_13){
with(_12){
if(_isHidden){
return YES;
}
var _14=objj_msgSend(_menu,"supermenu");
if(objj_msgSend(objj_msgSend(_14,"itemAtIndex:",objj_msgSend(_14,"indexOfItemWithSubmenu:",_menu)),"isHiddenOrHasHiddenAncestor")){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("setTarget:"),function(_15,_16,_17){
with(_15){
_target=_17;
}
}),new objj_method(sel_getUid("target"),function(_18,_19){
with(_18){
return _target;
}
}),new objj_method(sel_getUid("setAction:"),function(_1a,_1b,_1c){
with(_1a){
_action=_1c;
}
}),new objj_method(sel_getUid("action"),function(_1d,_1e){
with(_1d){
return _action;
}
}),new objj_method(sel_getUid("setTitle:"),function(_1f,_20,_21){
with(_1f){
_mnemonicLocation=CPNotFound;
if(_title==_21){
return;
}
_title=_21;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_1f);
}
}),new objj_method(sel_getUid("title"),function(_22,_23){
with(_22){
return _title;
}
}),new objj_method(sel_getUid("setFont:"),function(_24,_25,_26){
with(_24){
if(_font==_26){
return;
}
_font=_26;
objj_msgSend(_menu,"itemChanged:",_24);
objj_msgSend(_menuItemView,"setDirty");
}
}),new objj_method(sel_getUid("font"),function(_27,_28){
with(_27){
return _font;
}
}),new objj_method(sel_getUid("setTag:"),function(_29,_2a,_2b){
with(_29){
_tag=_2b;
}
}),new objj_method(sel_getUid("tag"),function(_2c,_2d){
with(_2c){
return _tag;
}
}),new objj_method(sel_getUid("setState:"),function(_2e,_2f,_30){
with(_2e){
if(_state==_30){
return;
}
_state=_30;
objj_msgSend(_menu,"itemChanged:",_2e);
objj_msgSend(_menuItemView,"setDirty");
}
}),new objj_method(sel_getUid("state"),function(_31,_32){
with(_31){
return _state;
}
}),new objj_method(sel_getUid("setImage:"),function(_33,_34,_35){
with(_33){
if(_image==_35){
return;
}
_image=_35;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_33);
}
}),new objj_method(sel_getUid("image"),function(_36,_37){
with(_36){
return _image;
}
}),new objj_method(sel_getUid("setAlternateImage:"),function(_38,_39,_3a){
with(_38){
_alternateImage=_3a;
}
}),new objj_method(sel_getUid("alternateImage"),function(_3b,_3c){
with(_3b){
return _alternateImage;
}
}),new objj_method(sel_getUid("setOnStateImage:"),function(_3d,_3e,_3f){
with(_3d){
if(_onStateImage==_3f){
return;
}
_onStateImage=_3f;
objj_msgSend(_menu,"itemChanged:",_3d);
}
}),new objj_method(sel_getUid("onStateImage"),function(_40,_41){
with(_40){
return _onStateImage;
}
}),new objj_method(sel_getUid("setOffStateImage:"),function(_42,_43,_44){
with(_42){
if(_offStateImage==_44){
return;
}
_offStateImage=_44;
objj_msgSend(_menu,"itemChanged:",_42);
}
}),new objj_method(sel_getUid("offStateImage"),function(_45,_46){
with(_45){
return _offStateImage;
}
}),new objj_method(sel_getUid("setMixedStateImage:"),function(_47,_48,_49){
with(_47){
if(_mixedStateImage==_49){
return;
}
_mixedStateImage=_49;
objj_msgSend(_menu,"itemChanged:",_47);
}
}),new objj_method(sel_getUid("mixedStateImage"),function(_4a,_4b){
with(_4a){
return _mixedStateImage;
}
}),new objj_method(sel_getUid("setSubmenu:"),function(_4c,_4d,_4e){
with(_4c){
var _4f=objj_msgSend(_submenu,"supermenu");
if(_4f==_4c){
return;
}
if(_4f){
return alert("bad");
}
objj_msgSend(_submenu,"setSupermenu:",_menu);
_submenu=_4e;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_4c);
}
}),new objj_method(sel_getUid("submenu"),function(_50,_51){
with(_50){
return _submenu;
}
}),new objj_method(sel_getUid("hasSubmenu"),function(_52,_53){
with(_52){
return _submenu?YES:NO;
}
}),new objj_method(sel_getUid("isSeparatorItem"),function(_54,_55){
with(_54){
return NO;
}
}),new objj_method(sel_getUid("setMenu:"),function(_56,_57,_58){
with(_56){
_menu=_58;
}
}),new objj_method(sel_getUid("menu"),function(_59,_5a){
with(_59){
return _menu;
}
}),new objj_method(sel_getUid("setKeyEquivalent:"),function(_5b,_5c,_5d){
with(_5b){
_keyEquivalent=_5d||"";
}
}),new objj_method(sel_getUid("keyEquivalent"),function(_5e,_5f){
with(_5e){
return _keyEquivalent;
}
}),new objj_method(sel_getUid("setKeyEquivalentModifierMask:"),function(_60,_61,_62){
with(_60){
_keyEquivalentModifierMask=_62;
}
}),new objj_method(sel_getUid("keyEquivalentModifierMask"),function(_63,_64){
with(_63){
return _keyEquivalentModifierMask;
}
}),new objj_method(sel_getUid("setMnemonicLocation:"),function(_65,_66,_67){
with(_65){
_mnemonicLocation=_67;
}
}),new objj_method(sel_getUid("mnemonicLocation"),function(_68,_69){
with(_68){
return _mnemonicLocation;
}
}),new objj_method(sel_getUid("setTitleWithMnemonicLocation:"),function(_6a,_6b,_6c){
with(_6a){
var _6d=objj_msgSend(_6c,"rangeOfString:","&").location;
if(_6d==CPNotFound){
objj_msgSend(_6a,"setTitle:",_6c);
}else{
objj_msgSend(_6a,"setTitle:",objj_msgSend(_6c,"substringToIndex:",_6d)+objj_msgSend(_6c,"substringFromIndex:",_6d+1));
objj_msgSend(_6a,"setMnemonicLocation:",_6d);
}
}
}),new objj_method(sel_getUid("mnemonic"),function(_6e,_6f){
with(_6e){
return _mnemonicLocation==CPNotFound?"":objj_msgSend(_title,"characterAtIndex:",_mnemonicLocation);
}
}),new objj_method(sel_getUid("setAlternate:"),function(_70,_71,_72){
with(_70){
_isAlternate=_72;
}
}),new objj_method(sel_getUid("isAlternate"),function(_73,_74){
with(_73){
return _isAlternate;
}
}),new objj_method(sel_getUid("setIndentationLevel:"),function(_75,_76,_77){
with(_75){
if(_77<0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"setIndentationLevel: argument must be greater than 0.");
}
_indentationLevel=MIN(15,_77);
}
}),new objj_method(sel_getUid("indentationLevel"),function(_78,_79){
with(_78){
return _indentationLevel;
}
}),new objj_method(sel_getUid("setToolTip:"),function(_7a,_7b,_7c){
with(_7a){
_toolTip=_7c;
}
}),new objj_method(sel_getUid("toolTip"),function(_7d,_7e){
with(_7d){
return _toolTip;
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(_7f,_80,_81){
with(_7f){
_representedObject=_81;
}
}),new objj_method(sel_getUid("representedObject"),function(_82,_83){
with(_82){
return _representedObject;
}
}),new objj_method(sel_getUid("setView:"),function(_84,_85,_86){
with(_84){
if(_view==_86){
return;
}
_view=_86;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_84);
}
}),new objj_method(sel_getUid("view"),function(_87,_88){
with(_87){
return _view;
}
}),new objj_method(sel_getUid("isHighlighted"),function(_89,_8a){
with(_89){
return objj_msgSend(objj_msgSend(_89,"menu"),"highlightedItem")==_89;
}
}),new objj_method(sel_getUid("_menuItemView"),function(_8b,_8c){
with(_8b){
if(!_menuItemView){
_menuItemView=objj_msgSend(objj_msgSend(_CPMenuItemView,"alloc"),"initWithFrame:forMenuItem:",CGRectMakeZero(),_8b);
}
return _menuItemView;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("separatorItem"),function(_8d,_8e){
with(_8d){
return objj_msgSend(objj_msgSend(_CPMenuItemSeparator,"alloc"),"init");
}
})]);
var _1=objj_allocateClassPair(CPMenuItem,"_CPMenuItemSeparator"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_8f,_90){
with(_8f){
return objj_msgSendSuper({receiver:_8f,super_class:objj_getClass("CPMenuItem")},"initWithTitle:action:keyEquivalent:","",nil,"");
}
}),new objj_method(sel_getUid("isSeparatorItem"),function(_91,_92){
with(_91){
return YES;
}
})]);
var _93="CPMenuItemTitleKey",_94="CPMenuItemTargetKey",_95="CPMenuItemActionKey",_96="CPMenuItemIsEnabledKey",_97="CPMenuItemIsHiddenKey",_98="CPMenuItemImageKey",_99="CPMenuItemAlternateImageKey",_9a="CPMenuItemSubmenuKey",_9b="CPMenuItemMenuKey",_9c="CPMenuItemRepresentedObjectKey";
var _1=objj_getClass("CPMenuItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPMenuItem\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_9d,_9e,_9f){
with(_9d){
_9d=objj_msgSendSuper({receiver:_9d,super_class:objj_getClass("CPObject")},"init");
if(_9d){
_title=objj_msgSend(_9f,"decodeObjectForKey:",_93);
_target=objj_msgSend(_9f,"decodeObjectForKey:",_94);
_action=objj_msgSend(_9f,"decodeObjectForKey:",_95);
_isEnabled=objj_msgSend(_9f,"decodeObjectForKey:",_96);
_isHidden=objj_msgSend(_9f,"decodeObjectForKey:",_97);
_image=objj_msgSend(_9f,"decodeObjectForKey:",_98);
_alternateImage=objj_msgSend(_9f,"decodeObjectForKey:",_99);
_submenu=objj_msgSend(_9f,"decodeObjectForKey:",_9a);
_menu=objj_msgSend(_9f,"decodeObjectForKey:",_9b);
_representedObject=objj_msgSend(_9f,"decodeObjectForKey:",_9c);
}
return _9d;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a0,_a1,_a2){
with(_a0){
objj_msgSend(_a2,"encodeObject:forKey:",_title,_93);
objj_msgSend(_a2,"encodeObject:forKey:",_target,_94);
objj_msgSend(_a2,"encodeObject:forKey:",_action,_95);
objj_msgSend(_a2,"encodeObject:forKey:",_isEnabled,_96);
objj_msgSend(_a2,"encodeObject:forKey:",_isHidden,_97);
objj_msgSend(_a2,"encodeObject:forKey:",_image,_98);
objj_msgSend(_a2,"encodeObject:forKey:",_alternateImage,_99);
objj_msgSend(_a2,"encodeObject:forKey:",_submenu,_9a);
objj_msgSend(_a2,"encodeObject:forKey:",_menu,_9b);
objj_msgSend(_a2,"encodeObject:forKey:",_representedObject,_9c);
}
})]);
var _a3=3,_a4=16,_a5=14,_a6=17;
var _a7=nil,_a8=[],_a9=[];
var _1=objj_allocateClassPair(CPView,"_CPMenuItemView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_menuItem"),new objj_ivar("_font"),new objj_ivar("_textColor"),new objj_ivar("_minSize"),new objj_ivar("_isDirty"),new objj_ivar("_showsStateColumn"),new objj_ivar("_belongsToMenuBar"),new objj_ivar("_stateView"),new objj_ivar("_imageAndTitleView"),new objj_ivar("_submenuView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:forMenuItem:"),function(_aa,_ab,_ac,_ad){
with(_aa){
_aa=objj_msgSendSuper({receiver:_aa,super_class:objj_getClass("CPView")},"initWithFrame:",_ac);
if(_aa){
_menuItem=_ad;
_showsStateColumn=YES;
_isDirty=YES;
objj_msgSend(_aa,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_aa,"synchronizeWithMenuItem");
}
return _aa;
}
}),new objj_method(sel_getUid("minSize"),function(_ae,_af){
with(_ae){
return _minSize;
}
}),new objj_method(sel_getUid("setDirty"),function(_b0,_b1){
with(_b0){
_isDirty=YES;
}
}),new objj_method(sel_getUid("synchronizeWithMenuItem"),function(_b2,_b3){
with(_b2){
if(!_isDirty){
return;
}
_isDirty=NO;
var _b4=objj_msgSend(_menuItem,"view");
if(_b4){
objj_msgSend(_imageAndTitleView,"removeFromSuperview");
_imageAndTitleView=nil;
objj_msgSend(_stateView,"removeFromSuperview");
_stateView=nil;
objj_msgSend(_submenuView,"removeFromSuperview");
_submenuView=nil;
_minSize=objj_msgSend(_b4,"frame").size;
objj_msgSend(_b2,"setFrameSize:",_minSize);
objj_msgSend(_b2,"addSubview:",_b4);
return;
}
var x=_belongsToMenuBar?0:(_a3+objj_msgSend(_menuItem,"indentationLevel")*_a6);
if(_showsStateColumn){
if(!_stateView){
_stateView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(x,(CGRectGetHeight(objj_msgSend(_b2,"frame"))-_a5)/2,_a5,_a5));
objj_msgSend(_stateView,"setAutoresizingMask:",CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(_b2,"addSubview:",_stateView);
}
var _b6=objj_msgSend(_menuItem,"state");
switch(_b6){
case CPOffState:
case CPOnState:
case CPMixedState:
objj_msgSend(_stateView,"setImage:",_a8[_b6]);
break;
default:
objj_msgSend(_stateView,"setImage:",nil);
}
x+=_a5;
}else{
objj_msgSend(_stateView,"removeFromSuperview");
_stateView=nil;
}
if(!_imageAndTitleView){
_imageAndTitleView=objj_msgSend(objj_msgSend(_CPImageAndTitleView,"alloc"),"initWithFrame:",CGRectMake(0,0,0,0));
objj_msgSend(_imageAndTitleView,"setImagePosition:",CPImageLeft);
objj_msgSend(_b2,"addSubview:",_imageAndTitleView);
}
var _b7=objj_msgSend(_menuItem,"font");
if(!_b7){
_b7=_font;
}
objj_msgSend(_imageAndTitleView,"setFont:",_b7);
objj_msgSend(_imageAndTitleView,"setImage:",objj_msgSend(_menuItem,"image"));
objj_msgSend(_imageAndTitleView,"setTitle:",objj_msgSend(_menuItem,"title"));
objj_msgSend(_imageAndTitleView,"setTextColor:",objj_msgSend(_b2,"textColor"));
objj_msgSend(_imageAndTitleView,"setFrameOrigin:",CGPointMake(x,0));
objj_msgSend(_imageAndTitleView,"sizeToFit");
var _b8=objj_msgSend(_imageAndTitleView,"frame");
x+=CGRectGetWidth(_b8);
if(objj_msgSend(_menuItem,"hasSubmenu")){
if(!_submenuView){
_submenuView=objj_msgSend(objj_msgSend(_CPMenuItemArrowView,"alloc"),"initWithFrame:",CGRectMake(0,0,10,10));
objj_msgSend(_b2,"addSubview:",_submenuView);
}
objj_msgSend(_submenuView,"setHidden:",NO);
objj_msgSend(_submenuView,"setColor:",_belongsToMenuBar?objj_msgSend(_b2,"textColor"):nil);
objj_msgSend(_submenuView,"setFrameOrigin:",CGPointMake(x,(CGRectGetHeight(_b8)-10)/2));
x+=10;
}else{
objj_msgSend(_submenuView,"setHidden:",YES);
}
_minSize=CGSizeMake(x+(_belongsToMenuBar?0:_a4),CGRectGetHeight(_b8));
objj_msgSend(_b2,"setFrameSize:",_minSize);
}
}),new objj_method(sel_getUid("calculatedLeftMargin"),function(_b9,_ba){
with(_b9){
if(_belongsToMenuBar){
return 0;
}
return _a3+(objj_msgSend(objj_msgSend(_menuItem,"menu"),"showsStateColumn")?_a5:0)+objj_msgSend(_menuItem,"indentationLevel")*_a6;
}
}),new objj_method(sel_getUid("setShowsStateColumn:"),function(_bb,_bc,_bd){
with(_bb){
_showsStateColumn=_bd;
}
}),new objj_method(sel_getUid("setBelongsToMenuBar:"),function(_be,_bf,_c0){
with(_be){
_belongsToMenuBar=_c0;
}
}),new objj_method(sel_getUid("highlight:"),function(_c1,_c2,_c3){
with(_c1){
if(_belongsToMenuBar){
objj_msgSend(_imageAndTitleView,"setImage:",_c3?objj_msgSend(_menuItem,"alternateImage"):objj_msgSend(_menuItem,"image"));
}else{
objj_msgSend(_imageAndTitleView,"setTextColor:",_c3?objj_msgSend(CPColor,"whiteColor"):objj_msgSend(_c1,"textColor"));
if(_c3){
objj_msgSend(_c1,"setBackgroundColor:",_a7);
}else{
objj_msgSend(_c1,"setBackgroundColor:",nil);
}
var _c4=objj_msgSend(_menuItem,"state");
switch(_c4){
case CPOffState:
case CPOnState:
case CPMixedState:
objj_msgSend(_stateView,"setImage:",_c3?_a9[_c4]:_a8[_c4]);
break;
default:
objj_msgSend(_stateView,"setImage:",nil);
}
}
}
}),new objj_method(sel_getUid("activate:"),function(_c5,_c6,_c7){
with(_c5){
objj_msgSend(_imageAndTitleView,"setImage:",objj_msgSend(_menuItem,"image"));
if(_c7){
objj_msgSend(_imageAndTitleView,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_submenuView,"setColor:",objj_msgSend(CPColor,"whiteColor"));
}else{
objj_msgSend(_imageAndTitleView,"setTextColor:",objj_msgSend(_c5,"textColor"));
objj_msgSend(_submenuView,"setColor:",objj_msgSend(_c5,"textColor"));
}
}
}),new objj_method(sel_getUid("eventOnSubmenu:"),function(_c8,_c9,_ca){
with(_c8){
if(!objj_msgSend(_menuItem,"hasSubmenu")){
return NO;
}
return CGRectContainsPoint(objj_msgSend(_submenuView,"frame"),objj_msgSend(_c8,"convertPoint:fromView:",objj_msgSend(_ca,"locationInWindow"),nil));
}
}),new objj_method(sel_getUid("isHidden"),function(_cb,_cc){
with(_cb){
return objj_msgSend(_menuItem,"isHidden");
}
}),new objj_method(sel_getUid("menuItem"),function(_cd,_ce){
with(_cd){
return _menuItem;
}
}),new objj_method(sel_getUid("setFont:"),function(_cf,_d0,_d1){
with(_cf){
if(_font==_d1){
return;
}
_font=_d1;
objj_msgSend(_cf,"setDirty");
}
}),new objj_method(sel_getUid("setTextColor:"),function(_d2,_d3,_d4){
with(_d2){
if(_textColor==_d4){
return;
}
_textColor=_d4;
objj_msgSend(_imageAndTitleView,"setTextColor:",objj_msgSend(_d2,"textColor"));
objj_msgSend(_submenuView,"setColor:",objj_msgSend(_d2,"textColor"));
}
}),new objj_method(sel_getUid("textColor"),function(_d5,_d6){
with(_d5){
return objj_msgSend(_menuItem,"isEnabled")?(_textColor?_textColor:objj_msgSend(CPColor,"blackColor")):objj_msgSend(CPColor,"darkGrayColor");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("initialize"),function(_d7,_d8){
with(_d7){
if(_d7!=objj_msgSend(_CPMenuItemView,"class")){
return;
}
_a7=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",81/255,83/255,109/255,1);
var _d9=objj_msgSend(CPBundle,"bundleForClass:",_d7);
_a8[CPOffState]=nil;
_a9[CPOffState]=nil;
_a8[CPOnState]=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d9,"pathForResource:","CPMenuItem/CPMenuItemOnState.png"),CGSizeMake(14,14));
_a9[CPOnState]=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_d9,"pathForResource:","CPMenuItem/CPMenuItemOnStateHighlighted.png"),CGSizeMake(14,14));
_a8[CPMixedState]=nil;
_a9[CPMixedState]=nil;
}
}),new objj_method(sel_getUid("leftMargin"),function(_da,_db){
with(_da){
return _a3+_a5;
}
})]);
var _1=objj_allocateClassPair(CPView,"_CPMenuItemArrowView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_color")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("setColor:"),function(_dc,_dd,_de){
with(_dc){
if(_color==_de){
return;
}
_color=_de;
objj_msgSend(_dc,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("drawRect:"),function(_df,_e0,_e1){
with(_df){
var _e2=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextBeginPath(_e2);
CGContextMoveToPoint(_e2,1,4);
CGContextAddLineToPoint(_e2,9,4);
CGContextAddLineToPoint(_e2,5,8);
CGContextAddLineToPoint(_e2,1,4);
CGContextClosePath(_e2);
CGContextSetFillColor(_e2,_color);
CGContextFillPath(_e2);
}
})]);
p;9;CPPanel.ji;10;CPWindow.jc;1152;
CPOKButton=1;
CPCancelButton=0;
var _1=objj_allocateClassPair(CPWindow,"CPPanel"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_becomesKeyOnlyIfNeeded"),new objj_ivar("_worksWhenModal")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("isFloatingPanel"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"level")==CPFloatingWindowLevel;
}
}),new objj_method(sel_getUid("setFloatingPanel:"),function(_5,_6,_7){
with(_5){
objj_msgSend(_5,"setLevel:",_7?CPFloatingWindowLevel:CPNormalWindowLevel);
}
}),new objj_method(sel_getUid("becomesKeyOnlyIfNeeded"),function(_8,_9){
with(_8){
return _becomesKeyOnlyIfNeeded;
}
}),new objj_method(sel_getUid("setBecomesKeyOnlyIfNeeded:"),function(_a,_b,_c){
with(_a){
_becomesKeyOnlyIfNeeded=_c;
}
}),new objj_method(sel_getUid("worksWhenModal"),function(_d,_e){
with(_d){
return _worksWhenModal;
}
}),new objj_method(sel_getUid("setWorksWhenModal:"),function(_f,_10,_11){
with(_f){
_worksWhenModal=_11;
}
}),new objj_method(sel_getUid("canBecomeMainWindow"),function(_12,_13){
with(_12){
return NO;
}
})]);
p;14;CPPasteboard.jI;21;Foundation/CPObject.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;40;Foundation/CPPropertyListSerialization.jc;4493;
CPGeneralPboard="CPGeneralPboard";
CPFontPboard="CPFontPboard";
CPRulerPboard="CPRulerPboard";
CPFindPboard="CPFindPboard";
CPDragPboard="CPDragPboard";
CPColorPboardType="CPColorPboardType";
CPFilenamesPboardType="CPFilenamesPboardType";
CPFontPboardType="CPFontPboardType";
CPHTMLPboardType="CPHTMLPboardType";
CPStringPboardType="CPStringPboardType";
CPURLPboardType="CPURLPboardType";
CPImagePboardType="CPImagePboardType";
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPPasteboard"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_types"),new objj_ivar("_owners"),new objj_ivar("_provided"),new objj_ivar("_changeCount"),new objj_ivar("_stateUID")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("_initWithName:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_name=_6;
_types=[];
_owners=objj_msgSend(CPDictionary,"dictionary");
_provided=objj_msgSend(CPDictionary,"dictionary");
_changeCount=0;
}
return _4;
}
}),new objj_method(sel_getUid("addTypes:owner:"),function(_7,_8,_9,_a){
with(_7){
var i=0,_c=_9.length;
for(;i<_c;++i){
var _d=_9[i];
if(!objj_msgSend(_owners,"objectForKey:",_d)){
objj_msgSend(_types,"addObject:",_d);
objj_msgSend(_provided,"removeObjectForKey:",_d);
}
objj_msgSend(_owners,"setObject:forKey:",_a,_d);
}
return ++_changeCount;
}
}),new objj_method(sel_getUid("declareTypes:owner:"),function(_e,_f,_10,_11){
with(_e){
objj_msgSend(_types,"setArray:",_10);
_owners=objj_msgSend(CPDictionary,"dictionary");
_provided=objj_msgSend(CPDictionary,"dictionary");
var _12=_types.length;
while(_12--){
objj_msgSend(_owners,"setObject:forKey:",_11,_types[_12]);
}
return ++_changeCount;
}
}),new objj_method(sel_getUid("setData:forType:"),function(_13,_14,_15,_16){
with(_13){
objj_msgSend(_provided,"setObject:forKey:",_15,_16);
return YES;
}
}),new objj_method(sel_getUid("setPropertyList:forType:"),function(_17,_18,_19,_1a){
with(_17){
return objj_msgSend(_17,"setData:forType:",objj_msgSend(CPPropertyListSerialization,"dataFromPropertyList:format:errorDescription:",_19,CPPropertyListXMLFormat_v1_0,nil),_1a);
}
}),new objj_method(sel_getUid("setString:forType:"),function(_1b,_1c,_1d,_1e){
with(_1b){
return objj_msgSend(_1b,"setPropertyList:forType:",_1d,_1e);
}
}),new objj_method(sel_getUid("availableTypeFromArray:"),function(_1f,_20,_21){
with(_1f){
return objj_msgSend(_types,"firstObjectCommonWithArray:",_21);
}
}),new objj_method(sel_getUid("types"),function(_22,_23){
with(_22){
return _types;
}
}),new objj_method(sel_getUid("changeCount"),function(_24,_25){
with(_24){
return _changeCount;
}
}),new objj_method(sel_getUid("dataForType:"),function(_26,_27,_28){
with(_26){
var _29=objj_msgSend(_provided,"objectForKey:",_28);
if(_29){
return _29;
}
var _2a=objj_msgSend(_owners,"objectForKey:",_28);
if(_2a){
objj_msgSend(_2a,"pasteboard:provideDataForType:",_26,_28);
++_changeCount;
return objj_msgSend(_provided,"objectForKey:",_28);
}
return nil;
}
}),new objj_method(sel_getUid("propertyListForType:"),function(_2b,_2c,_2d){
with(_2b){
var _2e=objj_msgSend(_2b,"dataForType:",_2d);
if(_2e){
return objj_msgSend(CPPropertyListSerialization,"propertyListFromData:format:errorDescription:",_2e,CPPropertyListXMLFormat_v1_0,nil);
}
return nil;
}
}),new objj_method(sel_getUid("stringForType:"),function(_2f,_30,_31){
with(_2f){
return objj_msgSend(_2f,"propertyListForType:",_31);
}
}),new objj_method(sel_getUid("_generateStateUID"),function(_32,_33){
with(_32){
var _34=32;
_stateUID="";
while(_34--){
_stateUID+=FLOOR(RAND()*16).toString(16).toUpperCase();
}
return _stateUID;
}
}),new objj_method(sel_getUid("_stateUID"),function(_35,_36){
with(_35){
return _stateUID;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("initialize"),function(_37,_38){
with(_37){
if(_37!=objj_msgSend(CPPasteboard,"class")){
return;
}
objj_msgSend(_37,"setVersion:",1);
_1=objj_msgSend(CPDictionary,"dictionary");
}
}),new objj_method(sel_getUid("generalPasteboard"),function(_39,_3a){
with(_39){
return objj_msgSend(CPPasteboard,"pasteboardWithName:",CPGeneralPboard);
}
}),new objj_method(sel_getUid("pasteboardWithName:"),function(_3b,_3c,_3d){
with(_3b){
var _3e=objj_msgSend(_1,"objectForKey:",_3d);
if(_3e){
return _3e;
}
_3e=objj_msgSend(objj_msgSend(CPPasteboard,"alloc"),"_initWithName:",_3d);
objj_msgSend(_1,"setObject:forKey:",_3e,_3d);
return _3e;
}
})]);
p;15;CPPopUpButton.ji;10;CPButton.ji;12;CPGeometry.ji;8;CPMenu.ji;12;CPMenuItem.jc;13229;
var _1=7;
var _2=nil;
var _3=objj_allocateClassPair(CPButton,"CPPopUpButton"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_pullsDown"),new objj_ivar("_selectedIndex"),new objj_ivar("_preferredEdge"),new objj_ivar("_arrowsView"),new objj_ivar("_menu")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initWithFrame:pullsDown:"),function(_5,_6,_7,_8){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPButton")},"initWithFrame:",_7);
if(_5){
_pullsDown=_8;
_selectedIndex=CPNotFound;
_preferredEdge=CPMaxYEdge;
objj_msgSend(_5,"setBezelStyle:",CPTexturedRoundedBezelStyle);
objj_msgSend(_5,"setImagePosition:",CPImageLeft);
objj_msgSend(_5,"setAlignment:",CPLeftTextAlignment);
objj_msgSend(_5,"setMenu:",objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:",""));
}
return _5;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_9,_a,_b){
with(_9){
return objj_msgSend(_9,"initWithFrame:pullsDown:",_b,NO);
}
}),new objj_method(sel_getUid("setBordered:"),function(_c,_d,_e){
with(_c){
if(_e){
var _f=objj_msgSend(_c,"bounds");
_arrowsView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(CGRectGetWidth(_f)-10,(CGRectGetHeight(_f)-8)/2,5,8));
if(!_2){
_2=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPPopUpButton,"class")),"pathForResource:","CPPopUpButton/CPPopUpButtonArrows.png"),CGSizeMake(5,8));
}
objj_msgSend(_arrowsView,"setImage:",_2);
objj_msgSend(_arrowsView,"setAutoresizingMask:",CPViewMaxXMargin|CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(_c,"addSubview:",_arrowsView);
}else{
objj_msgSend(_arrowsView,"removeFromSuperview");
_arrowsView=nil;
}
objj_msgSendSuper({receiver:_c,super_class:objj_getClass("CPButton")},"setBordered:",_e);
}
}),new objj_method(sel_getUid("setPullsDown:"),function(_10,_11,_12){
with(_10){
if(_pullsDown==_12){
return;
}
_pullsDown=_12;
var _13=objj_msgSend(_menu,"itemArray");
if(_13.length<=0){
return;
}
objj_msgSend(_13[0],"setHidden:",_pullsDown);
objj_msgSend(_10,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("pullsDown"),function(_14,_15){
with(_14){
return _pullsDown;
}
}),new objj_method(sel_getUid("addItemWithTitle:"),function(_16,_17,_18){
with(_16){
objj_msgSend(_menu,"addItemWithTitle:action:keyEquivalent:",_18,NULL,NULL);
}
}),new objj_method(sel_getUid("addItemsWithTitles:"),function(_19,_1a,_1b){
with(_19){
var _1c=0,_1d=objj_msgSend(_1b,"count");
for(;_1c<_1d;++_1c){
objj_msgSend(_19,"addItemWithTitle:",_1b[_1c]);
}
}
}),new objj_method(sel_getUid("insertItemWithTitle:atIndex:"),function(_1e,_1f,_20,_21){
with(_1e){
var _22=objj_msgSend(_1e,"itemArray"),_23=objj_msgSend(_22,"count");
while(_23--){
if(objj_msgSend(_22[_23],"title")==_20){
objj_msgSend(_1e,"removeItemAtIndex:",_23);
}
}
objj_msgSend(_menu,"insertItemWithTitle:action:keyEquivalent:atIndex:",_20,NULL,NULL,_21);
}
}),new objj_method(sel_getUid("removeAllItems"),function(_24,_25){
with(_24){
var _26=objj_msgSend(_menu,"numberOfItems");
while(_26--){
objj_msgSend(_menu,"removeItemAtIndex:",0);
}
}
}),new objj_method(sel_getUid("removeItemWithTitle:"),function(_27,_28,_29){
with(_27){
objj_msgSend(_27,"removeItemAtIndex:",objj_msgSend(_27,"indexOfItemWithTitle:",_29));
objj_msgSend(_27,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("removeItemAtIndex:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_menu,"removeItemAtIndex:",_2c);
objj_msgSend(_2a,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("selectedItem"),function(_2d,_2e){
with(_2d){
if(_selectedIndex<0){
return nil;
}
return objj_msgSend(_menu,"itemAtIndex:",_selectedIndex);
}
}),new objj_method(sel_getUid("titleOfSelectedItem"),function(_2f,_30){
with(_2f){
return objj_msgSend(objj_msgSend(_2f,"selectedItem"),"title");
}
}),new objj_method(sel_getUid("indexOfSelectedItem"),function(_31,_32){
with(_31){
return _selectedIndex;
}
}),new objj_method(sel_getUid("objectValue"),function(_33,_34){
with(_33){
return _selectedIndex;
}
}),new objj_method(sel_getUid("selectItem:"),function(_35,_36,_37){
with(_35){
objj_msgSend(_35,"selectItemAtIndex:",objj_msgSend(_35,"indexOfItem:",_37));
}
}),new objj_method(sel_getUid("selectItemAtIndex:"),function(_38,_39,_3a){
with(_38){
if(_selectedIndex==_3a){
return;
}
if(_selectedIndex>=0&&!_pullsDown){
objj_msgSend(objj_msgSend(_38,"selectedItem"),"setState:",CPOffState);
}
_selectedIndex=_3a;
if(_selectedIndex>=0&&!_pullsDown){
objj_msgSend(objj_msgSend(_38,"selectedItem"),"setState:",CPOnState);
}
objj_msgSend(_38,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("selectItemWithTag:"),function(_3b,_3c,_3d){
with(_3b){
objj_msgSend(_3b,"selectItemAtIndex:",objj_msgSend(_3b,"indexOfItemWithTag:",_3d));
}
}),new objj_method(sel_getUid("selectItemWithTitle:"),function(_3e,_3f,_40){
with(_3e){
objj_msgSend(_3e,"selectItemAtIndex:",objj_msgSend(_3e,"indexOfItemWithTitle:",_40));
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_41,_42,_43){
with(_41){
objj_msgSend(_41,"selectItemAtIndex:",objj_msgSend(_43,"intValue"));
}
}),new objj_method(sel_getUid("menu"),function(_44,_45){
with(_44){
return _menu;
}
}),new objj_method(sel_getUid("setMenu:"),function(_46,_47,_48){
with(_46){
if(_menu==_48){
return;
}
var _49=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_menu){
objj_msgSend(_49,"removeObserver:name:object:",_46,CPMenuDidAddItemNotification,_menu);
objj_msgSend(_49,"removeObserver:name:object:",_46,CPMenuDidChangeItemNotification,_menu);
objj_msgSend(_49,"removeObserver:name:object:",_46,CPMenuDidRemoveItemNotification,_menu);
}
_menu=_48;
if(_menu){
objj_msgSend(_49,"addObserver:selector:name:object:",_46,sel_getUid("menuDidAddItem:"),CPMenuDidAddItemNotification,_menu);
objj_msgSend(_49,"addObserver:selector:name:object:",_46,sel_getUid("menuDidChangeItem:"),CPMenuDidChangeItemNotification,_menu);
objj_msgSend(_49,"addObserver:selector:name:object:",_46,sel_getUid("menuDidRemoveItem:"),CPMenuDidRemoveItemNotification,_menu);
}
objj_msgSend(_46,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("numberOfItems"),function(_4a,_4b){
with(_4a){
return objj_msgSend(_menu,"numberOfItems");
}
}),new objj_method(sel_getUid("itemArray"),function(_4c,_4d){
with(_4c){
return objj_msgSend(_menu,"itemArray");
}
}),new objj_method(sel_getUid("itemAtIndex:"),function(_4e,_4f,_50){
with(_4e){
return objj_msgSend(_menu,"itemAtIndex:",_50);
}
}),new objj_method(sel_getUid("itemTitleAtIndex:"),function(_51,_52,_53){
with(_51){
return objj_msgSend(objj_msgSend(_menu,"itemAtIndex:",_53),"title");
}
}),new objj_method(sel_getUid("itemTitles"),function(_54,_55){
with(_54){
var _56=[],_57=objj_msgSend(_54,"itemArray"),_58=0,_59=objj_msgSend(_57,"count");
for(;_58<_59;++_58){
_57.push(objj_msgSend(_57[_58],"title"));
}
}
}),new objj_method(sel_getUid("itemWithTitle:"),function(_5a,_5b,_5c){
with(_5a){
return objj_msgSend(_menu,"itemAtIndex:",objj_msgSend(_menu,"indexOfItemWithTitle:",_5c));
}
}),new objj_method(sel_getUid("lastItem"),function(_5d,_5e){
with(_5d){
return objj_msgSend(objj_msgSend(_menu,"itemArray"),"lastObject");
}
}),new objj_method(sel_getUid("indexOfItem:"),function(_5f,_60,_61){
with(_5f){
return objj_msgSend(_menu,"indexOfItem:",_61);
}
}),new objj_method(sel_getUid("indexOfItemWithTag:"),function(_62,_63,_64){
with(_62){
return objj_msgSend(_menu,"indexOfItemWithTag:",aMenuItem);
}
}),new objj_method(sel_getUid("indexOfItemWithTitle:"),function(_65,_66,_67){
with(_65){
return objj_msgSend(_menu,"indexOfItemWithTitle:",_67);
}
}),new objj_method(sel_getUid("indexOfItemWithRepresentedObject:"),function(_68,_69,_6a){
with(_68){
return objj_msgSend(_menu,"indexOfItemWithRepresentedObejct:",_6a);
}
}),new objj_method(sel_getUid("indexOfItemWithTarget:action:"),function(_6b,_6c,_6d,_6e){
with(_6b){
return objj_msgSend(_menu,"indexOfItemWithTarget:action:",_6d,_6e);
}
}),new objj_method(sel_getUid("preferredEdge"),function(_6f,_70){
with(_6f){
return _preferredEdge;
}
}),new objj_method(sel_getUid("setPreferredEdge:"),function(_71,_72,_73){
with(_71){
_preferredEdge=_73;
}
}),new objj_method(sel_getUid("setTitle:"),function(_74,_75,_76){
with(_74){
if(objj_msgSend(_74,"title")==_76){
return;
}
if(_pullsDown){
objj_msgSend(_items[0],"setTitle:",_76);
objj_msgSend(_74,"synchronizeTitleAndSelectedItem");
}else{
var _77=objj_msgSend(_74,"indexOfItemWithTitle:",_76);
if(_77<0){
objj_msgSend(_74,"addItemWithTitle:",_76);
_77=objj_msgSend(_74,"numberOfItems")-1;
}
objj_msgSend(_74,"selectItemAtIndex:",_77);
}
}
}),new objj_method(sel_getUid("setImage:"),function(_78,_79,_7a){
with(_78){
}
}),new objj_method(sel_getUid("synchronizeTitleAndSelectedItem"),function(_7b,_7c){
with(_7b){
var _7d=nil;
if(_pullsDown){
var _7e=objj_msgSend(_menu,"itemArray");
if(_7e.length>0){
_7d=_7e[0];
}
}else{
_7d=objj_msgSend(_7b,"selectedItem");
}
objj_msgSendSuper({receiver:_7b,super_class:objj_getClass("CPButton")},"setImage:",objj_msgSend(_7d,"image"));
objj_msgSendSuper({receiver:_7b,super_class:objj_getClass("CPButton")},"setTitle:",objj_msgSend(_7d,"title"));
}
}),new objj_method(sel_getUid("menuDidAddItem:"),function(_7f,_80,_81){
with(_7f){
var _82=objj_msgSend(objj_msgSend(_81,"userInfo"),"objectForKey:","CPMenuItemIndex");
if(_selectedIndex<0){
objj_msgSend(_7f,"selectItemAtIndex:",0);
}else{
if(_82==_selectedIndex){
objj_msgSend(_7f,"synchronizeTitleAndSelectedItem");
}else{
if(_82<_selectedIndex){
++_selectedIndex;
}
}
}
if(_82==0&&_pullsDown){
var _83=objj_msgSend(_menu,"itemArray");
objj_msgSend(_83[0],"setHidden:",YES);
if(_83.length>0){
objj_msgSend(_83[1],"setHidden:",NO);
}
}
}
}),new objj_method(sel_getUid("menuDidChangeItem:"),function(_84,_85,_86){
with(_84){
var _87=objj_msgSend(objj_msgSend(_86,"userInfo"),"objectForKey:","CPMenuItemIndex");
if(_pullsDown&&_87!=0){
return;
}
if(!_pullsDown&&_87!=_selectedIndex){
return;
}
objj_msgSend(_84,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("menuDidRemoveItem:"),function(_88,_89,_8a){
with(_88){
var _8b=objj_msgSend(_88,"numberOfItems");
if(_8b<=_selectedIndex){
objj_msgSend(_88,"selectItemAtIndex:",_8b-1);
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_8c,_8d,_8e){
with(_8c){
if(!objj_msgSend(_8c,"isEnabled")){
return;
}
objj_msgSend(_8c,"highlight:",YES);
var _8f=objj_msgSend(_8c,"window"),_90=objj_msgSend(_CPMenuWindow,"menuWindowWithMenu:font:",objj_msgSend(_8c,"menu"),objj_msgSend(_8c,"font"));
objj_msgSend(_90,"setDelegate:",_8c);
objj_msgSend(_90,"setBackgroundStyle:",_CPMenuWindowPopUpBackgroundStyle);
var _91=objj_msgSend(_8f,"convertBaseToBridge:",objj_msgSend(_8c,"convertPoint:toView:",CGPointMakeZero(),nil));
if(_pullsDown){
_91.y+=CGRectGetHeight(objj_msgSend(_8c,"frame"));
}else{
var _92=objj_msgSend(_90,"rectForItemAtIndex:",_selectedIndex);
_91.x-=CGRectGetMinX(_92)+objj_msgSend(_CPMenuItemView,"leftMargin");
_91.y-=CGRectGetMinY(_92);
}
objj_msgSend(_90,"setFrameOrigin:",_91);
var _93=CGRectGetMaxX(objj_msgSend(_90,"frame")),_94=CGRectGetMaxX(objj_msgSend(_8c,"convertRect:toView:",objj_msgSend(_8c,"bounds"),nil));
if(_93<_94){
objj_msgSend(_90,"setMinWidth:",CGRectGetWidth(objj_msgSend(_90,"frame"))+_94-_93-_1);
}
objj_msgSend(_90,"orderFront:",_8c);
objj_msgSend(_90,"beginTrackingWithEvent:sessionDelegate:didEndSelector:",_8e,_8c,sel_getUid("menuWindowDidFinishTracking:highlightedItem:"));
}
}),new objj_method(sel_getUid("menuWindowDidFinishTracking:highlightedItem:"),function(_95,_96,_97,_98){
with(_95){
objj_msgSend(_CPMenuWindow,"poolMenuWindow:",_97);
objj_msgSend(_95,"highlight:",NO);
var _99=objj_msgSend(_menu,"indexOfItem:",_98);
if(_99==CPNotFound){
return;
}
objj_msgSend(_95,"selectItemAtIndex:",_99);
var _9a=objj_msgSend(_95,"selectedItem"),_9b=nil,_9c=objj_msgSend(_9a,"action");
if(!_9c){
_9b=objj_msgSend(_95,"target");
_9c=objj_msgSend(_95,"action");
}else{
_9b=objj_msgSend(_9a,"target");
}
objj_msgSend(_95,"sendAction:to:",_9c,_9b);
}
})]);
var _9d="CPPopUpButtonMenuKey",_9e="CPPopUpButtonSelectedIndexKey",_9f="CPPopUpButtonPullsDownKey";
var _3=objj_getClass("CPPopUpButton");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPPopUpButton\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_a0,_a1,_a2){
with(_a0){
_a0=objj_msgSendSuper({receiver:_a0,super_class:objj_getClass("CPButton")},"initWithCoder:",_a2);
if(_a0){
objj_msgSend(_a0,"setMenu:",objj_msgSend(_a2,"decodeObjectForKey:",_9d));
objj_msgSend(_a0,"selectItemAtIndex:",objj_msgSend(_a2,"decodeObjectForKey:",_9e));
objj_msgSend(_a0,"setPullsDown:",objj_msgSend(_a2,"decodeBoolForKey:",_9f));
}
return _a0;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a3,_a4,_a5){
with(_a3){
objj_msgSendSuper({receiver:_a3,super_class:objj_getClass("CPButton")},"encodeWithCoder:",_a5);
objj_msgSend(_a5,"encodeObject:forKey:",_menu,_9d);
objj_msgSend(_a5,"encodeInt:forKey:",_selectedIndex,_9e);
objj_msgSend(_a5,"encodeBool:forKey:",_pullsDown,_9f);
}
})]);
p;21;CPProgressIndicator.jI;19;AppKit/CGGeometry.jI;20;AppKit/CPImageView.jI;15;AppKit/CPView.jc;8511;
CPProgressIndicatorBarStyle=0;
CPProgressIndicatorSpinningStyle=1;
CPProgressIndicatorHUDBarStyle=2;
var _1=nil,_2=nil,_3=nil,_4=nil;
var _5=objj_allocateClassPair(CPView,"CPProgressIndicator"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_minValue"),new objj_ivar("_maxValue"),new objj_ivar("_doubleValue"),new objj_ivar("_controlSize"),new objj_ivar("_isIndeterminate"),new objj_ivar("_style"),new objj_ivar("_isAnimating"),new objj_ivar("_isDisplayedWhenStoppedSet"),new objj_ivar("_isDisplayedWhenStopped"),new objj_ivar("_barView")]);
objj_registerClassPair(_5);
objj_addClassForBundle(_5,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_5,[new objj_method(sel_getUid("initWithFrame:"),function(_7,_8,_9){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPView")},"initWithFrame:",_9);
if(_7){
_minValue=0;
_maxValue=100;
_doubleValue=0;
_style=CPProgressIndicatorBarStyle;
_isDisplayedWhenStoppedSet=NO;
_controlSize=CPRegularControlSize;
objj_msgSend(_7,"updateBackgroundColor");
objj_msgSend(_7,"drawBar");
}
return _7;
}
}),new objj_method(sel_getUid("setUsesThreadedAnimation:"),function(_a,_b,_c){
with(_a){
}
}),new objj_method(sel_getUid("startAnimation:"),function(_d,_e,_f){
with(_d){
_isAnimating=YES;
objj_msgSend(_d,"_hideOrDisplay");
}
}),new objj_method(sel_getUid("stopAnimation:"),function(_10,_11,_12){
with(_10){
_isAnimating=NO;
objj_msgSend(_10,"_hideOrDisplay");
}
}),new objj_method(sel_getUid("usesThreadedAnimation"),function(_13,_14){
with(_13){
return NO;
}
}),new objj_method(sel_getUid("incrementBy:"),function(_15,_16,_17){
with(_15){
objj_msgSend(_15,"setDoubleValue:",_doubleValue+_17);
}
}),new objj_method(sel_getUid("setDoubleValue:"),function(_18,_19,_1a){
with(_18){
_doubleValue=MIN(MAX(_1a,_minValue),_maxValue);
objj_msgSend(_18,"drawBar");
}
}),new objj_method(sel_getUid("doubleValue"),function(_1b,_1c){
with(_1b){
return _doubleValue;
}
}),new objj_method(sel_getUid("setMinValue:"),function(_1d,_1e,_1f){
with(_1d){
_minValue=_1f;
}
}),new objj_method(sel_getUid("minValue"),function(_20,_21){
with(_20){
return _minValue;
}
}),new objj_method(sel_getUid("setMaxValue:"),function(_22,_23,_24){
with(_22){
_maxValue=_24;
}
}),new objj_method(sel_getUid("maxValue"),function(_25,_26){
with(_25){
return _maxValue;
}
}),new objj_method(sel_getUid("setControlSize:"),function(_27,_28,_29){
with(_27){
if(_controlSize==_29){
return;
}
_controlSize=_29;
objj_msgSend(_27,"updateBackgroundColor");
}
}),new objj_method(sel_getUid("controlSize"),function(_2a,_2b){
with(_2a){
return _controlSize;
}
}),new objj_method(sel_getUid("setControlTint:"),function(_2c,_2d,_2e){
with(_2c){
}
}),new objj_method(sel_getUid("controlTint"),function(_2f,_30){
with(_2f){
return 0;
}
}),new objj_method(sel_getUid("setBezeled:"),function(_31,_32,_33){
with(_31){
}
}),new objj_method(sel_getUid("isBezeled"),function(_34,_35){
with(_34){
return YES;
}
}),new objj_method(sel_getUid("setIndeterminate:"),function(_36,_37,_38){
with(_36){
if(_isIndeterminate==_38){
return;
}
_isIndeterminate=_38;
objj_msgSend(_36,"updateBackgroundColor");
}
}),new objj_method(sel_getUid("isIndeterminate"),function(_39,_3a){
with(_39){
return _isIndeterminate;
}
}),new objj_method(sel_getUid("setStyle:"),function(_3b,_3c,_3d){
with(_3b){
if(_style==_3d){
return;
}
_style=_3d;
objj_msgSend(_3b,"updateBackgroundColor");
}
}),new objj_method(sel_getUid("sizeToFit"),function(_3e,_3f){
with(_3e){
if(_style==CPProgressIndicatorSpinningStyle){
objj_msgSend(_3e,"setFrameSize:",objj_msgSend(objj_msgSend(_1[_controlSize],"patternImage"),"size"));
}else{
objj_msgSend(_3e,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_3e,"frame")),_4[_2+"BezelBorder"+_3[CPProgressIndicatorBarStyle]+_CPControlIdentifierForControlSize(_controlSize)][0].height));
}
}
}),new objj_method(sel_getUid("setDisplayedWhenStopped:"),function(_40,_41,_42){
with(_40){
if(_isDisplayedWhenStoppedSet&&_isDisplayedWhenStopped==_42){
return;
}
_isDisplayedWhenStoppedSet=YES;
_isDisplayedWhenStopped=_42;
objj_msgSend(_40,"_hideOrDisplay");
}
}),new objj_method(sel_getUid("isDisplayedWhenStopped"),function(_43,_44){
with(_43){
if(_isDisplayedWhenStoppedSet){
return _isDisplayedWhenStopped;
}
if(_style==CPProgressIndicatorBarStyle||_style==CPProgressIndicatorHUDBarStyle){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("_hideOrDisplay"),function(_45,_46){
with(_45){
objj_msgSend(_45,"setHidden:",!_isAnimating&&!objj_msgSend(_45,"isDisplayedWhenStopped"));
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_47,_48,_49){
with(_47){
objj_msgSendSuper({receiver:_47,super_class:objj_getClass("CPView")},"setFrameSize:",_49);
objj_msgSend(_47,"drawBar");
}
}),new objj_method(sel_getUid("drawBar"),function(_4a,_4b){
with(_4a){
if(_style==CPProgressIndicatorSpinningStyle){
return;
}
if(!_barView){
_barView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(2,2,0,9));
objj_msgSend(_barView,"setBackgroundColor:",objj_msgSend(CPColor,"redColor"));
objj_msgSend(_4a,"addSubview:",_barView);
}
objj_msgSend(_barView,"setBackgroundColor:",_CPControlColorWithPatternImage(_4,_2,"Bar",_3[_style],_CPControlIdentifierForControlSize(_controlSize)));
objj_msgSend(_barView,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_4a,"bounds"))*(_doubleValue-_minValue)/(_maxValue-_minValue)-4,9));
}
}),new objj_method(sel_getUid("updateBackgroundColor"),function(_4c,_4d){
with(_4c){
if(YES){
if(_style==CPProgressIndicatorSpinningStyle){
objj_msgSend(_barView,"removeFromSuperview");
_barView=nil;
objj_msgSend(_4c,"setBackgroundColor:",_1[_controlSize]);
}else{
objj_msgSend(_4c,"setBackgroundColor:",_CPControlThreePartImagePattern(NO,_4,_2,"BezelBorder",_3[_style],_CPControlIdentifierForControlSize(_controlSize)));
objj_msgSend(_4c,"drawBar");
}
}else{
objj_msgSend(_4c,"setBackgroundColor:",nil);
}
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("initialize"),function(_4e,_4f){
with(_4e){
if(_4e!=objj_msgSend(CPProgressIndicator,"class")){
return;
}
var _50=objj_msgSend(CPBundle,"bundleForClass:",_4e);
_1=[];
_1[CPMiniControlSize]=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_50,"pathForResource:","CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"),CGSizeMake(64,64)));
_1[CPSmallControlSize]=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_50,"pathForResource:","CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"),CGSizeMake(64,64)));
_1[CPRegularControlSize]=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_50,"pathForResource:","CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"),CGSizeMake(64,64)));
CPProgressIndicatorBezelBorderViewPool=[];
var _51=CPProgressIndicatorBarStyle,end=CPProgressIndicatorHUDBarStyle;
for(;_51<=end;++_51){
CPProgressIndicatorBezelBorderViewPool[_51]=[];
CPProgressIndicatorBezelBorderViewPool[_51][CPMiniControlSize]=[];
CPProgressIndicatorBezelBorderViewPool[_51][CPSmallControlSize]=[];
CPProgressIndicatorBezelBorderViewPool[_51][CPRegularControlSize]=[];
}
_2=objj_msgSend(_4e,"className");
_3=[];
_3[CPProgressIndicatorBarStyle]="Bar";
_3[CPProgressIndicatorSpinningStyle]="Spinny";
_3[CPProgressIndicatorHUDBarStyle]="HUDBar";
var _53=_CPControlIdentifierForControlSize(CPRegularControlSize),_54=_CPControlIdentifierForControlSize(CPSmallControlSize),_55=_CPControlIdentifierForControlSize(CPMiniControlSize);
_4=[];
var _56=_2+"BezelBorder"+_3[CPProgressIndicatorBarStyle];
_4[_56+_53]=[{width:3,height:15},{width:1,height:15},{width:3,height:15}];
_4[_56+_54]=[{width:3,height:15},{width:1,height:15},{width:3,height:15}];
_4[_56+_55]=[{width:3,height:15},{width:1,height:15},{width:3,height:15}];
_56=_2+"Bar"+_3[CPProgressIndicatorBarStyle];
_4[_56+_53]={width:1,height:9};
_4[_56+_54]={width:1,height:9};
_4[_56+_55]={width:1,height:9};
_56=_2+"BezelBorder"+_3[CPProgressIndicatorHUDBarStyle];
_4[_56+_53]=[{width:3,height:15},{width:1,height:15},{width:3,height:15}];
_4[_56+_54]=[{width:3,height:15},{width:1,height:15},{width:3,height:15}];
_4[_56+_55]=[{width:3,height:15},{width:1,height:15},{width:3,height:15}];
_56=_2+"Bar"+_3[CPProgressIndicatorHUDBarStyle];
_4[_56+_53]={width:1,height:9};
_4[_56+_54]={width:1,height:9};
_4[_56+_55]={width:1,height:9};
}
})]);
p;13;CPResponder.jI;21;Foundation/CPObject.jc;4785;
CPDeleteKeyCode=8;
CPUpArrowKeyCode=63232;
CPDownArrowKeyCode=63233;
CPLeftArrowKeyCode=63234;
CPRightArrowKeyCode=63235;
var _1=objj_allocateClassPair(CPObject,"CPResponder"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_menu"),new objj_ivar("_nextResponder")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("acceptsFirstResponder"),function(_3,_4){
with(_3){
return NO;
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_5,_6){
with(_5){
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_7,_8){
with(_7){
return YES;
}
}),new objj_method(sel_getUid("setNextResponder:"),function(_9,_a,_b){
with(_9){
_nextResponder=_b;
}
}),new objj_method(sel_getUid("nextResponder"),function(_c,_d){
with(_c){
return _nextResponder;
}
}),new objj_method(sel_getUid("interpretKeyEvents:"),function(_e,_f,_10){
with(_e){
var _11,_12=0;
while(_11=_10[_12++]){
switch(objj_msgSend(_11,"keyCode")){
case CPLeftArrowKeyCode:
objj_msgSend(_e,"moveBackward:",_e);
break;
case CPRightArrowKeyCode:
objj_msgSend(_e,"moveForward:",_e);
break;
case CPUpArrowKeyCode:
objj_msgSend(_e,"moveUp:",_e);
break;
case CPDownArrowKeyCode:
objj_msgSend(_e,"moveDown:",_e);
break;
case CPDeleteKeyCode:
objj_msgSend(_e,"deleteBackward:",_e);
break;
case 3:
case 13:
objj_msgSend(_e,"insertLineBreak:",_e);
break;
default:
objj_msgSend(_e,"insertText:",objj_msgSend(_11,"characters"));
}
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_13,_14,_15){
with(_13){
objj_msgSend(_nextResponder,"performSelector:withObject:",_14,_15);
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_16,_17,_18){
with(_16){
objj_msgSend(_nextResponder,"performSelector:withObject:",_17,_18);
}
}),new objj_method(sel_getUid("mouseUp:"),function(_19,_1a,_1b){
with(_19){
objj_msgSend(_nextResponder,"performSelector:withObject:",_1a,_1b);
}
}),new objj_method(sel_getUid("mouseMoved:"),function(_1c,_1d,_1e){
with(_1c){
objj_msgSend(_nextResponder,"performSelector:withObject:",_1d,_1e);
}
}),new objj_method(sel_getUid("mouseEntered:"),function(_1f,_20,_21){
with(_1f){
objj_msgSend(_nextResponder,"performSelector:withObject:",_20,_21);
}
}),new objj_method(sel_getUid("mouseExited:"),function(_22,_23,_24){
with(_22){
objj_msgSend(_nextResponder,"performSelector:withObject:",_23,_24);
}
}),new objj_method(sel_getUid("scrollWheel:"),function(_25,_26,_27){
with(_25){
objj_msgSend(_nextResponder,"performSelector:withObject:",_26,_27);
}
}),new objj_method(sel_getUid("keyDown:"),function(_28,_29,_2a){
with(_28){
objj_msgSend(_nextResponder,"performSelector:withObject:",_29,_2a);
}
}),new objj_method(sel_getUid("keyUp:"),function(_2b,_2c,_2d){
with(_2b){
objj_msgSend(_nextResponder,"performSelector:withObject:",_2c,_2d);
}
}),new objj_method(sel_getUid("performKeyEquivalent:"),function(_2e,_2f,_30){
with(_2e){
return NO;
}
}),new objj_method(sel_getUid("deleteBackward:"),function(_31,_32,_33){
with(_31){
}
}),new objj_method(sel_getUid("insertLineBreak:"),function(_34,_35,_36){
with(_34){
}
}),new objj_method(sel_getUid("insertText:"),function(_37,_38,_39){
with(_37){
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_3a,_3b,_3c){
with(_3a){
if(objj_msgSend(_3a,"respondsToSelector:",_3c)){
objj_msgSend(_3a,"performSelector:",_3c);
}else{
objj_msgSend(_nextResponder,"doCommandBySelector:",_3c);
}
}
}),new objj_method(sel_getUid("tryToPerform:with:"),function(_3d,_3e,_3f,_40){
with(_3d){
if(objj_msgSend(_3d,"respondsToSelector:",_3f)){
objj_msgSend(_3d,"performSelector:withObject:",_3f,_40);
return YES;
}
return objj_msgSend(_nextResponder,"tryToPerform:with:",_3f,_40);
}
}),new objj_method(sel_getUid("setMenu:"),function(_41,_42,_43){
with(_41){
_menu=_43;
}
}),new objj_method(sel_getUid("menu"),function(_44,_45){
with(_44){
return _menu;
}
}),new objj_method(sel_getUid("undoManager"),function(_46,_47){
with(_46){
return objj_msgSend(_nextResponder,"performSelector:",_47);
}
}),new objj_method(sel_getUid("noResponderFor:"),function(_48,_49,_4a){
with(_48){
}
})]);
var _4b="CPResponderNextResponderKey";
var _1=objj_getClass("CPResponder");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPResponder\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_4c,_4d,_4e){
with(_4c){
_4c=objj_msgSendSuper({receiver:_4c,super_class:objj_getClass("CPObject")},"init");
if(_4c){
_nextResponder=objj_msgSend(_4e,"decodeObjectForKey:",_4b);
}
return _4c;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_4f,_50,_51){
with(_4f){
objj_msgSend(_51,"encodeConditionalObject:forKey:",_nextResponder,_4b);
}
})]);
p;12;CPScroller.ji;11;CPControl.jc;17596;
CPScrollerNoPart=0;
CPScrollerDecrementPage=1;
CPScrollerKnob=2;
CPScrollerIncrementPage=3;
CPScrollerDecrementLine=4;
CPScrollerIncrementLine=5;
CPScrollerKnobSlot=6;
CPScrollerIncrementArrow=0;
CPScrollerDecrementArrow=1;
CPNoScrollerParts=0;
CPOnlyScrollerArrows=1;
CPAllScrollerParts=2;
var _1=[],_2=[],_3=[],_4=[];
_1[CPRegularControlSize]=14;
_1[CPSmallControlSize]=11;
_1[CPMiniControlSize]=11;
_2[CPRegularControlSize]=18;
_2[CPSmallControlSize]=12;
_2[CPMiniControlSize]=12;
_3[CPRegularControlSize]=21;
_3[CPSmallControlSize]=16;
_3[CPMiniControlSize]=16;
_4[CPRegularControlSize]=16;
_4[CPSmallControlSize]=10;
_4[CPMiniControlSize]=10;
var _5="Knob",_6="KnobSlot",_7="DecrementArrow",_8="IncrementArrow",_9="Horizontal",_a="Vertical",_b="Highlighted",_c="Disabled";
var _d=nil,_e={};
var _f=objj_allocateClassPair(CPControl,"CPScroller"),_10=_f.isa;
class_addIvars(_f,[new objj_ivar("_controlSize"),new objj_ivar("_usableParts"),new objj_ivar("_partRects"),new objj_ivar("_isHorizontal"),new objj_ivar("_knobProportion"),new objj_ivar("_hitPart"),new objj_ivar("_trackingPart"),new objj_ivar("_trackingFloatValue"),new objj_ivar("_trackingStartPoint"),new objj_ivar("_knobView"),new objj_ivar("_knobSlotView"),new objj_ivar("_decrementArrowView"),new objj_ivar("_incrementArrowView")]);
objj_registerClassPair(_f);
objj_addClassForBundle(_f,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_f,[new objj_method(sel_getUid("initWithFrame:"),function(_11,_12,_13){
with(_11){
_11=objj_msgSendSuper({receiver:_11,super_class:objj_getClass("CPControl")},"initWithFrame:",_13);
if(_11){
_controlSize=CPRegularControlSize;
_partRects=[];
objj_msgSend(_11,"setFloatValue:knobProportion:",0,1);
_isHorizontal=CPRectGetWidth(_13)>CPRectGetHeight(_13);
_hitPart=CPScrollerNoPart;
objj_msgSend(_11,"checkSpaceForParts");
objj_msgSend(_11,"drawParts");
objj_msgSend(_11,"layoutSubviews");
}
return _11;
}
}),new objj_method(sel_getUid("setControlSize:"),function(_14,_15,_16){
with(_14){
if(_controlSize==_16){
return;
}
_controlSize=_16;
objj_msgSend(_14,"drawKnobSlot");
objj_msgSend(_14,"drawKnob");
objj_msgSend(_14,"drawArrow:highlight:",CPScrollerDecrementArrow,NO);
objj_msgSend(_14,"drawArrow:highlight:",CPScrollerIncrementArrow,NO);
objj_msgSend(_14,"layoutSubviews");
}
}),new objj_method(sel_getUid("controlSize"),function(_17,_18){
with(_17){
return _controlSize;
}
}),new objj_method(sel_getUid("setFloatValue:"),function(_19,_1a,_1b){
with(_19){
objj_msgSendSuper({receiver:_19,super_class:objj_getClass("CPControl")},"setFloatValue:",MIN(1,MAX(0,_1b)));
objj_msgSend(_19,"checkSpaceForParts");
objj_msgSend(_19,"layoutSubviews");
}
}),new objj_method(sel_getUid("setFloatValue:knobProportion:"),function(_1c,_1d,_1e,_1f){
with(_1c){
_knobProportion=MIN(1,MAX(0.0001,_1f));
objj_msgSend(_1c,"setFloatValue:",_1e);
}
}),new objj_method(sel_getUid("knobProportion"),function(_20,_21){
with(_20){
return _knobProportion;
}
}),new objj_method(sel_getUid("rectForPart:"),function(_22,_23,_24){
with(_22){
if(_24==CPScrollerNoPart){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
return _partRects[_24];
}
}),new objj_method(sel_getUid("testPart:"),function(_25,_26,_27){
with(_25){
_27=objj_msgSend(_25,"convertPoint:fromView:",_27,nil);
if(CGRectContainsPoint(objj_msgSend(_25,"rectForPart:",CPScrollerKnob),_27)){
return CPScrollerKnob;
}
if(CGRectContainsPoint(objj_msgSend(_25,"rectForPart:",CPScrollerDecrementPage),_27)){
return CPScrollerDecrementPage;
}
if(CGRectContainsPoint(objj_msgSend(_25,"rectForPart:",CPScrollerIncrementPage),_27)){
return CPScrollerIncrementPage;
}
if(CGRectContainsPoint(objj_msgSend(_25,"rectForPart:",CPScrollerDecrementLine),_27)){
return CPScrollerDecrementLine;
}
if(CGRectContainsPoint(objj_msgSend(_25,"rectForPart:",CPScrollerIncrementLine),_27)){
return CPScrollerIncrementLine;
}
if(CGRectContainsPoint(objj_msgSend(_25,"rectForPart:",CPScrollerKnobSlot),_27)){
return CPScrollerKnobSlot;
}
return CPScrollerNoPart;
}
}),new objj_method(sel_getUid("checkSpaceForParts"),function(_28,_29){
with(_28){
var _2a=objj_msgSend(_28,"bounds");
if(_knobProportion==1){
_usableParts=CPNoScrollerParts;
_partRects[CPScrollerDecrementPage]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerKnob]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerIncrementPage]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerDecrementLine]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerIncrementLine]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerKnobSlot]={origin:{x:_2a.origin.x,y:_2a.origin.y},size:{width:_2a.size.width,height:_2a.size.height}};
return;
}
var _2b=(_2a.size.width),_2c=(_2a.size.height),_2d=_4[_controlSize],_2e=(_isHorizontal?_2b:_2c)-2*_2d,_2f=MAX(_2[_controlSize],(_2e*_knobProportion));
_usableParts=CPAllScrollerParts;
var _30=_3[_controlSize],_31=_2d+(_2e-_2f)*objj_msgSend(_28,"floatValue");
if(_isHorizontal){
_partRects[CPScrollerDecrementPage]={origin:{x:_2d,y:0},size:{width:_31-_2d,height:_2c}};
_partRects[CPScrollerKnob]={origin:{x:_31,y:0},size:{width:_2f,height:_1[_controlSize]}};
_partRects[CPScrollerIncrementPage]={origin:{x:_31+_2f,y:0},size:{width:_2b-(_31+_2f)-_2d,height:_2c}};
_partRects[CPScrollerKnobSlot]={origin:{x:_2d,y:0},size:{width:_2e,height:_2c}};
_partRects[CPScrollerDecrementLine]={origin:{x:0,y:0},size:{width:_30,height:_2c}};
_partRects[CPScrollerIncrementLine]={origin:{x:_2b-_3[_controlSize],y:0},size:{width:_30,height:_2c}};
}else{
_partRects[CPScrollerDecrementPage]={origin:{x:0,y:_2d},size:{width:_2b,height:_31-_2d}};
_partRects[CPScrollerKnob]={origin:{x:0,y:_31},size:{width:_1[_controlSize],height:_2f}};
_partRects[CPScrollerIncrementPage]={origin:{x:0,y:_31+_2f},size:{width:_2b,height:_2c-(_31+_2f)-_2d}};
_partRects[CPScrollerKnobSlot]={origin:{x:0,y:_2d},size:{width:_2b,height:_2e}};
_partRects[CPScrollerDecrementLine]={origin:{x:0,y:0},size:{width:_2b,height:_30}};
_partRects[CPScrollerIncrementLine]={origin:{x:0,y:_2c-_3[_controlSize]},size:{width:_2b,height:_30}};
}
}
}),new objj_method(sel_getUid("usableParts"),function(_32,_33){
with(_32){
return _usableParts;
}
}),new objj_method(sel_getUid("drawArrow:highlight:"),function(_34,_35,_36,_37){
with(_34){
var _38=(_36==CPScrollerDecrementArrow?_7:_8),_39=(_36==CPScrollerDecrementArrow?_decrementArrowView:_incrementArrowView);
objj_msgSend(_39,"setBackgroundColor:",_CPControlColorWithPatternImage(_e,_d,_38,_isHorizontal?_9:_a,_CPControlIdentifierForControlSize(_controlSize),_37?_b:""));
}
}),new objj_method(sel_getUid("drawKnob"),function(_3a,_3b){
with(_3a){
objj_msgSend(_knobView,"setBackgroundColor:",_CPControlThreePartImagePattern(!_isHorizontal,_e,_d,_5,_isHorizontal?_9:_a,_CPControlIdentifierForControlSize(_controlSize)));
}
}),new objj_method(sel_getUid("drawKnobSlot"),function(_3c,_3d){
with(_3c){
objj_msgSend(_knobSlotView,"setBackgroundColor:",_CPControlColorWithPatternImage(_e,_d,_6,_isHorizontal?_9:_a,_CPControlIdentifierForControlSize(_controlSize)));
}
}),new objj_method(sel_getUid("drawParts"),function(_3e,_3f){
with(_3e){
_knobSlotView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_knobSlotView,"setHitTests:",NO);
objj_msgSend(_3e,"addSubview:",_knobSlotView);
objj_msgSend(_3e,"drawKnobSlot");
_knobView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_knobView,"setHitTests:",NO);
objj_msgSend(_3e,"addSubview:",_knobView);
objj_msgSend(_3e,"drawKnob");
_decrementArrowView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_decrementArrowView,"setHitTests:",NO);
objj_msgSend(_3e,"addSubview:",_decrementArrowView);
objj_msgSend(_3e,"drawArrow:highlight:",CPScrollerDecrementArrow,NO);
_incrementArrowView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_incrementArrowView,"setHitTests:",NO);
objj_msgSend(_3e,"addSubview:",_incrementArrowView);
objj_msgSend(_3e,"drawArrow:highlight:",CPScrollerIncrementArrow,NO);
}
}),new objj_method(sel_getUid("highlight:"),function(_40,_41,_42){
with(_40){
if(_trackingPart==CPScrollerDecrementLine){
objj_msgSend(_40,"drawArrow:highlight:",CPScrollerDecrementArrow,_42);
}else{
if(_trackingPart==CPScrollerIncrementLine){
objj_msgSend(_40,"drawArrow:highlight:",CPScrollerIncrementArrow,_42);
}
}
}
}),new objj_method(sel_getUid("hitPart"),function(_43,_44){
with(_43){
return _hitPart;
}
}),new objj_method(sel_getUid("trackKnob:"),function(_45,_46,_47){
with(_45){
var _48=objj_msgSend(_47,"type");
if(_48==CPLeftMouseUp){
_hitPart=CPScrollerNoPart;
return;
}
if(_48==CPLeftMouseDown){
_trackingFloatValue=objj_msgSend(_45,"floatValue");
_trackingStartPoint=objj_msgSend(_45,"convertPoint:fromView:",objj_msgSend(_47,"locationInWindow"),nil);
}else{
if(_48==CPLeftMouseDragged){
var _49=objj_msgSend(_45,"rectForPart:",CPScrollerKnob),_4a=objj_msgSend(_45,"rectForPart:",CPScrollerKnobSlot),_4b=_isHorizontal?((_4a.size.width)-(_49.size.width)):((_4a.size.height)-(_49.size.height));
if(_4b<=0){
objj_msgSend(_45,"setFloatValue:",0);
}else{
var _4c=objj_msgSend(_45,"convertPoint:fromView:",objj_msgSend(_47,"locationInWindow"),nil);
delta=_isHorizontal?_4c.x-_trackingStartPoint.x:_4c.y-_trackingStartPoint.y;
objj_msgSend(_45,"setFloatValue:",_trackingFloatValue+delta/_4b);
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_45,sel_getUid("trackKnob:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
objj_msgSend(_45,"sendAction:to:",objj_msgSend(_45,"action"),objj_msgSend(_45,"target"));
}
}),new objj_method(sel_getUid("trackScrollButtons:"),function(_4d,_4e,_4f){
with(_4d){
var _50=objj_msgSend(_4f,"type");
if(_50==CPLeftMouseUp){
objj_msgSend(_4d,"highlight:",NO);
objj_msgSend(CPEvent,"stopPeriodicEvents");
_hitPart=CPScrollerNoPart;
return;
}
if(_50==CPLeftMouseDown){
_trackingPart=objj_msgSend(_4d,"hitPart");
_trackingStartPoint=objj_msgSend(_4d,"convertPoint:fromView:",objj_msgSend(_4f,"locationInWindow"),nil);
if(objj_msgSend(_4f,"modifierFlags")&CPAlternateKeyMask){
if(_trackingPart==CPScrollerDecrementLine){
_hitPart=CPScrollerDecrementPage;
}else{
if(_trackingPart==CPScrollerIncrementLine){
_hitPart=CPScrollerIncrementPage;
}else{
if(_trackingPart==CPScrollerDecrementPage||_trackingPart==CPScrollerIncrementPage){
var _51=objj_msgSend(_4d,"rectForPart:",CPScrollerKnob),_52=_isHorizontal?(_51.size.width):(_51.size.height),_53=objj_msgSend(_4d,"rectForPart:",CPScrollerKnobSlot),_54=(_isHorizontal?(_53.size.width):(_53.size.height))-_52;
objj_msgSend(_4d,"setFloatValue:",((_isHorizontal?_trackingStartPoint.x-(_53.origin.x):_trackingStartPoint.y-(_53.origin.y))-_52/2)/_54);
_hitPart=CPScrollerKnob;
objj_msgSend(_4d,"sendAction:to:",objj_msgSend(_4d,"action"),objj_msgSend(_4d,"target"));
return objj_msgSend(_4d,"trackKnob:",_4f);
}
}
}
}
objj_msgSend(_4d,"highlight:",YES);
objj_msgSend(_4d,"sendAction:to:",objj_msgSend(_4d,"action"),objj_msgSend(_4d,"target"));
objj_msgSend(CPEvent,"startPeriodicEventsAfterDelay:withPeriod:",0.5,0.04);
}else{
if(_50==CPLeftMouseDragged){
_trackingStartPoint=objj_msgSend(_4d,"convertPoint:fromView:",objj_msgSend(_4f,"locationInWindow"),nil);
if(_trackingPart==CPScrollerDecrementPage||_trackingPart==CPScrollerIncrementPage){
var _55=objj_msgSend(_4d,"testPart:",objj_msgSend(_4f,"locationInWindow"));
if(_55==CPScrollerDecrementPage||_55==CPScrollerIncrementPage){
_trackingPart=_55;
_hitPart=_55;
}
}
objj_msgSend(_4d,"highlight:",CGRectContainsPoint(objj_msgSend(_4d,"rectForPart:",_trackingPart),_trackingStartPoint));
}else{
if(_50==CPPeriodic&&CGRectContainsPoint(objj_msgSend(_4d,"rectForPart:",_trackingPart),_trackingStartPoint)){
objj_msgSend(_4d,"sendAction:to:",objj_msgSend(_4d,"action"),objj_msgSend(_4d,"target"));
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_4d,sel_getUid("trackScrollButtons:"),CPPeriodicMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_56,_57,_58){
with(_56){
objj_msgSendSuper({receiver:_56,super_class:objj_getClass("CPControl")},"setFrameSize:",_58);
objj_msgSend(_56,"checkSpaceForParts");
var _59=objj_msgSend(_56,"frame"),_5a=CPRectGetWidth(_59)>CPRectGetHeight(_59);
if(_isHorizontal!=_5a){
_isHorizontal=_5a;
objj_msgSend(_56,"drawParts");
}
objj_msgSend(_56,"layoutSubviews");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_5b,_5c){
with(_5b){
objj_msgSend(_knobSlotView,"setFrame:",objj_msgSend(_5b,"rectForPart:",CPScrollerKnobSlot));
var _5d=objj_msgSend(_5b,"usableParts"),_5e=!(_5d==CPAllScrollerParts);
if(_5e!=objj_msgSend(_knobView,"isHidden")){
objj_msgSend(_knobView,"setHidden:",_5e);
objj_msgSend(_decrementArrowView,"setHidden:",_5e);
objj_msgSend(_incrementArrowView,"setHidden:",_5e);
}
if(!_5e){
objj_msgSend(_knobView,"setFrame:",objj_msgSend(_5b,"rectForPart:",CPScrollerKnob));
objj_msgSend(_decrementArrowView,"setFrame:",objj_msgSend(_5b,"rectForPart:",CPScrollerDecrementLine));
objj_msgSend(_incrementArrowView,"setFrame:",objj_msgSend(_5b,"rectForPart:",CPScrollerIncrementLine));
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_5f,_60,_61){
with(_5f){
_hitPart=objj_msgSend(_5f,"testPart:",objj_msgSend(_61,"locationInWindow"));
switch(_hitPart){
case CPScrollerKnob:
return objj_msgSend(_5f,"trackKnob:",_61);
case CPScrollerDecrementLine:
case CPScrollerIncrementLine:
case CPScrollerDecrementPage:
case CPScrollerIncrementPage:
return objj_msgSend(_5f,"trackScrollButtons:",_61);
}
}
}),new objj_method(sel_getUid("setEnabled:"),function(_62,_63,_64){
with(_62){
}
})]);
class_addMethods(_10,[new objj_method(sel_getUid("initialize"),function(_65,_66){
with(_65){
if(_65!=objj_msgSend(CPScroller,"class")){
return;
}
_d=objj_msgSend(_65,"className");
var _67=_CPControlIdentifierForControlSize(CPRegularControlSize),_68=_CPControlIdentifierForControlSize(CPSmallControlSize),_69=_CPControlIdentifierForControlSize(CPMiniControlSize);
var _6a=_d+_5+_9;
_e[_6a+_67]=[{width:9,height:_1[CPRegularControlSize]},{width:1,height:_1[CPRegularControlSize]},{width:9,height:_1[CPRegularControlSize]}];
_e[_6a+_68]=[{width:6,height:_1[CPSmallControlSize]},{width:1,height:_1[CPSmallControlSize]},{width:6,height:_1[CPSmallControlSize]}];
_e[_6a+_69]=[{width:6,height:_1[CPMiniControlSize]},{width:1,height:_1[CPMiniControlSize]},{width:6,height:_1[CPMiniControlSize]}];
var _6a=_d+_5+_a;
_e[_6a+_67]=[{width:_1[CPRegularControlSize],height:9},{width:_1[CPRegularControlSize],height:1},{width:_1[CPRegularControlSize],height:9}];
_e[_6a+_68]=[{width:_1[CPSmallControlSize],height:6},{width:_1[CPSmallControlSize],height:1},{width:_1[CPSmallControlSize],height:6}];
_e[_6a+_69]=[{width:_1[CPMiniControlSize],height:6},{width:_1[CPMiniControlSize],height:1},{width:_1[CPMiniControlSize],height:6}];
var _6a=_d+_6+_9;
_e[_6a+_67]={width:1,height:_1[CPRegularControlSize]};
_e[_6a+_68]={width:1,height:_1[CPSmallControlSize]};
_e[_6a+_69]={width:1,height:_1[CPMiniControlSize]};
var _6a=_d+_6+_a;
_e[_6a+_67]={width:_1[CPRegularControlSize],height:1};
_e[_6a+_68]={width:_1[CPSmallControlSize],height:1};
_e[_6a+_69]={width:_1[CPMiniControlSize],height:1};
var _6a=_d+_7+_9;
_e[_6a+_67]={width:_3[CPRegularControlSize],height:_1[CPRegularControlSize]};
_e[_6a+_67+_b]={width:_3[CPRegularControlSize],height:_1[CPRegularControlSize]};
_e[_6a+_68]={width:_3[CPSmallControlSize],height:_1[CPSmallControlSize]};
_e[_6a+_68+_b]={width:_3[CPSmallControlSize],height:_1[CPSmallControlSize]};
_e[_6a+_69]={width:_3[CPMiniControlSize],height:_1[CPMiniControlSize]};
_e[_6a+_69+_b]={width:_3[CPMiniControlSize],height:_1[CPMiniControlSize]};
var _6a=_d+_7+_a;
_e[_6a+_67]={width:_1[CPRegularControlSize],height:_3[CPRegularControlSize]};
_e[_6a+_67+_b]={width:_1[CPRegularControlSize],height:_3[CPRegularControlSize]};
_e[_6a+_68]={width:_1[CPSmallControlSize],height:_3[CPSmallControlSize]};
_e[_6a+_68+_b]={width:_1[CPSmallControlSize],height:_3[CPSmallControlSize]};
_e[_6a+_69]={width:_1[CPMiniControlSize],height:_3[CPMiniControlSize]};
_e[_6a+_69+_b]={width:_1[CPMiniControlSize],height:_3[CPMiniControlSize]};
var _6a=_d+_8+_9;
_e[_6a+_67]={width:_3[CPRegularControlSize],height:_1[CPRegularControlSize]};
_e[_6a+_67+_b]={width:_3[CPRegularControlSize],height:_1[CPRegularControlSize]};
_e[_6a+_68]={width:_3[CPSmallControlSize],height:_1[CPSmallControlSize]};
_e[_6a+_68+_b]={width:_3[CPSmallControlSize],height:_1[CPSmallControlSize]};
_e[_6a+_69]={width:_3[CPMiniControlSize],height:_1[CPMiniControlSize]};
_e[_6a+_69+_b]={width:_3[CPMiniControlSize],height:_1[CPMiniControlSize]};
var _6a=_d+_8+_a;
_e[_6a+_67]={width:_1[CPRegularControlSize],height:_3[CPRegularControlSize]};
_e[_6a+_67+_b]={width:_1[CPRegularControlSize],height:_3[CPRegularControlSize]};
_e[_6a+_68]={width:_1[CPSmallControlSize],height:_3[CPSmallControlSize]};
_e[_6a+_68+_b]={width:_1[CPSmallControlSize],height:_3[CPSmallControlSize]};
_e[_6a+_69]={width:_1[CPMiniControlSize],height:_3[CPMiniControlSize]};
_e[_6a+_69+_b]={width:_1[CPMiniControlSize],height:_3[CPMiniControlSize]};
}
}),new objj_method(sel_getUid("scrollerWidth"),function(_6b,_6c){
with(_6b){
return objj_msgSend(_6b,"scrollerWidthForControlSize:",CPRegularControlSize);
}
}),new objj_method(sel_getUid("scrollerWidthForControlSize:"),function(_6d,_6e,_6f){
with(_6d){
return _1[_6f];
}
})]);
p;14;CPScrollView.ji;8;CPView.ji;12;CPClipView.ji;12;CPScroller.jc;12429;
var _1=objj_allocateClassPair(CPView,"CPScrollView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_contentView"),new objj_ivar("_hasVerticalScroller"),new objj_ivar("_hasHorizontalScroller"),new objj_ivar("_autohidesScrollers"),new objj_ivar("_verticalScroller"),new objj_ivar("_horizontalScroller"),new objj_ivar("_recursionCount"),new objj_ivar("_verticalLineScroll"),new objj_ivar("_verticalPageScroll"),new objj_ivar("_horizontalLineScroll"),new objj_ivar("_horizontalPageScroll")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPView")},"initWithFrame:",_5);
if(_3){
_verticalLineScroll=10;
_verticalPageScroll=10;
_horizontalLineScroll=10;
_horizontalPageScroll=10;
_contentView=objj_msgSend(objj_msgSend(CPClipView,"alloc"),"initWithFrame:",objj_msgSend(_3,"bounds"));
objj_msgSend(_3,"addSubview:",_contentView);
objj_msgSend(_3,"setHasVerticalScroller:",YES);
objj_msgSend(_3,"setHasHorizontalScroller:",YES);
}
return _3;
}
}),new objj_method(sel_getUid("contentSize"),function(_6,_7){
with(_6){
return objj_msgSend(_contentView,"frame").size;
}
}),new objj_method(sel_getUid("documentView"),function(_8,_9){
with(_8){
return objj_msgSend(_contentView,"documentView");
}
}),new objj_method(sel_getUid("setContentView:"),function(_a,_b,_c){
with(_a){
if(!_c){
return;
}
var _d=objj_msgSend(_c,"documentView");
if(_d){
objj_msgSend(_d,"removeFromSuperview");
}
objj_msgSend(_contentView,"removeFromSuperview");
var _e=objj_msgSend(_a,"contentSize");
_contentView=_c;
objj_msgSend(_contentView,"setFrame:",CGRectMake(0,0,_e.width,_e.height));
objj_msgSend(_contentView,"setDocumentView:",_d);
objj_msgSend(_a,"addSubview:",_contentView);
}
}),new objj_method(sel_getUid("contentView"),function(_f,_10){
with(_f){
return _contentView;
}
}),new objj_method(sel_getUid("setDocumentView:"),function(_11,_12,_13){
with(_11){
objj_msgSend(_contentView,"setDocumentView:",_13);
objj_msgSend(_11,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(_14,_15,_16){
with(_14){
if(_contentView!=_16){
return;
}
if(_recursionCount>5){
return;
}
++_recursionCount;
var _17=objj_msgSend(_14,"documentView");
if(!_17){
if(_autohidesScrollers){
objj_msgSend(_verticalScroller,"setHidden:",YES);
objj_msgSend(_horizontalScroller,"setHidden:",YES);
}else{
objj_msgSend(_verticalScroller,"setEnabled:",NO);
objj_msgSend(_horizontalScroller,"setEnabled:",NO);
}
objj_msgSend(_contentView,"setFrame:",objj_msgSend(_14,"bounds"));
--_recursionCount;
return;
}
var _18=objj_msgSend(_17,"frame"),_19=objj_msgSend(_14,"bounds"),_1a=objj_msgSend(_contentView,"bounds").origin,_1b={width:CPRectGetWidth(_18)-CPRectGetWidth(_19),height:CPRectGetHeight(_18)-CPRectGetHeight(_19)},_1c=(!_autohidesScrollers||_1b.height>0)&&_hasVerticalScroller,_1d=(!_autohidesScrollers||_1b.width>0)&&_hasHorizontalScroller,_1e=!objj_msgSend(_verticalScroller,"isHidden"),_1f=!objj_msgSend(_horizontalScroller,"isHidden"),_20=objj_msgSend(CPScroller,"scrollerWidthForControlSize:",objj_msgSend(_verticalScroller,"controlSize")),_21=objj_msgSend(CPScroller,"scrollerWidthForControlSize:",objj_msgSend(_horizontalScroller,"controlSize"));
if(_autohidesScrollers){
if(_1c){
_1d=(!_autohidesScrollers||_1b.width>-_20)&&_hasHorizontalScroller;
}
if(_1d){
_1c=(!_autohidesScrollers||_1b.height>-_21)&&_hasVerticalScroller;
}
}
objj_msgSend(_verticalScroller,"setHidden:",!_1c);
objj_msgSend(_verticalScroller,"setEnabled:",!_autohidesScrollers&&_1b.height<0);
objj_msgSend(_horizontalScroller,"setHidden:",!_1d);
objj_msgSend(_horizontalScroller,"setEnabled:",!_autohidesScrollers&&_1b.width<0);
if(_1c){
var _22=CPRectGetHeight(_19);
if(_1d){
_22-=_21;
}
_1b.width+=_20;
_19.size.width-=_20;
objj_msgSend(_verticalScroller,"setFloatValue:knobProportion:",(_1b.height<=0)?0:_1a.y/_1b.height,CPRectGetHeight(_19)/CPRectGetHeight(_18));
objj_msgSend(_verticalScroller,"setFrame:",CPRectMake(CPRectGetMaxX(_19),0,_20,_22));
}else{
if(_1e){
objj_msgSend(_verticalScroller,"setFloatValue:knobProportion:",0,1);
}
}
if(_1d){
_1b.height+=_21;
_19.size.height-=_21;
objj_msgSend(_horizontalScroller,"setFloatValue:knobProportion:",(_1b.width<=0)?0:_1a.x/_1b.width,CPRectGetWidth(_19)/CPRectGetWidth(_18));
objj_msgSend(_horizontalScroller,"setFrame:",CPRectMake(0,CPRectGetMaxY(_19),CPRectGetWidth(_19),_21));
}else{
if(_1f){
objj_msgSend(_horizontalScroller,"setFloatValue:knobProportion:",0,1);
}
}
objj_msgSend(_contentView,"setFrame:",_19);
--_recursionCount;
}
}),new objj_method(sel_getUid("setHorizontalScroller:"),function(_23,_24,_25){
with(_23){
if(_horizontalScroller==_25){
return;
}
objj_msgSend(_horizontalScroller,"removeFromSuperview");
objj_msgSend(_horizontalScroller,"setTarget:",nil);
objj_msgSend(_horizontalScroller,"setAction:",nil);
_horizontalScroller=_25;
objj_msgSend(_horizontalScroller,"setTarget:",_23);
objj_msgSend(_horizontalScroller,"setAction:",sel_getUid("_horizontalScrollerDidScroll:"));
objj_msgSend(_23,"addSubview:",_horizontalScroller);
objj_msgSend(_23,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("horizontalScroller"),function(_26,_27){
with(_26){
return _horizontalScroller;
}
}),new objj_method(sel_getUid("setHasHorizontalScroller:"),function(_28,_29,_2a){
with(_28){
if(_hasHorizontalScroller==_2a){
return;
}
_hasHorizontalScroller=_2a;
if(_hasHorizontalScroller&&!_horizontalScroller){
objj_msgSend(_28,"setHorizontalScroller:",objj_msgSend(objj_msgSend(CPScroller,"alloc"),"initWithFrame:",CPRectMake(0,0,CPRectGetWidth(objj_msgSend(_28,"bounds")),objj_msgSend(CPScroller,"scrollerWidth"))));
}else{
if(!_hasHorizontalScroller&&_horizontalScroller){
objj_msgSend(_horizontalScroller,"setHidden:",YES);
objj_msgSend(_28,"reflectScrolledClipView:",_contentView);
}
}
}
}),new objj_method(sel_getUid("hasHorizontalScroller"),function(_2b,_2c){
with(_2b){
return _hasHorizontalScroller;
}
}),new objj_method(sel_getUid("setVerticalScroller:"),function(_2d,_2e,_2f){
with(_2d){
if(_verticalScroller==_2f){
return;
}
objj_msgSend(_verticalScroller,"removeFromSuperview");
objj_msgSend(_verticalScroller,"setTarget:",nil);
objj_msgSend(_verticalScroller,"setAction:",nil);
_verticalScroller=_2f;
objj_msgSend(_verticalScroller,"setTarget:",_2d);
objj_msgSend(_verticalScroller,"setAction:",sel_getUid("_verticalScrollerDidScroll:"));
objj_msgSend(_2d,"addSubview:",_verticalScroller);
objj_msgSend(_2d,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("verticalScroller"),function(_30,_31){
with(_30){
return _verticalScroller;
}
}),new objj_method(sel_getUid("setHasVerticalScroller:"),function(_32,_33,_34){
with(_32){
if(_hasVerticalScroller==_34){
return;
}
_hasVerticalScroller=_34;
if(_hasVerticalScroller&&!_verticalScroller){
objj_msgSend(_32,"setVerticalScroller:",objj_msgSend(objj_msgSend(CPScroller,"alloc"),"initWithFrame:",CPRectMake(0,0,objj_msgSend(CPScroller,"scrollerWidth"),CPRectGetHeight(objj_msgSend(_32,"bounds")))));
}else{
if(!_hasVerticalScroller&&_verticalScroller){
objj_msgSend(_verticalScroller,"setHidden:",YES);
objj_msgSend(_32,"reflectScrolledClipView:",_contentView);
}
}
}
}),new objj_method(sel_getUid("hasHorizontalScroller"),function(_35,_36){
with(_35){
return _hasHorizontalScroller;
}
}),new objj_method(sel_getUid("setAutohidesScrollers:"),function(_37,_38,_39){
with(_37){
if(_autohidesScrollers==_39){
return;
}
_autohidesScrollers=_39;
objj_msgSend(_37,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("autohidesScrollers"),function(_3a,_3b){
with(_3a){
return _autohidesScrollers;
}
}),new objj_method(sel_getUid("_verticalScrollerDidScroll:"),function(_3c,_3d,_3e){
with(_3c){
var _3f=objj_msgSend(_3e,"floatValue"),_40=objj_msgSend(objj_msgSend(_contentView,"documentView"),"frame");
contentBounds=objj_msgSend(_contentView,"bounds");
switch(objj_msgSend(_verticalScroller,"hitPart")){
case CPScrollerDecrementLine:
contentBounds.origin.y-=_verticalLineScroll;
break;
case CPScrollerIncrementLine:
contentBounds.origin.y+=_verticalLineScroll;
break;
case CPScrollerDecrementPage:
contentBounds.origin.y-=(contentBounds.size.height)-_verticalPageScroll;
break;
case CPScrollerIncrementPage:
contentBounds.origin.y+=(contentBounds.size.height)-_verticalPageScroll;
break;
case CPScrollerKnobSlot:
case CPScrollerKnob:
default:
contentBounds.origin.y=_3f*((_40.size.height)-(contentBounds.size.height));
}
objj_msgSend(_contentView,"scrollToPoint:",contentBounds.origin);
}
}),new objj_method(sel_getUid("_horizontalScrollerDidScroll:"),function(_41,_42,_43){
with(_41){
var _44=objj_msgSend(_43,"floatValue"),_45=objj_msgSend(objj_msgSend(_41,"documentView"),"frame"),_46=objj_msgSend(_contentView,"bounds");
switch(objj_msgSend(_horizontalScroller,"hitPart")){
case CPScrollerDecrementLine:
_46.origin.x-=_horizontalLineScroll;
break;
case CPScrollerIncrementLine:
_46.origin.x+=_horizontalLineScroll;
break;
case CPScrollerDecrementPage:
_46.origin.x-=(_46.size.width)-_horizontalPageScroll;
break;
case CPScrollerIncrementPage:
_46.origin.x+=(_46.size.width)-_horizontalPageScroll;
break;
case CPScrollerKnobSlot:
case CPScrollerKnob:
default:
_46.origin.x=_44*((_45.size.width)-(_46.size.width));
}
objj_msgSend(_contentView,"scrollToPoint:",_46.origin);
}
}),new objj_method(sel_getUid("tile"),function(_47,_48){
with(_47){
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_49,_4a,_4b){
with(_49){
objj_msgSend(_49,"reflectScrolledClipView:",_contentView);
}
}),new objj_method(sel_getUid("setLineScroll:"),function(_4c,_4d,_4e){
with(_4c){
objj_msgSend(_4c,"setHorizonalLineScroll:",_4e);
objj_msgSend(_4c,"setVerticalLineScroll:",_4e);
}
}),new objj_method(sel_getUid("lineScroll"),function(_4f,_50){
with(_4f){
return objj_msgSend(_4f,"horizontalLineScroll");
}
}),new objj_method(sel_getUid("setHorizontalLineScroll:"),function(_51,_52,_53){
with(_51){
_horizontalLineScroll=_53;
}
}),new objj_method(sel_getUid("horizontalLineScroll"),function(_54,_55){
with(_54){
return _horizontalLineScroll;
}
}),new objj_method(sel_getUid("setVerticalLineScroll:"),function(_56,_57,_58){
with(_56){
_verticalLineScroll=_58;
}
}),new objj_method(sel_getUid("verticalLineScroll"),function(_59,_5a){
with(_59){
return _verticalLineScroll;
}
}),new objj_method(sel_getUid("setPageScroll:"),function(_5b,_5c,_5d){
with(_5b){
objj_msgSend(_5b,"setHorizontalPageScroll:",_5d);
objj_msgSend(_5b,"setVerticalPageScroll:",_5d);
}
}),new objj_method(sel_getUid("pageScroll"),function(_5e,_5f){
with(_5e){
return objj_msgSend(_5e,"horizontalPageScroll");
}
}),new objj_method(sel_getUid("setHorizontalPageScroll:"),function(_60,_61,_62){
with(_60){
_horizontalPageScroll=_62;
}
}),new objj_method(sel_getUid("horizontalPageScroll"),function(_63,_64){
with(_63){
return _horizontalPageScroll;
}
}),new objj_method(sel_getUid("setVerticalPageScroll:"),function(_65,_66,_67){
with(_65){
_verticalPageScroll=_67;
}
}),new objj_method(sel_getUid("verticalPageScroll"),function(_68,_69){
with(_68){
return _verticalPageScroll;
}
}),new objj_method(sel_getUid("scrollWheel:"),function(_6a,_6b,_6c){
with(_6a){
var _6d=objj_msgSend(_verticalScroller,"floatValue"),_6e=objj_msgSend(objj_msgSend(_6a,"documentView"),"frame"),_6f=objj_msgSend(_contentView,"bounds");
_6f.origin.x+=objj_msgSend(_6c,"deltaX")*_horizontalLineScroll;
_6f.origin.y+=objj_msgSend(_6c,"deltaY")*_verticalLineScroll;
objj_msgSend(_contentView,"scrollToPoint:",_6f.origin);
}
}),new objj_method(sel_getUid("keyDown:"),function(_70,_71,_72){
with(_70){
var _73=objj_msgSend(_72,"keyCode"),_74=objj_msgSend(_verticalScroller,"floatValue"),_75=objj_msgSend(objj_msgSend(_70,"documentView"),"frame"),_76=objj_msgSend(_contentView,"bounds");
switch(_73){
case 33:
_76.origin.y-=(_76.size.height)-_verticalPageScroll;
break;
case 34:
_76.origin.y+=(_76.size.height)-_verticalPageScroll;
break;
case 38:
_76.origin.y-=_verticalLineScroll;
break;
case 40:
_76.origin.y+=_verticalLineScroll;
break;
case 37:
_76.origin.x-=_horizontalLineScroll;
break;
case 49:
_76.origin.x+=_horizontalLineScroll;
break;
default:
return objj_msgSendSuper({receiver:_70,super_class:objj_getClass("CPView")},"keyDown:",_72);
}
objj_msgSend(_contentView,"scrollToPoint:",_76.origin);
}
})]);
p;19;CPSecureTextField.ji;13;CPTextField.jc;2304;
var _1=4,_2=3;
HORIZONTAL_PADDING=3;
var _3=nil;
var _4=objj_allocateClassPair(CPTextField,"CPSecureTextField"),_5=_4.isa;
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("initWithFrame:"),function(_6,_7,_8){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPTextField")},"initWithFrame:",_8);
if(_6){
_DOMElement.removeChild(_DOMTextElement);
_DOMTextElement=document.createElement("input");
_DOMTextElement.type="password";
_DOMTextElement.style.position="absolute";
_DOMTextElement.style.top=_1+"px";
_DOMTextElement.style.left=HORIZONTAL_PADDING+"px";
_DOMTextElement.style.width=MAX(0,CGRectGetWidth(_8)-2*HORIZONTAL_PADDING)+"px";
_DOMTextElement.style.height=MAX(0,CGRectGetHeight(_8)-_1-_2)+"px";
_DOMTextElement.style.whiteSpace="pre";
_DOMTextElement.style.cursor="default";
_DOMTextElement.style.zIndex=100;
_DOMTextElement.style.border="0";
_DOMTextElement.style.font=_DOMElement.style.font;
_DOMTextElement.style.padding="0px";
_DOMTextElement.style.margin="0px";
_DOMElement.appendChild(_DOMTextElement);
}
return _6;
}
}),new objj_method(sel_getUid("setFont:"),function(_9,_a,_b){
with(_9){
objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPTextField")},"setFont:",_b);
if(_DOMTextElement){
_DOMTextElement.style.font=_DOMElement.style.font;
}
}
}),new objj_method(sel_getUid("stringValue"),function(_c,_d){
with(_c){
if(objj_msgSend(objj_msgSend(_c,"window"),"firstResponder")==_c){
return objj_msgSend(objj_msgSend(_c,"class"),"_inputElement").value;
}
return _DOMTextElement.value;
}
}),new objj_method(sel_getUid("setStringValue:"),function(_e,_f,_10){
with(_e){
_value=_10;
_DOMTextElement.value=_value;
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("_inputElement"),function(_11,_12){
with(_11){
if(!_3){
_3=document.createElement("input");
_3.type="password";
_3.style.position="absolute";
_3.style.top="0px";
_3.style.left="0px";
_3.style.width="100%";
_3.style.height="100%";
_3.style.border="0px";
_3.style.padding="0px";
_3.style.whiteSpace="pre";
_3.style.background="transparent";
_3.style.outline="none";
_3.style.paddingLeft=HORIZONTAL_PADDING+"px";
_3.style.paddingTop=_1-2+"px";
_3.style.margin="0px";
}
return _3;
}
})]);
p;20;CPSegmentedControl.jI;20;Foundation/CPArray.ji;11;CPControl.jc;10756;
CPSegmentSwitchTrackingSelectOne=0;
CPSegmentSwitchTrackingSelectAny=1;
CPSegmentSwitchTrackingMomentary=2;
var _1=objj_allocateClassPair(CPControl,"CPSegmentedControl"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_segmentCount"),new objj_ivar("_segments"),new objj_ivar("_selectedSegment"),new objj_ivar("_trackingMode"),new objj_ivar("_trackingSegment"),new objj_ivar("_trackingHighlighted")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPControl")},"initWithFrame:",_5);
if(_3){
_segments=[];
_selectedSegment=-1;
_segmentCount=0;
_trackingMode=CPSegmentSwitchTrackingSelectOne;
}
return _3;
}
}),new objj_method(sel_getUid("selectedTag"),function(_6,_7){
with(_6){
return _segments[_selectedSegment].tag;
}
}),new objj_method(sel_getUid("setSegmentCount:"),function(_8,_9,_a){
with(_8){
if(_segmentCount==_a){
return;
}
var _b=CGRectGetHeight(objj_msgSend(_8,"bounds"));
if(_segmentCount<_a){
var _c=_segmentCount;
for(;_c<_a;++_c){
_segments[_c]=_d();
_segments[_c].frame.size.height=_b;
}
}else{
if(_a<_segmentCount){
var _c=_a;
for(;_c<_segmentCount;++_c){
objj_msgSend(_segments[_c].imageView,"removeFromSuperview");
objj_msgSend(_segments[_c].labelView,"removeFromSuperview");
_segments[_c]=nil;
}
}
}
_segmentCount=_a;
if(_selectedSegment<_segmentCount){
_selectedSegment=-1;
}
objj_msgSend(_8,"tileWithChangedSegment:",0);
}
}),new objj_method(sel_getUid("segmentCount"),function(_e,_f){
with(_e){
return _segmentCount;
}
}),new objj_method(sel_getUid("setSelectedSegment:"),function(_10,_11,_12){
with(_10){
objj_msgSend(_10,"setSelected:forSegment:",YES,_12);
}
}),new objj_method(sel_getUid("selectedSegment"),function(_13,_14){
with(_13){
return _selectedSegment;
}
}),new objj_method(sel_getUid("selectSegmentWithTag:"),function(_15,_16,_17){
with(_15){
var _18=0;
for(;_18<_segmentCount;++_18){
if(_segments[_18].tag==_17){
objj_msgSend(_15,"setSelectedSegment:",_18);
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("isTracking"),function(_19,_1a){
with(_19){
}
}),new objj_method(sel_getUid("setTrackingMode:"),function(_1b,_1c,_1d){
with(_1b){
if(_trackingMode==_1d){
return;
}
_trackingMode=_1d;
if(_trackingMode==CPSegmentSwitchTrackingSelectOne){
var _1e=0,_1f=NO;
for(;_1e<_segmentCount;++_1e){
if(_segments[_1e].selected){
if(_1f){
objj_msgSend(_1b,"setSelected:forSegment:",NO,_1e);
}else{
_1f=YES;
}
}
}
}else{
if(_trackingMode==CPSegmentSwitchTrackingMomentary){
var _1e=0;
for(;_1e<_segmentCount;++_1e){
if(_segments[_1e].selected){
objj_msgSend(_1b,"setSelected:forSegment:",NO,_1e);
}
}
}
}
}
}),new objj_method(sel_getUid("trackingMode"),function(_20,_21){
with(_20){
return _trackingMode;
}
}),new objj_method(sel_getUid("setWidth:forSegment:"),function(_22,_23,_24,_25){
with(_22){
_segments[_25].width=_24;
objj_msgSend(_22,"tileWithChangedSegment:",_25);
}
}),new objj_method(sel_getUid("widthForSegment:"),function(_26,_27,_28){
with(_26){
return _segments[_28].width;
}
}),new objj_method(sel_getUid("setImage:forSegment:"),function(_29,_2a,_2b,_2c){
with(_29){
var _2d=_segments[_2c];
if(!_2b){
objj_msgSend(_2d.imageView,"removeFromSuperview");
_2d.imageView=nil;
}else{
if(!_2d.imageView){
_2d.imageView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_29,"addSubview:",_2d.imageView);
}
objj_msgSend(_2d.imageView,"setImage:",_2b);
objj_msgSend(_2d.imageView,"setFrameSize:",CGSizeMakeCopy(objj_msgSend(_2b,"size")));
}
_2d.image=_2b;
if(_2d.width){
objj_msgSend(_29,"drawSegment:highlight:",_2c,NO);
}else{
objj_msgSend(_29,"tileWithChangedSegment:",_2c);
}
}
}),new objj_method(sel_getUid("imageForSegment:"),function(_2e,_2f,_30){
with(_2e){
return _segments[_30].image;
}
}),new objj_method(sel_getUid("setLabel:forSegment:"),function(_31,_32,_33,_34){
with(_31){
var _35=_segments[_34];
if(!_33||!_33.length){
objj_msgSend(_35.labelView,"removeFromSuperview");
_35.labelView=nil;
}else{
if(!_35.labelView){
_35.labelView=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_35.labelView,"setFont:",objj_msgSend(_31,"font"));
objj_msgSend(_31,"addSubview:",_35.labelView);
}
objj_msgSend(_35.labelView,"setStringValue:",_33);
objj_msgSend(_35.labelView,"sizeToFit");
}
_segments[_34].label=_33;
if(_35.width){
objj_msgSend(_31,"drawSegment:highlight:",_34,NO);
}else{
objj_msgSend(_31,"tileWithChangedSegment:",_34);
}
}
}),new objj_method(sel_getUid("labelForSegment:"),function(_36,_37,_38){
with(_36){
return _segments[_38].label;
}
}),new objj_method(sel_getUid("setMenu:forSegment:"),function(_39,_3a,_3b,_3c){
with(_39){
_segments[_3c].menu=_3b;
}
}),new objj_method(sel_getUid("menuForSegment:"),function(_3d,_3e,_3f){
with(_3d){
return _segments[_3f].menu;
}
}),new objj_method(sel_getUid("setSelected:forSegment:"),function(_40,_41,_42,_43){
with(_40){
var _44=_segments[_43];
if(_44.selected==_42){
return;
}
_44.selected=_42;
if(_42){
var _45=_selectedSegment;
_selectedSegment=_43;
if(_trackingMode==CPSegmentSwitchTrackingSelectOne&&_45!=_43&&_45!=-1){
_segments[_45].selected=NO;
objj_msgSend(_40,"drawSegmentBezel:highlight:",_45,NO);
}
}
if(_trackingMode!=CPSegmentSwitchTrackingMomentary){
objj_msgSend(_40,"drawSegmentBezel:highlight:",_43,NO);
}
}
}),new objj_method(sel_getUid("isSelectedForSegment:"),function(_46,_47,_48){
with(_46){
return _segments[_48].selected;
}
}),new objj_method(sel_getUid("setEnabled:forSegment:"),function(_49,_4a,_4b,_4c){
with(_49){
_segments[_4c].enabled=_4b;
}
}),new objj_method(sel_getUid("isEnabledForSegment:"),function(_4d,_4e,_4f){
with(_4d){
return _segments[_4f].enabled;
}
}),new objj_method(sel_getUid("setTag:forSegment:"),function(_50,_51,_52,_53){
with(_50){
_segments[_53].tag=_52;
}
}),new objj_method(sel_getUid("tagForSegment:"),function(_54,_55,_56){
with(_54){
return _segments[_56].tag;
}
}),new objj_method(sel_getUid("drawSegmentBezel:highlight:"),function(_57,_58,_59,_5a){
with(_57){
}
}),new objj_method(sel_getUid("drawSegment:highlight:"),function(_5b,_5c,_5d,_5e){
with(_5b){
var _5f=_segments[_5d],_60=_5f.imageView,_61=_5f.labelView,_62=_5f.frame,_63=CGRectGetMinX(_62),_64=CGRectGetWidth(_62),_65=CGRectGetHeight(_62)-1;
if(_60&&_61){
var _66=objj_msgSend(_60,"frame").size,_67=objj_msgSend(_61,"frame").size,_68=_66.height+_67.height,_69=MIN(_67.width,width),y=(_65-_68)/2;
objj_msgSend(_60,"setFrameOrigin:",CGPointMake(_63+(_64-_66.width)/2,y));
if(_69<_67.width){
objj_msgSend(_61,"setFrameSize:",CGSizeMake(_69,_67.height));
}
objj_msgSend(_61,"setFrameOrigin:",CGPointMake(_63+(_64-_69)/2,y+_66.height));
}else{
if(_60){
var _66=objj_msgSend(_60,"frame").size;
objj_msgSend(_60,"setFrameOrigin:",CGPointMake(_63+(_64-_66.width)/2,(_65-_66.height)/2));
}else{
if(_61){
var _67=objj_msgSend(_61,"frame").size,_69=MIN(_67.width,_64);
if(_69<_67.width){
objj_msgSend(_61,"setFrameSize:",CGSizeMake(_69,_67.height));
}
objj_msgSend(_61,"setFrameOrigin:",CGPointMake(_63+(_64-_69)/2,(_65-_67.height)/2));
}
}
}
}
}),new objj_method(sel_getUid("tileWithChangedSegment:"),function(_6b,_6c,_6d){
with(_6b){
var _6e=_segments[_6d],_6f=_6e.width;
if(!_6f){
if(_6e.labelView&&_6e.imageView){
_6f=MAX(CGRectGetWidth(objj_msgSend(_6e.labelView,"frame")),CGRectGetWidth(objj_msgSend(_6e.imageView,"frame")));
}else{
if(_6e.labelView){
_6f=CGRectGetWidth(objj_msgSend(_6e.labelView,"frame"));
}else{
if(_6e.imageView){
_6f=CGRectGetWidth(objj_msgSend(_6e.imageView,"frame"));
}
}
}
}
var _70=_6f-CGRectGetWidth(_6e.frame);
if(!_70){
return;
}
var _71=objj_msgSend(_6b,"frame");
objj_msgSend(_6b,"setFrameSize:",CGSizeMake(CGRectGetWidth(_71)+_70,CGRectGetHeight(_71)));
_6e.frame.size.width=_6f;
var _72=_6d+1;
for(;_72<_segmentCount;++_72){
_segments[_72].frame.origin.x+=_70;
objj_msgSend(_6b,"drawSegmentBezel:highlight:",_72,NO);
objj_msgSend(_6b,"drawSegment:highlight:",_72,NO);
}
objj_msgSend(_6b,"drawSegmentBezel:highlight:",_6d,NO);
objj_msgSend(_6b,"drawSegment:highlight:",_6d,NO);
}
}),new objj_method(sel_getUid("frameForSegment:"),function(_73,_74,_75){
with(_73){
return _segments[_75].frame;
}
}),new objj_method(sel_getUid("testSegment:"),function(_76,_77,_78){
with(_76){
var _79=objj_msgSend(_76,"convertPoint:fromView:",_78,nil),_7a=_segments.length;
while(_7a--){
if(CGRectContainsPoint(_segments[_7a].frame,_78)){
return _7a;
}
}
return -1;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_7b,_7c,_7d){
with(_7b){
if(!objj_msgSend(_7b,"isEnabled")){
return;
}
objj_msgSend(_7b,"trackSegment:",_7d);
}
}),new objj_method(sel_getUid("mouseUp:"),function(_7e,_7f,_80){
with(_7e){
}
}),new objj_method(sel_getUid("trackSegment:"),function(_81,_82,_83){
with(_81){
var _84=objj_msgSend(_83,"type"),_85=objj_msgSend(_81,"convertPoint:fromView:",objj_msgSend(_83,"locationInWindow"),nil);
if(_84==CPLeftMouseUp){
if(CGRectContainsPoint(_segments[_trackingSegment].frame,_85)){
if(_trackingMode==CPSegmentSwitchTrackingSelectAny){
objj_msgSend(_81,"setSelected:forSegment:",!objj_msgSend(_81,"isSelectedForSegment:",_trackingSegment),_trackingSegment);
_selectedSegment=_trackingSegment;
}else{
objj_msgSend(_81,"setSelected:forSegment:",YES,_trackingSegment);
}
objj_msgSend(_81,"sendAction:to:",objj_msgSend(_81,"action"),objj_msgSend(_81,"target"));
if(_trackingMode==CPSegmentSwitchTrackingMomentary){
objj_msgSend(_81,"setSelected:forSegment:",NO,_trackingSegment);
_selectedSegment=-1;
}
}
objj_msgSend(_81,"drawSegmentBezel:highlight:",_trackingSegment,NO);
_trackingSegment=-1;
return;
}
if(_84==CPLeftMouseDown){
_trackingHighlighted=YES;
_trackingSegment=objj_msgSend(_81,"testSegment:",_85);
objj_msgSend(_81,"drawSegmentBezel:highlight:",_trackingSegment,YES);
}else{
if(_84==CPLeftMouseDragged){
var _86=CGRectContainsPoint(_segments[_trackingSegment].frame,_85);
if(_86!=_trackingHighlighted){
_trackingHighlighted=_86;
objj_msgSend(_81,"drawSegmentBezel:highlight:",_trackingSegment,_trackingHighlighted);
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_81,sel_getUid("trackSegment:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("setFont:"),function(_87,_88,_89){
with(_87){
objj_msgSendSuper({receiver:_87,super_class:objj_getClass("CPControl")},"setFont:",_89);
var _8a=_segmentCount;
if(!_8a){
return;
}
while(_8a--){
objj_msgSend(_segments[_8a].labelView,"setFont:",_89);
}
objj_msgSend(_87,"tileWithChangedSegment:",0);
}
})]);
var _d=function(){
return {width:0,image:nil,label:"",menu:nil,selected:NO,enabled:NO,tag:0,labelView:nil,imageView:nil,frame:CGRectMakeZero()};
};
p;10;CPShadow.jI;21;Foundation/CPObject.jc;1307;
var _1=objj_allocateClassPair(CPObject,"CPShadow"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_offset"),new objj_ivar("_blurRadius"),new objj_ivar("_color"),new objj_ivar("_cssString")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("_initWithOffset:blurRadius:color:"),function(_3,_4,_5,_6,_7){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_offset=_5;
_blurRadius=_6;
_color=_7;
_cssString=objj_msgSend(_color,"cssString")+" "+Math.round(_5.width)+"px "+Math.round(_5.height)+"px "+Math.round(_blurRadius)+"px";
}
return _3;
}
}),new objj_method(sel_getUid("shadowOffset"),function(_8,_9){
with(_8){
return _offset;
}
}),new objj_method(sel_getUid("shadowBlurRadius"),function(_a,_b){
with(_a){
return _blurRadius;
}
}),new objj_method(sel_getUid("shadowColor"),function(_c,_d){
with(_c){
return _color;
}
}),new objj_method(sel_getUid("cssString"),function(_e,_f){
with(_e){
return _cssString;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("shadowWithOffset:blurRadius:color:"),function(_10,_11,_12,_13,_14){
with(_10){
return objj_msgSend(objj_msgSend(CPShadow,"alloc"),"_initWithOffset:blurRadius:color:",_12,_13,_14);
}
})]);
p;14;CPShadowView.jI;21;Foundation/CPBundle.ji;12;CGGeometry.ji;9;CPImage.ji;13;CPImageView.ji;8;CPView.jc;5564;
CPLightShadow=0;
CPHeavyShadow=1;
var _1=nil,_2=nil;
var _3=3,_4=3,_5=3,_6=5,_7=7,_8=7,_9=5,_a=5;
var _b=objj_allocateClassPair(CPView,"CPShadowView"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("_weight")]);
objj_registerClassPair(_b);
objj_addClassForBundle(_b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_b,[new objj_method(sel_getUid("initWithFrame:"),function(_d,_e,_f){
with(_d){
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPView")},"initWithFrame:",_f);
if(_d){
_weight=CPLightShadow;
objj_msgSend(_d,"setBackgroundColor:",_1);
objj_msgSend(_d,"setHitTests:",NO);
}
return _d;
}
}),new objj_method(sel_getUid("setWeight:"),function(_10,_11,_12){
with(_10){
if(_weight==_12){
return;
}
_weight=_12;
if(_weight==CPLightShadow){
objj_msgSend(_10,"setBackgroundColor:",_1);
}else{
objj_msgSend(_10,"setBackgroundColor:",_2);
}
}
}),new objj_method(sel_getUid("leftInset"),function(_13,_14){
with(_13){
return _weight==CPLightShadow?_3:_7;
}
}),new objj_method(sel_getUid("rightInset"),function(_15,_16){
with(_15){
return _weight==CPLightShadow?_4:_8;
}
}),new objj_method(sel_getUid("topInset"),function(_17,_18){
with(_17){
return _weight==CPLightShadow?_5:_9;
}
}),new objj_method(sel_getUid("bottomInset"),function(_19,_1a){
with(_19){
return _weight==CPLightShadow?_6:_a;
}
}),new objj_method(sel_getUid("horizontalInset"),function(_1b,_1c){
with(_1b){
if(_weight==CPLightShadow){
return _3+_4;
}
return _7+_8;
}
}),new objj_method(sel_getUid("verticalInset"),function(_1d,_1e){
with(_1d){
if(_weight==CPLightShadow){
return _5+_6;
}
return _9+_a;
}
}),new objj_method(sel_getUid("frameForContentFrame:"),function(_1f,_20,_21){
with(_1f){
return objj_msgSend(objj_msgSend(_1f,"class"),"frameForContentFrame:withWeight:",_21,_weight);
}
}),new objj_method(sel_getUid("setFrameForContentFrame:"),function(_22,_23,_24){
with(_22){
objj_msgSend(_22,"setFrame:",objj_msgSend(_22,"frameForContentFrame:",_24));
}
})]);
class_addMethods(_c,[new objj_method(sel_getUid("initialize"),function(_25,_26){
with(_25){
if(_25!=objj_msgSend(CPShadowView,"class")){
return;
}
var _27=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_25,"class"));
_1=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightTopLeft.png"),CGSizeMake(9,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightTop.png"),CGSizeMake(1,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightTopRight.png"),CGSizeMake(9,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightLeft.png"),CGSizeMake(9,1)),nil,objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightRight.png"),CGSizeMake(9,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightBottomLeft.png"),CGSizeMake(9,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightBottom.png"),CGSizeMake(1,9)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewLightBottomRight.png"),CGSizeMake(9,9))]));
_2=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyTopLeft.png"),CGSizeMake(17,17)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyTop.png"),CGSizeMake(1,17)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyTopRight.png"),CGSizeMake(17,17)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyLeft.png"),CGSizeMake(17,1)),nil,objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyRight.png"),CGSizeMake(17,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyBottomLeft.png"),CGSizeMake(17,17)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyBottom.png"),CGSizeMake(1,17)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_27,"pathForResource:","CPShadowView/CPShadowViewHeavyBottomRight.png"),CGSizeMake(17,17))]));
}
}),new objj_method(sel_getUid("frameForContentFrame:withWeight:"),function(_28,_29,_2a,_2b){
with(_28){
if(_2b==CPLightShadow){
return CGRectMake((_2a.origin.x)-_3,(_2a.origin.y)-_5,(_2a.size.width)+_3+_4,(_2a.size.height)+_5+_6);
}else{
return CGRectMake((_2a.origin.x)-_7,(_2a.origin.y)-_9,(_2a.size.width)+_7+_8,(_2a.size.height)+_9+_a);
}
}
})]);
p;10;CPSlider.ji;11;CPControl.jc;10485;
var _1=nil,_2=nil,_3=nil,_4=nil;
var _5=objj_allocateClassPair(CPControl,"CPSlider"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_minValue"),new objj_ivar("_maxValue"),new objj_ivar("_altIncrementValue"),new objj_ivar("_isVertical"),new objj_ivar("_bar"),new objj_ivar("_knob"),new objj_ivar("_standardKnob"),new objj_ivar("_standardVerticalBar"),new objj_ivar("_standardHorizontalBar")]);
objj_registerClassPair(_5);
objj_addClassForBundle(_5,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_5,[new objj_method(sel_getUid("initWithFrame:"),function(_7,_8,_9){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPControl")},"initWithFrame:",_9);
if(_7){
_value=50;
_minValue=0;
_maxValue=100;
_bar=objj_msgSend(_7,"bar");
_knob=objj_msgSend(_7,"knob");
_knobSize=objj_msgSend(objj_msgSend(_7,"knobImage"),"size");
_isVertical=objj_msgSend(_7,"isVertical");
objj_msgSend(_7,"setContinuous:",YES);
objj_msgSend(_knob,"setFrameOrigin:",objj_msgSend(_7,"knobPosition"));
objj_msgSend(_7,"addSubview:",_bar);
objj_msgSend(_7,"addSubview:",_knob);
}
return _7;
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_a,_b,_c){
with(_a){
if(_c.height>21){
_c.height=21;
}
if(_isVertical!=objj_msgSend(_a,"isVertical")){
_isVertical=objj_msgSend(_a,"isVertical");
var _d=objj_msgSend(_a,"bar"),_e=objj_msgSend(_a,"knob");
if(_bar!=_d){
objj_msgSend(_a,"replaceSubview:withView:",_bar=_d,_bar);
}
if(_knob!=_e){
objj_msgSend(_a,"replaceSubview:withView:",_e,_knob);
_knob=_e;
objj_msgSend(_knob,"setFrameOrigin:",objj_msgSend(_a,"knobPosition"));
}
}
objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPControl")},"setFrameSize:",_c);
objj_msgSend(_knob,"setFrameOrigin:",objj_msgSend(_a,"knobPosition"));
}
}),new objj_method(sel_getUid("altIncrementValue"),function(_f,_10){
with(_f){
return _altIncrementValue;
}
}),new objj_method(sel_getUid("setAltIncrementValue:"),function(_11,_12,_13){
with(_11){
_altIncrementValue=_13;
}
}),new objj_method(sel_getUid("isContinuous"),function(_14,_15){
with(_14){
return (_sendActionOn&CPLeftMouseDraggedMask)!=0;
}
}),new objj_method(sel_getUid("setContinuous:"),function(_16,_17,_18){
with(_16){
if(_18){
_sendActionOn|=CPLeftMouseDraggedMask;
}else{
_sendActionOn&=~CPLeftMouseDraggedMask;
}
}
}),new objj_method(sel_getUid("knobThickness"),function(_19,_1a){
with(_19){
return CPRectGetWidth(objj_msgSend(_knob,"frame"));
}
}),new objj_method(sel_getUid("leftTrackImage"),function(_1b,_1c){
with(_1b){
return _2;
}
}),new objj_method(sel_getUid("rightTrackImage"),function(_1d,_1e){
with(_1d){
return _3;
}
}),new objj_method(sel_getUid("centerTrackImage"),function(_1f,_20){
with(_1f){
return _4;
}
}),new objj_method(sel_getUid("knobImage"),function(_21,_22){
with(_21){
return CPSliderKnobImage;
}
}),new objj_method(sel_getUid("pushedKnobImage"),function(_23,_24){
with(_23){
return CPSliderKnobPushedImage;
}
}),new objj_method(sel_getUid("knob"),function(_25,_26){
with(_25){
if(!_standardKnob){
var _27=objj_msgSend(_25,"knobImage"),_28=objj_msgSend(_27,"size");
_standardKnob=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CPRectMake(0,0,_28.width,_28.height));
objj_msgSend(_standardKnob,"setImage:",_27);
}
return _standardKnob;
}
}),new objj_method(sel_getUid("bar"),function(_29,_2a){
with(_29){
if(objj_msgSend(_29,"isVertical")){
return nil;
}else{
if(!_standardHorizontalBar){
var _2b=objj_msgSend(_29,"frame"),_2c=CPRectMake(0,0,CPRectGetWidth(_2b),4);
_standardHorizontalBar=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_2c);
objj_msgSend(_standardHorizontalBar,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(_29,"leftTrackImage"),objj_msgSend(_29,"centerTrackImage"),objj_msgSend(_29,"rightTrackImage")],NO)));
objj_msgSend(_standardHorizontalBar,"setFrame:",CPRectMake(0,(CPRectGetHeight(_2b)-CPRectGetHeight(_2c))/2,CPRectGetWidth(_isVertical?_2c:_2b),CPRectGetHeight(_isVertical?_2b:_2c)));
objj_msgSend(_standardHorizontalBar,"setAutoresizingMask:",_isVertical?CPViewHeightSizable:CPViewWidthSizable);
}
return _standardHorizontalBar;
}
}
}),new objj_method(sel_getUid("isVertical"),function(_2d,_2e){
with(_2d){
var _2f=objj_msgSend(_2d,"frame");
if(CPRectGetWidth(_2f)==CPRectGetHeight(_2f)){
return -1;
}
return CPRectGetWidth(_2f)<CPRectGetHeight(_2f);
}
}),new objj_method(sel_getUid("maxValue"),function(_30,_31){
with(_30){
return _maxValue;
}
}),new objj_method(sel_getUid("minValue"),function(_32,_33){
with(_32){
return _minValue;
}
}),new objj_method(sel_getUid("setMaxValue:"),function(_34,_35,_36){
with(_34){
_maxValue=_36;
}
}),new objj_method(sel_getUid("setMinValue:"),function(_37,_38,_39){
with(_37){
_minValue=_39;
}
}),new objj_method(sel_getUid("setValue:"),function(_3a,_3b,_3c){
with(_3a){
objj_msgSend(_3a,"setObjectValue:",_3c);
}
}),new objj_method(sel_getUid("value"),function(_3d,_3e){
with(_3d){
return objj_msgSend(_3d,"floatValue");
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_3f,_40,_41){
with(_3f){
objj_msgSendSuper({receiver:_3f,super_class:objj_getClass("CPControl")},"setObjectValue:",_41);
if(_knob){
objj_msgSend(_knob,"setFrameOrigin:",objj_msgSend(_3f,"knobPosition"));
}
}
}),new objj_method(sel_getUid("knobPosition"),function(_42,_43){
with(_42){
if(objj_msgSend(_42,"isVertical")){
return CPPointMake(0,0);
}else{
return CPPointMake(((objj_msgSend(_42,"floatValue")-_minValue)/(_maxValue-_minValue))*(CPRectGetWidth(objj_msgSend(_42,"frame"))-CPRectGetWidth(objj_msgSend(_knob,"frame"))),(CPRectGetHeight(objj_msgSend(_42,"frame"))-CPRectGetHeight(objj_msgSend(_knob,"frame")))/2);
}
}
}),new objj_method(sel_getUid("valueForKnobPosition:"),function(_44,_45,_46){
with(_44){
if(objj_msgSend(_44,"isVertical")){
return 0;
}else{
return MAX(MIN((_46.x)*(_maxValue-_minValue)/(CPRectGetWidth(objj_msgSend(_44,"frame"))-CPRectGetWidth(objj_msgSend(_knob,"frame")))+_minValue,_maxValue),_minValue);
}
}
}),new objj_method(sel_getUid("constrainKnobPosition:"),function(_47,_48,_49){
with(_47){
_49.x-=_knobSize.width/2;
return CPPointMake(MAX(MIN(CPRectGetWidth(objj_msgSend(_47,"bounds"))-_knobSize.width,_49.x),0),(CPRectGetHeight(objj_msgSend(_47,"bounds"))-CPRectGetHeight(objj_msgSend(_knob,"frame")))/2);
}
}),new objj_method(sel_getUid("mouseUp:"),function(_4a,_4b,_4c){
with(_4a){
objj_msgSend(objj_msgSend(_4a,"knob"),"setImage:",objj_msgSend(_4a,"knobImage"));
if(objj_msgSend(_target,"respondsToSelector:",sel_getUid("sliderDidFinish:"))){
objj_msgSend(_target,"sliderDidFinish:",_4a);
}
if(_sendActionOn&CPLeftMouseUpMask){
objj_msgSend(_4a,"sendAction:to:",_action,_target);
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_4d,_4e,_4f){
with(_4d){
objj_msgSend(_knob,"setFrameOrigin:",objj_msgSend(_4d,"constrainKnobPosition:",objj_msgSend(_4d,"convertPoint:fromView:",objj_msgSend(_4f,"locationInWindow"),nil)));
objj_msgSendSuper({receiver:_4d,super_class:objj_getClass("CPControl")},"setObjectValue:",objj_msgSend(_4d,"valueForKnobPosition:",objj_msgSend(_knob,"frame").origin));
objj_msgSend(objj_msgSend(_4d,"knob"),"setImage:",objj_msgSend(_4d,"pushedKnobImage"));
if(_sendActionOn&CPLeftMouseDraggedMask){
objj_msgSend(_4d,"sendAction:to:",_action,_target);
}
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_50,_51,_52){
with(_50){
objj_msgSend(_knob,"setFrameOrigin:",objj_msgSend(_50,"constrainKnobPosition:",objj_msgSend(_50,"convertPoint:fromView:",objj_msgSend(_52,"locationInWindow"),nil)));
objj_msgSendSuper({receiver:_50,super_class:objj_getClass("CPControl")},"setObjectValue:",objj_msgSend(_50,"valueForKnobPosition:",objj_msgSend(_knob,"frame").origin));
if(_sendActionOn&CPLeftMouseDraggedMask){
objj_msgSend(_50,"sendAction:to:",_action,_target);
}
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("initialize"),function(_53,_54){
with(_53){
if(_53!=objj_msgSend(CPSlider,"class")){
return;
}
var _55=objj_msgSend(CPBundle,"bundleForClass:",_53);
CPSliderKnobImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_55,"pathForResource:","CPSlider/CPSliderKnobRegular.png"),CPSizeMake(11,11)),CPSliderKnobPushedImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_55,"pathForResource:","CPSlider/CPSliderKnobRegularPushed.png"),CPSizeMake(11,11)),_2=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_55,"pathForResource:","CPSlider/CPSliderTrackHorizontalLeft.png"),CPSizeMake(2,4)),_3=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_55,"pathForResource:","CPSlider/CPSliderTrackHorizontalRight.png"),CPSizeMake(2,4)),_4=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_55,"pathForResource:","CPSlider/CPSliderTrackHorizontalCenter.png"),CPSizeMake(1,4));
}
})]);
var _56="CPSliderMinValueKey",_57="CPSliderMaxValueKey",_58="CPSliderAltIncrValueKey",_59="CPSliderIsVerticalKey";
var _5=objj_getClass("CPSlider");
if(!_5){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSlider\""));
}
var _6=_5.isa;
class_addMethods(_5,[new objj_method(sel_getUid("initWithCoder:"),function(_5a,_5b,_5c){
with(_5a){
_5a=objj_msgSendSuper({receiver:_5a,super_class:objj_getClass("CPControl")},"initWithCoder:",_5c);
if(_5a){
_minValue=objj_msgSend(_5c,"decodeDoubleForKey:",_56);
_maxValue=objj_msgSend(_5c,"decodeDoubleForKey:",_57);
_altIncrementValue=objj_msgSend(_5c,"decodeDoubleForKey:",_58);
_isVertical=objj_msgSend(_5c,"decodeDoubleForKey:",_59);
_bar=objj_msgSend(_5a,"bar");
_knob=objj_msgSend(_5a,"knob");
_knobSize=objj_msgSend(objj_msgSend(_5a,"knobImage"),"size");
_isVertical=objj_msgSend(_5a,"isVertical");
objj_msgSend(_knob,"setFrameOrigin:",objj_msgSend(_5a,"knobPosition"));
objj_msgSend(_5a,"addSubview:",_bar);
objj_msgSend(_5a,"addSubview:",_knob);
}
return _5a;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_5d,_5e,_5f){
with(_5d){
var _60=_subviews;
_subviews=[];
objj_msgSendSuper({receiver:_5d,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_5f);
_subviews=_60;
objj_msgSend(_5f,"encodeDouble:forKey:",_minValue,_56);
objj_msgSend(_5f,"encodeDouble:forKey:",_maxValue,_57);
objj_msgSend(_5f,"encodeDouble:forKey:",_altIncrementValue,_58);
objj_msgSend(_5f,"encodeBool:forKey:",_isVertical,_59);
}
})]);
p;21;CPSliderColorPicker.ji;15;CPColorPicker.jc;13627;
var _1=objj_allocateClassPair(CPColorPicker,"CPSliderColorPicker"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_contentView"),new objj_ivar("_redSlider"),new objj_ivar("_greenSlider"),new objj_ivar("_blueSlider"),new objj_ivar("_hueSlider"),new objj_ivar("_saturationSlider"),new objj_ivar("_brightnessSlider"),new objj_ivar("_rgbLabel"),new objj_ivar("_hsbLabel"),new objj_ivar("_redLabel"),new objj_ivar("_greenLabel"),new objj_ivar("_blueLabel"),new objj_ivar("_hueLabel"),new objj_ivar("_saturationLabel"),new objj_ivar("_brightnessLabel"),new objj_ivar("_hexLabel"),new objj_ivar("_redValue"),new objj_ivar("_greenValue"),new objj_ivar("_blueValue"),new objj_ivar("_hueValue"),new objj_ivar("_saturationValue"),new objj_ivar("_brightnessValue"),new objj_ivar("_hexValue")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithPickerMask:colorPanel:"),function(_3,_4,_5,_6){
with(_3){
return objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPColorPicker")},"initWithPickerMask:colorPanel:",_5,_6);
}
}),new objj_method(sel_getUid("initView"),function(_7,_8){
with(_7){
aFrame=CPRectMake(0,0,CPColorPickerViewWidth,CPColorPickerViewHeight);
_contentView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",aFrame);
objj_msgSend(_contentView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
_rgbLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,10,100,20));
objj_msgSend(_rgbLabel,"setStringValue:","RGB");
objj_msgSend(_rgbLabel,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
_redLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,35,15,20));
objj_msgSend(_redLabel,"setStringValue:","R");
objj_msgSend(_redLabel,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
_redSlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CPRectMake(15,35,aFrame.size.width-70,20));
objj_msgSend(_redSlider,"setMaxValue:",1);
objj_msgSend(_redSlider,"setMinValue:",0);
objj_msgSend(_redSlider,"setTarget:",_7);
objj_msgSend(_redSlider,"setAction:",sel_getUid("sliderChanged:"));
objj_msgSend(_redSlider,"setAutoresizingMask:",CPViewWidthSizable);
var _9=function(_a){
if(isNaN(this.value)){
return;
}
switch(this){
case _redValue:
objj_msgSend(_redSlider,"setFloatValue:",MAX(MIN(ROUND(this.value),255)/255,0));
break;
case _greenValue:
objj_msgSend(_greenSlider,"setFloatValue:",MAX(MIN(ROUND(this.value),255)/255,0));
break;
case _blueValue:
objj_msgSend(_blueSlider,"setFloatValue:",MAX(MIN(ROUND(this.value),255)/255,0));
break;
case _hueValue:
objj_msgSend(_hueSlider,"setFloatValue:",MAX(MIN(ROUND(this.value),360),0));
break;
case _saturationValue:
objj_msgSend(_saturationSlider,"setFloatValue:",MAX(MIN(ROUND(this.value),100),0));
break;
case _brightnessValue:
objj_msgSend(_brightnessSlider,"setFloatValue:",MAX(MIN(ROUND(this.value),100),0));
break;
}
this.blur();
};
var _b=function(_c){
_c=_c||window.event;
if(_c.keyCode==13){
_9(_c);
if(_c.preventDefault){
_c.preventDefault();
}else{
if(_c.stopPropagation){
_c.stopPropagation();
}
}
}
};
var _d=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(aFrame.size.width-45,35,45,20));
objj_msgSend(_d,"setAutoresizingMask:",CPViewMinXMargin);
_redValue=document.createElement("input");
_redValue.style.width="40px";
_redValue.style.backgroundColor="transparent";
_redValue.style.border="1px solid white";
_redValue.style.color="white";
_redValue.style.position="absolute";
_redValue.style.top="0px";
_redValue.style.left="0px";
_redValue.onchange=_9;
_d._DOMElement.appendChild(_redValue);
objj_msgSend(_contentView,"addSubview:",_d);
_greenLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,58,15,20));
objj_msgSend(_greenLabel,"setStringValue:","G");
objj_msgSend(_greenLabel,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
_greenSlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CPRectMake(15,58,aFrame.size.width-70,20));
objj_msgSend(_greenSlider,"setMaxValue:",1);
objj_msgSend(_greenSlider,"setMinValue:",0);
objj_msgSend(_greenSlider,"setTarget:",_7);
objj_msgSend(_greenSlider,"setAction:",sel_getUid("sliderChanged:"));
objj_msgSend(_greenSlider,"setAutoresizingMask:",CPViewWidthSizable);
var _e=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(aFrame.size.width-45,58,45,20));
objj_msgSend(_e,"setAutoresizingMask:",CPViewMinXMargin);
_greenValue=_redValue.cloneNode(false);
_greenValue.onchange=_9;
_e._DOMElement.appendChild(_greenValue);
objj_msgSend(_contentView,"addSubview:",_e);
_blueLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,81,15,20));
objj_msgSend(_blueLabel,"setStringValue:","B");
objj_msgSend(_blueLabel,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
_blueSlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CPRectMake(15,81,aFrame.size.width-70,20));
objj_msgSend(_blueSlider,"setMaxValue:",1);
objj_msgSend(_blueSlider,"setMinValue:",0);
objj_msgSend(_blueSlider,"setTarget:",_7);
objj_msgSend(_blueSlider,"setAction:",sel_getUid("sliderChanged:"));
objj_msgSend(_blueSlider,"setAutoresizingMask:",CPViewWidthSizable);
var _f=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(aFrame.size.width-45,81,45,20));
objj_msgSend(_f,"setAutoresizingMask:",CPViewMinXMargin);
_blueValue=_redValue.cloneNode(false);
_blueValue.onchange=_9;
_f._DOMElement.appendChild(_blueValue);
objj_msgSend(_contentView,"addSubview:",_f);
_hsbLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,120,100,20));
objj_msgSend(_hsbLabel,"setStringValue:","HSB");
objj_msgSend(_hsbLabel,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
_hueLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,145,15,20));
objj_msgSend(_hueLabel,"setStringValue:","H");
objj_msgSend(_hueLabel,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
_hueSlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CPRectMake(15,145,aFrame.size.width-70,20));
objj_msgSend(_hueSlider,"setMaxValue:",359);
objj_msgSend(_hueSlider,"setMinValue:",0);
objj_msgSend(_hueSlider,"setTarget:",_7);
objj_msgSend(_hueSlider,"setAction:",sel_getUid("sliderChanged:"));
objj_msgSend(_hueSlider,"setAutoresizingMask:",CPViewWidthSizable);
var _10=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(aFrame.size.width-45,145,45,20));
objj_msgSend(_10,"setAutoresizingMask:",CPViewMinXMargin);
_hueValue=_redValue.cloneNode(false);
_hueValue.onchange=_9;
_10._DOMElement.appendChild(_hueValue);
objj_msgSend(_contentView,"addSubview:",_10);
_saturationLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,168,15,20));
objj_msgSend(_saturationLabel,"setStringValue:","S");
objj_msgSend(_saturationLabel,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
_saturationSlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CPRectMake(15,168,aFrame.size.width-70,20));
objj_msgSend(_saturationSlider,"setMaxValue:",100);
objj_msgSend(_saturationSlider,"setMinValue:",0);
objj_msgSend(_saturationSlider,"setTarget:",_7);
objj_msgSend(_saturationSlider,"setAction:",sel_getUid("sliderChanged:"));
objj_msgSend(_saturationSlider,"setAutoresizingMask:",CPViewWidthSizable);
var _11=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(aFrame.size.width-45,168,45,20));
objj_msgSend(_11,"setAutoresizingMask:",CPViewMinXMargin);
_saturationValue=_redValue.cloneNode(false);
_saturationValue.onchange=_9;
_11._DOMElement.appendChild(_saturationValue);
objj_msgSend(_contentView,"addSubview:",_11);
_brightnessLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,191,15,20));
objj_msgSend(_brightnessLabel,"setStringValue:","B");
objj_msgSend(_brightnessLabel,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
_brightnessSlider=objj_msgSend(objj_msgSend(CPSlider,"alloc"),"initWithFrame:",CPRectMake(15,191,aFrame.size.width-70,20));
objj_msgSend(_brightnessSlider,"setMaxValue:",100);
objj_msgSend(_brightnessSlider,"setMinValue:",0);
objj_msgSend(_brightnessSlider,"setTarget:",_7);
objj_msgSend(_brightnessSlider,"setAction:",sel_getUid("sliderChanged:"));
objj_msgSend(_brightnessSlider,"setAutoresizingMask:",CPViewWidthSizable);
var _12=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CPRectMake(aFrame.size.width-45,191,45,20));
objj_msgSend(_12,"setAutoresizingMask:",CPViewMinXMargin);
_brightnessValue=_redValue.cloneNode(false);
_brightnessValue.onchange=_9;
_12._DOMElement.appendChild(_brightnessValue);
objj_msgSend(_contentView,"addSubview:",_12);
_hexLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CPRectMake(0,230,100,20));
objj_msgSend(_hexLabel,"setStringValue:","Hex");
objj_msgSend(_hexLabel,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
_hexValue=_redValue.cloneNode(false);
_hexValue.style.top="255px";
_hexValue.style.width="80px";
_hexValue.style.left="0px";
_hexValue.onkeypress=function(_13){
_13=_13||window.event;
if(_13.keyCode==13){
var _14=objj_msgSend(CPColor,"colorWithHexString:",this.value);
if(_14){
objj_msgSend(_7,"setColor:",_14);
objj_msgSend(objj_msgSend(_7,"colorPanel"),"setColor:",_14);
}
if(_13.preventDefault){
_13.preventDefault();
}else{
if(_13.stopPropagation){
_13.stopPropagation();
}
}
this.blur();
}
};
_contentView._DOMElement.appendChild(_hexValue);
objj_msgSend(_contentView,"addSubview:",_rgbLabel);
objj_msgSend(_contentView,"addSubview:",_redLabel);
objj_msgSend(_contentView,"addSubview:",_greenLabel);
objj_msgSend(_contentView,"addSubview:",_blueLabel);
objj_msgSend(_contentView,"addSubview:",_redSlider);
objj_msgSend(_contentView,"addSubview:",_greenSlider);
objj_msgSend(_contentView,"addSubview:",_blueSlider);
objj_msgSend(_contentView,"addSubview:",_hsbLabel);
objj_msgSend(_contentView,"addSubview:",_hueLabel);
objj_msgSend(_contentView,"addSubview:",_saturationLabel);
objj_msgSend(_contentView,"addSubview:",_brightnessLabel);
objj_msgSend(_contentView,"addSubview:",_hueSlider);
objj_msgSend(_contentView,"addSubview:",_saturationSlider);
objj_msgSend(_contentView,"addSubview:",_brightnessSlider);
objj_msgSend(_contentView,"addSubview:",_hexLabel);
}
}),new objj_method(sel_getUid("provideNewView:"),function(_15,_16,_17){
with(_15){
if(_17){
objj_msgSend(_15,"initView");
}
return _contentView;
}
}),new objj_method(sel_getUid("currentMode"),function(_18,_19){
with(_18){
return CPSliderColorPickerMode;
}
}),new objj_method(sel_getUid("supportsMode:"),function(_1a,_1b,_1c){
with(_1a){
return (_1c==CPSliderColorPickerMode)?YES:NO;
}
}),new objj_method(sel_getUid("sliderChanged:"),function(_1d,_1e,_1f){
with(_1d){
var _20;
switch(_1f){
case _hueSlider:
case _saturationSlider:
case _brightnessSlider:
_20=objj_msgSend(CPColor,"colorWithHue:saturation:brightness:",objj_msgSend(_hueSlider,"floatValue"),objj_msgSend(_saturationSlider,"floatValue"),objj_msgSend(_brightnessSlider,"floatValue"));
objj_msgSend(_1d,"updateRGBSliders:",_20);
break;
case _redSlider:
case _greenSlider:
case _blueSlider:
_20=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",objj_msgSend(_redSlider,"floatValue"),objj_msgSend(_greenSlider,"floatValue"),objj_msgSend(_blueSlider,"floatValue"),1);
objj_msgSend(_1d,"updateHSBSliders:",_20);
break;
}
objj_msgSend(_1d,"updateLabels");
objj_msgSend(_1d,"updateHex:",_20);
objj_msgSend(objj_msgSend(_1d,"colorPanel"),"setColor:",_20);
}
}),new objj_method(sel_getUid("setColor:"),function(_21,_22,_23){
with(_21){
objj_msgSend(_21,"updateRGBSliders:",_23);
objj_msgSend(_21,"updateHSBSliders:",_23);
objj_msgSend(_21,"updateHex:",_23);
objj_msgSend(_21,"updateLabels");
}
}),new objj_method(sel_getUid("updateHSBSliders:"),function(_24,_25,_26){
with(_24){
var hsb=objj_msgSend(_26,"hsbComponents");
objj_msgSend(_hueSlider,"setFloatValue:",hsb[0]);
objj_msgSend(_saturationSlider,"setFloatValue:",hsb[1]);
objj_msgSend(_brightnessSlider,"setFloatValue:",hsb[2]);
}
}),new objj_method(sel_getUid("updateHex:"),function(_28,_29,_2a){
with(_28){
_hexValue.value=objj_msgSend(_2a,"hexString");
}
}),new objj_method(sel_getUid("updateRGBSliders:"),function(_2b,_2c,_2d){
with(_2b){
var rgb=objj_msgSend(_2d,"components");
objj_msgSend(_redSlider,"setFloatValue:",rgb[0]);
objj_msgSend(_greenSlider,"setFloatValue:",rgb[1]);
objj_msgSend(_blueSlider,"setFloatValue:",rgb[2]);
}
}),new objj_method(sel_getUid("updateLabels"),function(_2f,_30){
with(_2f){
_hueValue.value=ROUND(objj_msgSend(_hueSlider,"floatValue"));
_saturationValue.value=ROUND(objj_msgSend(_saturationSlider,"floatValue"));
_brightnessValue.value=ROUND(objj_msgSend(_brightnessSlider,"floatValue"));
_redValue.value=ROUND(objj_msgSend(_redSlider,"floatValue")*255);
_greenValue.value=ROUND(objj_msgSend(_greenSlider,"floatValue")*255);
_blueValue.value=ROUND(objj_msgSend(_blueSlider,"floatValue")*255);
}
}),new objj_method(sel_getUid("provideNewButtonImage"),function(_31,_32){
with(_31){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",CPColorPicker),"pathForResource:","slider_button.png"),CGSizeMake(32,32));
}
}),new objj_method(sel_getUid("provideNewAlternateButtonImage"),function(_33,_34){
with(_33){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",CPColorPicker),"pathForResource:","slider_button_h.png"),CGSizeMake(32,32));
}
})]);
p;13;CPSplitView.ji;9;CPImage.ji;8;CPView.jc;17500;
CPSplitViewDidResizeSubviewsNotification="CPSplitViewDidResizeSubviewsNotification";
CPSplitViewWillResizeSubviewsNotification="CPSplitViewWillResizeSubviewsNotification";
var _1=nil,_2=nil;
var _3=objj_allocateClassPair(CPView,"CPSplitView"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_delegate"),new objj_ivar("_isVertical"),new objj_ivar("_isPaneSplitter"),new objj_ivar("_currentDivider"),new objj_ivar("_initialOffset"),new objj_ivar("_originComponent"),new objj_ivar("_sizeComponent"),new objj_ivar("_DOMDividerElements"),new objj_ivar("_dividerImagePath"),new objj_ivar("_drawingDivider"),new objj_ivar("_needsResizeSubviews")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initWithFrame:"),function(_5,_6,_7){
with(_5){
if(_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPView")},"initWithFrame:",_7)){
_currentDivider=CPNotFound;
_DOMDividerElements=[];
objj_msgSend(_5,"_setVertical:",YES);
}
return _5;
}
}),new objj_method(sel_getUid("dividerThickness"),function(_8,_9){
with(_8){
return _isPaneSplitter?1:10;
}
}),new objj_method(sel_getUid("isVertical"),function(_a,_b){
with(_a){
return _isVertical;
}
}),new objj_method(sel_getUid("setVertical:"),function(_c,_d,_e){
with(_c){
if(!objj_msgSend(_c,"_setVertical:",_e)){
return;
}
var _f=objj_msgSend(_c,"frame"),_10=objj_msgSend(_c,"dividerThickness");
objj_msgSend(_c,"_postNotificationWillResize");
var _11=ROUND((_f.size[_sizeComponent]-_10*(_subviews.length-1))/_subviews.length),_12=0,_13=_subviews.length;
if(objj_msgSend(_c,"isVertical")){
for(;_12<_13;++_12){
objj_msgSend(_subviews[_12],"setFrame:",CGRectMake(ROUND((_11+_10)*_12),0,_11,_f.size.height));
}
}else{
for(;_12<_13;++_12){
objj_msgSend(_subviews[_12],"setFrame:",CGRectMake(0,ROUND((_11+_10)*_12),_f.size.width,_11));
}
}
objj_msgSend(_c,"setNeedsDisplay:",YES);
objj_msgSend(_c,"_postNotificationDidResize");
}
}),new objj_method(sel_getUid("_setVertical:"),function(_14,_15,_16){
with(_14){
var _17=(_isVertical!=_16);
_isVertical=_16;
_originComponent=objj_msgSend(_14,"isVertical")?"x":"y";
_sizeComponent=objj_msgSend(_14,"isVertical")?"width":"height";
_dividerImagePath=objj_msgSend(_14,"isVertical")?objj_msgSend(_2,"filename"):objj_msgSend(_1,"filename");
return _17;
}
}),new objj_method(sel_getUid("isPaneSplitter"),function(_18,_19){
with(_18){
return _isPaneSplitter;
}
}),new objj_method(sel_getUid("setIsPaneSplitter:"),function(_1a,_1b,_1c){
with(_1a){
if(_isPaneSplitter==_1c){
return;
}
_isPaneSplitter=_1c;
_DOMDividerElements=[];
objj_msgSend(_1a,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_1d,_1e,_1f){
with(_1d){
_needsResizeSubviews=YES;
}
}),new objj_method(sel_getUid("isSubviewCollapsed:"),function(_20,_21,_22){
with(_20){
return objj_msgSend(_22,"frame").size[_sizeComponent]<1?YES:NO;
}
}),new objj_method(sel_getUid("rectOfDividerAtIndex:"),function(_23,_24,_25){
with(_23){
var _26=objj_msgSend(_subviews[_25],"frame"),_27=CGRectMakeZero();
_27.size=objj_msgSend(_23,"frame").size;
_27.size[_sizeComponent]=objj_msgSend(_23,"dividerThickness");
_27.origin[_originComponent]=_26.origin[_originComponent]+_26.size[_sizeComponent];
return _27;
}
}),new objj_method(sel_getUid("effectiveRectOfDividerAtIndex:"),function(_28,_29,_2a){
with(_28){
var _2b=objj_msgSend(_28,"rectOfDividerAtIndex:",_2a);
var _2c=2;
_2b.size[_sizeComponent]+=_2c*2;
_2b.origin[_originComponent]-=_2c;
return _2b;
}
}),new objj_method(sel_getUid("drawRect:"),function(_2d,_2e,_2f){
with(_2d){
var _30=objj_msgSend(_subviews,"count")-1;
if(_30>0){
while(_30--){
objj_msgSend(_2d,"drawDividerInRect:",objj_msgSend(_2d,"rectOfDividerAtIndex:",_30));
}
}
}
}),new objj_method(sel_getUid("drawDividerInRect:"),function(_31,_32,_33){
with(_31){
if(!_DOMDividerElements[_drawingDivider]){
_DOMDividerElements[_drawingDivider]=document.createElement("div");
_DOMDividerElements[_drawingDivider].style.cursor="move";
_DOMDividerElements[_drawingDivider].style.position="absolute";
_DOMDividerElements[_drawingDivider].style.backgroundRepeat="repeat";
if(_DOMDividerElements[_drawingDivider].CPDOMDisplayContext){
_DOMDividerElements[_drawingDivider].CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=6;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMDividerElements[_drawingDivider];
if(_isPaneSplitter){
_DOMDividerElements[_drawingDivider].style.backgroundColor="#A5A5A5";
_DOMDividerElements[_drawingDivider].style.backgroundImage="";
}else{
_DOMDividerElements[_drawingDivider].style.backgroundColor="";
_DOMDividerElements[_drawingDivider].style.backgroundImage="url('"+_dividerImagePath+"')";
}
}
if(!_DOMDividerElements[_drawingDivider].CPDOMDisplayContext){
_DOMDividerElements[_drawingDivider].CPDOMDisplayContext=[];
}
var _34=_DOMDividerElements[_drawingDivider].CPDOMDisplayContext[0];
if(!(_34>=0)){
_34=_DOMDividerElements[_drawingDivider].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_34]=0;
CPDOMDisplayServerInstructions[_34+1]=_DOMDividerElements[_drawingDivider];
CPDOMDisplayServerInstructions[_34+2]=NULL;
CPDOMDisplayServerInstructions[_34+3]=(_33.origin.x);
CPDOMDisplayServerInstructions[_34+4]=(_33.origin.y);
if(!_DOMDividerElements[_drawingDivider].CPDOMDisplayContext){
_DOMDividerElements[_drawingDivider].CPDOMDisplayContext=[];
}
var _34=_DOMDividerElements[_drawingDivider].CPDOMDisplayContext[4];
if(!(_34>=0)){
_34=_DOMDividerElements[_drawingDivider].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_34]=4;
CPDOMDisplayServerInstructions[_34+1]=_DOMDividerElements[_drawingDivider];
CPDOMDisplayServerInstructions[_34+2]=(_33.size.width);
CPDOMDisplayServerInstructions[_34+3]=(_33.size.height);
}
}),new objj_method(sel_getUid("viewWillDraw"),function(_35,_36){
with(_35){
objj_msgSend(_35,"_adjustSubviewsWithCalculatedSize");
}
}),new objj_method(sel_getUid("_adjustSubviewsWithCalculatedSize"),function(_37,_38){
with(_37){
if(!_needsResizeSubviews){
return;
}
_needsResizeSubviews=NO;
var _39=objj_msgSend(_37,"subviews"),_3a=_39.length,_3b=CGSizeMakeZero();
if(objj_msgSend(_37,"isVertical")){
_3b.width+=objj_msgSend(_37,"dividerThickness")*(_3a-1);
_3b.height=CGRectGetHeight(objj_msgSend(_37,"frame"));
}else{
_3b.width=CGRectGetWidth(objj_msgSend(_37,"frame"));
_3b.height+=objj_msgSend(_37,"dividerThickness")*(_3a-1);
}
while(_3a--){
_3b[_sizeComponent]+=objj_msgSend(_39[_3a],"frame").size[_sizeComponent];
}
objj_msgSend(_37,"resizeSubviewsWithOldSize:",_3b);
}
}),new objj_method(sel_getUid("cursorAtPoint:hitDividerAtIndex:"),function(_3c,_3d,_3e,_3f){
with(_3c){
var _40=objj_msgSend(_subviews[_3f],"frame"),_41=_40.origin[_originComponent]+_40.size[_sizeComponent],_42=objj_msgSend(_3c,"effectiveRectOfDividerAtIndex:",_3f),_43=null;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:"))){
_42=objj_msgSend(_delegate,"splitView:effectiveRect:forDrawnRect:ofDividerAtIndex:",_3c,_42,_42,_3f);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:additionalEffectiveRectOfDividerAtIndex:"))){
_43=objj_msgSend(_delegate,"splitView:additionalEffectiveRectOfDividerAtIndex:",_3c,_3f);
}
return CGRectContainsPoint(_42,_3e)||(_43&&CGRectContainsPoint(_43,_3e));
}
}),new objj_method(sel_getUid("hitTest:"),function(_44,_45,_46){
with(_44){
if(objj_msgSend(_44,"isHidden")||!objj_msgSend(_44,"hitTests")||!CGRectContainsPoint(objj_msgSend(_44,"frame"),_46)){
return nil;
}
var _47=objj_msgSend(_44,"convertPoint:fromView:",_46,objj_msgSend(_44,"superview"));
var _48=objj_msgSend(_subviews,"count")-1;
for(var i=0;i<_48;i++){
if(objj_msgSend(_44,"cursorAtPoint:hitDividerAtIndex:",_47,i)){
return _44;
}
}
return objj_msgSendSuper({receiver:_44,super_class:objj_getClass("CPView")},"hitTest:",_46);
}
}),new objj_method(sel_getUid("trackDivider:"),function(_4a,_4b,_4c){
with(_4a){
var _4d=objj_msgSend(_4c,"type");
if(_4d==CPLeftMouseUp){
if(_currentDivider!=CPNotFound){
_currentDivider=CPNotFound;
objj_msgSend(_4a,"_postNotificationDidResize");
}
return;
}
if(_4d==CPLeftMouseDown){
var _4e=objj_msgSend(_4a,"convertPoint:fromView:",objj_msgSend(_4c,"locationInWindow"),nil);
_currentDivider=CPNotFound;
var _4f=objj_msgSend(_subviews,"count")-1;
for(var i=0;i<_4f;i++){
var _51=objj_msgSend(_subviews[i],"frame"),_52=_51.origin[_originComponent]+_51.size[_sizeComponent];
if(objj_msgSend(_4a,"cursorAtPoint:hitDividerAtIndex:",_4e,i)){
if(objj_msgSend(_4c,"clickCount")==2&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:canCollapseSubview:"))&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:"))){
var _53=objj_msgSend(_4a,"minPossiblePositionOfDividerAtIndex:",i),_54=objj_msgSend(_4a,"maxPossiblePositionOfDividerAtIndex:",i);
if(objj_msgSend(_delegate,"splitView:canCollapseSubview:",_4a,_subviews[i])&&objj_msgSend(_delegate,"splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:",_4a,_subviews[i],i)){
if(objj_msgSend(_4a,"isSubviewCollapsed:",_subviews[i])){
objj_msgSend(_4a,"setPosition:ofDividerAtIndex:",(_53+(_54-_53)/2),i);
}else{
objj_msgSend(_4a,"setPosition:ofDividerAtIndex:",_53,i);
}
}else{
if(objj_msgSend(_delegate,"splitView:canCollapseSubview:",_4a,_subviews[i+1])&&objj_msgSend(_delegate,"splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:",_4a,_subviews[i+1],i)){
if(objj_msgSend(_4a,"isSubviewCollapsed:",_subviews[i+1])){
objj_msgSend(_4a,"setPosition:ofDividerAtIndex:",(_53+(_54-_53)/2),i);
}else{
objj_msgSend(_4a,"setPosition:ofDividerAtIndex:",_54,i);
}
}
}
}else{
_currentDivider=i;
_initialOffset=_52-_4e[_originComponent];
objj_msgSend(_4a,"_postNotificationWillResize");
}
}
}
}else{
if(_4d==CPLeftMouseDragged&&_currentDivider!=CPNotFound){
var _4e=objj_msgSend(_4a,"convertPoint:fromView:",objj_msgSend(_4c,"locationInWindow"),nil);
objj_msgSend(_4a,"setPosition:ofDividerAtIndex:",(_4e[_originComponent]+_initialOffset),_currentDivider);
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_4a,sel_getUid("trackDivider:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_55,_56,_57){
with(_55){
objj_msgSend(_55,"trackDivider:",_57);
}
}),new objj_method(sel_getUid("maxPossiblePositionOfDividerAtIndex:"),function(_58,_59,_5a){
with(_58){
var _5b=objj_msgSend(_subviews[_5a+1],"frame");
if(_5a+1<objj_msgSend(_subviews,"count")-1){
return _5b.origin[_originComponent]+_5b.size[_sizeComponent]-objj_msgSend(_58,"dividerThickness");
}else{
return objj_msgSend(_58,"frame").size[_sizeComponent]-objj_msgSend(_58,"dividerThickness");
}
}
}),new objj_method(sel_getUid("minPossiblePositionOfDividerAtIndex:"),function(_5c,_5d,_5e){
with(_5c){
var _5f=objj_msgSend(_subviews[_5e-1],"frame");
if(_5e>0){
return _5f.origin[_originComponent]+_5f.size[_sizeComponent]+objj_msgSend(_5c,"dividerThickness");
}else{
return 0;
}
}
}),new objj_method(sel_getUid("setPosition:ofDividerAtIndex:"),function(_60,_61,_62,_63){
with(_60){
objj_msgSend(_60,"_adjustSubviewsWithCalculatedSize");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:constrainSplitPosition:ofSubviewAt:"))){
_62=objj_msgSend(_delegate,"splitView:constrainSplitPosition:ofSubviewAt:",_60,_62,_63);
}
var _64=objj_msgSend(_60,"maxPossiblePositionOfDividerAtIndex:",_63),_65=objj_msgSend(_60,"minPossiblePositionOfDividerAtIndex:",_63),_66=_64,_67=_65;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:constrainMinCoordinate:ofSubviewAt:"))){
_67=objj_msgSend(_delegate,"splitView:constrainMinCoordinate:ofSubviewAt:",_60,_65,_63);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:constrainMaxCoordinate:ofSubviewAt:"))){
_66=objj_msgSend(_delegate,"splitView:constrainMaxCoordinate:ofSubviewAt:",_60,_64,_63);
}
var _68=objj_msgSend(_60,"frame"),_69=_subviews[_63],_6a=objj_msgSend(_69,"frame"),_6b=_subviews[_63+1],_6c=objj_msgSend(_6b,"frame");
var _6d=MAX(MIN(_62,_66),_67);
if(_62<_65+(_67-_65)/2){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:canCollapseSubview:"))){
if(objj_msgSend(_delegate,"splitView:canCollapseSubview:",_60,_69)){
_6d=_65;
}
}
}
_6a.size[_sizeComponent]=_6d-_6a.origin[_originComponent];
objj_msgSend(_subviews[_63],"setFrame:",_6a);
_6c.size[_sizeComponent]=_6c.origin[_originComponent]+_6c.size[_sizeComponent]-_6d-objj_msgSend(_60,"dividerThickness");
_6c.origin[_originComponent]=_6d+objj_msgSend(_60,"dividerThickness");
objj_msgSend(_subviews[_63+1],"setFrame:",_6c);
objj_msgSend(_60,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_6e,_6f,_70){
with(_6e){
objj_msgSend(_6e,"_adjustSubviewsWithCalculatedSize");
objj_msgSendSuper({receiver:_6e,super_class:objj_getClass("CPView")},"setFrameSize:",_70);
objj_msgSend(_6e,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_71,_72,_73){
with(_71){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitView:resizeSubviewsWithOldSize:"))){
objj_msgSend(_delegate,"splitView:resizeSubviewsWithOldSize:",_71,_73);
return;
}
objj_msgSend(_71,"_postNotificationWillResize");
var _74=0,_75=objj_msgSend(_subviews,"count"),_76=objj_msgSend(_71,"bounds"),_77=objj_msgSend(_71,"dividerThickness");
for(;_74<_75;++_74){
var _78=_subviews[_74],_79=CGRectMakeCopy(_76);
if(_74+1==_75){
_79.size[_sizeComponent]=_76.size[_sizeComponent]-_79.origin[_originComponent];
}else{
_79.size[_sizeComponent]=_76.size[_sizeComponent]*(objj_msgSend(_78,"frame").size[_sizeComponent]/_73[_sizeComponent]);
}
_76.origin[_originComponent]+=_79.size[_sizeComponent]+_77;
objj_msgSend(_78,"setFrame:",_79);
}
objj_msgSend(_71,"_postNotificationDidResize");
}
}),new objj_method(sel_getUid("setDelegate:"),function(_7a,_7b,_7c){
with(_7a){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewDidResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_delegate,CPSplitViewDidResizeSubviewsNotification,_7a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewWillResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_delegate,CPSplitViewWillResizeSubviewsNotification,_7a);
}
_delegate=_7c;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewDidResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_delegate,sel_getUid("splitViewDidResizeSubviews:"),CPSplitViewDidResizeSubviewsNotification,_7a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("splitViewWillResizeSubviews:"))){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_delegate,sel_getUid("splitViewWillResizeSubviews:"),CPSplitViewWillResizeSubviewsNotification,_7a);
}
}
}),new objj_method(sel_getUid("_postNotificationWillResize"),function(_7d,_7e){
with(_7d){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPSplitViewWillResizeSubviewsNotification,_7d);
}
}),new objj_method(sel_getUid("_postNotificationDidResize"),function(_7f,_80){
with(_7f){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPSplitViewDidResizeSubviewsNotification,_7f);
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("initialize"),function(_81,_82){
with(_81){
if(_81!=objj_msgSend(CPSplitView,"class")){
return;
}
var _83=objj_msgSend(CPBundle,"bundleForClass:",_81);
_1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_83,"pathForResource:","CPSplitView/CPSplitViewHorizontal.png"),CPSizeMake(5,10));
_2=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_83,"pathForResource:","CPSplitView/CPSplitViewVertical.png"),CPSizeMake(10,5));
}
})]);
var _84="CPSplitViewDelegateKey",_85="CPSplitViewIsVerticalKey",_86="CPSplitViewIsPaneSplitterKey";
var _3=objj_getClass("CPSplitView");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSplitView\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_87,_88,_89){
with(_87){
_87=objj_msgSendSuper({receiver:_87,super_class:objj_getClass("CPView")},"initWithCoder:",_89);
if(_87){
_currentDivider=CPNotFound;
_DOMDividerElements=[];
_delegate=objj_msgSend(_89,"decodeObjectForKey:",_84);
_isPaneSplitter=objj_msgSend(_89,"decodeBoolForKey:",_86);
objj_msgSend(_87,"_setVertical:",objj_msgSend(_89,"decodeBoolForKey:",_85));
}
return _87;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_8a,_8b,_8c){
with(_8a){
objj_msgSendSuper({receiver:_8a,super_class:objj_getClass("CPView")},"encodeWithCoder:",_8c);
objj_msgSend(_8c,"encodeConditionalObject:forKey:",_delegate,_84);
objj_msgSend(_8c,"encodeBool:forKey:",_isVertical,_85);
objj_msgSend(_8c,"encodeBool:forKey:",_isPaneSplitter,_86);
}
})]);
p;17;CPStringDrawing.jI;21;Foundation/CPString.jc;996;
var _1=nil;
var _2=objj_getClass("CPString");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("cssString"),function(_4,_5){
with(_4){
return _4;
}
}),new objj_method(sel_getUid("sizeWithFont:"),function(_6,_7,_8){
with(_6){
if(!_1){
_1=document.createElement("span");
var _9=_1.style;
_9.position="absolute";
_9.whiteSpace="pre";
_9.visibility="visible";
_9.padding="0px";
_9.margin="0px";
_9.left="-100000px";
_9.top="-100000px";
_9.zIndex="10000";
_9.background="red";
document.getElementsByTagName("body")[0].appendChild(_1);
}
_1.style.font=objj_msgSend(_8?_8:objj_msgSend(CPFont,"systemFontOfSize:",12),"cssString");
if(CPFeatureIsCompatible(CPJavascriptInnerTextFeature)){
_1.innerText=_6;
}else{
if(CPFeatureIsCompatible(CPJavascriptTextContentFeature)){
_1.textContent=_6;
}
}
return CGSizeMake(_1.clientWidth,_1.clientHeight);
}
})]);
p;11;CPTabView.ji;13;CPImageView.ji;15;CPTabViewItem.ji;8;CPView.jc;18495;
CPTopTabsBezelBorder=0;
CPNoTabsBezelBorder=4;
CPNoTabsLineBorder=5;
CPNoTabsNoBorder=6;
var _1=nil,_2=nil,_3=nil,_4=nil,_5=nil;
var _6=7,_7=7;
var _8=1,_9=2,_a=4,_b=8;
var _c=objj_allocateClassPair(CPView,"CPTabView"),_d=_c.isa;
class_addIvars(_c,[new objj_ivar("_labelsView"),new objj_ivar("_backgroundView"),new objj_ivar("_separatorView"),new objj_ivar("_auxiliaryView"),new objj_ivar("_contentView"),new objj_ivar("_tabViewItems"),new objj_ivar("_selectedTabViewItem"),new objj_ivar("_tabViewType"),new objj_ivar("_delegate"),new objj_ivar("_delegateSelectors")]);
objj_registerClassPair(_c);
objj_addClassForBundle(_c,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_c,[new objj_method(sel_getUid("initWithFrame:"),function(_e,_f,_10){
with(_e){
_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("CPView")},"initWithFrame:",_10);
if(_e){
_tabViewType=CPTopTabsBezelBorder;
_tabViewItems=[];
}
return _e;
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_11,_12){
with(_11){
if(_tabViewType!=CPTopTabsBezelBorder||_labelsView){
return;
}
objj_msgSend(_11,"_createBezelBorder");
objj_msgSend(_11,"layoutSubviews");
}
}),new objj_method(sel_getUid("_createBezelBorder"),function(_13,_14){
with(_13){
var _15=objj_msgSend(_13,"bounds");
_labelsView=objj_msgSend(objj_msgSend(_CPTabLabelsView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_15),0));
objj_msgSend(_labelsView,"setTabView:",_13);
objj_msgSend(_labelsView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_13,"addSubview:",_labelsView);
_backgroundView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_backgroundView,"setBackgroundColor:",_5);
objj_msgSend(_backgroundView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_13,"addSubview:",_backgroundView);
_separatorView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_separatorView,"setBackgroundColor:",objj_msgSend(objj_msgSend(_13,"class"),"bezelBorderColor"));
objj_msgSend(_separatorView,"setAutoresizingMask:",CPViewWidthSizable|CPViewMaxYMargin);
objj_msgSend(_13,"addSubview:",_separatorView);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_16,_17){
with(_16){
if(_tabViewType==CPTopTabsBezelBorder){
var _18=objj_msgSend(_16,"bounds"),_19=objj_msgSend(_CPTabLabelsView,"height");
_18.origin.y+=_19;
_18.size.height-=_19;
objj_msgSend(_backgroundView,"setFrame:",_18);
var _1a=5;
if(_auxiliaryView){
_1a=CGRectGetHeight(objj_msgSend(_auxiliaryView,"frame"));
objj_msgSend(_auxiliaryView,"setFrame:",CGRectMake(_6,_19,CGRectGetWidth(_18)-_6-_7,_1a));
}
objj_msgSend(_separatorView,"setFrame:",CGRectMake(_6,_19+_1a,CGRectGetWidth(_18)-_6-_7,1));
}
objj_msgSend(_contentView,"setFrame:",objj_msgSend(_16,"contentRect"));
}
}),new objj_method(sel_getUid("addTabViewItem:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSend(_1b,"insertTabViewItem:atIndex:",_1d,objj_msgSend(_tabViewItems,"count"));
}
}),new objj_method(sel_getUid("insertTabViewItem:atIndex:"),function(_1e,_1f,_20,_21){
with(_1e){
objj_msgSend(_tabViewItems,"insertObject:atIndex:",_20,_21);
objj_msgSend(_labelsView,"tabView:didAddTabViewItem:",_1e,_20);
if(objj_msgSend(_tabViewItems,"count")==1){
objj_msgSend(_1e,"selectFirstTabViewItem:",_1e);
}
if(_delegateSelectors&_b){
objj_msgSend(_delegate,"tabViewDidChangeNumberOfTabViewItems:",_1e);
}
}
}),new objj_method(sel_getUid("removeTabViewItem:"),function(_22,_23,_24){
with(_22){
objj_msgSend(_tabViewItems,"removeObjectIdenticalTo:",_24);
objj_msgSend(_labelsView,"tabView:didRemoveTabViewItem:",_22,_24);
if(_delegateSelectors&_b){
objj_msgSend(_delegate,"tabViewDidChangeNumberOfTabViewItems:",_22);
}
}
}),new objj_method(sel_getUid("indexOfTabViewItem:"),function(_25,_26,_27){
with(_25){
return objj_msgSend(_tabViewItems,"indexOfObjectIdenticalTo:",_27);
}
}),new objj_method(sel_getUid("indexOfTabViewItemWithIdentifier:"),function(_28,_29,_2a){
with(_28){
var _2b=0,_2c=objj_msgSend(_tabViewItems,"count");
for(;_2b<_2c;++_2b){
if(objj_msgSend(objj_msgSend(_tabViewItems[_2b],"identifier"),"isEqualTo:",_2a)){
return _2b;
}
}
return _2b;
}
}),new objj_method(sel_getUid("numberOfTabViewItems"),function(_2d,_2e){
with(_2d){
return objj_msgSend(_tabViewItems,"count");
}
}),new objj_method(sel_getUid("tabViewItemAtIndex:"),function(_2f,_30,_31){
with(_2f){
return _tabViewItems[_31];
}
}),new objj_method(sel_getUid("tabViewItems"),function(_32,_33){
with(_32){
return _tabViewItems;
}
}),new objj_method(sel_getUid("selectFirstTabViewItem:"),function(_34,_35,_36){
with(_34){
var _37=objj_msgSend(_tabViewItems,"count");
if(_37){
objj_msgSend(_34,"selectTabViewItemAtIndex:",0);
}
}
}),new objj_method(sel_getUid("selectLastTabViewItem:"),function(_38,_39,_3a){
with(_38){
var _3b=objj_msgSend(_tabViewItems,"count");
if(_3b){
objj_msgSend(_38,"selectTabViewItemAtIndex:",_3b-1);
}
}
}),new objj_method(sel_getUid("selectNextTabViewItem:"),function(_3c,_3d,_3e){
with(_3c){
if(!_selectedTabViewItem){
return;
}
var _3f=objj_msgSend(_3c,"indexOfTabViewItem:",_selectedTabViewItem),_40=objj_msgSend(_tabViewItems,"count");
objj_msgSend(_3c,"selectTabViewItemAtIndex:",_3f+1%_40);
}
}),new objj_method(sel_getUid("selectPreviousTabViewItem:"),function(_41,_42,_43){
with(_41){
if(!_selectedTabViewItem){
return;
}
var _44=objj_msgSend(_41,"indexOfTabViewItem:",_selectedTabViewItem),_45=objj_msgSend(_tabViewItems,"count");
objj_msgSend(_41,"selectTabViewItemAtIndex:",_44==0?_45:_44-1);
}
}),new objj_method(sel_getUid("selectTabViewItem:"),function(_46,_47,_48){
with(_46){
if((_delegateSelectors&_9)&&!objj_msgSend(_delegate,"tabView:shouldSelectTabViewItem:",_46,_48)){
return;
}
if(_delegateSelectors&_a){
objj_msgSend(_delegate,"tabView:willSelectTabViewItem:",_46,_48);
}
if(_selectedTabViewItem){
_selectedTabViewItem._tabState=CPBackgroundTab;
objj_msgSend(_labelsView,"tabView:didChangeStateOfTabViewItem:",_46,_selectedTabViewItem);
objj_msgSend(_contentView,"removeFromSuperview");
objj_msgSend(_auxiliaryView,"removeFromSuperview");
}
_selectedTabViewItem=_48;
_selectedTabViewItem._tabState=CPSelectedTab;
_contentView=objj_msgSend(_selectedTabViewItem,"view");
objj_msgSend(_contentView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
_auxiliaryView=objj_msgSend(_selectedTabViewItem,"auxiliaryView");
objj_msgSend(_auxiliaryView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_46,"addSubview:",_contentView);
if(_auxiliaryView){
objj_msgSend(_46,"addSubview:",_auxiliaryView);
}
objj_msgSend(_labelsView,"tabView:didChangeStateOfTabViewItem:",_46,_selectedTabViewItem);
objj_msgSend(_46,"layoutSubviews");
if(_delegateSelectors&_8){
objj_msgSend(_delegate,"tabView:didSelectTabViewItem:",_46,_48);
}
}
}),new objj_method(sel_getUid("selectTabViewItemAtIndex:"),function(_49,_4a,_4b){
with(_49){
objj_msgSend(_49,"selectTabViewItem:",_tabViewItems[_4b]);
}
}),new objj_method(sel_getUid("selectedTabViewItem"),function(_4c,_4d){
with(_4c){
return _selectedTabViewItem;
}
}),new objj_method(sel_getUid("setTabViewType:"),function(_4e,_4f,_50){
with(_4e){
if(_tabViewType==_50){
return;
}
_tabViewType=_50;
if(_tabViewType==CPNoTabsBezelBorder||_tabViewType==CPNoTabsLineBorder||_tabViewType==CPNoTabsNoBorder){
objj_msgSend(_labelsView,"removeFromSuperview");
}else{
if(!objj_msgSend(_labelsView,"superview")){
objj_msgSend(_4e,"addSubview:",_lablesView);
}
}
if(_tabViewType==CPNoTabsLineBorder||_tabViewType==CPNoTabsNoBorder){
objj_msgSend(_backgroundView,"removeFromSuperview");
}else{
if(!objj_msgSend(_backgroundView,"superview")){
objj_msgSend(_4e,"addSubview:",_backgroundView);
}
}
objj_msgSend(_4e,"layoutSubviews");
}
}),new objj_method(sel_getUid("tabViewType"),function(_51,_52){
with(_51){
return _tabViewType;
}
}),new objj_method(sel_getUid("contentRect"),function(_53,_54){
with(_53){
var _55=CGRectMakeCopy(objj_msgSend(_53,"bounds"));
if(_tabViewType==CPTopTabsBezelBorder){
var _56=objj_msgSend(_CPTabLabelsView,"height"),_57=_auxiliaryView?CGRectGetHeight(objj_msgSend(_auxiliaryView,"frame")):5,_58=1;
_55.origin.y+=_56+_57+_58;
_55.size.height-=_56+_57+_58*2;
_55.origin.x+=_6;
_55.size.width-=_6+_7;
}
return _55;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_59,_5a,_5b){
with(_59){
if(_delegate==_5b){
return;
}
_delegate=_5b;
_delegateSelectors=0;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tabView:shouldSelectTabViewItem:"))){
_delegateSelectors|=_9;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tabView:willSelectTabViewItem:"))){
_delegateSelectors|=_a;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tabView:didSelectTabViewItem:"))){
_delegateSelectors|=_8;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tabViewDidChangeNumberOfTabViewItems:"))){
_delegateSelectors|=_b;
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_5c,_5d,_5e){
with(_5c){
var _5f=objj_msgSend(_labelsView,"convertPoint:fromView:",objj_msgSend(_5e,"locationInWindow"),nil),_60=objj_msgSend(_labelsView,"representedTabViewItemAtPoint:",_5f);
if(_60){
objj_msgSend(_5c,"selectTabViewItem:",_60);
}
}
})]);
class_addMethods(_d,[new objj_method(sel_getUid("initialize"),function(_61,_62){
with(_61){
if(_61!=CPTabView){
return;
}
var _63=objj_msgSend(CPBundle,"bundleForClass:",_61),_64=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:","",CGSizeMake(7,0)),_65=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_63,"pathForResource:","CPTabView/CPTabViewBezelBackgroundCenter.png"),CGSizeMake(1,1)),_66=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_63,"pathForResource:","CPTabView/CPTabViewBezelBorderLeft.png"),CGSizeMake(7,1)),_67=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_63,"pathForResource:","CPTabView/CPTabViewBezelBorder.png"),CGSizeMake(1,1)),_68=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_63,"pathForResource:","CPTabView/CPTabViewBezelBorderRight.png"),CGSizeMake(7,1));
_5=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[_64,_64,_64,_66,_65,_68,_66,_67,_68]));
_4=objj_msgSend(CPColor,"colorWithPatternImage:",_67);
}
}),new objj_method(sel_getUid("bezelBorderColor"),function(_69,_6a){
with(_69){
return _4;
}
})]);
var _6b="CPTabViewItemsKey",_6c="CPTabViewSelectedItemKey",_6d="CPTabViewTypeKey",_6e="CPTabViewDelegateKey";
var _c=objj_getClass("CPTabView");
if(!_c){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTabView\""));
}
var _d=_c.isa;
class_addMethods(_c,[new objj_method(sel_getUid("initWithCoder:"),function(_6f,_70,_71){
with(_6f){
if(_6f=objj_msgSendSuper({receiver:_6f,super_class:objj_getClass("CPView")},"initWithCoder:",_71)){
_tabViewType=objj_msgSend(_71,"decodeIntForKey:",_6d);
_tabViewItems=[];
objj_msgSend(_6f,"_createBezelBorder");
var _72=objj_msgSend(_71,"decodeObjectForKey:",_6b);
for(var i=0;_72&&i<_72.length;i++){
objj_msgSend(_6f,"insertTabViewItem:atIndex:",_72[i],i);
}
var _74=objj_msgSend(_71,"decodeObjectForKey:",_6c);
if(_74){
objj_msgSend(_6f,"selectTabViewItem:",_74);
}
objj_msgSend(_6f,"setDelegate:",objj_msgSend(_71,"decodeObjectForKey:",_6e));
}
return _6f;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_75,_76,_77){
with(_75){
var _78=_subviews;
_subviews=[];
objj_msgSendSuper({receiver:_75,super_class:objj_getClass("CPView")},"encodeWithCoder:",_77);
_subviews=_78;
objj_msgSend(_77,"encodeObject:forKey:",_tabViewItems,_6b);
objj_msgSend(_77,"encodeObject:forKey:",_selectedTabViewItem,_6c);
objj_msgSend(_77,"encodeInt:forKey:",_tabViewType,_6d);
objj_msgSend(_77,"encodeConditionalObject:forKey:",_delegate,_6e);
}
})]);
var _79=nil,_7a=10,_7b=15;
var _c=objj_allocateClassPair(CPView,"_CPTabLabelsView"),_d=_c.isa;
class_addIvars(_c,[new objj_ivar("_tabView"),new objj_ivar("_tabLabels")]);
objj_registerClassPair(_c);
objj_addClassForBundle(_c,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_c,[new objj_method(sel_getUid("initWithFrame:"),function(_7c,_7d,_7e){
with(_7c){
_7c=objj_msgSendSuper({receiver:_7c,super_class:objj_getClass("CPView")},"initWithFrame:",_7e);
if(_7c){
_tabLabels=[];
objj_msgSend(_7c,"setBackgroundColor:",_79);
objj_msgSend(_7c,"setFrameSize:",CGSizeMake(CGRectGetWidth(_7e),26));
}
return _7c;
}
}),new objj_method(sel_getUid("setTabView:"),function(_7f,_80,_81){
with(_7f){
_tabView=_81;
}
}),new objj_method(sel_getUid("tabView"),function(_82,_83){
with(_82){
return _tabView;
}
}),new objj_method(sel_getUid("tabView:didAddTabViewItem:"),function(_84,_85,_86,_87){
with(_84){
var _88=objj_msgSend(objj_msgSend(_CPTabLabel,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_88,"setTabViewItem:",_87);
_tabLabels.push(_88);
objj_msgSend(_84,"addSubview:",_88);
objj_msgSend(_84,"layoutSubviews");
}
}),new objj_method(sel_getUid("tabView:didRemoveTabViewItem:"),function(_89,_8a,_8b,_8c){
with(_89){
var _8d=objj_msgSend(_8b,"indexOfTabViewItem:",_8c),_8e=_tabLabels[_8d];
objj_msgSend(_tabLabels,"removeObjectAtIndex:",_8d);
objj_msgSend(_8e,"removeFromSuperview");
objj_msgSend(_89,"layoutSubviews");
}
}),new objj_method(sel_getUid("tabView:didChangeStateOfTabViewItem:"),function(_8f,_90,_91,_92){
with(_8f){
objj_msgSend(_tabLabels[objj_msgSend(_91,"indexOfTabViewItem:",_92)],"setTabState:",objj_msgSend(_92,"tabState"));
}
}),new objj_method(sel_getUid("representedTabViewItemAtPoint:"),function(_93,_94,_95){
with(_93){
var _96=0,_97=_tabLabels.length;
for(;_96<_97;++_96){
var _98=_tabLabels[_96];
if(CGRectContainsPoint(objj_msgSend(_98,"frame"),_95)){
return objj_msgSend(_98,"tabViewItem");
}
}
return nil;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_99,_9a){
with(_99){
var _9b=0,_9c=_tabLabels.length,_9d=((objj_msgSend(_99,"bounds").size.width)-(_9c-1)*_7a-2*_7b)/_9c,x=_7b;
for(;_9b<_9c;++_9b){
var _9f=_tabLabels[_9b],_a0={origin:{x:x,y:8},size:{width:_9d,height:18}};
objj_msgSend(_9f,"setFrame:",_a0);
x=(_a0.origin.x+_a0.size.width)+_7a;
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_a1,_a2,_a3){
with(_a1){
if(CGSizeEqualToSize(objj_msgSend(_a1,"frame").size,_a3)){
return;
}
objj_msgSendSuper({receiver:_a1,super_class:objj_getClass("CPView")},"setFrameSize:",_a3);
objj_msgSend(_a1,"layoutSubviews");
}
})]);
class_addMethods(_d,[new objj_method(sel_getUid("initialize"),function(_a4,_a5){
with(_a4){
if(_a4!=objj_msgSend(_CPTabLabelsView,"class")){
return;
}
var _a6=objj_msgSend(CPBundle,"bundleForClass:",_a4);
_79=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_a6,"pathForResource:","CPTabView/_CPTabLabelsViewLeft.png"),CGSizeMake(12,26)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_a6,"pathForResource:","CPTabView/_CPTabLabelsViewCenter.png"),CGSizeMake(1,26)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_a6,"pathForResource:","CPTabView/_CPTabLabelsViewRight.png"),CGSizeMake(12,26))],NO));
}
}),new objj_method(sel_getUid("height"),function(_a7,_a8){
with(_a7){
return 26;
}
})]);
var _a9=nil,_aa=nil;
var _c=objj_allocateClassPair(CPView,"_CPTabLabel"),_d=_c.isa;
class_addIvars(_c,[new objj_ivar("_tabViewItem"),new objj_ivar("_labelField")]);
objj_registerClassPair(_c);
objj_addClassForBundle(_c,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_c,[new objj_method(sel_getUid("initWithFrame:"),function(_ab,_ac,_ad){
with(_ab){
_ab=objj_msgSendSuper({receiver:_ab,super_class:objj_getClass("CPView")},"initWithFrame:",_ad);
if(_ab){
_labelField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_labelField,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_labelField,"setFrame:",CGRectMake(5,0,CGRectGetWidth(_ad)-10,20));
objj_msgSend(_labelField,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_labelField,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",11));
objj_msgSend(_ab,"addSubview:",_labelField);
objj_msgSend(_ab,"setTabState:",CPBackgroundTab);
}
return _ab;
}
}),new objj_method(sel_getUid("setTabState:"),function(_ae,_af,_b0){
with(_ae){
objj_msgSend(_ae,"setBackgroundColor:",_b0==CPSelectedTab?_aa:_a9);
}
}),new objj_method(sel_getUid("setTabViewItem:"),function(_b1,_b2,_b3){
with(_b1){
_tabViewItem=_b3;
objj_msgSend(_b1,"update");
}
}),new objj_method(sel_getUid("tabViewItem"),function(_b4,_b5){
with(_b4){
return _tabViewItem;
}
}),new objj_method(sel_getUid("update"),function(_b6,_b7){
with(_b6){
objj_msgSend(_labelField,"setStringValue:",objj_msgSend(_tabViewItem,"label"));
}
})]);
class_addMethods(_d,[new objj_method(sel_getUid("initialize"),function(_b8,_b9){
with(_b8){
if(_b8!=objj_msgSend(_CPTabLabel,"class")){
return;
}
var _ba=objj_msgSend(CPBundle,"bundleForClass:",_b8);
_a9=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ba,"pathForResource:","CPTabView/_CPTabLabelBackgroundLeft.png"),CGSizeMake(6,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ba,"pathForResource:","CPTabView/_CPTabLabelBackgroundCenter.png"),CGSizeMake(1,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ba,"pathForResource:","CPTabView/_CPTabLabelBackgroundRight.png"),CGSizeMake(6,18))],NO));
_aa=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ba,"pathForResource:","CPTabView/_CPTabLabelSelectedLeft.png"),CGSizeMake(3,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ba,"pathForResource:","CPTabView/_CPTabLabelSelectedCenter.png"),CGSizeMake(1,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_ba,"pathForResource:","CPTabView/_CPTabLabelSelectedRight.png"),CGSizeMake(3,18))],NO));
}
})]);
p;15;CPTabViewItem.jI;21;Foundation/CPObject.jI;15;AppKit/CPView.jc;2676;
CPSelectedTab=0;
CPBackgroundTab=1;
CPPressedTab=2;
var _1=objj_allocateClassPair(CPObject,"CPTabViewItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_identifier"),new objj_ivar("_label"),new objj_ivar("_view"),new objj_ivar("_auxiliaryView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithIdentifier:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_identifier=_5;
}
return _3;
}
}),new objj_method(sel_getUid("setLabel:"),function(_6,_7,_8){
with(_6){
_label=_8;
}
}),new objj_method(sel_getUid("label"),function(_9,_a){
with(_9){
return _label;
}
}),new objj_method(sel_getUid("tabState"),function(_b,_c){
with(_b){
return _tabState;
}
}),new objj_method(sel_getUid("setIdentifier:"),function(_d,_e,_f){
with(_d){
_identifier=_f;
}
}),new objj_method(sel_getUid("identifier"),function(_10,_11){
with(_10){
return _identifier;
}
}),new objj_method(sel_getUid("setView:"),function(_12,_13,_14){
with(_12){
_view=_14;
}
}),new objj_method(sel_getUid("view"),function(_15,_16){
with(_15){
return _view;
}
}),new objj_method(sel_getUid("setAuxiliaryView:"),function(_17,_18,_19){
with(_17){
_auxiliaryView=_19;
}
}),new objj_method(sel_getUid("auxiliaryView"),function(_1a,_1b){
with(_1a){
return _auxiliaryView;
}
}),new objj_method(sel_getUid("tabView"),function(_1c,_1d){
with(_1c){
return _tabView;
}
})]);
var _1e="CPTabViewItemIdentifierKey",_1f="CPTabViewItemLabelKey",_20="CPTabViewItemViewKey",_21="CPTabViewItemAuxViewKey";
var _1=objj_getClass("CPTabViewItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTabViewItem\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_22,_23,_24){
with(_22){
_22=objj_msgSendSuper({receiver:_22,super_class:objj_getClass("CPObject")},"init");
if(_22){
_identifier=objj_msgSend(_24,"decodeObjectForKey:",_1e);
_label=objj_msgSend(_24,"decodeObjectForKey:",_1f);
_view=objj_msgSend(_24,"decodeObjectForKey:",_20);
_auxiliaryView=objj_msgSend(_24,"decodeObjectForKey:",_21);
CPLog.warn("_identifier="+_identifier+" _label="+_label+" _view="+_view+" _auxiliaryView="+_auxiliaryView);
}
return _22;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_25,_26,_27){
with(_25){
objj_msgSend(_27,"encodeObject:forKey:",_identifier,_1e);
objj_msgSend(_27,"encodeObject:forKey:",_label,_1f);
objj_msgSend(_27,"encodeObject:forKey:",_view,_20);
objj_msgSend(_27,"encodeObject:forKey:",_auxiliaryView,_21);
}
})]);
p;13;CPTextField.ji;11;CPControl.ji;17;CPStringDrawing.jc;18299;
CPLineBreakByWordWrapping=0;
CPLineBreakByCharWrapping=1;
CPLineBreakByClipping=2;
CPLineBreakByTruncatingHead=3;
CPLineBreakByTruncatingTail=4;
CPLineBreakByTruncatingMiddle=5;
CPTextFieldSquareBezel=0;
CPTextFieldRoundedBezel=1;
var _1=4,_2=3;
HORIZONTAL_PADDING=3;
var _3=nil;
var _4=nil,_5=nil;
var _6=objj_getClass("CPString");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("string"),function(_8,_9){
with(_8){
return _8;
}
})]);
var _6=objj_allocateClassPair(CPControl,"CPTextField"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_isEditable"),new objj_ivar("_isSelectable"),new objj_ivar("_isBordered"),new objj_ivar("_isBezeled"),new objj_ivar("_bezelStyle"),new objj_ivar("_drawsBackground"),new objj_ivar("_lineBreakMode"),new objj_ivar("_textFieldBackgroundColor"),new objj_ivar("_placeholderString"),new objj_ivar("_delegate"),new objj_ivar("_textDidChangeValue"),new objj_ivar("_DOMTextElement")]);
objj_registerClassPair(_6);
objj_addClassForBundle(_6,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_6,[new objj_method(sel_getUid("initWithFrame:"),function(_a,_b,_c){
with(_a){
_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("CPControl")},"initWithFrame:",_c);
if(_a){
_value="";
_placeholderString="";
_sendActionOn=CPKeyUpMask|CPKeyDownMask;
_DOMTextElement=document.createElement("div");
_DOMTextElement.style.position="absolute";
_DOMTextElement.style.top=_1+"px";
_DOMTextElement.style.left=HORIZONTAL_PADDING+"px";
_DOMTextElement.style.width=MAX(0,CGRectGetWidth(_c)-2*HORIZONTAL_PADDING)+"px";
_DOMTextElement.style.height=MAX(0,CGRectGetHeight(_c)-_1-_2)+"px";
_DOMTextElement.style.whiteSpace="pre";
_DOMTextElement.style.cursor="default";
_DOMTextElement.style.zIndex=100;
_DOMElement.appendChild(_DOMTextElement);
objj_msgSend(_a,"setAlignment:",CPLeftTextAlignment);
}
return _a;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_d,_e,_f){
with(_d){
var _10=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
objj_msgSend(_10,"removeObserver:name:object:",_delegate,CPControlTextDidBeginEditingNotification,_d);
objj_msgSend(_10,"removeObserver:name:object:",_delegate,CPControlTextDidChangeNotification,_d);
objj_msgSend(_10,"removeObserver:name:object:",_delegate,CPControlTextDidEndEditingNotification,_d);
}
_delegate=_f;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidBeginEditing:"))){
objj_msgSend(_10,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidBeginEditing:"),CPControlTextDidBeginEditingNotification,_d);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidChange:"))){
objj_msgSend(_10,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidChange:"),CPControlTextDidChangeNotification,_d);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidEndEditing:"))){
objj_msgSend(_10,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidEndEditing:"),CPControlTextDidEndEditingNotification,_d);
}
}
}),new objj_method(sel_getUid("delegate"),function(_11,_12){
with(_11){
return _delegate;
}
}),new objj_method(sel_getUid("setBezeled:"),function(_13,_14,_15){
with(_13){
if(_isBezeled==_15){
return;
}
_isBezeled=_15;
objj_msgSend(_13,"_updateBackground");
}
}),new objj_method(sel_getUid("isBezeled"),function(_16,_17){
with(_16){
return _isBezeled;
}
}),new objj_method(sel_getUid("setBezelStyle:"),function(_18,_19,_1a){
with(_18){
if(_bezelStyle==_1a){
return;
}
_bezelStyle=_1a;
objj_msgSend(_18,"_updateBackground");
}
}),new objj_method(sel_getUid("bezelStyle"),function(_1b,_1c){
with(_1b){
return _bezelStyle;
}
}),new objj_method(sel_getUid("setBordered:"),function(_1d,_1e,_1f){
with(_1d){
if(_isBordered==_1f){
return;
}
_isBordered=_1f;
objj_msgSend(_1d,"_updateBackground");
}
}),new objj_method(sel_getUid("isBordered"),function(_20,_21){
with(_20){
return _isBordered;
}
}),new objj_method(sel_getUid("setDrawsBackground:"),function(_22,_23,_24){
with(_22){
if(_drawsBackground==_24){
return;
}
_drawsBackground=_24;
objj_msgSend(_22,"_updateBackground");
}
}),new objj_method(sel_getUid("drawsBackground"),function(_25,_26){
with(_25){
return _drawsBackground;
}
}),new objj_method(sel_getUid("setTextFieldBackgroundColor:"),function(_27,_28,_29){
with(_27){
if(_textFieldBackgroundColor==_29){
return;
}
_textFieldBackgroundColor=_29;
objj_msgSend(_27,"_updateBackground");
}
}),new objj_method(sel_getUid("textFieldBackgroundColor"),function(_2a,_2b){
with(_2a){
return _textFieldBackgroundColor;
}
}),new objj_method(sel_getUid("_updateBackground"),function(_2c,_2d){
with(_2c){
if(_isBezeled){
if(_bezelStyle==CPTextFieldSquareBezel){
if(!_4){
var _2e=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPTextField,"class"));
_4=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2e,"pathForResource:","CPTextField/CPTextFieldBezelSquare0.png"),CGSizeMake(2,3)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2e,"pathForResource:","CPTextField/CPTextFieldBezelSquare1.png"),CGSizeMake(1,3)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2e,"pathForResource:","CPTextField/CPTextFieldBezelSquare2.png"),CGSizeMake(2,3)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2e,"pathForResource:","CPTextField/CPTextFieldBezelSquare3.png"),CGSizeMake(2,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2e,"pathForResource:","CPTextField/CPTextFieldBezelSquare4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2e,"pathForResource:","CPTextField/CPTextFieldBezelSquare5.png"),CGSizeMake(2,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2e,"pathForResource:","CPTextField/CPTextFieldBezelSquare6.png"),CGSizeMake(2,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2e,"pathForResource:","CPTextField/CPTextFieldBezelSquare7.png"),CGSizeMake(1,2)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2e,"pathForResource:","CPTextField/CPTextFieldBezelSquare8.png"),CGSizeMake(2,2))]));
}
objj_msgSend(_2c,"setBackgroundColor:",_4);
}else{
if(_bezelStyle==CPTextFieldRoundedBezel){
if(!_5){
var _2e=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPTextField,"class"));
_5=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2e,"pathForResource:","CPTextField/CPTextFieldBezelRounded0.png"),CGSizeMake(12,22)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2e,"pathForResource:","CPTextField/CPTextFieldBezelRounded1.png"),CGSizeMake(16,22)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2e,"pathForResource:","CPTextField/CPTextFieldBezelRounded2.png"),CGSizeMake(12,22))],NO));
}
objj_msgSend(_2c,"setBackgroundColor:",_5);
}
}
}else{
if(_drawsBackground){
objj_msgSend(_2c,"setBackgroundColor:",_textFieldBackgroundColor);
}else{
objj_msgSend(_2c,"setBackgroundColor:",nil);
}
}
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_2f,_30){
with(_2f){
return _isEditable;
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_31,_32){
with(_31){
var _33=objj_msgSend(_31,"stringValue");
objj_msgSend(_31,"setStringValue:","");
var _34=objj_msgSend(objj_msgSend(_31,"class"),"_inputElement");
_34.value=_33;
_34.style.color=_DOMElement.style.color;
_34.style.font=_DOMElement.style.font;
_34.style.zIndex=1000;
_34.style.width=CGRectGetWidth(objj_msgSend(_31,"bounds"))-3+"px";
_34.style.marginTop="0px";
_DOMElement.appendChild(_34);
window.setTimeout(function(){
_34.focus();
},0);
_34.onblur=function(){
objj_msgSend(_31,"setObjectValue:",_34.value);
objj_msgSend(_31,"sendAction:to:",objj_msgSend(_31,"action"),objj_msgSend(_31,"target"));
objj_msgSend(objj_msgSend(_31,"window"),"makeFirstResponder:",nil);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
_34.onkeydown=function(_35){
_textDidChangeValue=objj_msgSend(_31,"stringValue");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
return true;
};
_34.onkeypress=function(_36){
_36=_36||window.event;
if(_36.keyCode==13){
if(_36.preventDefault){
_36.preventDefault();
}
if(_36.stopPropagation){
_36.stopPropagation();
}
_36.cancelBubble=true;
_34.blur();
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
_34.onkeyup=function(_37){
if(objj_msgSend(_31,"stringValue")!=_textDidChangeValue){
_textDidChangeValue=objj_msgSend(_31,"stringValue");
objj_msgSend(_31,"textDidChange:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidChangeNotification,_31,nil));
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
if(objj_msgSend(_33,"lowercaseString")==objj_msgSend(objj_msgSend(_31,"placeholderString"),"lowercaseString")){
objj_msgSend(_31,"setStringValue:","");
}
objj_msgSend(_31,"textDidBeginEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidBeginEditingNotification,_31,nil));
objj_msgSend(objj_msgSend(CPDOMWindowBridge,"sharedDOMWindowBridge"),"_propagateCurrentDOMEvent:",YES);
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_38,_39){
with(_38){
var _3a=objj_msgSend(objj_msgSend(_38,"class"),"_inputElement");
_3a.onkeyup=nil;
_3a.onkeydown=nil;
_3a.onkeypress=nil;
_DOMElement.removeChild(_3a);
objj_msgSend(_38,"setStringValue:",_3a.value);
if(!_value){
objj_msgSend(_38,"setStringValue:",objj_msgSend(_38,"placeholderString"));
}
objj_msgSend(_38,"textDidEndEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidBeginEditingNotification,_38,nil));
return YES;
}
}),new objj_method(sel_getUid("mouseUp:"),function(_3b,_3c,_3d){
with(_3b){
if(_isEditable&&objj_msgSend(objj_msgSend(_3b,"window"),"firstResponder")==_3b){
return;
}
objj_msgSendSuper({receiver:_3b,super_class:objj_getClass("CPControl")},"mouseUp:",_3d);
}
}),new objj_method(sel_getUid("setEditable:"),function(_3e,_3f,_40){
with(_3e){
_isEditable=_40;
}
}),new objj_method(sel_getUid("isEditable"),function(_41,_42){
with(_41){
return _isEditable;
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_43,_44,_45){
with(_43){
objj_msgSendSuper({receiver:_43,super_class:objj_getClass("CPControl")},"setFrameSize:",_45);
if(!_DOMTextElement.CPDOMDisplayContext){
_DOMTextElement.CPDOMDisplayContext=[];
}
var _46=_DOMTextElement.CPDOMDisplayContext[4];
if(!(_46>=0)){
_46=_DOMTextElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_46]=4;
CPDOMDisplayServerInstructions[_46+1]=_DOMTextElement;
CPDOMDisplayServerInstructions[_46+2]=_frame.size.width-2*HORIZONTAL_PADDING;
CPDOMDisplayServerInstructions[_46+3]=_frame.size.height-_1-_2;
}
}),new objj_method(sel_getUid("isSelectable"),function(_47,_48){
with(_47){
return _isSelectable;
}
}),new objj_method(sel_getUid("setSelectable:"),function(_49,_4a,_4b){
with(_49){
_isSelectable=_4b;
}
}),new objj_method(sel_getUid("setAlignment:"),function(_4c,_4d,_4e){
with(_4c){
if(objj_msgSend(_4c,"alignment")==_4e){
return;
}
objj_msgSendSuper({receiver:_4c,super_class:objj_getClass("CPControl")},"setAlignment:",_4e);
switch(objj_msgSend(_4c,"alignment")){
case CPLeftTextAlignment:
_DOMTextElement.style.textAlign="left";
break;
case CPRightTextAlignment:
_DOMTextElement.style.textAlign="right";
break;
case CPCenterTextAlignment:
_DOMTextElement.style.textAlign="center";
break;
case CPJustifiedTextAlignment:
_DOMTextElement.style.textAlign="justify";
break;
case CPNaturalTextAlignment:
_DOMTextElement.style.textAlign="";
break;
}
}
}),new objj_method(sel_getUid("setLineBreakMode:"),function(_4f,_50,_51){
with(_4f){
_lineBreakMode=_51;
switch(_51){
case CPLineBreakByTruncatingTail:
_DOMTextElement.style.textOverflow="ellipsis";
_DOMTextElement.style.whiteSpace="nowrap";
_DOMTextElement.style.overflow="hidden";
if(document.attachEvent){
_DOMTextElement.style.wordWrap="normal";
}
break;
case CPLineBreakByWordWrapping:
if(document.attachEvent){
_DOMTextElement.style.whiteSpace="pre";
_DOMTextElement.style.wordWrap="break-word";
}else{
_DOMTextElement.style.whiteSpace="-o-pre-wrap";
_DOMTextElement.style.whiteSpace="-pre-wrap";
_DOMTextElement.style.whiteSpace="-moz-pre-wrap";
_DOMTextElement.style.whiteSpace="pre-wrap";
}
_DOMTextElement.style.overflow="hidden";
_DOMTextElement.style.textOverflow="clip";
break;
}
}
}),new objj_method(sel_getUid("objectValue"),function(_52,_53){
with(_52){
if(objj_msgSend(objj_msgSend(_52,"window"),"firstResponder")==_52){
return objj_msgSend(objj_msgSend(_52,"class"),"_inputElement").value;
}
if(objj_msgSendSuper({receiver:_52,super_class:objj_getClass("CPControl")},"objectValue")==objj_msgSend(_52,"placeholderString")){
return "";
}
return objj_msgSendSuper({receiver:_52,super_class:objj_getClass("CPControl")},"objectValue");
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_54,_55,_56){
with(_54){
objj_msgSendSuper({receiver:_54,super_class:objj_getClass("CPControl")},"setObjectValue:",_56);
var _57="";
if(_56&&objj_msgSend(_56,"respondsToSelector:",sel_getUid("string"))){
_57=objj_msgSend(_56,"string");
}else{
if(_56){
_57+=_56;
}
}
if(objj_msgSend(objj_msgSend(_54,"window"),"firstResponder")==_54){
objj_msgSend(objj_msgSend(_54,"class"),"_inputElement").value=_57;
}
if(CPFeatureIsCompatible(CPJavascriptInnerTextFeature)){
_DOMTextElement.innerText=_57;
}else{
if(CPFeatureIsCompatible(CPJavascriptTextContentFeature)){
_DOMTextElement.textContent=_57;
}
}
}
}),new objj_method(sel_getUid("placeholderString"),function(_58,_59){
with(_58){
return _placeholderString;
}
}),new objj_method(sel_getUid("setPlaceholderString:"),function(_5a,_5b,_5c){
with(_5a){
_placeholderString=_5c;
if(!_value){
objj_msgSend(_5a,"setStringValue:",_5c);
}
}
}),new objj_method(sel_getUid("sizeToFit"),function(_5d,_5e){
with(_5d){
var _5f=objj_msgSend((_value||" "),"sizeWithFont:",objj_msgSend(_5d,"font"));
objj_msgSend(_5d,"setFrameSize:",CGSizeMake(_5f.width+2*HORIZONTAL_PADDING,_5f.height+_1+_2));
}
}),new objj_method(sel_getUid("selectText:"),function(_60,_61,_62){
with(_60){
var _63=objj_msgSend(objj_msgSend(_60,"class"),"_inputElement");
if(_63.parentNode==_DOMElement&&(objj_msgSend(_60,"isEditable")||objj_msgSend(_60,"isSelectable"))){
_63.select();
}
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("_inputElement"),function(_64,_65){
with(_64){
if(!_3){
_3=document.createElement("input");
_3.style.position="absolute";
_3.style.top="0px";
_3.style.left="0px";
_3.style.width="100%";
_3.style.height="100%";
_3.style.border="0px";
_3.style.padding="0px";
_3.style.whiteSpace="pre";
_3.style.background="transparent";
_3.style.outline="none";
_3.style.paddingLeft=HORIZONTAL_PADDING-1+"px";
_3.style.paddingTop=_1-2+"px";
}
return _3;
}
})]);
var _66="CPTextFieldIsEditableKey",_67="CPTextFieldIsSelectableKey",_68="CPTextFieldIsBorderedKey",_69="CPTextFieldIsBezeledKey",_6a="CPTextFieldBezelStyleKey",_6b="CPTextFieldDrawsBackgroundKey",_6c="CPTextFieldLineBreakModeKey",_6d="CPTextFieldBackgroundColorKey",_6e="CPTextFieldPlaceholderStringKey";
var _6=objj_getClass("CPTextField");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTextField\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("initWithCoder:"),function(_6f,_70,_71){
with(_6f){
_DOMTextElement=document.createElement("div");
_6f=objj_msgSendSuper({receiver:_6f,super_class:objj_getClass("CPControl")},"initWithCoder:",_71);
if(_6f){
var _72=objj_msgSend(_6f,"bounds");
_DOMTextElement.style.position="absolute";
_DOMTextElement.style.top=_1+"px";
_DOMTextElement.style.left=HORIZONTAL_PADDING+"px";
_DOMTextElement.style.width=MAX(0,CGRectGetWidth(_72)-2*HORIZONTAL_PADDING)+"px";
_DOMTextElement.style.height=MAX(0,CGRectGetHeight(_72)-_1-_2)+"px";
_DOMTextElement.style.whiteSpace="pre";
_DOMTextElement.style.cursor="default";
_DOMElement.appendChild(_DOMTextElement);
objj_msgSend(_6f,"setEditable:",objj_msgSend(_71,"decodeBoolForKey:",_66));
objj_msgSend(_6f,"setSelectable:",objj_msgSend(_71,"decodeBoolForKey:",_67));
objj_msgSend(_6f,"setBordered:",objj_msgSend(_71,"decodeBoolForKey:",_68));
objj_msgSend(_6f,"setBezeled:",objj_msgSend(_71,"decodeBoolForKey:",_69));
objj_msgSend(_6f,"setBezelStyle:",objj_msgSend(_71,"decodeIntForKey:",_6a));
objj_msgSend(_6f,"setDrawsBackground:",objj_msgSend(_71,"decodeBoolForKey:",_6b));
objj_msgSend(_6f,"setLineBreakMode:",objj_msgSend(_71,"decodeIntForKey:",_6c));
objj_msgSend(_6f,"setTextFieldBackgroundColor:",objj_msgSend(_71,"decodeObjectForKey:",_6d));
objj_msgSend(_6f,"setPlaceholderString:",objj_msgSend(_71,"decodeObjectForKey:",_6e));
}
return _6f;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_73,_74,_75){
with(_73){
objj_msgSendSuper({receiver:_73,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_75);
objj_msgSend(_75,"encodeBool:forKey:",_isEditable,_66);
objj_msgSend(_75,"encodeBool:forKey:",_isSelectable,_67);
objj_msgSend(_75,"encodeBool:forKey:",_isBordered,_68);
objj_msgSend(_75,"encodeBool:forKey:",_isBezeled,_69);
objj_msgSend(_75,"encodeInt:forKey:",_bezelStyle,_6a);
objj_msgSend(_75,"encodeBool:forKey:",_drawsBackground,_6b);
objj_msgSend(_75,"encodeInt:forKey:",_lineBreakMode,_6c);
objj_msgSend(_75,"encodeObject:forKey:",_textFieldBackgroundColor,_6d);
objj_msgSend(_75,"encodeObject:forKey:",_placeholderString,_6e);
}
})]);
p;11;CPToolbar.jI;21;Foundation/CPObject.ji;15;CPPopUpButton.ji;15;CPToolbarItem.jc;16383;
CPToolbarDisplayModeDefault=0;
CPToolbarDisplayModeIconAndLabel=1;
CPToolbarDisplayModeIconOnly=2;
CPToolbarDisplayModeLabelOnly=3;
var _1=nil;
var _2=nil;
var _3=objj_allocateClassPair(CPObject,"CPToolbar"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_identifier"),new objj_ivar("_displayMode"),new objj_ivar("_showsBaselineSeparator"),new objj_ivar("_allowsUserCustomization"),new objj_ivar("_isVisible"),new objj_ivar("_delegate"),new objj_ivar("_itemIdentifiers"),new objj_ivar("_identifiedItems"),new objj_ivar("_defaultItems"),new objj_ivar("_allowedItems"),new objj_ivar("_selectableItems"),new objj_ivar("_items"),new objj_ivar("_itemsSortedByVisibilityPriority"),new objj_ivar("_toolbarView")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initWithIdentifier:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_items=[];
_identifier=_7;
_isVisible=YES;
objj_msgSend(CPToolbar,"_addToolbar:forIdentifier:",_5,_identifier);
}
return _5;
}
}),new objj_method(sel_getUid("setDisplayMode:"),function(_8,_9,_a){
with(_8){
}
}),new objj_method(sel_getUid("identifier"),function(_b,_c){
with(_b){
return _identifier;
}
}),new objj_method(sel_getUid("delegate"),function(_d,_e){
with(_d){
return _delegate;
}
}),new objj_method(sel_getUid("isVisible"),function(_f,_10){
with(_f){
return _isVisible;
}
}),new objj_method(sel_getUid("setVisible:"),function(_11,_12,_13){
with(_11){
if(_isVisible==_13){
return;
}
_isVisible=_13;
objj_msgSend(_window,"_setToolbarVisible:",_isVisible);
objj_msgSend(_11,"_reloadToolbarItems");
}
}),new objj_method(sel_getUid("setDelegate:"),function(_14,_15,_16){
with(_14){
if(_delegate==_16){
return;
}
_delegate=_16;
objj_msgSend(_14,"_reloadToolbarItems");
}
}),new objj_method(sel_getUid("_loadConfiguration"),function(_17,_18){
with(_17){
}
}),new objj_method(sel_getUid("_toolbarView"),function(_19,_1a){
with(_19){
if(!_toolbarView){
_toolbarView=objj_msgSend(objj_msgSend(_CPToolbarView,"alloc"),"initWithFrame:",CPRectMake(0,0,1200,59));
objj_msgSend(_toolbarView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_toolbarView,"setToolbar:",_19);
}
return _toolbarView;
}
}),new objj_method(sel_getUid("_reloadToolbarItems"),function(_1b,_1c){
with(_1b){
if(!objj_msgSend(_toolbarView,"superview")||!_delegate){
return;
}
var _1d=objj_msgSend(_itemIdentifiers,"count");
if(!_1d){
_itemIdentifiers=objj_msgSend(objj_msgSend(_delegate,"toolbarDefaultItemIdentifiers:",_1b),"mutableCopy");
_1d=objj_msgSend(_itemIdentifiers,"count");
}
objj_msgSend(objj_msgSend(_toolbarView,"subviews"),"makeObjectsPerformSelector:",sel_getUid("removeFromSuperview"));
_items=[];
var _1e=0;
for(;_1e<_1d;++_1e){
var _1f=_itemIdentifiers[_1e],_20=objj_msgSend(CPToolbarItem,"_standardItemWithItemIdentifier:",_1f);
if(!_20){
_20=objj_msgSend(objj_msgSend(_delegate,"toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:",_1b,_1f,YES),"copy");
}
if(_20==nil){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,sprintf("_delegate %s returned nil toolbar item returned for identifier %s",_delegate,_1f));
}
objj_msgSend(_items,"addObject:",_20);
}
_itemsSortedByVisibilityPriority=objj_msgSend(_items,"sortedArrayUsingFunction:context:",_21,NULL);
objj_msgSend(_toolbarView,"reloadToolbarItems");
}
}),new objj_method(sel_getUid("items"),function(_22,_23){
with(_22){
return _items;
}
}),new objj_method(sel_getUid("visibleItems"),function(_24,_25){
with(_24){
return objj_msgSend(_toolbarView,"visibleItems");
}
}),new objj_method(sel_getUid("itemsSortedByVisibilityPriority"),function(_26,_27){
with(_26){
return _itemsSortedByVisibilityPriority;
}
}),new objj_method(sel_getUid("_itemForItemIdentifier:willBeInsertedIntoToolbar:"),function(_28,_29,_2a,_2b){
with(_28){
var _2c=objj_msgSend(_identifiedItems,"objectForKey:",_2a);
if(!_2c){
_2c=objj_msgSend(CPToolbarItem,"_standardItemWithItemIdentifier:",_2a);
if(_delegate&&!_2c){
_2c=objj_msgSend(objj_msgSend(_delegate,"toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:",_28,_2a,_2b),"copy");
if(!_2c){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,sprintf("_delegate %s returned nil toolbar item returned for identifier %s",_delegate,_2a));
}
}
objj_msgSend(_identifiedItems,"setObject:forKey:",_2c,_2a);
}
return _2c;
}
}),new objj_method(sel_getUid("_itemsWithIdentifiers:"),function(_2d,_2e,_2f){
with(_2d){
var _30=[];
for(var i=0;i<_2f.length;i++){
objj_msgSend(_30,"addObject:",objj_msgSend(_2d,"_itemForItemIdentifier:willBeInsertedIntoToolbar:",_2f[i],NO));
}
return _30;
}
}),new objj_method(sel_getUid("_defaultToolbarItems"),function(_32,_33){
with(_32){
if(!_defaultItems){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("toolbarDefaultItemIdentifiers:"))){
_defaultItems=objj_msgSend(_32,"_itemsWithIdentifiers:",objj_msgSend(_delegate,"toolbarDefaultItemIdentifiers:",_32));
}
}
return _defaultItems;
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("initialize"),function(_34,_35){
with(_34){
if(_34!=objj_msgSend(CPToolbar,"class")){
return;
}
_1=objj_msgSend(CPDictionary,"dictionary");
_2=objj_msgSend(CPDictionary,"dictionary");
}
}),new objj_method(sel_getUid("_addToolbar:forIdentifier:"),function(_36,_37,_38,_39){
with(_36){
var _3a=objj_msgSend(_1,"objectForKey:",_39);
if(!_3a){
_3a=[];
objj_msgSend(_1,"setObject:forKey:",_3a,_39);
}
objj_msgSend(_3a,"addObject:",_38);
}
})]);
var _3b="CPToolbarIdentifierKey",_3c="CPToolbarDisplayModeKey",_3d="CPToolbarShowsBaselineSeparatorKey",_3e="CPToolbarAllowsUserCustomizationKey",_3f="CPToolbarIsVisibleKey",_40="CPToolbarDelegateKey",_41="CPToolbarIdentifiedItemsKey",_42="CPToolbarDefaultItemsKey",_43="CPToolbarAllowedItemsKey",_44="CPToolbarSelectableItemsKey";
var _3=objj_getClass("CPToolbar");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPToolbar\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_45,_46,_47){
with(_45){
_45=objj_msgSendSuper({receiver:_45,super_class:objj_getClass("CPObject")},"init");
if(_45){
_identifier=objj_msgSend(_47,"decodeObjectForKey:",_3b);
_displayMode=objj_msgSend(_47,"decodeIntForKey:",_3c);
_showsBaselineSeparator=objj_msgSend(_47,"decodeBoolForKey:",_3d);
_allowsUserCustomization=objj_msgSend(_47,"decodeBoolForKey:",_3e);
_isVisible=objj_msgSend(_47,"decodeBoolForKey:",_3f);
_identifiedItems=objj_msgSend(_47,"decodeObjectForKey:",_41);
_defaultItems=objj_msgSend(_47,"decodeObjectForKey:",_42);
_allowedItems=objj_msgSend(_47,"decodeObjectForKey:",_43);
_selectableItems=objj_msgSend(_47,"decodeObjectForKey:",_44);
_items=[];
objj_msgSend(CPToolbar,"_addToolbar:forIdentifier:",_45,_identifier);
objj_msgSend(_45,"setDelegate:",objj_msgSend(_47,"decodeObjectForKey:",_40));
}
return _45;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_48,_49,_4a){
with(_48){
objj_msgSend(_4a,"encodeObject:forKey:",_identifier,_3b);
objj_msgSend(_4a,"encodeInt:forKey:",_displayMode,_3c);
objj_msgSend(_4a,"encodeBool:forKey:",_showsBaselineSeparator,_3d);
objj_msgSend(_4a,"encodeBool:forKey:",_allowsUserCustomization,_3e);
objj_msgSend(_4a,"encodeBool:forKey:",_isVisible,_3f);
objj_msgSend(_4a,"encodeObject:forKey:",_identifiedItems,_41);
objj_msgSend(_4a,"encodeObject:forKey:",_defaultItems,_42);
objj_msgSend(_4a,"encodeObject:forKey:",_allowedItems,_43);
objj_msgSend(_4a,"encodeObject:forKey:",_selectableItems,_44);
objj_msgSend(_4a,"encodeConditionalObject:forKey:",_delegate,_40);
}
})]);
var _4b=nil,_4c=nil,_4d=nil;
var _4e=5,_4f=10,_50=20;
var _51=function(_52,_53,_54,_55){
return {index:_52,view:_53,label:_54,minWidth:_55};
};
var _3=objj_allocateClassPair(CPView,"_CPToolbarView"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_toolbar"),new objj_ivar("_flexibleWidthIndexes"),new objj_ivar("_visibleFlexibleWidthIndexes"),new objj_ivar("_itemInfos"),new objj_ivar("_visibleItems"),new objj_ivar("_invisibleItems"),new objj_ivar("_additionalItemsButton")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initWithFrame:"),function(_56,_57,_58){
with(_56){
_56=objj_msgSendSuper({receiver:_56,super_class:objj_getClass("CPView")},"initWithFrame:",_58);
if(_56){
_minWidth=0;
objj_msgSend(_56,"setBackgroundColor:",_4b);
_additionalItemsButton=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:pullsDown:",CGRectMake(0,0,10,15),YES);
objj_msgSend(_additionalItemsButton,"setBordered:",NO);
objj_msgSend(_additionalItemsButton,"setImagePosition:",CPImageOnly);
objj_msgSend(objj_msgSend(_additionalItemsButton,"menu"),"setShowsStateColumn:",NO);
objj_msgSend(_additionalItemsButton,"setAlternateImage:",_4d);
}
return _56;
}
}),new objj_method(sel_getUid("setToolbar:"),function(_59,_5a,_5b){
with(_59){
_toolbar=_5b;
}
}),new objj_method(sel_getUid("toolbar"),function(_5c,_5d){
with(_5c){
return _toolbar;
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_5e,_5f,_60){
with(_5e){
objj_msgSend(_5e,"layoutSubviews");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_61,_62){
with(_61){
var _63=objj_msgSend(_toolbar,"items"),_64=CGRectGetWidth(objj_msgSend(_61,"bounds")),_65=_minWidth,_66=objj_msgSend(CPIndexSet,"indexSet"),_67=[];
_visibleItems=_63;
if(_64<_65){
_64-=_50;
_visibleItems=objj_msgSend(_visibleItems,"copy");
var _68=objj_msgSend(_toolbar,"itemsSortedByVisibilityPriority"),_69=_68.length;
while(_65>_64){
var _6a=_68[_69--];
_65-=objj_msgSend(_61,"minWidthForItem:",_6a)+_4f;
objj_msgSend(_visibleItems,"removeObjectIdenticalTo:",_6a);
objj_msgSend(_67,"addObject:",_6a);
objj_msgSend(objj_msgSend(_61,"viewForItem:",_6a),"setHidden:",YES);
objj_msgSend(objj_msgSend(_61,"labelForItem:",_6a),"setHidden:",YES);
}
}
var _6b=_visibleItems.length,_6c=0;
while(_6b--){
var _6a=_visibleItems[_6b],_6d=objj_msgSend(_6a,"minSize"),_6e=objj_msgSend(_61,"viewForItem:",_6a);
if(_6d.width!=objj_msgSend(_6a,"maxSize").width){
objj_msgSend(_66,"addIndex:",_6b);
}else{
objj_msgSend(_6e,"setFrameSize:",CGSizeMake(objj_msgSend(_6a,"minSize").width,CGRectGetHeight(objj_msgSend(_6e,"frame"))));
}
objj_msgSend(_6e,"setHidden:",NO);
objj_msgSend(objj_msgSend(_61,"labelForItem:",_6a),"setHidden:",NO);
if(_6c<_6d.height){
_6c=_6d.height;
}
}
var _6f=_64-_65,_70=0;
while(_6f&&objj_msgSend(_66,"count")){
_70+=_6f/objj_msgSend(_66,"count");
_6f=0;
var _6b=CPNotFound;
while((_6b=objj_msgSend(_66,"indexGreaterThanIndex:",_6b))!=CPNotFound){
var _6a=_visibleItems[_6b];
_6e=objj_msgSend(_61,"viewForItem:",_6a),_71=objj_msgSend(_6e,"frame"),proposedWidth=objj_msgSend(_6a,"minSize").width+_70,constrainedWidth=MIN(proposedWidth,objj_msgSend(_6a,"maxSize").width);
if(constrainedWidth<proposedWidth){
objj_msgSend(_66,"removeIndex:",_6b);
_6f+=proposedWidth-constrainedWidth;
}
objj_msgSend(_6e,"setFrameSize:",CGSizeMake(constrainedWidth,CGRectGetHeight(_71)));
}
}
var _69=_visibleItems.length,x=_4f,_73=[];
for(_6b=0;_6b<_69;++_6b){
var _6a=_visibleItems[_6b],_6e=objj_msgSend(_61,"viewForItem:",_6a),_71=objj_msgSend(_6e,"frame"),_74=CGRectGetWidth(_71),_75=objj_msgSend(_61,"labelForItem:",_6a),_76=objj_msgSend(_75,"frame"),_77=CGRectGetWidth(_76),_78=MAX(objj_msgSend(_61,"minWidthForItem:",_6a),_74),_79=CGRectGetHeight(_71);
objj_msgSend(_6e,"setFrame:",CGRectMake(x+(_78-_74)/2,_4e+(_6c-_79)/2,_74,_79));
objj_msgSend(_75,"setFrameOrigin:",CGPointMake(x+(_78-_77)/2,_4e+_6c+2));
x+=_78+_4f;
if(objj_msgSend(_6a,"itemIdentifier")==CPToolbarSeparatorItemIdentifier){
_73.push(_6a);
}
}
for(_6b=0,_69=_73.length;_6b<_69;++_6b){
var _6e=objj_msgSend(_61,"viewForItem:",_73[_6b]),_79=53;
objj_msgSend(_6e,"setFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_6e,"frame")),(59-_79)/2,CGRectGetWidth(objj_msgSend(_6e,"frame")),_79));
}
if(objj_msgSend(_67,"count")){
var _6b=0,_69=objj_msgSend(_63,"count");
_invisibleItems=[];
for(;_6b<_69;++_6b){
var _6a=_63[_6b];
if(objj_msgSend(_67,"indexOfObjectIdenticalTo:",_6a)!=CPNotFound){
objj_msgSend(_invisibleItems,"addObject:",_6a);
}
}
objj_msgSend(_additionalItemsButton,"setFrameOrigin:",CGPointMake(_64+5,(CGRectGetHeight(objj_msgSend(_61,"bounds"))-CGRectGetHeight(objj_msgSend(_additionalItemsButton,"frame")))/2));
objj_msgSend(_61,"addSubview:",_additionalItemsButton);
objj_msgSend(_additionalItemsButton,"removeAllItems");
var _6b=0,_69=objj_msgSend(_invisibleItems,"count");
objj_msgSend(_additionalItemsButton,"addItemWithTitle:","Additional Items");
objj_msgSend(objj_msgSend(_additionalItemsButton,"itemArray")[0],"setImage:",_4c);
for(;_6b<_69;++_6b){
var _6a=_invisibleItems[_6b];
objj_msgSend(_additionalItemsButton,"addItemWithTitle:",objj_msgSend(_6a,"label"));
var _7a=objj_msgSend(_additionalItemsButton,"itemArray")[_6b+1];
objj_msgSend(_7a,"setImage:",objj_msgSend(_6a,"image"));
objj_msgSend(_7a,"setTarget:",objj_msgSend(_6a,"target"));
objj_msgSend(_7a,"setAction:",objj_msgSend(_6a,"action"));
}
}else{
objj_msgSend(_additionalItemsButton,"removeFromSuperview");
}
}
}),new objj_method(sel_getUid("viewForItem:"),function(_7b,_7c,_7d){
with(_7b){
var _7e=objj_msgSend(_itemInfos,"objectForKey:",objj_msgSend(_7d,"hash"));
if(!_7e){
return nil;
}
return _7e.view;
}
}),new objj_method(sel_getUid("labelForItem:"),function(_7f,_80,_81){
with(_7f){
var _82=objj_msgSend(_itemInfos,"objectForKey:",objj_msgSend(_81,"hash"));
if(!_82){
return nil;
}
return _82.label;
}
}),new objj_method(sel_getUid("minWidthForItem:"),function(_83,_84,_85){
with(_83){
var _86=objj_msgSend(_itemInfos,"objectForKey:",objj_msgSend(_85,"hash"));
if(!_86){
return 0;
}
return _86.minWidth;
}
}),new objj_method(sel_getUid("reloadToolbarItems"),function(_87,_88){
with(_87){
var _89=objj_msgSend(_87,"subviews"),_8a=_89.length;
while(_8a--){
objj_msgSend(_89,"removeObjectAtIndex:",_8a);
}
var _8b=objj_msgSend(_toolbar,"items"),_8c=0;
_8a=_8b.length;
_itemInfos=objj_msgSend(CPDictionary,"dictionary");
_minWidth=_4f;
for(;_8c<_8a;++_8c){
var _8d=_8b[_8c],_8e=objj_msgSend(_8d,"view");
if(!_8e){
_8e=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(0,0,32,32));
objj_msgSend(_8e,"setBordered:",NO);
objj_msgSend(_8e,"setImage:",objj_msgSend(_8d,"image"));
objj_msgSend(_8e,"setAlternateImage:",objj_msgSend(_8d,"alternateImage"));
objj_msgSend(_8e,"setTarget:",objj_msgSend(_8d,"target"));
objj_msgSend(_8e,"setAction:",objj_msgSend(_8d,"action"));
objj_msgSend(_8e,"setImagePosition:",CPImageOnly);
}
objj_msgSend(_87,"addSubview:",_8e);
var _8f=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_8f,"setStringValue:",objj_msgSend(_8d,"label"));
objj_msgSend(_8f,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",11));
objj_msgSend(_8f,"sizeToFit");
objj_msgSend(_8f,"setTarget:",objj_msgSend(_8d,"target"));
objj_msgSend(_8f,"setAction:",objj_msgSend(_8d,"action"));
objj_msgSend(_87,"addSubview:",_8f);
var _90=objj_msgSend(_8d,"minSize"),_91=MAX(_90.width,CGRectGetWidth(objj_msgSend(_8f,"frame")));
objj_msgSend(_itemInfos,"setObject:forKey:",_51(_8c,_8e,_8f,_91),objj_msgSend(_8d,"hash"));
_minWidth+=_91+_4f;
}
objj_msgSend(_87,"layoutSubviews");
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("initialize"),function(_92,_93){
with(_92){
if(_92!=objj_msgSend(_CPToolbarView,"class")){
return;
}
var _94=objj_msgSend(CPBundle,"bundleForClass:",_92);
_4b=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_94,"pathForResource:","_CPToolbarView/_CPToolbarViewBackground.png"),CGSizeMake(1,59)));
_4c=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_94,"pathForResource:","_CPToolbarView/_CPToolbarViewExtraItemsImage.png"),CPSizeMake(10,15));
_4d=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_94,"pathForResource:","_CPToolbarView/_CPToolbarViewExtraItemsAlternateImage.png"),CGSizeMake(10,15));
}
})]);
var _21=function(lhs,rhs){
var _97=objj_msgSend(lhs,"visibilityPriority"),_98=objj_msgSend(rhs,"visibilityPriority");
if(_97==_98){
return CPOrderedSame;
}
if(_97>_98){
return CPOrderedAscending;
}
return CPOrderedDescending;
};
p;15;CPToolbarItem.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;16;AppKit/CPImage.jI;15;AppKit/CPView.jc;9209;
CPToolbarItemVisibilityPriorityStandard=0;
CPToolbarItemVisibilityPriorityLow=-1000;
CPToolbarItemVisibilityPriorityHigh=1000;
CPToolbarItemVisibilityPriorityUser=2000;
CPToolbarSeparatorItemIdentifier="CPToolbarSeparatorItemIdentifier";
CPToolbarSpaceItemIdentifier="CPToolbarSpaceItemIdentifier";
CPToolbarFlexibleSpaceItemIdentifier="CPToolbarFlexibleSpaceItemIdentifier";
CPToolbarShowColorsItemIdentifier="CPToolbarShowColorsItemIdentifier";
CPToolbarShowFontsItemIdentifier="CPToolbarShowFontsItemIdentifier";
CPToolbarCustomizeToolbarItemIdentifier="CPToolbarCustomizeToolbarItemIdentifier";
CPToolbarPrintItemIdentifier="CPToolbarPrintItemIdentifier";
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"CPToolbarItem"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_itemIdentifier"),new objj_ivar("_toolbar"),new objj_ivar("_label"),new objj_ivar("_paletteLabel"),new objj_ivar("_toolTip"),new objj_ivar("_tag"),new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_isEnabled"),new objj_ivar("_image"),new objj_ivar("_alternateImage"),new objj_ivar("_view"),new objj_ivar("_minSize"),new objj_ivar("_maxSize"),new objj_ivar("_visibilityPriority")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithItemIdentifier:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPObject")},"init");
if(_4){
_itemIdentifier=_6;
_tag=0;
_isEnabled=YES;
_minSize=CGSizeMakeZero();
_maxSize=CGSizeMakeZero();
_visibilityPriority=CPToolbarItemVisibilityPriorityStandard;
}
return _4;
}
}),new objj_method(sel_getUid("itemIdentifier"),function(_7,_8){
with(_7){
return _itemIdentifier;
}
}),new objj_method(sel_getUid("toolbar"),function(_9,_a){
with(_9){
return _toolbar;
}
}),new objj_method(sel_getUid("label"),function(_b,_c){
with(_b){
return _label;
}
}),new objj_method(sel_getUid("setLabel:"),function(_d,_e,_f){
with(_d){
_label=_f;
}
}),new objj_method(sel_getUid("paletteLabel"),function(_10,_11){
with(_10){
return _paletteLabel;
}
}),new objj_method(sel_getUid("setPaletteLabel:"),function(_12,_13,_14){
with(_12){
_paletteLabel=_14;
}
}),new objj_method(sel_getUid("toolTip"),function(_15,_16){
with(_15){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("toolTip"))){
return objj_msgSend(_view,"toolTip");
}
return _toolTip;
}
}),new objj_method(sel_getUid("setToolTip:"),function(_17,_18,_19){
with(_17){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setToolTip:"))){
objj_msgSend(view,"setToolTip:",_19);
}
_toolTip=_19;
}
}),new objj_method(sel_getUid("tag"),function(_1a,_1b){
with(_1a){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("tag"))){
return objj_msgSend(_view,"tag");
}
return _tag;
}
}),new objj_method(sel_getUid("setTag:"),function(_1c,_1d,_1e){
with(_1c){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setTag:"))){
objj_msgSend(_view,"setTag:",_1e);
}
_tag=_1e;
}
}),new objj_method(sel_getUid("target"),function(_1f,_20){
with(_1f){
if(_view){
return objj_msgSend(_view,"respondsToSelector:",sel_getUid("target"))?objj_msgSend(_view,"target"):nil;
}
return _target;
}
}),new objj_method(sel_getUid("setTarget:"),function(_21,_22,_23){
with(_21){
if(!_view){
_target=_23;
}else{
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setTarget:"))){
objj_msgSend(_view,"setTarget:",_23);
}
}
}
}),new objj_method(sel_getUid("action"),function(_24,_25){
with(_24){
if(_view){
return objj_msgSend(_view,"respondsToSelector:",sel_getUid("action"))?objj_msgSend(_view,"action"):nil;
}
return _action;
}
}),new objj_method(sel_getUid("setAction:"),function(_26,_27,_28){
with(_26){
if(!_view){
_action=_28;
}else{
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setAction:"))){
objj_msgSend(_view,"setAction:",_28);
}
}
}
}),new objj_method(sel_getUid("isEnabled"),function(_29,_2a){
with(_29){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("isEnabled"))){
return objj_msgSend(_view,"isEnabled");
}
return _isEnabled;
}
}),new objj_method(sel_getUid("setEnabled:"),function(_2b,_2c,_2d){
with(_2b){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setEnabled:"))){
objj_msgSend(_view,"setEnabled:",_2d);
}
_isEnabled=_2d;
}
}),new objj_method(sel_getUid("image"),function(_2e,_2f){
with(_2e){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("image"))){
return objj_msgSend(_view,"image");
}
return _image;
}
}),new objj_method(sel_getUid("setImage:"),function(_30,_31,_32){
with(_30){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setImage:"))){
objj_msgSend(_view,"setImage:",_32);
}
_image=_32;
if(!_image){
return;
}
if(_minSize.width==0&&_minSize.height==0&&_maxSize.width==0&&_maxSize.height==0){
var _33=objj_msgSend(_image,"size");
if(_33.width>0||_33.height>0){
objj_msgSend(_30,"setMinSize:",_33);
objj_msgSend(_30,"setMaxSize:",_33);
}
}
}
}),new objj_method(sel_getUid("setAlternateImage:"),function(_34,_35,_36){
with(_34){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setAlternateImage:"))){
objj_msgSend(_view,"setAlternateImage:",_36);
}
_alternateImage=_36;
}
}),new objj_method(sel_getUid("alternateImage"),function(_37,_38){
with(_37){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("alternateIamge"))){
return objj_msgSend(_view,"alternateImage");
}
return _alternateImage;
}
}),new objj_method(sel_getUid("view"),function(_39,_3a){
with(_39){
return _view;
}
}),new objj_method(sel_getUid("setView:"),function(_3b,_3c,_3d){
with(_3b){
if(_view==_3d){
return;
}
_view=_3d;
if(_view){
if(_tag!==0&&objj_msgSend(_view,"respondsToSelector:",sel_getUid("setTag:"))){
objj_msgSend(_view,"setTag:",_tag);
}
_target=nil;
_action=nil;
}
}
}),new objj_method(sel_getUid("minSize"),function(_3e,_3f){
with(_3e){
return _minSize;
}
}),new objj_method(sel_getUid("setMinSize:"),function(_40,_41,_42){
with(_40){
_minSize=CGSizeMakeCopy(_42);
_maxSize=CGSizeMake(MAX(_minSize.width,_maxSize.width),MAX(_minSize.height,_maxSize.height));
}
}),new objj_method(sel_getUid("maxSize"),function(_43,_44){
with(_43){
return _maxSize;
}
}),new objj_method(sel_getUid("setMaxSize:"),function(_45,_46,_47){
with(_45){
_maxSize=CGSizeMakeCopy(_47);
_minSize=CGSizeMake(MIN(_minSize.width,_maxSize.width),MIN(_minSize.height,_maxSize.height));
}
}),new objj_method(sel_getUid("visibilityPriority"),function(_48,_49){
with(_48){
return _visibilityPriority;
}
}),new objj_method(sel_getUid("setVisibilityPriority:"),function(_4a,_4b,_4c){
with(_4a){
_visibilityPriority=_4c;
}
})]);
var _2=objj_getClass("CPToolbarItem");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPToolbarItem\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("copy"),function(_4d,_4e){
with(_4d){
var _4f=objj_msgSend(objj_msgSend(objj_msgSend(_4d,"class"),"alloc"),"initWithItemIdentifier:",_itemIdentifier);
if(_view){
objj_msgSend(_4f,"setView:",objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_view)));
}
objj_msgSend(_4f,"setLabel:",_label);
objj_msgSend(_4f,"setPaletteLabel:",_paletteLabel);
objj_msgSend(_4f,"setToolTip:",objj_msgSend(_4d,"toolTip"));
objj_msgSend(_4f,"setTag:",objj_msgSend(_4d,"tag"));
objj_msgSend(_4f,"setTarget:",objj_msgSend(_4d,"target"));
objj_msgSend(_4f,"setAction:",objj_msgSend(_4d,"action"));
objj_msgSend(_4f,"setEnabled:",objj_msgSend(_4d,"isEnabled"));
objj_msgSend(_4f,"setImage:",_image);
objj_msgSend(_4f,"setAlternateImage:",_alternateImage);
objj_msgSend(_4f,"setMinSize:",_minSize);
objj_msgSend(_4f,"setMaxSize:",_maxSize);
objj_msgSend(_4f,"setVisibilityPriority:",_visibilityPriority);
return _4f;
}
})]);
var _2=objj_getClass("CPToolbarItem");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPToolbarItem\""));
}
var _3=_2.isa;
class_addMethods(_3,[new objj_method(sel_getUid("_standardItemWithItemIdentifier:"),function(_50,_51,_52){
with(_50){
var _53=objj_msgSend(objj_msgSend(CPToolbarItem,"alloc"),"initWithItemIdentifier:",_52);
switch(_52){
case CPToolbarSeparatorItemIdentifier:
objj_msgSend(_53,"setMinSize:",CGSizeMake(2,0));
objj_msgSend(_53,"setMaxSize:",CGSizeMake(2,100000));
if(!_1){
_1=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,2,32));
sizes={};
sizes["CPToolbarItemSeparator"]=[CGSizeMake(2,26),CGSizeMake(2,1),CGSizeMake(2,26)];
objj_msgSend(_1,"setBackgroundColor:",_CPControlThreePartImagePattern(YES,sizes,"CPToolbarItem","Separator"));
}
objj_msgSend(_53,"setView:",_1);
return _53;
case CPToolbarSpaceItemIdentifier:
objj_msgSend(_53,"setMinSize:",CGSizeMake(32,32));
objj_msgSend(_53,"setMaxSize:",CGSizeMake(32,32));
return _53;
case CPToolbarFlexibleSpaceItemIdentifier:
objj_msgSend(_53,"setMinSize:",CGSizeMake(32,32));
objj_msgSend(_53,"setMaxSize:",CGSizeMake(10000,32));
return _53;
case CPToolbarShowColorsItemIdentifier:
return nil;
case CPToolbarShowFontsItemIdentifier:
return nil;
case CPToolbarCustomizeToolbarItemIdentifier:
return nil;
case CPToolbarPrintItemIdentifier:
return nil;
}
return nil;
}
})]);
p;8;CPView.jI;20;Foundation/CPArray.jI;26;Foundation/CPObjJRuntime.ji;19;CGAffineTransform.ji;12;CGGeometry.ji;9;CPColor.ji;20;CPDOMDisplayServer.ji;12;CPGeometry.ji;13;CPResponder.ji;19;CPGraphicsContext.jc;52531;
CPViewNotSizable=0;
CPViewMinXMargin=1;
CPViewWidthSizable=2;
CPViewMaxXMargin=4;
CPViewMinYMargin=8;
CPViewHeightSizable=16;
CPViewMaxYMargin=32;
CPViewBoundsDidChangeNotification="CPViewBoundsDidChangeNotification";
CPViewFrameDidChangeNotification="CPViewFrameDidChangeNotification";
var _1=1<<0,_2=1<<1;
var _3=nil;
var _4=nil,_5=0,_6=1,_7=2,_8=3,_9={};
var _a=objj_allocateClassPair(CPResponder,"CPView"),_b=_a.isa;
class_addIvars(_a,[new objj_ivar("_window"),new objj_ivar("_superview"),new objj_ivar("_subviews"),new objj_ivar("_graphicsContext"),new objj_ivar("_tag"),new objj_ivar("_frame"),new objj_ivar("_bounds"),new objj_ivar("_boundsTransform"),new objj_ivar("_inverseBoundsTransform"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_isHidden"),new objj_ivar("_hitTests"),new objj_ivar("_postsFrameChangedNotifications"),new objj_ivar("_postsBoundsChangedNotifications"),new objj_ivar("_inhibitFrameAndBoundsChangedNotifications"),new objj_ivar("_displayHash"),new objj_ivar("_DOMElement"),new objj_ivar("_DOMContentsElement"),new objj_ivar("_DOMImageParts"),new objj_ivar("_DOMImageSizes"),new objj_ivar("_backgroundType"),new objj_ivar("_dirtyRect"),new objj_ivar("_opacity"),new objj_ivar("_backgroundColor"),new objj_ivar("_autoresizesSubviews"),new objj_ivar("_autoresizingMask"),new objj_ivar("_layer"),new objj_ivar("_wantsLayer"),new objj_ivar("_isInFullScreenMode"),new objj_ivar("_fullScreenModeState")]);
objj_registerClassPair(_a);
objj_addClassForBundle(_a,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_a,[new objj_method(sel_getUid("init"),function(_c,_d){
with(_c){
return objj_msgSend(_c,"initWithFrame:",CGRectMakeZero());
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_e,_f,_10){
with(_e){
_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("CPResponder")},"init");
if(_e){
var _11=(_10.size.width),_12=(_10.size.height);
_subviews=[];
_tag=-1;
_frame={origin:{x:_10.origin.x,y:_10.origin.y},size:{width:_10.size.width,height:_10.size.height}};
_bounds={origin:{x:0,y:0},size:{width:_11,height:_12}};
_registeredDraggedTypes=[];
_autoresizingMask=CPViewNotSizable;
_autoresizesSubviews=YES;
_opacity=1;
_isHidden=NO;
_hitTests=YES;
_displayHash=objj_msgSend(_e,"hash");
_DOMElement=_4.cloneNode(false);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _13=_DOMElement.CPDOMDisplayContext[0];
if(!(_13>=0)){
_13=_DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_13]=0;
CPDOMDisplayServerInstructions[_13+1]=_DOMElement;
CPDOMDisplayServerInstructions[_13+2]=NULL;
CPDOMDisplayServerInstructions[_13+3]=(_10.origin.x);
CPDOMDisplayServerInstructions[_13+4]=(_10.origin.y);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _13=_DOMElement.CPDOMDisplayContext[4];
if(!(_13>=0)){
_13=_DOMElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_13]=4;
CPDOMDisplayServerInstructions[_13+1]=_DOMElement;
CPDOMDisplayServerInstructions[_13+2]=_11;
CPDOMDisplayServerInstructions[_13+3]=_12;
_DOMImageParts=[];
_DOMImageSizes=[];
}
return _e;
}
}),new objj_method(sel_getUid("superview"),function(_14,_15){
with(_14){
return _superview;
}
}),new objj_method(sel_getUid("subviews"),function(_16,_17){
with(_16){
return _subviews;
}
}),new objj_method(sel_getUid("window"),function(_18,_19){
with(_18){
return _window;
}
}),new objj_method(sel_getUid("addSubview:"),function(_1a,_1b,_1c){
with(_1a){
objj_msgSend(_1a,"_insertSubview:atIndex:",_1c,CPNotFound);
}
}),new objj_method(sel_getUid("addSubview:positioned:relativeTo:"),function(_1d,_1e,_1f,_20,_21){
with(_1d){
var _22=_21?objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_21):CPNotFound;
if(_22===CPNotFound){
_22=(_20===CPWindowAbove)?objj_msgSend(_subviews,"count"):0;
}else{
if(_20===CPWindowAbove){
++_22;
}
}
objj_msgSend(_1d,"_insertSubview:atIndex:",_1f,_22);
}
}),new objj_method(sel_getUid("_insertSubview:atIndex:"),function(_23,_24,_25,_26){
with(_23){
var _27=_subviews.length;
if(_25._superview==_23){
var _28=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_25);
if(_28===_26||_28===_27-1&&_26===_27){
return;
}
objj_msgSend(_subviews,"removeObjectAtIndex:",_28);
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=8;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_25._DOMElement;
if(_26>_28){
--_26;
}
--_27;
}else{
objj_msgSend(_25,"removeFromSuperview");
objj_msgSend(_25,"_setWindow:",_window);
objj_msgSend(_25,"viewWillMoveToSuperview:",_23);
_25._superview=_23;
}
if(_26===CPNotFound||_26>=_27){
_subviews.push(_25);
if(_25._DOMElement.CPDOMDisplayContext){
_25._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=6;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_25._DOMElement;
}else{
_subviews.splice(_26,0,_25);
if(_25._DOMElement.CPDOMDisplayContext){
_25._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=7;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_25._DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_subviews[_26+1]._DOMElement;
}
objj_msgSend(_25,"setNextResponder:",_23);
objj_msgSend(_25,"viewDidMoveToSuperview");
objj_msgSend(_23,"didAddSubview:",_25);
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_29,_2a,_2b){
with(_29){
}
}),new objj_method(sel_getUid("removeFromSuperview"),function(_2c,_2d){
with(_2c){
if(!_superview){
return;
}
objj_msgSend(_superview,"willRemoveSubview:",_2c);
objj_msgSend(objj_msgSend(_superview,"subviews"),"removeObject:",_2c);
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=8;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_superview._DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
_superview=nil;
objj_msgSend(_2c,"_setWindow:",nil);
}
}),new objj_method(sel_getUid("replaceSubview:with:"),function(_2e,_2f,_30,_31){
with(_2e){
if(_30._superview!=_2e){
return;
}
var _32=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_30);
objj_msgSend(_30,"removeFromSuperview");
objj_msgSend(_2e,"_insertSubview:atIndex:",_31,_32);
}
}),new objj_method(sel_getUid("_setWindow:"),function(_33,_34,_35){
with(_33){
if(objj_msgSend(_window,"firstResponder")==_33){
objj_msgSend(_window,"makeFirstResponder:",nil);
}
objj_msgSend(_33,"viewWillMoveToWindow:",_35);
objj_msgSend(_subviews,"makeObjectsPerformSelector:withObject:",sel_getUid("_setWindow:"),_35);
_window=_35;
objj_msgSend(_33,"viewDidMoveToWindow");
}
}),new objj_method(sel_getUid("isDescendantOf:"),function(_36,_37,_38){
with(_36){
var _39=_36;
do{
if(_39==_38){
return YES;
}
}while(_39=objj_msgSend(_39,"superview"));
return NO;
}
}),new objj_method(sel_getUid("viewDidMoveToSuperview"),function(_3a,_3b){
with(_3a){
objj_msgSend(_3a,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_3c,_3d){
with(_3c){
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(_3e,_3f,_40){
with(_3e){
}
}),new objj_method(sel_getUid("viewWillMoveToWindow:"),function(_41,_42,_43){
with(_41){
}
}),new objj_method(sel_getUid("willRemoveSubview:"),function(_44,_45,_46){
with(_44){
}
}),new objj_method(sel_getUid("enclosingMenuItem"),function(_47,_48){
with(_47){
var _49=_47;
while(!objj_msgSend(_49,"isKindOfClass:",objj_msgSend(_CPMenuItemView,"class"))){
_49=objj_msgSend(_49,"superview");
}
if(_49){
return _49._menuItem;
}
return nil;
}
}),new objj_method(sel_getUid("tag"),function(_4a,_4b){
with(_4a){
return _tag;
}
}),new objj_method(sel_getUid("isFlipped"),function(_4c,_4d){
with(_4c){
return YES;
}
}),new objj_method(sel_getUid("setFrame:"),function(_4e,_4f,_50){
with(_4e){
if(((_frame.origin.x==_50.origin.x&&_frame.origin.y==_50.origin.y)&&(_frame.size.width==_50.size.width&&_frame.size.height==_50.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_4e,"setFrameOrigin:",_50.origin);
objj_msgSend(_4e,"setFrameSize:",_50.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsFrameChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewFrameDidChangeNotification,_4e);
}
}
}),new objj_method(sel_getUid("frame"),function(_51,_52){
with(_51){
return {origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}};
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_53,_54,_55){
with(_53){
var _56=_frame.origin;
if(!_55||(_56.x==_55.x&&_56.y==_55.y)){
return;
}
_56.x=_55.x;
_56.y=_55.y;
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewFrameDidChangeNotification,_53);
}
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _57=_DOMElement.CPDOMDisplayContext[0];
if(!(_57>=0)){
_57=_DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_57]=0;
CPDOMDisplayServerInstructions[_57+1]=_DOMElement;
CPDOMDisplayServerInstructions[_57+2]=_superview?_superview._boundsTransform:NULL;
CPDOMDisplayServerInstructions[_57+3]=_56.x;
CPDOMDisplayServerInstructions[_57+4]=_56.y;
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_58,_59,_5a){
with(_58){
var _5b=_frame.size;
if(!_5a||(_5b.width==_5a.width&&_5b.height==_5a.height)){
return;
}
var _5c={width:_5b.width,height:_5b.height};
_5b.width=_5a.width;
_5b.height=_5a.height;
if(YES){
_bounds.size.width=_5a.width;
_bounds.size.height=_5a.height;
}
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewFrameDidChangeNotification,_58);
}
if(_layer){
objj_msgSend(_layer,"_owningViewBoundsChanged");
}
if(_autoresizesSubviews){
objj_msgSend(_58,"resizeSubviewsWithOldSize:",_5c);
}
objj_msgSend(_58,"setNeedsDisplay:",YES);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _5d=_DOMElement.CPDOMDisplayContext[4];
if(!(_5d>=0)){
_5d=_DOMElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_5d]=4;
CPDOMDisplayServerInstructions[_5d+1]=_DOMElement;
CPDOMDisplayServerInstructions[_5d+2]=_5b.width;
CPDOMDisplayServerInstructions[_5d+3]=_5b.height;
if(_DOMContentsElement){
if(!_DOMContentsElement.CPDOMDisplayContext){
_DOMContentsElement.CPDOMDisplayContext=[];
}
var _5d=_DOMContentsElement.CPDOMDisplayContext[5];
if(!(_5d>=0)){
_5d=_DOMContentsElement.CPDOMDisplayContext[5]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_5d]=5;
CPDOMDisplayServerInstructions[_5d+1]=_DOMContentsElement;
CPDOMDisplayServerInstructions[_5d+2]=_5b.width;
CPDOMDisplayServerInstructions[_5d+3]=_5b.height;
if(!_DOMContentsElement.CPDOMDisplayContext){
_DOMContentsElement.CPDOMDisplayContext=[];
}
var _5d=_DOMContentsElement.CPDOMDisplayContext[4];
if(!(_5d>=0)){
_5d=_DOMContentsElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_5d]=4;
CPDOMDisplayServerInstructions[_5d+1]=_DOMContentsElement;
CPDOMDisplayServerInstructions[_5d+2]=_5b.width;
CPDOMDisplayServerInstructions[_5d+3]=_5b.height;
}
if(_backgroundType==_5){
return;
}
var _5e=objj_msgSend(objj_msgSend(_backgroundColor,"patternImage"),"imageSlices");
if(_backgroundType==_6){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _5d=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_5d>=0)){
_5d=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_5d]=4;
CPDOMDisplayServerInstructions[_5d+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_5d+2]=_5b.width;
CPDOMDisplayServerInstructions[_5d+3]=_5b.height-_DOMImageSizes[0].height-_DOMImageSizes[2].height;
}else{
if(_backgroundType==_7){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _5d=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_5d>=0)){
_5d=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_5d]=4;
CPDOMDisplayServerInstructions[_5d+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_5d+2]=_5b.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width;
CPDOMDisplayServerInstructions[_5d+3]=_5b.height;
}else{
if(_backgroundType==_8){
var _5f=_5b.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width,_60=_5b.height-_DOMImageSizes[0].height-_DOMImageSizes[6].height;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _5d=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_5d>=0)){
_5d=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_5d]=4;
CPDOMDisplayServerInstructions[_5d+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_5d+2]=_5f;
CPDOMDisplayServerInstructions[_5d+3]=_DOMImageSizes[0].height;
if(!_DOMImageParts[3].CPDOMDisplayContext){
_DOMImageParts[3].CPDOMDisplayContext=[];
}
var _5d=_DOMImageParts[3].CPDOMDisplayContext[4];
if(!(_5d>=0)){
_5d=_DOMImageParts[3].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_5d]=4;
CPDOMDisplayServerInstructions[_5d+1]=_DOMImageParts[3];
CPDOMDisplayServerInstructions[_5d+2]=_DOMImageSizes[3].width;
CPDOMDisplayServerInstructions[_5d+3]=_60;
if(!_DOMImageParts[4].CPDOMDisplayContext){
_DOMImageParts[4].CPDOMDisplayContext=[];
}
var _5d=_DOMImageParts[4].CPDOMDisplayContext[4];
if(!(_5d>=0)){
_5d=_DOMImageParts[4].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_5d]=4;
CPDOMDisplayServerInstructions[_5d+1]=_DOMImageParts[4];
CPDOMDisplayServerInstructions[_5d+2]=_5f;
CPDOMDisplayServerInstructions[_5d+3]=_60;
if(!_DOMImageParts[5].CPDOMDisplayContext){
_DOMImageParts[5].CPDOMDisplayContext=[];
}
var _5d=_DOMImageParts[5].CPDOMDisplayContext[4];
if(!(_5d>=0)){
_5d=_DOMImageParts[5].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_5d]=4;
CPDOMDisplayServerInstructions[_5d+1]=_DOMImageParts[5];
CPDOMDisplayServerInstructions[_5d+2]=_DOMImageSizes[5].width;
CPDOMDisplayServerInstructions[_5d+3]=_60;
if(!_DOMImageParts[7].CPDOMDisplayContext){
_DOMImageParts[7].CPDOMDisplayContext=[];
}
var _5d=_DOMImageParts[7].CPDOMDisplayContext[4];
if(!(_5d>=0)){
_5d=_DOMImageParts[7].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_5d]=4;
CPDOMDisplayServerInstructions[_5d+1]=_DOMImageParts[7];
CPDOMDisplayServerInstructions[_5d+2]=_5f;
CPDOMDisplayServerInstructions[_5d+3]=_DOMImageSizes[7].height;
}
}
}
}
}),new objj_method(sel_getUid("setBounds:"),function(_61,_62,_63){
with(_61){
if(((_bounds.origin.x==_63.origin.x&&_bounds.origin.y==_63.origin.y)&&(_bounds.size.width==_63.size.width&&_bounds.size.height==_63.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_61,"setBoundsOrigin:",_63.origin);
objj_msgSend(_61,"setBoundsSize:",_63.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsBoundsChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_61);
}
}
}),new objj_method(sel_getUid("bounds"),function(_64,_65){
with(_64){
return {origin:{x:_bounds.origin.x,y:_bounds.origin.y},size:{width:_bounds.size.width,height:_bounds.size.height}};
}
}),new objj_method(sel_getUid("setBoundsOrigin:"),function(_66,_67,_68){
with(_66){
var _69=_bounds.origin;
if((_69.x==_68.x&&_69.y==_68.y)){
return;
}
_69.x=_68.x;
_69.y=_68.y;
if(_69.x!=0||_69.y!=0){
_boundsTransform={a:1,b:0,c:0,d:1,tx:-_69.x,ty:-_69.y};
_inverseBoundsTransform=CGAffineTransformInvert(_boundsTransform);
}else{
_boundsTransform=nil;
_inverseBoundsTransform=nil;
}
var _6a=_subviews.length;
while(_6a--){
var _6b=_subviews[_6a],_69=_6b._frame.origin;
if(!_6b._DOMElement.CPDOMDisplayContext){
_6b._DOMElement.CPDOMDisplayContext=[];
}
var _6c=_6b._DOMElement.CPDOMDisplayContext[0];
if(!(_6c>=0)){
_6c=_6b._DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_6c]=0;
CPDOMDisplayServerInstructions[_6c+1]=_6b._DOMElement;
CPDOMDisplayServerInstructions[_6c+2]=_boundsTransform;
CPDOMDisplayServerInstructions[_6c+3]=_69.x;
CPDOMDisplayServerInstructions[_6c+4]=_69.y;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_66);
}
}
}),new objj_method(sel_getUid("setBoundsSize:"),function(_6d,_6e,_6f){
with(_6d){
var _70=_bounds.size;
if((_70.width==_6f.width&&_70.height==_6f.height)){
return;
}
var _71=_frame.size;
if(!(_70.width==_71.width&&_70.height==_71.height)){
var _72=_bounds.origin;
_72.x/=_70.width/_71.width;
_72.y/=_70.height/_71.height;
}
_70.width=_6f.width;
_70.height=_6f.height;
if(!(_70.width==_71.width&&_70.height==_71.height)){
var _72=_bounds.origin;
_72.x*=_70.width/_71.width;
_72.y*=_70.height/_71.height;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_6d);
}
}
}),new objj_method(sel_getUid("resizeWithOldSuperviewSize:"),function(_73,_74,_75){
with(_73){
var _76=_autoresizingMask;
if(_76==CPViewNotSizable){
return;
}
var _77=_superview._frame,_78={origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}},dX=((_77.size.width)-_75.width)/(((_76&CPViewMinXMargin)?1:0)+(_76&CPViewWidthSizable?1:0)+(_76&CPViewMaxXMargin?1:0)),dY=((_77.size.height)-_75.height)/((_76&CPViewMinYMargin?1:0)+(_76&CPViewHeightSizable?1:0)+(_76&CPViewMaxYMargin?1:0));
if(_76&CPViewMinXMargin){
_78.origin.x+=dX;
}
if(_76&CPViewWidthSizable){
_78.size.width+=dX;
}
if(_76&CPViewMinYMargin){
_78.origin.y+=dY;
}
if(_76&CPViewHeightSizable){
_78.size.height+=dY;
}
objj_msgSend(_73,"setFrame:",_78);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_7b,_7c,_7d){
with(_7b){
var _7e=_subviews.length;
while(_7e--){
objj_msgSend(_subviews[_7e],"resizeWithOldSuperviewSize:",_7d);
}
}
}),new objj_method(sel_getUid("setAutoresizesSubviews:"),function(_7f,_80,_81){
with(_7f){
_autoresizesSubviews=_81;
}
}),new objj_method(sel_getUid("autoresizesSubviews"),function(_82,_83){
with(_82){
return _autoresizesSubviews;
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(_84,_85,_86){
with(_84){
_autoresizingMask=_86;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(_87,_88){
with(_87){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("enterFullScreenMode:withOptions:"),function(_89,_8a,_8b,_8c){
with(_89){
_fullScreenModeState=_8d(_89);
var _8e=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(objj_msgSend(CPDOMWindowBridge,"sharedDOMWindowBridge"),"contentBounds"),CPBorderlessWindowMask);
objj_msgSend(_8e,"setLevel:",CPScreenSaverWindowLevel);
objj_msgSend(_8e,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _8f=objj_msgSend(_8e,"contentView");
objj_msgSend(_8f,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_8f,"addSubview:",_89);
objj_msgSend(_89,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_89,"setFrame:",CGRectMakeCopy(objj_msgSend(_8f,"bounds")));
objj_msgSend(_8e,"makeKeyAndOrderFront:",_89);
objj_msgSend(_8e,"makeFirstResponder:",_89);
_isInFullScreenMode=YES;
return YES;
}
}),new objj_method(sel_getUid("exitFullScreenModeWithOptions:"),function(_90,_91,_92){
with(_90){
if(!_isInFullScreenMode){
return;
}
_isInFullScreenMode=NO;
objj_msgSend(_90,"setFrame:",_fullScreenModeState.frame);
objj_msgSend(_90,"setAutoresizingMask:",_fullScreenModeState.autoresizingMask);
objj_msgSend(_fullScreenModeState.superview,"_insertSubview:atIndex:",_90,_fullScreenModeState.index);
objj_msgSend(objj_msgSend(_90,"window"),"orderOut:",_90);
}
}),new objj_method(sel_getUid("isInFullScreenMode"),function(_93,_94){
with(_93){
return _isInFullScreenMode;
}
}),new objj_method(sel_getUid("setHidden:"),function(_95,_96,_97){
with(_95){
if(_isHidden==_97){
return;
}
_isHidden=_97;
_DOMElement.style.display=_isHidden?"none":"block";
}
}),new objj_method(sel_getUid("isHidden"),function(_98,_99){
with(_98){
return _isHidden;
}
}),new objj_method(sel_getUid("setAlphaValue:"),function(_9a,_9b,_9c){
with(_9a){
if(_opacity==_9c){
return;
}
_opacity=_9c;
if(CPFeatureIsCompatible(CPOpacityRequiresFilterFeature)){
if(_9c==1){
try{
_DOMElement.style.removeAttribute("filter");
}
catch(anException){
}
}else{
_DOMElement.style.filter="alpha(opacity="+_9c*100+")";
}
}else{
_DOMElement.style.opacity=_9c;
}
}
}),new objj_method(sel_getUid("alphaValue"),function(_9d,_9e){
with(_9d){
return _opacity;
}
}),new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"),function(_9f,_a0){
with(_9f){
var _a1=_9f;
while(!objj_msgSend(_a1,"isHidden")){
_a1=objj_msgSend(_a1,"superview");
}
return _a1!=nil;
}
}),new objj_method(sel_getUid("acceptsFirstMouse:"),function(_a2,_a3,_a4){
with(_a2){
return YES;
}
}),new objj_method(sel_getUid("hitTests"),function(_a5,_a6){
with(_a5){
return _hitTests;
}
}),new objj_method(sel_getUid("setHitTests:"),function(_a7,_a8,_a9){
with(_a7){
_hitTests=_a9;
}
}),new objj_method(sel_getUid("hitTest:"),function(_aa,_ab,_ac){
with(_aa){
if(_isHidden||!_hitTests||!CPRectContainsPoint(_frame,_ac)){
return nil;
}
var _ad=nil,i=_subviews.length,_af={x:_ac.x-(_frame.origin.x),y:_ac.y-(_frame.origin.y)};
if(_inverseBoundsTransform){
_af={x:_af.x*_inverseBoundsTransform.a+_af.y*_inverseBoundsTransform.c+_inverseBoundsTransform.tx,y:_af.x*_inverseBoundsTransform.b+_af.y*_inverseBoundsTransform.d+_inverseBoundsTransform.ty};
}
while(i--){
if(_ad=objj_msgSend(_subviews[i],"hitTest:",_af)){
return _ad;
}
}
return _aa;
}
}),new objj_method(sel_getUid("mouseDownCanMoveWindow"),function(_b0,_b1){
with(_b0){
return !objj_msgSend(_b0,"isOpaque");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_b2,_b3,_b4){
with(_b2){
if(objj_msgSend(_b2,"mouseDownCanMoveWindow")){
objj_msgSendSuper({receiver:_b2,super_class:objj_getClass("CPResponder")},"mouseDown:",_b4);
}
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_b5,_b6,_b7){
with(_b5){
if(_backgroundColor==_b7){
return;
}
_backgroundColor=_b7;
var _b8=objj_msgSend(_backgroundColor,"patternImage"),_b9=0;
if(objj_msgSend(_b8,"isThreePartImage")){
_backgroundType=objj_msgSend(_b8,"isVertical")?_6:_7;
_b9=3-_DOMImageParts.length;
}else{
if(objj_msgSend(_b8,"isNinePartImage")){
_backgroundType=_8;
_b9=9-_DOMImageParts.length;
}else{
_backgroundType=_5;
_b9=0-_DOMImageParts.length;
}
}
if(_b9>0){
while(_b9--){
var _ba=_4.cloneNode(false);
_ba.style.zIndex=-1000;
_DOMImageParts.push(_ba);
_DOMElement.appendChild(_ba);
}
}else{
_b9=-_b9;
while(_b9--){
_DOMElement.removeChild(_DOMImageParts.pop());
}
}
if(_backgroundType==_5){
_DOMElement.style.background=_backgroundColor?objj_msgSend(_backgroundColor,"cssString"):"";
}else{
var _bb=objj_msgSend(_b8,"imageSlices"),_bc=_bb.length,_bd=_frame.size;
while(_bc--){
var _be=_bb[_bc],_bf=_DOMImageSizes[_bc]=_be?objj_msgSend(_be,"size"):{width:0,height:0};
if(!_DOMImageParts[_bc].CPDOMDisplayContext){
_DOMImageParts[_bc].CPDOMDisplayContext=[];
}
var _c0=_DOMImageParts[_bc].CPDOMDisplayContext[4];
if(!(_c0>=0)){
_c0=_DOMImageParts[_bc].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_c0]=4;
CPDOMDisplayServerInstructions[_c0+1]=_DOMImageParts[_bc];
CPDOMDisplayServerInstructions[_c0+2]=_bf.width;
CPDOMDisplayServerInstructions[_c0+3]=_bf.height;
_DOMImageParts[_bc].style.background=_be?"url(\""+objj_msgSend(_be,"filename")+"\")":"";
}
if(_backgroundType==_8){
var _c1=_bd.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width,_c2=_bd.height-_DOMImageSizes[0].height-_DOMImageSizes[6].height;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _c0=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_c0>=0)){
_c0=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_c0]=4;
CPDOMDisplayServerInstructions[_c0+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_c0+2]=_c1;
CPDOMDisplayServerInstructions[_c0+3]=_DOMImageSizes[0].height;
if(!_DOMImageParts[3].CPDOMDisplayContext){
_DOMImageParts[3].CPDOMDisplayContext=[];
}
var _c0=_DOMImageParts[3].CPDOMDisplayContext[4];
if(!(_c0>=0)){
_c0=_DOMImageParts[3].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_c0]=4;
CPDOMDisplayServerInstructions[_c0+1]=_DOMImageParts[3];
CPDOMDisplayServerInstructions[_c0+2]=_DOMImageSizes[3].width;
CPDOMDisplayServerInstructions[_c0+3]=_c2;
if(!_DOMImageParts[4].CPDOMDisplayContext){
_DOMImageParts[4].CPDOMDisplayContext=[];
}
var _c0=_DOMImageParts[4].CPDOMDisplayContext[4];
if(!(_c0>=0)){
_c0=_DOMImageParts[4].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_c0]=4;
CPDOMDisplayServerInstructions[_c0+1]=_DOMImageParts[4];
CPDOMDisplayServerInstructions[_c0+2]=_c1;
CPDOMDisplayServerInstructions[_c0+3]=_c2;
if(!_DOMImageParts[5].CPDOMDisplayContext){
_DOMImageParts[5].CPDOMDisplayContext=[];
}
var _c0=_DOMImageParts[5].CPDOMDisplayContext[4];
if(!(_c0>=0)){
_c0=_DOMImageParts[5].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_c0]=4;
CPDOMDisplayServerInstructions[_c0+1]=_DOMImageParts[5];
CPDOMDisplayServerInstructions[_c0+2]=_DOMImageSizes[5].width;
CPDOMDisplayServerInstructions[_c0+3]=_c2;
if(!_DOMImageParts[7].CPDOMDisplayContext){
_DOMImageParts[7].CPDOMDisplayContext=[];
}
var _c0=_DOMImageParts[7].CPDOMDisplayContext[4];
if(!(_c0>=0)){
_c0=_DOMImageParts[7].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_c0]=4;
CPDOMDisplayServerInstructions[_c0+1]=_DOMImageParts[7];
CPDOMDisplayServerInstructions[_c0+2]=_c1;
CPDOMDisplayServerInstructions[_c0+3]=_DOMImageSizes[7].height;
if(!_DOMImageParts[0].CPDOMDisplayContext){
_DOMImageParts[0].CPDOMDisplayContext=[];
}
var _c0=_DOMImageParts[0].CPDOMDisplayContext[0];
if(!(_c0>=0)){
_c0=_DOMImageParts[0].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_c0]=0;
CPDOMDisplayServerInstructions[_c0+1]=_DOMImageParts[0];
CPDOMDisplayServerInstructions[_c0+2]=NULL;
CPDOMDisplayServerInstructions[_c0+3]=0;
CPDOMDisplayServerInstructions[_c0+4]=0;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _c0=_DOMImageParts[1].CPDOMDisplayContext[0];
if(!(_c0>=0)){
_c0=_DOMImageParts[1].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_c0]=0;
CPDOMDisplayServerInstructions[_c0+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_c0+2]=NULL;
CPDOMDisplayServerInstructions[_c0+3]=_DOMImageSizes[0].width;
CPDOMDisplayServerInstructions[_c0+4]=0;
if(!_DOMImageParts[2].CPDOMDisplayContext){
_DOMImageParts[2].CPDOMDisplayContext=[];
}
var _c0=_DOMImageParts[2].CPDOMDisplayContext[0];
if(!(_c0>=0)){
_c0=_DOMImageParts[2].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_c0]=1;
CPDOMDisplayServerInstructions[_c0+1]=_DOMImageParts[2];
CPDOMDisplayServerInstructions[_c0+2]=NULL;
CPDOMDisplayServerInstructions[_c0+3]=0;
CPDOMDisplayServerInstructions[_c0+4]=0;
if(!_DOMImageParts[3].CPDOMDisplayContext){
_DOMImageParts[3].CPDOMDisplayContext=[];
}
var _c0=_DOMImageParts[3].CPDOMDisplayContext[0];
if(!(_c0>=0)){
_c0=_DOMImageParts[3].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_c0]=0;
CPDOMDisplayServerInstructions[_c0+1]=_DOMImageParts[3];
CPDOMDisplayServerInstructions[_c0+2]=NULL;
CPDOMDisplayServerInstructions[_c0+3]=0;
CPDOMDisplayServerInstructions[_c0+4]=_DOMImageSizes[1].height;
if(!_DOMImageParts[4].CPDOMDisplayContext){
_DOMImageParts[4].CPDOMDisplayContext=[];
}
var _c0=_DOMImageParts[4].CPDOMDisplayContext[0];
if(!(_c0>=0)){
_c0=_DOMImageParts[4].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_c0]=0;
CPDOMDisplayServerInstructions[_c0+1]=_DOMImageParts[4];
CPDOMDisplayServerInstructions[_c0+2]=NULL;
CPDOMDisplayServerInstructions[_c0+3]=_DOMImageSizes[0].width;
CPDOMDisplayServerInstructions[_c0+4]=_DOMImageSizes[0].height;
if(!_DOMImageParts[5].CPDOMDisplayContext){
_DOMImageParts[5].CPDOMDisplayContext=[];
}
var _c0=_DOMImageParts[5].CPDOMDisplayContext[0];
if(!(_c0>=0)){
_c0=_DOMImageParts[5].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_c0]=1;
CPDOMDisplayServerInstructions[_c0+1]=_DOMImageParts[5];
CPDOMDisplayServerInstructions[_c0+2]=NULL;
CPDOMDisplayServerInstructions[_c0+3]=0;
CPDOMDisplayServerInstructions[_c0+4]=_DOMImageSizes[1].height;
if(!_DOMImageParts[6].CPDOMDisplayContext){
_DOMImageParts[6].CPDOMDisplayContext=[];
}
var _c0=_DOMImageParts[6].CPDOMDisplayContext[0];
if(!(_c0>=0)){
_c0=_DOMImageParts[6].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_c0]=2;
CPDOMDisplayServerInstructions[_c0+1]=_DOMImageParts[6];
CPDOMDisplayServerInstructions[_c0+2]=NULL;
CPDOMDisplayServerInstructions[_c0+3]=0;
CPDOMDisplayServerInstructions[_c0+4]=0;
if(!_DOMImageParts[7].CPDOMDisplayContext){
_DOMImageParts[7].CPDOMDisplayContext=[];
}
var _c0=_DOMImageParts[7].CPDOMDisplayContext[0];
if(!(_c0>=0)){
_c0=_DOMImageParts[7].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_c0]=2;
CPDOMDisplayServerInstructions[_c0+1]=_DOMImageParts[7];
CPDOMDisplayServerInstructions[_c0+2]=NULL;
CPDOMDisplayServerInstructions[_c0+3]=_DOMImageSizes[6].width;
CPDOMDisplayServerInstructions[_c0+4]=0;
if(!_DOMImageParts[8].CPDOMDisplayContext){
_DOMImageParts[8].CPDOMDisplayContext=[];
}
var _c0=_DOMImageParts[8].CPDOMDisplayContext[0];
if(!(_c0>=0)){
_c0=_DOMImageParts[8].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_c0]=3;
CPDOMDisplayServerInstructions[_c0+1]=_DOMImageParts[8];
CPDOMDisplayServerInstructions[_c0+2]=NULL;
CPDOMDisplayServerInstructions[_c0+3]=0;
CPDOMDisplayServerInstructions[_c0+4]=0;
}else{
if(_backgroundType==_6){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _c0=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_c0>=0)){
_c0=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_c0]=4;
CPDOMDisplayServerInstructions[_c0+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_c0+2]=_bd.width;
CPDOMDisplayServerInstructions[_c0+3]=_bd.height-_DOMImageSizes[0].height-_DOMImageSizes[2].height;
if(!_DOMImageParts[0].CPDOMDisplayContext){
_DOMImageParts[0].CPDOMDisplayContext=[];
}
var _c0=_DOMImageParts[0].CPDOMDisplayContext[0];
if(!(_c0>=0)){
_c0=_DOMImageParts[0].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_c0]=0;
CPDOMDisplayServerInstructions[_c0+1]=_DOMImageParts[0];
CPDOMDisplayServerInstructions[_c0+2]=NULL;
CPDOMDisplayServerInstructions[_c0+3]=0;
CPDOMDisplayServerInstructions[_c0+4]=0;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _c0=_DOMImageParts[1].CPDOMDisplayContext[0];
if(!(_c0>=0)){
_c0=_DOMImageParts[1].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_c0]=0;
CPDOMDisplayServerInstructions[_c0+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_c0+2]=NULL;
CPDOMDisplayServerInstructions[_c0+3]=0;
CPDOMDisplayServerInstructions[_c0+4]=_DOMImageSizes[0].height;
if(!_DOMImageParts[2].CPDOMDisplayContext){
_DOMImageParts[2].CPDOMDisplayContext=[];
}
var _c0=_DOMImageParts[2].CPDOMDisplayContext[0];
if(!(_c0>=0)){
_c0=_DOMImageParts[2].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_c0]=2;
CPDOMDisplayServerInstructions[_c0+1]=_DOMImageParts[2];
CPDOMDisplayServerInstructions[_c0+2]=NULL;
CPDOMDisplayServerInstructions[_c0+3]=0;
CPDOMDisplayServerInstructions[_c0+4]=0;
}else{
if(_backgroundType==_7){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _c0=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_c0>=0)){
_c0=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_c0]=4;
CPDOMDisplayServerInstructions[_c0+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_c0+2]=_bd.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width;
CPDOMDisplayServerInstructions[_c0+3]=_bd.height;
if(!_DOMImageParts[0].CPDOMDisplayContext){
_DOMImageParts[0].CPDOMDisplayContext=[];
}
var _c0=_DOMImageParts[0].CPDOMDisplayContext[0];
if(!(_c0>=0)){
_c0=_DOMImageParts[0].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_c0]=0;
CPDOMDisplayServerInstructions[_c0+1]=_DOMImageParts[0];
CPDOMDisplayServerInstructions[_c0+2]=NULL;
CPDOMDisplayServerInstructions[_c0+3]=0;
CPDOMDisplayServerInstructions[_c0+4]=0;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _c0=_DOMImageParts[1].CPDOMDisplayContext[0];
if(!(_c0>=0)){
_c0=_DOMImageParts[1].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_c0]=0;
CPDOMDisplayServerInstructions[_c0+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_c0+2]=NULL;
CPDOMDisplayServerInstructions[_c0+3]=_DOMImageSizes[0].width;
CPDOMDisplayServerInstructions[_c0+4]=0;
if(!_DOMImageParts[2].CPDOMDisplayContext){
_DOMImageParts[2].CPDOMDisplayContext=[];
}
var _c0=_DOMImageParts[2].CPDOMDisplayContext[0];
if(!(_c0>=0)){
_c0=_DOMImageParts[2].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_c0]=1;
CPDOMDisplayServerInstructions[_c0+1]=_DOMImageParts[2];
CPDOMDisplayServerInstructions[_c0+2]=NULL;
CPDOMDisplayServerInstructions[_c0+3]=0;
CPDOMDisplayServerInstructions[_c0+4]=0;
}
}
}
}
}
}),new objj_method(sel_getUid("backgroundColor"),function(_c3,_c4){
with(_c3){
return _backgroundColor;
}
}),new objj_method(sel_getUid("convertPoint:fromView:"),function(_c5,_c6,_c7,_c8){
with(_c5){
return CGPointApplyAffineTransform(_c7,_c9(_c8,_c5));
}
}),new objj_method(sel_getUid("convertPoint:toView:"),function(_ca,_cb,_cc,_cd){
with(_ca){
return CGPointApplyAffineTransform(_cc,_c9(_ca,_cd));
}
}),new objj_method(sel_getUid("convertSize:fromView:"),function(_ce,_cf,_d0,_d1){
with(_ce){
return CGSizeApplyAffineTransform(_d0,_c9(_d1,_ce));
}
}),new objj_method(sel_getUid("convertSize:toView:"),function(_d2,_d3,_d4,_d5){
with(_d2){
return CGSizeApplyAffineTransform(_d4,_c9(_d2,_d5));
}
}),new objj_method(sel_getUid("convertRect:fromView:"),function(_d6,_d7,_d8,_d9){
with(_d6){
return CGRectApplyAffineTransform(_d8,_c9(_d9,_d6));
}
}),new objj_method(sel_getUid("convertRect:toView:"),function(_da,_db,_dc,_dd){
with(_da){
return CGRectApplyAffineTransform(_dc,_c9(_da,_dd));
}
}),new objj_method(sel_getUid("setPostsFrameChangedNotifications:"),function(_de,_df,_e0){
with(_de){
if(_postsFrameChangedNotifications==_e0){
return;
}
_postsFrameChangedNotifications=_e0;
if(_postsFrameChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewFrameDidChangeNotification,_de);
}
}
}),new objj_method(sel_getUid("postsFrameChangedNotifications"),function(_e1,_e2){
with(_e1){
return _postsFrameChangedNotifications;
}
}),new objj_method(sel_getUid("setPostsBoundsChangedNotifications:"),function(_e3,_e4,_e5){
with(_e3){
if(_postsBoundsChangedNotifications==_e5){
return;
}
_postsBoundsChangedNotifications=_e5;
if(_postsBoundsChangedNotifications){
objj_msgSend(_3,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_e3);
}
}
}),new objj_method(sel_getUid("postsBoundsChangedNotifications"),function(_e6,_e7){
with(_e6){
return _postsBoundsChangedNotifications;
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(_e8,_e9,_ea,_eb,_ec,_ed,_ee,_ef,_f0){
with(_e8){
objj_msgSend(_window,"dragImage:at:offset:event:pasteboard:source:slideBack:",_ea,objj_msgSend(_e8,"convertPoint:toView:",_eb,nil),_ec,_ed,_ee,_ef,_f0);
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(_f1,_f2,_f3,_f4,_f5,_f6,_f7,_f8,_f9){
with(_f1){
objj_msgSend(_window,"dragView:at:offset:event:pasteboard:source:slideBack:",_f3,objj_msgSend(_f1,"convertPoint:toView:",_f4,nil),_f5,_f6,_f7,_f8,_f9);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(_fa,_fb,_fc){
with(_fa){
_registeredDraggedTypes=objj_msgSend(_fc,"copy");
}
}),new objj_method(sel_getUid("registeredDraggedTypes"),function(_fd,_fe){
with(_fd){
return _registeredDraggedTypes;
}
}),new objj_method(sel_getUid("unregisterDraggedTypes"),function(_ff,_cmd){
with(_ff){
_registeredDraggedTypes=nil;
}
}),new objj_method(sel_getUid("drawRect:"),function(self,_cmd,_103){
with(self){
}
}),new objj_method(sel_getUid("setNeedsDisplay:"),function(self,_cmd,_106){
with(self){
if(_106){
objj_msgSend(self,"setNeedsDisplayInRect:",objj_msgSend(self,"bounds"));
}else{
var _107=CPDOMDisplayServerViewsContext[objj_msgSend(self,"hash")];
if(typeof _107!="undefined"){
CPDOMDisplayServerViewsContext[objj_msgSend(self,"hash")];
CPDOMDisplayServerViews[_107]=NULL;
}
}
}
}),new objj_method(sel_getUid("setNeedsDisplayInRect:"),function(self,_cmd,_10a){
with(self){
var hash=objj_msgSend(objj_msgSend(self,"class"),"hash"),_10c=_9[hash];
if(!_10c&&typeof _10c==="undefined"){
_10c=objj_msgSend(self,"methodForSelector:",sel_getUid("drawRect:"))!=objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("drawRect:"));
_9[hash]=_10c;
}
if(!_10c){
return;
}
if((_10a.size.width<=0||_10a.size.height<=0)){
return;
}
if(_dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0)){
_dirtyRect=CGRectUnion(_10a,_dirtyRect);
}else{
_dirtyRect={origin:{x:_10a.origin.x,y:_10a.origin.y},size:{width:_10a.size.width,height:_10a.size.height}};
}
var _10d=objj_msgSend(self,"hash");
if(typeof (CPDOMDisplayServerViewsContext[_10d])=="undefined"){
CPDOMDisplayServerViews[CPDOMDisplayServerViewsCount++]=self;
CPDOMDisplayServerViewsContext[_10d]=self;
}
}
}),new objj_method(sel_getUid("needsDisplay"),function(self,_cmd){
with(self){
return _dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0);
}
}),new objj_method(sel_getUid("displayIfNeeded"),function(self,_cmd){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_dirtyRect);
}
}
}),new objj_method(sel_getUid("display"),function(self,_cmd){
with(self){
objj_msgSend(self,"displayRect:",objj_msgSend(self,"visibleRect"));
}
}),new objj_method(sel_getUid("displayIfNeededInRect:"),function(self,_cmd,_116){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_116);
}
}
}),new objj_method(sel_getUid("displayRect:"),function(self,_cmd,_119){
with(self){
objj_msgSend(self,"viewWillDraw");
objj_msgSend(self,"displayRectIgnoringOpacity:inContext:",_119,nil);
_dirtyRect=NULL;
}
}),new objj_method(sel_getUid("displayRectIgnoringOpacity:inContext:"),function(self,_cmd,_11c,_11d){
with(self){
objj_msgSend(self,"lockFocus");
CGContextClearRect(objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_11c);
objj_msgSend(self,"drawRect:",_11c);
objj_msgSend(self,"unlockFocus");
}
}),new objj_method(sel_getUid("viewWillDraw"),function(self,_cmd){
with(self){
}
}),new objj_method(sel_getUid("lockFocus"),function(self,_cmd){
with(self){
if(!_graphicsContext){
var _122=CGBitmapGraphicsContextCreate();
_DOMContentsElement=_122.DOMElement;
_DOMContentsElement.style.zIndex=-100;
_DOMContentsElement.style.overflow="hidden";
_DOMContentsElement.style.position="absolute";
_DOMContentsElement.style.visibility="visible";
_DOMContentsElement.width=ROUND((_frame.size.width));
_DOMContentsElement.height=ROUND((_frame.size.height));
_DOMContentsElement.style.top="0px";
_DOMContentsElement.style.left="0px";
_DOMContentsElement.style.width=ROUND((_frame.size.width))+"px";
_DOMContentsElement.style.height=ROUND((_frame.size.height))+"px";
if(_DOMContentsElement.CPDOMDisplayContext){
_DOMContentsElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=6;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMContentsElement;
_graphicsContext=objj_msgSend(CPGraphicsContext,"graphicsContextWithGraphicsPort:flipped:",_122,YES);
}
objj_msgSend(CPGraphicsContext,"setCurrentContext:",_graphicsContext);
CGContextSaveGState(objj_msgSend(_graphicsContext,"graphicsPort"));
}
}),new objj_method(sel_getUid("unlockFocus"),function(self,_cmd){
with(self){
CGContextRestoreGState(objj_msgSend(_graphicsContext,"graphicsPort"));
objj_msgSend(CPGraphicsContext,"setCurrentContext:",nil);
}
}),new objj_method(sel_getUid("isOpaque"),function(self,_cmd){
with(self){
return NO;
}
}),new objj_method(sel_getUid("visibleRect"),function(self,_cmd){
with(self){
if(!_superview){
return _bounds;
}
return CGRectIntersection(objj_msgSend(self,"convertRect:fromView:",objj_msgSend(_superview,"visibleRect"),_superview),_bounds);
}
}),new objj_method(sel_getUid("_enclosingClipView"),function(self,_cmd){
with(self){
var _12b=_superview,_12c=objj_msgSend(CPClipView,"class");
while(_12b&&!objj_msgSend(_12b,"isKindOfClass:",_12c)){
_12b=_12b._superview;
}
return _12b;
}
}),new objj_method(sel_getUid("scrollPoint:"),function(self,_cmd,_12f){
with(self){
var _130=objj_msgSend(self,"_enclosingClipView");
if(!_130){
return;
}
objj_msgSend(_130,"scrollToPoint:",objj_msgSend(self,"convertPoint:toView:",_12f,_130));
}
}),new objj_method(sel_getUid("scrollRectToVisible:"),function(self,_cmd,_133){
with(self){
var _134=objj_msgSend(self,"visibleRect");
_133=CGRectIntersection(_133,_bounds);
if((_133.size.width<=0||_133.size.height<=0)||CGRectContainsRect(_134,_133)){
return NO;
}
var _135=objj_msgSend(self,"_enclosingClipView");
if(!_135){
return NO;
}
var _136={x:_134.origin.x,y:_134.origin.y};
if((_133.origin.x)<=(_134.origin.x)){
_136.x=(_133.origin.x);
}else{
if((_133.origin.x+_133.size.width)>(_134.origin.x+_134.size.width)){
_136.x+=(_133.origin.x+_133.size.width)-(_134.origin.x+_134.size.width);
}
}
if((_133.origin.y)<=(_134.origin.y)){
_136.y=CGRectGetMinY(_133);
}else{
if((_133.origin.y+_133.size.height)>(_134.origin.y+_134.size.height)){
_136.y+=(_133.origin.y+_133.size.height)-(_134.origin.y+_134.size.height);
}
}
objj_msgSend(_135,"scrollToPoint:",CGPointMake(_136.x,_136.y));
return YES;
}
}),new objj_method(sel_getUid("autoscroll:"),function(self,_cmd,_139){
with(self){
return NO;
}
}),new objj_method(sel_getUid("adjustScroll:"),function(self,_cmd,_13c){
with(self){
return _13c;
}
}),new objj_method(sel_getUid("scrollRect:by:"),function(self,_cmd,_13f,_140){
with(self){
}
}),new objj_method(sel_getUid("enclosingScrollView"),function(self,_cmd){
with(self){
var _143=_superview,_144=objj_msgSend(CPScrollView,"class");
while(_143&&!objj_msgSend(_143,"isKindOfClass:",_144)){
_143=_143._superview;
}
return _143;
}
}),new objj_method(sel_getUid("scrollClipView:toPoint:"),function(self,_cmd,_147,_148){
with(self){
objj_msgSend(_147,"scrollToPoint:",_148);
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(self,_cmd,_14b){
with(self){
}
})]);
class_addMethods(_b,[new objj_method(sel_getUid("initialize"),function(self,_cmd){
with(self){
if(self!=objj_msgSend(CPView,"class")){
return;
}
_4=document.createElement("div");
var _14e=_4.style;
_14e.overflow="hidden";
_14e.position="absolute";
_14e.visibility="visible";
_14e.zIndex=0;
_3=objj_msgSend(CPNotificationCenter,"defaultCenter");
}
})]);
var _a=objj_getClass("CPView");
if(!_a){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _b=_a.isa;
class_addMethods(_a,[new objj_method(sel_getUid("setLayer:"),function(self,_cmd,_151){
with(self){
if(_layer==_151){
return;
}
if(_layer){
_layer._owningView=nil;
_DOMElement.removeChild(_layer._DOMElement);
}
_layer=_151;
if(_layer){
var _152=CGRectMakeCopy(objj_msgSend(self,"bounds"));
objj_msgSend(_layer,"_setOwningView:",self);
_layer._DOMElement.style.zIndex=100;
_DOMElement.appendChild(_layer._DOMElement);
}
}
}),new objj_method(sel_getUid("layer"),function(self,_cmd){
with(self){
return _layer;
}
}),new objj_method(sel_getUid("setWantsLayer:"),function(self,_cmd,_157){
with(self){
_wantsLayer=_157;
}
}),new objj_method(sel_getUid("wantsLayer"),function(self,_cmd){
with(self){
return _wantsLayer;
}
})]);
var _15a="CPViewAutoresizingMask",_15b="CPViewAutoresizesSubviews",_15c="CPViewBackgroundColor",_15d="CPViewBoundsKey",_15e="CPViewFrameKey",_15f="CPViewHitTestsKey",_160="CPViewIsHiddenKey",_161="CPViewOpacityKey",_162="CPViewSubviewsKey",_163="CPViewSuperviewKey",_164="CPViewTagKey",_165="CPViewWindowKey";
var _a=objj_getClass("CPView");
if(!_a){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _b=_a.isa;
class_addMethods(_a,[new objj_method(sel_getUid("initWithCoder:"),function(self,_cmd,_168){
with(self){
_DOMElement=_4.cloneNode(false);
_frame=objj_msgSend(_168,"decodeRectForKey:",_15e);
_bounds=objj_msgSend(_168,"decodeRectForKey:",_15d);
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"initWithCoder:",_168);
if(self){
_tag=-1;
if(objj_msgSend(_168,"containsValueForKey:",_164)){
_tag=objj_msgSend(_168,"decodeIntForKey:",_164);
}
_window=objj_msgSend(_168,"decodeObjectForKey:",_165);
_subviews=objj_msgSend(_168,"decodeObjectForKey:",_162);
_superview=objj_msgSend(_168,"decodeObjectForKey:",_163);
_autoresizingMask=objj_msgSend(_168,"decodeIntForKey:",_15a);
_autoresizesSubviews=objj_msgSend(_168,"decodeBoolForKey:",_15b);
_hitTests=objj_msgSend(_168,"decodeObjectForKey:",_15f);
_isHidden=objj_msgSend(_168,"decodeObjectForKey:",_160);
_opacity=objj_msgSend(_168,"decodeIntForKey:",_161);
_DOMImageParts=[];
_DOMImageSizes=[];
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _169=_DOMElement.CPDOMDisplayContext[0];
if(!(_169>=0)){
_169=_DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_169]=0;
CPDOMDisplayServerInstructions[_169+1]=_DOMElement;
CPDOMDisplayServerInstructions[_169+2]=NULL;
CPDOMDisplayServerInstructions[_169+3]=(_frame.origin.x);
CPDOMDisplayServerInstructions[_169+4]=(_frame.origin.y);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _169=_DOMElement.CPDOMDisplayContext[4];
if(!(_169>=0)){
_169=_DOMElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_169]=4;
CPDOMDisplayServerInstructions[_169+1]=_DOMElement;
CPDOMDisplayServerInstructions[_169+2]=(_frame.size.width);
CPDOMDisplayServerInstructions[_169+3]=(_frame.size.height);
var _16a=0,_16b=_subviews.length;
for(;_16a<_16b;++_16a){
if(_subviews[_16a]._DOMElement.CPDOMDisplayContext){
_subviews[_16a]._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=6;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_subviews[_16a]._DOMElement;
}
_displayHash=objj_msgSend(self,"hash");
objj_msgSend(self,"setBackgroundColor:",objj_msgSend(_168,"decodeObjectForKey:",_15c));
objj_msgSend(self,"setNeedsDisplay:",YES);
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_cmd,_16e){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"encodeWithCoder:",_16e);
if(_tag!=-1){
objj_msgSend(_16e,"encodeInt:forKey:",_tag,_164);
}
objj_msgSend(_16e,"encodeRect:forKey:",_frame,_15e);
objj_msgSend(_16e,"encodeRect:forKey:",_bounds,_15d);
objj_msgSend(_16e,"encodeConditionalObject:forKey:",_window,_165);
objj_msgSend(_16e,"encodeObject:forKey:",_subviews,_162);
objj_msgSend(_16e,"encodeConditionalObject:forKey:",_superview,_163);
objj_msgSend(_16e,"encodeInt:forKey:",_autoresizingMask,_15a);
objj_msgSend(_16e,"encodeBool:forKey:",_autoresizesSubviews,_15b);
objj_msgSend(_16e,"encodeObject:forKey:",_backgroundColor,_15c);
objj_msgSend(_16e,"encodeBool:forKey:",_hitTests,_15f);
objj_msgSend(_16e,"encodeBool:forKey:",_isHidden,_160);
objj_msgSend(_16e,"encodeFloat:forKey:",_opacity,_161);
}
})]);
var _8d=function(_16f){
var _170=_16f._superview;
return {autoresizingMask:_16f._autoresizingMask,frame:CGRectMakeCopy(_16f._frame),index:(_170?objj_msgSend(_170._subviews,"indexOfObjectIdenticalTo:",_16f):0),superview:_170};
};
var _c9=function(_171,_172){
var _173=CGAffineTransformMakeIdentity();
if(_171){
var view=_171;
while(view&&view!=_172){
var _175=view._frame;
_173.tx+=(_175.origin.x);
_173.ty+=(_175.origin.y);
if(view._boundsTransform){
var tx=_173.tx*view._boundsTransform.a+_173.ty*view._boundsTransform.c+view._boundsTransform.tx;
_173.ty=_173.tx*view._boundsTransform.b+_173.ty*view._boundsTransform.d+view._boundsTransform.ty;
_173.tx=tx;
var a=_173.a*view._boundsTransform.a+_173.b*view._boundsTransform.c,b=_173.a*view._boundsTransform.b+_173.b*view._boundsTransform.d,c=_173.c*view._boundsTransform.a+_173.d*view._boundsTransform.c;
_173.d=_173.c*view._boundsTransform.b+_173.d*view._boundsTransform.d;
_173.a=a;
_173.b=b;
_173.c=c;
}
view=view._superview;
}
if(view==_172){
return _173;
}
}
var view=_172;
while(view){
var _175=view._frame;
_173.tx-=(_175.origin.x);
_173.ty-=(_175.origin.y);
if(view._boundsTransform){
var tx=_173.tx*view._inverseBoundsTransform.a+_173.ty*view._inverseBoundsTransform.c+view._inverseBoundsTransform.tx;
_173.ty=_173.tx*view._inverseBoundsTransform.b+_173.ty*view._inverseBoundsTransform.d+view._inverseBoundsTransform.ty;
_173.tx=tx;
var a=_173.a*view._inverseBoundsTransform.a+_173.b*view._inverseBoundsTransform.c,b=_173.a*view._inverseBoundsTransform.b+_173.b*view._inverseBoundsTransform.d,c=_173.c*view._inverseBoundsTransform.a+_173.d*view._inverseBoundsTransform.c;
_173.d=_173.c*view._inverseBoundsTransform.b+_173.d*view._inverseBoundsTransform.d;
_173.a=a;
_173.b=b;
_173.c=c;
}
view=view._superview;
}
return _173;
};
p;11;CPWebView.ji;8;CPView.jc;9733;
CPWebViewProgressStartedNotification="CPWebViewProgressStartedNotification";
CPWebViewProgressFinishedNotification="CPWebViewProgressFinishedNotification";
var _1=objj_allocateClassPair(CPView,"CPWebView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_iframe"),new objj_ivar("_mainFrameURL"),new objj_ivar("_backwardStack"),new objj_ivar("_forwardStack"),new objj_ivar("_ignoreLoadEvent"),new objj_ivar("_downloadDelegate"),new objj_ivar("_frameLoadDelegate"),new objj_ivar("_policyDelegate"),new objj_ivar("_resourceLoadDelegate"),new objj_ivar("_UIDelegate"),new objj_ivar("_wso")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:frameName:groupName:"),function(_3,_4,_5,_6,_7){
with(_3){
if(_3=objj_msgSend(_3,"initWithFrame:",_5)){
_iframe.name=_6;
}
return _3;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
if(_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPView")},"initWithFrame:",_a)){
_mainFrameURL=nil;
_backwardStack=[];
_forwardStack=[];
objj_msgSend(_8,"_initDOMWithFrame:",_a);
}
return _8;
}
}),new objj_method(sel_getUid("_initDOMWithFrame:"),function(_b,_c,_d){
with(_b){
_ignoreLoadEvent=NO;
_iframe=document.createElement("iframe");
_iframe.name="iframe_"+Math.floor(Math.random()*10000);
_iframe.style.width="100%";
_iframe.style.height="100%";
_iframe.style.borderWidth="0px";
objj_msgSend(_b,"setDrawsBackground:",YES);
var _e=function(){
if(!_ignoreLoadEvent){
objj_msgSend(_b,"_startedLoading");
if(_mainFrameURL){
objj_msgSend(_backwardStack,"addObject:",_mainFrameURL);
}
_mainFrameURL=_iframe.src;
objj_msgSend(_forwardStack,"removeAllObjects");
}
_ignoreLoadEvent=NO;
objj_msgSend(_b,"_finishedLoading");
};
if(_iframe.addEventListener){
_iframe.addEventListener("load",_e,false);
}else{
if(_iframe.attachEvent){
_iframe.attachEvent("onload",_e);
}
}
_DOMElement.appendChild(_iframe);
}
}),new objj_method(sel_getUid("takeStringURLFrom:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_f,"setMainFrameURL:",objj_msgSend(_11,"stringValue"));
}
}),new objj_method(sel_getUid("goBack:"),function(_12,_13,_14){
with(_12){
objj_msgSend(_12,"goBack");
}
}),new objj_method(sel_getUid("goForward:"),function(_15,_16,_17){
with(_15){
objj_msgSend(_15,"goForward");
}
}),new objj_method(sel_getUid("stopLoading:"),function(_18,_19,_1a){
with(_18){
}
}),new objj_method(sel_getUid("reload:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSend(_1b,"_loadMainFrameURL");
}
}),new objj_method(sel_getUid("print:"),function(_1e,_1f,_20){
with(_1e){
try{
objj_msgSend(_1e,"window").print();
}
catch(e){
alert("Please click the webpage and select \"Print\" from the \"File\" menu");
}
}
}),new objj_method(sel_getUid("drawsBackground"),function(_21,_22){
with(_21){
return _iframe.style.backgroundColor!="";
}
}),new objj_method(sel_getUid("setDrawsBackground:"),function(_23,_24,_25){
with(_23){
_iframe.style.backgroundColor=_25?"white":"";
}
}),new objj_method(sel_getUid("_loadMainFrameURL"),function(_26,_27){
with(_26){
objj_msgSend(_26,"_startedLoading");
_ignoreLoadEvent=YES;
_iframe.src=_mainFrameURL;
}
}),new objj_method(sel_getUid("_startedLoading"),function(_28,_29){
with(_28){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWebViewProgressStartedNotification,_28);
if(objj_msgSend(_frameLoadDelegate,"respondsToSelector:",sel_getUid("webView:didStartProvisionalLoadForFrame:"))){
objj_msgSend(_frameLoadDelegate,"webView:didStartProvisionalLoadForFrame:",_28,nil);
}
}
}),new objj_method(sel_getUid("_finishedLoading"),function(_2a,_2b){
with(_2a){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWebViewProgressFinishedNotification,_2a);
if(objj_msgSend(_frameLoadDelegate,"respondsToSelector:",sel_getUid("webView:didFinishLoadForFrame:"))){
objj_msgSend(_frameLoadDelegate,"webView:didFinishLoadForFrame:",_2a,nil);
}
}
}),new objj_method(sel_getUid("mainFrameURL"),function(_2c,_2d){
with(_2c){
return _mainFrameURL;
}
}),new objj_method(sel_getUid("setMainFrameURL:"),function(_2e,_2f,_30){
with(_2e){
if(_mainFrameURL){
objj_msgSend(_backwardStack,"addObject:",_mainFrameURL);
}
_mainFrameURL=_30;
objj_msgSend(_forwardStack,"removeAllObjects");
objj_msgSend(_2e,"_loadMainFrameURL");
}
}),new objj_method(sel_getUid("goBack"),function(_31,_32){
with(_31){
if(_backwardStack.length>0){
if(_mainFrameURL){
objj_msgSend(_forwardStack,"addObject:",_mainFrameURL);
}
_mainFrameURL=objj_msgSend(_backwardStack,"lastObject");
objj_msgSend(_backwardStack,"removeLastObject");
objj_msgSend(_31,"_loadMainFrameURL");
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("goForward"),function(_33,_34){
with(_33){
if(_forwardStack.length>0){
if(_mainFrameURL){
objj_msgSend(_backwardStack,"addObject:",_mainFrameURL);
}
_mainFrameURL=objj_msgSend(_forwardStack,"lastObject");
objj_msgSend(_forwardStack,"removeLastObject");
objj_msgSend(_33,"_loadMainFrameURL");
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("canGoBack"),function(_35,_36){
with(_35){
return (_backwardStack.length>0);
}
}),new objj_method(sel_getUid("canGoForward"),function(_37,_38){
with(_37){
return (_forwardStack.length>0);
}
}),new objj_method(sel_getUid("backForwardList"),function(_39,_3a){
with(_39){
return {back:_backwardStack,forward:_forwardStack};
}
}),new objj_method(sel_getUid("close"),function(_3b,_3c){
with(_3b){
_DOMElement.removeChild(_iframe);
}
}),new objj_method(sel_getUid("window"),function(_3d,_3e){
with(_3d){
return (_iframe.contentDocument&&_iframe.contentDocument.defaultView)||_iframe.contentWindow;
}
}),new objj_method(sel_getUid("windowScriptObject"),function(_3f,_40){
with(_3f){
var win=objj_msgSend(_3f,"window");
if(!_wso||win!=objj_msgSend(_wso,"window")){
if(win){
_wso=objj_msgSend(objj_msgSend(CPWebScriptObject,"alloc"),"initWithWindow:",win);
}else{
_wso=nil;
}
}
return _wso;
}
}),new objj_method(sel_getUid("stringByEvaluatingJavaScriptFromString:"),function(_42,_43,_44){
with(_42){
var _45=objj_msgSend(_42,"objectByEvaluatingJavaScriptFromString:",_44);
return _45?String(_45):nil;
}
}),new objj_method(sel_getUid("objectByEvaluatingJavaScriptFromString:"),function(_46,_47,_48){
with(_46){
return objj_msgSend(objj_msgSend(_46,"windowScriptObject"),"evaluateWebScript:",_48);
}
}),new objj_method(sel_getUid("computedStyleForElement:pseudoElement:"),function(_49,_4a,_4b,_4c){
with(_49){
var win=objj_msgSend(objj_msgSend(_49,"windowScriptObject"),"window");
if(win){
return win.document.defaultView.getComputedStyle(_4b,_4c);
}
return nil;
}
}),new objj_method(sel_getUid("downloadDelegate"),function(_4e,_4f){
with(_4e){
return _downloadDelegate;
}
}),new objj_method(sel_getUid("setDownloadDelegate:"),function(_50,_51,_52){
with(_50){
_downloadDelegate=_52;
}
}),new objj_method(sel_getUid("frameLoadDelegate"),function(_53,_54){
with(_53){
return _frameLoadDelegate;
}
}),new objj_method(sel_getUid("setFrameLoadDelegate:"),function(_55,_56,_57){
with(_55){
_frameLoadDelegate=_57;
}
}),new objj_method(sel_getUid("policyDelegate"),function(_58,_59){
with(_58){
return _policyDelegate;
}
}),new objj_method(sel_getUid("setPolicyDelegate:"),function(_5a,_5b,_5c){
with(_5a){
_policyDelegate=_5c;
}
}),new objj_method(sel_getUid("resourceLoadDelegate"),function(_5d,_5e){
with(_5d){
return _resourceLoadDelegate;
}
}),new objj_method(sel_getUid("setResourceLoadDelegate:"),function(_5f,_60,_61){
with(_5f){
_resourceLoadDelegate=_61;
}
}),new objj_method(sel_getUid("UIDelegate"),function(_62,_63){
with(_62){
return _UIDelegate;
}
}),new objj_method(sel_getUid("setUIDelegate:"),function(_64,_65,_66){
with(_64){
_UIDelegate=_66;
}
}),new objj_method(sel_getUid("loadHTMLString:"),function(_67,_68,_69){
with(_67){
objj_msgSend(_67,"loadHTMLString:baseURL:",_69,nil);
}
}),new objj_method(sel_getUid("loadHTMLString:baseURL:"),function(_6a,_6b,_6c,URL){
with(_6a){
_iframe.src="";
window.setTimeout(function(){
var win=objj_msgSend(_6a,"window");
win.document.write(_6c);
},0);
}
})]);
var _1=objj_allocateClassPair(CPObject,"CPWebScriptObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_window")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithWindow:"),function(_6f,_70,_71){
with(_6f){
if(_6f=objj_msgSendSuper({receiver:_6f,super_class:objj_getClass("CPObject")},"init")){
_window=_71;
}
return _6f;
}
}),new objj_method(sel_getUid("callWebScriptMethod:withArguments:"),function(_72,_73,_74,_75){
with(_72){
if(typeof _window[_74]=="function"){
try{
return _window[_74].apply(_75);
}
catch(e){
}
}
return undefined;
}
}),new objj_method(sel_getUid("evaluateWebScript:"),function(_76,_77,_78){
with(_76){
try{
return _window.eval(_78);
}
catch(e){
}
return undefined;
}
}),new objj_method(sel_getUid("window"),function(_79,_7a){
with(_79){
return _window;
}
})]);
var _1=objj_getClass("CPWebView");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPWebView\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7b,_7c,_7d){
with(_7b){
_7b=objj_msgSendSuper({receiver:_7b,super_class:objj_getClass("CPView")},"initWithCoder:",_7d);
if(_7b){
_mainFrameURL=nil;
_backwardStack=[];
_forwardStack=[];
objj_msgSend(_7b,"_initDOMWithFrame:",objj_msgSend(_7b,"frame"));
}
return _7b;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7e,_7f,_80){
with(_7e){
objj_msgSendSuper({receiver:_7e,super_class:objj_getClass("CPView")},"encodeWithCoder:",_80);
}
})]);
p;10;CPWindow.jI;33;Foundation/CPNotificationCenter.jI;26;Foundation/CPUndoManager.ji;12;CGGeometry.ji;13;CPAnimation.ji;13;CPResponder.jc;34894;
CPBorderlessWindowMask=0;
CPTitledWindowMask=1<<0;
CPClosableWindowMask=1<<1;
CPMiniaturizableWindowMask=1<<2;
CPResizableWindowMask=1<<3;
CPTexturedBackgroundWindowMask=1<<8;
CPBorderlessBridgeWindowMask=1<<20;
CPHUDBackgroundWindowMask=1<<21;
CPWindowNotSizable=0;
CPWindowMinXMargin=1;
CPWindowWidthSizable=2;
CPWindowMaxXMargin=4;
CPWindowMinYMargin=8;
CPWindowHeightSizable=16;
CPWindowMaxYMargin=32;
CPNormalWindowLevel=4;
CPFloatingWindowLevel=5;
CPSubmenuWindowLevel=6;
CPTornOffMenuWindowLevel=6;
CPMainMenuWindowLevel=8;
CPStatusWindowLevel=9;
CPModalPanelWindowLevel=10;
CPPopUpMenuWindowLevel=11;
CPDraggingWindowLevel=12;
CPScreenSaverWindowLevel=13;
CPWindowOut=0;
CPWindowAbove=1;
CPWindowBelow=2;
CPWindowWillCloseNotification="CPWindowWillCloseNotification";
CPWindowDidBecomeMainNotification="CPWindowDidBecomeMainNotification";
CPWindowDidResignMainNotification="CPWindowDidResignMainNotification";
var _1=20,_2=19,_3=10,_4=10,_5=5,_6=nil;
var _7=nil,_8=nil;
var _9=objj_allocateClassPair(CPResponder,"CPWindow"),_a=_9.isa;
class_addIvars(_9,[new objj_ivar("_windowNumber"),new objj_ivar("_styleMask"),new objj_ivar("_frame"),new objj_ivar("_level"),new objj_ivar("_isVisible"),new objj_ivar("_isAnimating"),new objj_ivar("_hasShadow"),new objj_ivar("_isMovableByWindowBackground"),new objj_ivar("_isDocumentEdited"),new objj_ivar("_isDocumentSaving"),new objj_ivar("_shadowView"),new objj_ivar("_windowView"),new objj_ivar("_contentView"),new objj_ivar("_toolbarView"),new objj_ivar("_mouseOverView"),new objj_ivar("_leftMouseDownView"),new objj_ivar("_rightMouseDownView"),new objj_ivar("_toolbar"),new objj_ivar("_firstResponder"),new objj_ivar("_delegate"),new objj_ivar("_title"),new objj_ivar("_acceptsMouseMovedEvents"),new objj_ivar("_windowController"),new objj_ivar("_minSize"),new objj_ivar("_maxSize"),new objj_ivar("_resizeFrame"),new objj_ivar("_mouseDraggedPoint"),new objj_ivar("_undoManager"),new objj_ivar("_representedURL"),new objj_ivar("_DOMElement"),new objj_ivar("_bridge"),new objj_ivar("_autoresizingMask"),new objj_ivar("_delegateRespondsToWindowWillReturnUndoManagerSelector")]);
objj_registerClassPair(_9);
objj_addClassForBundle(_9,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_9,[new objj_method(sel_getUid("initWithContentRect:styleMask:"),function(_b,_c,_d,_e){
with(_b){
return objj_msgSend(_b,"initWithContentRect:styleMask:bridge:",_d,_e,objj_msgSend(CPDOMWindowBridge,"sharedDOMWindowBridge"));
}
}),new objj_method(sel_getUid("initWithContentRect:styleMask:bridge:"),function(_f,_10,_11,_12,_13){
with(_f){
_f=objj_msgSendSuper({receiver:_f,super_class:objj_getClass("CPResponder")},"init");
if(_f){
_windowNumber=objj_msgSend(CPApp._windows,"count");
CPApp._windows[_windowNumber]=_f;
_styleMask=_12;
_frame=objj_msgSend(_f,"frameRectForContentRect:",_11);
_level=CPNormalWindowLevel;
_hasShadow=NO;
_minSize=CGSizeMake(0,0);
_maxSize=CGSizeMake(1000000,1000000);
if(_styleMask&CPBorderlessBridgeWindowMask){
_autoresizingMask=CPWindowWidthSizable|CPWindowHeightSizable;
}
_windowView=objj_msgSend(objj_msgSend(_CPWindowView,"alloc"),"initWithFrame:forStyleMask:",CGRectMake(0,0,CGRectGetWidth(_frame),CGRectGetHeight(_frame)),_styleMask);
objj_msgSend(_windowView,"_setWindow:",_f);
objj_msgSend(_windowView,"setNextResponder:",_f);
objj_msgSend(_f,"setMovableByWindowBackground:",_12&CPHUDBackgroundWindowMask);
objj_msgSend(_f,"setContentView:",objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero()));
_firstResponder=_f;
_DOMElement=document.createElement("div");
_DOMElement.style.position="absolute";
_DOMElement.style.visibility="visible";
_DOMElement.style.zIndex=0;
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _14=_DOMElement.CPDOMDisplayContext[0];
if(!(_14>=0)){
_14=_DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_14]=0;
CPDOMDisplayServerInstructions[_14+1]=_DOMElement;
CPDOMDisplayServerInstructions[_14+2]=NULL;
CPDOMDisplayServerInstructions[_14+3]=(_frame.origin.x);
CPDOMDisplayServerInstructions[_14+4]=(_frame.origin.y);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _14=_DOMElement.CPDOMDisplayContext[4];
if(!(_14>=0)){
_14=_DOMElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_14]=4;
CPDOMDisplayServerInstructions[_14+1]=_DOMElement;
CPDOMDisplayServerInstructions[_14+2]=1;
CPDOMDisplayServerInstructions[_14+3]=1;
if(_windowView._DOMElement.CPDOMDisplayContext){
_windowView._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=6;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_windowView._DOMElement;
objj_msgSend(_f,"setBridge:",_13);
objj_msgSend(_f,"setNextResponder:",CPApp);
}
return _f;
}
}),new objj_method(sel_getUid("styleMask"),function(_15,_16){
with(_15){
return _styleMask;
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_17,_18,_19){
with(_17){
var _1a=CGRectMakeCopy(objj_msgSend(_windowView,"bounds"));
if(_styleMask&CPHUDBackgroundWindowMask){
_1a.origin.x+=7;
_1a.origin.y+=30;
_1a.size.width-=14;
_1a.size.height-=40;
}else{
if(_styleMask&CPBorderlessBridgeWindowMask){
}
}
if(objj_msgSend(_toolbar,"isVisible")){
var _1b=CGRectGetHeight(objj_msgSend(_toolbarView,"frame"));
_1a.origin.y+=_1b;
_1a.size.height-=_1b;
}
return _1a;
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_1c,_1d,_1e){
with(_1c){
if(_styleMask&CPBorderlessBridgeWindowMask){
return _bridge?objj_msgSend(_bridge,"visibleFrame"):CGRectMakeZero();
}
var _1f=objj_msgSend(objj_msgSend(_1c,"class"),"frameRectForContentRect:styleMask:",_1e,_styleMask);
return _1f;
}
}),new objj_method(sel_getUid("frame"),function(_20,_21){
with(_20){
return _frame;
}
}),new objj_method(sel_getUid("setFrame:display:animate:"),function(_22,_23,_24,_25,_26){
with(_22){
if(_26){
var _27=objj_msgSend(objj_msgSend(_CPWindowFrameAnimation,"alloc"),"initWithWindow:targetFrame:",_22,_24);
objj_msgSend(_27,"startAnimation");
}else{
objj_msgSend(_22,"setFrameOrigin:",_24.origin);
objj_msgSend(_22,"setFrameSize:",_24.size);
}
}
}),new objj_method(sel_getUid("setFrame:"),function(_28,_29,_2a){
with(_28){
objj_msgSend(_28,"setFrame:display:animate:",_2a,YES,NO);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_2b,_2c,_2d){
with(_2b){
var _2e=_frame.origin;
if((_2e.x==_2d.x&&_2e.y==_2d.y)){
return;
}
_2e.x=_2d.x;
_2e.y=_2d.y;
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _2f=_DOMElement.CPDOMDisplayContext[0];
if(!(_2f>=0)){
_2f=_DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_2f]=0;
CPDOMDisplayServerInstructions[_2f+1]=_DOMElement;
CPDOMDisplayServerInstructions[_2f+2]=NULL;
CPDOMDisplayServerInstructions[_2f+3]=_2e.x;
CPDOMDisplayServerInstructions[_2f+4]=_2e.y;
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_30,_31,_32){
with(_30){
_32={width:MIN(MAX(_32.width,_minSize.width),_maxSize.width),height:MIN(MAX(_32.height,_minSize.height),_maxSize.height)};
if((_frame.size.width==_32.width&&_frame.size.height==_32.height)){
return;
}
_frame.size=_32;
objj_msgSend(_windowView,"setFrameSize:",_32);
if(_hasShadow){
objj_msgSend(_shadowView,"setFrameSize:",{width:_1+_32.width+_2,height:_4+_32.height+_3+_5});
}
if(!_isAnimating&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResize:"))){
objj_msgSend(_delegate,"windowDidResize:",_30);
}
}
}),new objj_method(sel_getUid("trackMoveWithEvent:"),function(_33,_34,_35){
with(_33){
var _36=objj_msgSend(_35,"type");
if(_36==CPLeftMouseUp){
return;
}else{
if(_36==CPLeftMouseDown){
_mouseDraggedPoint=objj_msgSend(_33,"convertBaseToBridge:",objj_msgSend(_35,"locationInWindow"));
}else{
if(_36==CPLeftMouseDragged){
var _37=objj_msgSend(_33,"convertBaseToBridge:",objj_msgSend(_35,"locationInWindow"));
objj_msgSend(_33,"setFrameOrigin:",CGPointMake((_frame.origin.x)+(_37.x-_mouseDraggedPoint.x),(_frame.origin.y)+(_37.y-_mouseDraggedPoint.y)));
_mouseDraggedPoint=_37;
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_33,sel_getUid("trackMoveWithEvent:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("trackResizeWithEvent:"),function(_38,_39,_3a){
with(_38){
var _3b=objj_msgSend(_3a,"locationInWindow"),_3c=objj_msgSend(_3a,"type");
if(_3c==CPLeftMouseUp){
return;
}else{
if(_3c==CPLeftMouseDown){
_resizeFrame=CGRectMake(_3b.x,_3b.y,CGRectGetWidth(_frame),CGRectGetHeight(_frame));
}else{
if(_3c==CPLeftMouseDragged){
objj_msgSend(_38,"setFrameSize:",CGSizeMake(CGRectGetWidth(_resizeFrame)+_3b.x-CGRectGetMinX(_resizeFrame),CGRectGetHeight(_resizeFrame)+_3b.y-CGRectGetMinY(_resizeFrame)));
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_38,sel_getUid("trackResizeWithEvent:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("orderFront:"),function(_3d,_3e,_3f){
with(_3d){
objj_msgSend(_bridge,"order:window:relativeTo:",CPWindowAbove,_3d,nil);
}
}),new objj_method(sel_getUid("orderBack:"),function(_40,_41,_42){
with(_40){
}
}),new objj_method(sel_getUid("orderOut:"),function(_43,_44,_45){
with(_43){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowWillClose:"))){
objj_msgSend(_delegate,"windowWillClose:",_43);
}
objj_msgSend(_bridge,"order:window:relativeTo:",CPWindowOut,_43,nil);
if(objj_msgSend(CPApp,"keyWindow")==_43){
objj_msgSend(_43,"resignKeyWindow");
CPApp._keyWindow=nil;
}
}
}),new objj_method(sel_getUid("orderWindow:relativeTo:"),function(_46,_47,_48,_49){
with(_46){
objj_msgSend(_bridge,"order:window:relativeTo:",_48,_46,CPApp._windows[_49]);
}
}),new objj_method(sel_getUid("setLevel:"),function(_4a,_4b,_4c){
with(_4a){
_level=_4c;
}
}),new objj_method(sel_getUid("level"),function(_4d,_4e){
with(_4d){
return _level;
}
}),new objj_method(sel_getUid("isVisible"),function(_4f,_50){
with(_4f){
return _isVisible;
}
}),new objj_method(sel_getUid("showsResizeIndicator"),function(_51,_52){
with(_51){
return objj_msgSend(_windowView,"showsResizeIndicator");
}
}),new objj_method(sel_getUid("setShowsResizeIndicator:"),function(_53,_54,_55){
with(_53){
objj_msgSend(_windowView,"setShowsResizeIndicator:",_55);
}
}),new objj_method(sel_getUid("resizeIndicatorOffset"),function(_56,_57){
with(_56){
return objj_msgSend(_windowView,"resizeIndicatorOffset");
}
}),new objj_method(sel_getUid("setResizeIndicatorOffset:"),function(_58,_59,_5a){
with(_58){
objj_msgSend(_windowView,"setResizeIndicatorOffset:",_5a);
}
}),new objj_method(sel_getUid("setContentView:"),function(_5b,_5c,_5d){
with(_5b){
if(_contentView){
objj_msgSend(_contentView,"removeFromSuperview");
}
_contentView=_5d;
objj_msgSend(_contentView,"setFrame:",objj_msgSend(_5b,"contentRectForFrameRect:",_frame));
objj_msgSend(_contentView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_windowView,"addSubview:positioned:relativeTo:",_contentView,CPWindowBelow,nil);
}
}),new objj_method(sel_getUid("contentView"),function(_5e,_5f){
with(_5e){
return _contentView;
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_60,_61,_62){
with(_60){
objj_msgSend(_windowView,"setBackgroundColor:",_62);
}
}),new objj_method(sel_getUid("backgroundColor"),function(_63,_64){
with(_63){
return objj_msgSend(_windowView,"backgroundColor");
}
}),new objj_method(sel_getUid("setMinSize:"),function(_65,_66,_67){
with(_65){
if(CGSizeEqualToSize(_minSize,_67)){
return;
}
_minSize=CGSizeCreateCopy(_67);
var _68=CGSizeMakeCopy(objj_msgSend(_65,"frame").size),_69=NO;
if(_68.width<_minSize.width){
_68.width=_minSize.width;
_69=YES;
}
if(_68.height<_minSize.height){
_68.height=_minSize.height;
_69=YES;
}
if(_69){
objj_msgSend(_65,"setFrameSize:",_68);
}
}
}),new objj_method(sel_getUid("minSize"),function(_6a,_6b){
with(_6a){
return _minSize;
}
}),new objj_method(sel_getUid("setMaxSize:"),function(_6c,_6d,_6e){
with(_6c){
if(CGSizeEqualToSize(_maxSize,_6e)){
return;
}
_maxSize=CGSizeCreateCopy(_6e);
var _6f=CGSizeMakeCopy(objj_msgSend(_6c,"frame").size),_70=NO;
if(_6f.width>_maxSize.width){
_6f.width=_maxSize.width;
_70=YES;
}
if(_6f.height>_maxSize.height){
_6f.height=_maxSize.height;
_70=YES;
}
if(_70){
objj_msgSend(_6c,"setFrameSize:",_6f);
}
}
}),new objj_method(sel_getUid("maxSize"),function(_71,_72){
with(_71){
return _maxSize;
}
}),new objj_method(sel_getUid("hasShadow"),function(_73,_74){
with(_73){
return _hasShadow;
}
}),new objj_method(sel_getUid("setHasShadow:"),function(_75,_76,_77){
with(_75){
if(_hasShadow==_77){
return;
}
_hasShadow=_77;
if(_hasShadow){
var _78=objj_msgSend(_windowView,"bounds");
_shadowView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(-_1,-_3+_5,_1+CGRectGetWidth(_78)+_2,_3+CGRectGetHeight(_78)+_4));
if(!_6){
var _79=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_75,"class"));
_6=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_79,"pathForResource:","CPWindow/CPWindowShadow0.png"),CGSizeMake(20,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_79,"pathForResource:","CPWindow/CPWindowShadow1.png"),CGSizeMake(1,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_79,"pathForResource:","CPWindow/CPWindowShadow2.png"),CGSizeMake(19,19)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_79,"pathForResource:","CPWindow/CPWindowShadow3.png"),CGSizeMake(20,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_79,"pathForResource:","CPWindow/CPWindowShadow4.png"),CGSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_79,"pathForResource:","CPWindow/CPWindowShadow5.png"),CGSizeMake(19,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_79,"pathForResource:","CPWindow/CPWindowShadow6.png"),CGSizeMake(20,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_79,"pathForResource:","CPWindow/CPWindowShadow7.png"),CGSizeMake(1,18)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_79,"pathForResource:","CPWindow/CPWindowShadow8.png"),CGSizeMake(19,18))]));
}
objj_msgSend(_shadowView,"setBackgroundColor:",_6);
objj_msgSend(_shadowView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
if(_shadowView._DOMElement.CPDOMDisplayContext){
_shadowView._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=7;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_shadowView._DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_windowView._DOMElement;
}else{
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=8;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_shadowView._DOMElement;
_shadowView=nil;
}
}
}),new objj_method(sel_getUid("setDelegate:"),function(_7a,_7b,_7c){
with(_7a){
_delegate=_7c;
_delegateRespondsToWindowWillReturnUndoManagerSelector=objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowWillReturnUndoManager:"));
var _7d=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidBecomeMain:"))){
objj_msgSend(_7d,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidBecomeMain:"),CPWindowDidBecomeMainNotification,_7a);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResignMain:"))){
objj_msgSend(_7d,"addObserver:selector:name:object:",_delegate,sel_getUid("windowDidResignMain:"),CPWindowDidResignMainNotification,_7a);
}
}
}),new objj_method(sel_getUid("delegate"),function(_7e,_7f){
with(_7e){
return _delegate;
}
}),new objj_method(sel_getUid("setWindowController:"),function(_80,_81,_82){
with(_80){
_windowController=_82;
}
}),new objj_method(sel_getUid("windowController"),function(_83,_84){
with(_83){
return _windowController;
}
}),new objj_method(sel_getUid("doCommandBySelector:"),function(_85,_86,_87){
with(_85){
if(objj_msgSend(_delegate,"respondsToSelector:",_87)){
objj_msgSend(_delegate,"performSelector:",_87);
}else{
objj_msgSendSuper({receiver:_85,super_class:objj_getClass("CPResponder")},"doCommandBySelector:",_87);
}
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_88,_89){
with(_88){
return YES;
}
}),new objj_method(sel_getUid("makeFirstResponder:"),function(_8a,_8b,_8c){
with(_8a){
if(_firstResponder==_8c){
return YES;
}
if(!objj_msgSend(_firstResponder,"resignFirstResponder")){
return NO;
}
if(!_8c||!objj_msgSend(_8c,"acceptsFirstResponder")||!objj_msgSend(_8c,"becomeFirstResponder")){
_firstResponder=_8a;
return NO;
}
_firstResponder=_8c;
return YES;
}
}),new objj_method(sel_getUid("firstResponder"),function(_8d,_8e){
with(_8d){
return _firstResponder;
}
}),new objj_method(sel_getUid("acceptsMouseMovedEvents"),function(_8f,_90){
with(_8f){
return _acceptsMouseMovedEvents;
}
}),new objj_method(sel_getUid("setAcceptsMouseMovedEvents:"),function(_91,_92,_93){
with(_91){
_acceptsMouseMovedEvents=_93;
}
}),new objj_method(sel_getUid("title"),function(_94,_95){
with(_94){
return _title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_96,_97,_98){
with(_96){
_title=_98;
objj_msgSend(_windowView,"setTitle:",_98);
objj_msgSend(_96,"_synchronizeMenuBarTitleWithWindowTitle");
}
}),new objj_method(sel_getUid("setTitleWithRepresentedFilename:"),function(_99,_9a,_9b){
with(_99){
objj_msgSend(_99,"setRepresentedFilename:",_9b);
objj_msgSend(_99,"setTitle:",objj_msgSend(_9b,"lastPathComponent"));
}
}),new objj_method(sel_getUid("setRepresentedFilename:"),function(_9c,_9d,_9e){
with(_9c){
objj_msgSend(_9c,"setRepresentedURL:",_9e);
}
}),new objj_method(sel_getUid("representedFilename"),function(_9f,_a0){
with(_9f){
return _representedURL;
}
}),new objj_method(sel_getUid("setRepresentedURL:"),function(_a1,_a2,_a3){
with(_a1){
_representedURL=_a3;
}
}),new objj_method(sel_getUid("representedURL"),function(_a4,_a5){
with(_a4){
return _representedURL;
}
}),new objj_method(sel_getUid("setMovableByWindowBackground:"),function(_a6,_a7,_a8){
with(_a6){
_isMovableByWindowBackground=_a8;
}
}),new objj_method(sel_getUid("isMovableByWindowBackground"),function(_a9,_aa){
with(_a9){
return _isMovableByWindowBackground;
}
}),new objj_method(sel_getUid("center"),function(_ab,_ac){
with(_ab){
var _ad=objj_msgSend(_ab,"frame").size,_ae=objj_msgSend(_bridge,"contentBounds").size;
objj_msgSend(_ab,"setFrameOrigin:",CGPointMake((_ae.width-_ad.width)/2,(_ae.height-_ad.height)/2));
}
}),new objj_method(sel_getUid("sendEvent:"),function(_af,_b0,_b1){
with(_af){
var _b2=objj_msgSend(_b1,"type"),_b3=objj_msgSend(_b1,"locationInWindow");
switch(_b2){
case CPKeyUp:
return objj_msgSend(objj_msgSend(_af,"firstResponder"),"keyUp:",_b1);
case CPKeyDown:
return objj_msgSend(objj_msgSend(_af,"firstResponder"),"keyDown:",_b1);
case CPScrollWheel:
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_b3),"scrollWheel:",_b1);
case CPLeftMouseUp:
if(!_leftMouseDownView){
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_b3),"mouseUp:",_b1);
}
objj_msgSend(_leftMouseDownView,"mouseUp:",_b1);
_leftMouseDownView=nil;
return;
case CPLeftMouseDown:
_leftMouseDownView=objj_msgSend(_windowView,"hitTest:",_b3);
if(_leftMouseDownView!=_firstResponder&&objj_msgSend(_leftMouseDownView,"acceptsFirstResponder")){
objj_msgSend(_af,"makeFirstResponder:",_leftMouseDownView);
}
var _b4=objj_msgSend(_b1,"window");
if(objj_msgSend(_b4,"isKeyWindow")||objj_msgSend(_b4,"becomesKeyOnlyIfNeeded")){
return objj_msgSend(_leftMouseDownView,"mouseDown:",_b1);
}else{
objj_msgSend(_af,"makeKeyAndOrderFront:",_af);
if(objj_msgSend(_leftMouseDownView,"acceptsFirstMouse:",_b1)){
return objj_msgSend(_leftMouseDownView,"mouseDown:",_b1);
}
}
break;
case CPLeftMouseDragged:
if(!_leftMouseDownView){
return objj_msgSend(objj_msgSend(_windowView,"hitTest:",_b3),"mouseDragged:",_b1);
}
return objj_msgSend(_leftMouseDownView,"mouseDragged:",_b1);
case CPRightMouseUp:
return objj_msgSend(_rightMouseDownView,"mouseUp:",_b1);
case CPRightMouseDown:
_rightMouseDownView=objj_msgSend(_windowView,"hitTest:",_b3);
return objj_msgSend(_rightMouseDownView,"mouseDown:",_b1);
case CPRightMouseDragged:
return objj_msgSend(_rightMouseDownView,"mouseDragged:",_b1);
case CPMouseMoved:
if(!_acceptsMouseMovedEvents){
return;
}
var _b5=objj_msgSend(_windowView,"hitTest:",_b3);
if(_b5!=_mouseOverView){
if(_mouseOverView){
objj_msgSend(_mouseOverView,"mouseExited:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPMouseExited,_b3,objj_msgSend(_b1,"modifierFlags"),objj_msgSend(_b1,"timestamp"),_windowNumber,nil,-1,1,0));
}
if(_b5){
objj_msgSend(_b5,"mouseEntered:",objj_msgSend(CPEvent,"mouseEventWithType:location:modifierFlags:timestamp:windowNumber:context:eventNumber:clickCount:pressure:",CPMouseEntered,_b3,objj_msgSend(_b1,"modifierFlags"),objj_msgSend(_b1,"timestamp"),_windowNumber,nil,-1,1,0));
}
_mouseOverView=_b5;
}
objj_msgSend(_mouseOverView,"mouseMoved:",_b1);
}
}
}),new objj_method(sel_getUid("windowNumber"),function(_b6,_b7){
with(_b6){
return _windowNumber;
}
}),new objj_method(sel_getUid("becomeKeyWindow"),function(_b8,_b9){
with(_b8){
if(_firstResponder!=_b8&&objj_msgSend(_firstResponder,"respondsToSelector:",sel_getUid("becomeKeyWindow"))){
objj_msgSend(_firstResponder,"becomeKeyWindow");
}
}
}),new objj_method(sel_getUid("canBecomeKeyWindow"),function(_ba,_bb){
with(_ba){
return YES;
}
}),new objj_method(sel_getUid("isKeyWindow"),function(_bc,_bd){
with(_bc){
return objj_msgSend(CPApp,"keyWindow")==_bc;
}
}),new objj_method(sel_getUid("makeKeyAndOrderFront:"),function(_be,_bf,_c0){
with(_be){
objj_msgSend(_be,"orderFront:",_be);
objj_msgSend(_be,"makeKeyWindow");
objj_msgSend(_be,"makeMainWindow");
}
}),new objj_method(sel_getUid("makeKeyWindow"),function(_c1,_c2){
with(_c1){
if(!objj_msgSend(_c1,"canBecomeKeyWindow")){
return;
}
objj_msgSend(CPApp._keyWindow,"resignKeyWindow");
CPApp._keyWindow=_c1;
objj_msgSend(_c1,"becomeKeyWindow");
}
}),new objj_method(sel_getUid("resignKeyWindow"),function(_c3,_c4){
with(_c3){
if(_firstResponder!=_c3&&objj_msgSend(_firstResponder,"respondsToSelector:",sel_getUid("resignKeyWindow"))){
objj_msgSend(_firstResponder,"resignKeyWindow");
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowDidResignKey:"))){
objj_msgSend(_delegate,"windowDidResignKey:",_c3);
}
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(_c5,_c6,_c7,_c8,_c9,_ca,_cb,_cc,_cd){
with(_c5){
objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"dragImage:fromWindow:at:offset:event:pasteboard:source:slideBack:",_c7,_c5,objj_msgSend(_c5,"convertBaseToBridge:",_c8),_c9,_ca,_cb,_cc,_cd);
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(_ce,_cf,_d0,_d1,_d2,_d3,_d4,_d5,_d6){
with(_ce){
objj_msgSend(objj_msgSend(CPDragServer,"sharedDragServer"),"dragView:fromWindow:at:offset:event:pasteboard:source:slideBack:",_d0,_ce,objj_msgSend(_ce,"convertBaseToBridge:",_d1),_d2,_d3,_d4,_d5,_d6);
}
}),new objj_method(sel_getUid("setDocumentEdited:"),function(_d7,_d8,_d9){
with(_d7){
if(_isDocumentEdited==_d9){
return;
}
_isDocumentEdited=_d9;
objj_msgSend(CPMenu,"_setMenuBarIconImageAlphaValue:",_isDocumentEdited?0.5:1);
}
}),new objj_method(sel_getUid("isDocumentEdited"),function(_da,_db){
with(_da){
return _isDocumentEdited;
}
}),new objj_method(sel_getUid("setDocumentSaving:"),function(_dc,_dd,_de){
with(_dc){
if(_isDocumentSaving==_de){
return;
}
_isDocumentSaving=_de;
objj_msgSend(_dc,"_synchronizeSaveMenuWithDocumentSaving");
objj_msgSend(_windowView,"windowDidChangeDocumentSaving");
}
}),new objj_method(sel_getUid("isDocumentSaving"),function(_df,_e0){
with(_df){
return _isDocumentSaving;
}
}),new objj_method(sel_getUid("_synchronizeSaveMenuWithDocumentSaving"),function(_e1,_e2){
with(_e1){
if(!objj_msgSend(_e1,"isMainWindow")){
return;
}
var _e3=objj_msgSend(CPApp,"mainMenu"),_e4=objj_msgSend(_e3,"indexOfItemWithTitle:",_isDocumentSaving?"Save":"Saving...");
if(_e4==CPNotFound){
return;
}
var _e5=objj_msgSend(_e3,"itemAtIndex:",_e4);
if(_isDocumentSaving){
_7=objj_msgSend(_e5,"image");
objj_msgSend(_e5,"setTitle:","Saving...");
objj_msgSend(_e5,"setImage:",_8);
objj_msgSend(_e5,"setEnabled:",NO);
}else{
objj_msgSend(_e5,"setTitle:","Save");
objj_msgSend(_e5,"setImage:",_7);
objj_msgSend(_e5,"setEnabled:",YES);
}
}
}),new objj_method(sel_getUid("performClose:"),function(_e6,_e7,_e8){
with(_e6){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("windowShouldClose:"))){
if(!objj_msgSend(_delegate,"windowShouldClose:",_e6)){
return;
}
}else{
if(objj_msgSend(_e6,"respondsToSelector:",sel_getUid("windowShouldClose:"))&&!objj_msgSend(_e6,"windowShouldClose:",_e6)){
return;
}
}
objj_msgSend(_e6,"close");
}
}),new objj_method(sel_getUid("close"),function(_e9,_ea){
with(_e9){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowWillCloseNotification,_e9);
objj_msgSend(_e9,"orderOut:",nil);
}
}),new objj_method(sel_getUid("isMainWindow"),function(_eb,_ec){
with(_eb){
return objj_msgSend(CPApp,"mainWindow")==_eb;
}
}),new objj_method(sel_getUid("canBecomeMainWindow"),function(_ed,_ee){
with(_ed){
if(objj_msgSend(_ed,"isVisible")){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("makeMainWindow"),function(_ef,_f0){
with(_ef){
if(!objj_msgSend(_ef,"canBecomeMainWindow")){
return;
}
objj_msgSend(CPApp._mainWindow,"resignMainWindow");
CPApp._mainWindow=_ef;
objj_msgSend(_ef,"becomeMainWindow");
}
}),new objj_method(sel_getUid("becomeMainWindow"),function(_f1,_f2){
with(_f1){
objj_msgSend(_f1,"_synchronizeMenuBarTitleWithWindowTitle");
objj_msgSend(_f1,"_synchronizeSaveMenuWithDocumentSaving");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidBecomeMainNotification,_f1);
}
}),new objj_method(sel_getUid("resignMainWindow"),function(_f3,_f4){
with(_f3){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",CPWindowDidResignMainNotification,_f3);
}
}),new objj_method(sel_getUid("toolbar"),function(_f5,_f6){
with(_f5){
return _toolbar;
}
}),new objj_method(sel_getUid("setToolbar:"),function(_f7,_f8,_f9){
with(_f7){
if(_toolbar==_f9){
return;
}
if(_toolbar){
objj_msgSend(_f7,"_setToolbarVisible:",NO);
_toolbar._window=nil;
_toolbarView=nil;
}
if(_toolbar=_f9){
_toolbar=_f9;
_toolbar._window=_f7;
if(objj_msgSend(_toolbar,"isVisible")){
objj_msgSend(_f7,"_setToolbarVisible:",YES);
}
objj_msgSend(_toolbar,"_reloadToolbarItems");
}
}
}),new objj_method(sel_getUid("_setToolbarVisible:"),function(_fa,_fb,_fc){
with(_fa){
if(_fc){
if(!_toolbarView){
_toolbarView=objj_msgSend(_toolbar,"_toolbarView");
}
objj_msgSend(_toolbarView,"setFrame:",CGRectMake(0,0,CGRectGetWidth(objj_msgSend(_windowView,"bounds")),CGRectGetHeight(objj_msgSend(_toolbarView,"frame"))));
objj_msgSend(_windowView,"addSubview:",_toolbarView);
}else{
objj_msgSend(_toolbarView,"removeFromSuperview");
}
objj_msgSend(_contentView,"setFrame:",objj_msgSend(_fa,"contentRectForFrameRect:",objj_msgSend(_windowView,"bounds")));
}
}),new objj_method(sel_getUid("_setAttachedSheetFrameOrigin"),function(_fd,_fe){
with(_fd){
var _ff=objj_msgSend(objj_msgSend(_fd,"contentView"),"frame"),_100=CGRectMakeCopy(objj_msgSend(_attachedSheet,"frame"));
_100.origin.y=CGRectGetMinY(_frame)+CGRectGetMinY(_ff);
_100.origin.x=CGRectGetMinX(_frame)+FLOOR((CGRectGetWidth(_frame)-CGRectGetWidth(_100))/2);
objj_msgSend(_attachedSheet,"setFrameOrigin:",_100.origin);
}
}),new objj_method(sel_getUid("_animateAttachedSheet"),function(self,_cmd){
with(self){
}
}),new objj_method(sel_getUid("_attachSheet:modalDelegate:didEndSelector:contextInfo:"),function(self,_cmd,_105,_106,_107,_108){
with(self){
_attachedSheet=_105;
_105._isSheet=YES;
objj_msgSend(self,"_setAttachedSheetFrameOrigin");
objj_msgSend(_bridge,"order:window:relativeTo:",CPWindowAbove,_105,self);
}
}),new objj_method(sel_getUid("attachedSheet"),function(self,_cmd){
with(self){
return _attachedSheet;
}
}),new objj_method(sel_getUid("isSheet"),function(self,_cmd){
with(self){
return _isSheet;
}
}),new objj_method(sel_getUid("becomesKeyOnlyIfNeeded"),function(self,_cmd){
with(self){
return NO;
}
}),new objj_method(sel_getUid("worksWhenModal"),function(self,_cmd){
with(self){
return NO;
}
})]);
class_addMethods(_a,[new objj_method(sel_getUid("initialize"),function(self,_cmd){
with(self){
if(self!=objj_msgSend(CPWindow,"class")){
return;
}
var _113=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
CPWindowResizeIndicatorImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_113,"pathForResource:","CPWindowResizeIndicator.png"),CGSizeMake(12,12));
_8=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_113,"pathForResource:","CPProgressIndicator/CPProgressIndicatorSpinningStyleRegular.gif"),CGSizeMake(16,16));
}
}),new objj_method(sel_getUid("frameRectForContentRect:styleMask:"),function(self,_cmd,_116,_117){
with(self){
var _118=CGRectMakeCopy(_116);
return _118;
}
})]);
var _9=objj_getClass("CPWindow");
if(!_9){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPWindow\""));
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("_synchronizeMenuBarTitleWithWindowTitle"),function(self,_cmd){
with(self){
if(!objj_msgSend(_windowController,"document")||!objj_msgSend(self,"isMainWindow")){
return;
}
objj_msgSend(CPMenu,"setMenuBarTitle:",_title);
}
})]);
var _9=objj_getClass("CPWindow");
if(!_9){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPWindow\""));
}
var _a=_9.isa;
class_addMethods(_9,[new objj_method(sel_getUid("setBridge:"),function(self,_cmd,_11d){
with(self){
if(_bridge==_11d){
return;
}
if(_bridge){
objj_msgSend(self,"orderOut:",self);
}
_bridge=_11d;
if(_styleMask&CPBorderlessBridgeWindowMask){
objj_msgSend(self,"setFrame:",objj_msgSend(_11d,"contentBounds"));
}
}
}),new objj_method(sel_getUid("resizeWithOldBridgeSize:"),function(self,_cmd,_120){
with(self){
if(_styleMask&CPBorderlessBridgeWindowMask){
return objj_msgSend(self,"setFrame:",objj_msgSend(_bridge,"visibleFrame"));
}
if(_autoresizingMask==CPWindowNotSizable){
return;
}
var _121=objj_msgSend(_bridge,"contentBounds"),_122=CGRectMakeCopy(_frame),dX=(CGRectGetWidth(_121)-_120.width)/(((_autoresizingMask&CPWindowMinXMargin)?1:0)+(_autoresizingMask&CPWindowWidthSizable?1:0)+(_autoresizingMask&CPWindowMaxXMargin?1:0)),dY=(CGRectGetHeight(_121)-_120.height)/((_autoresizingMask&CPWindowMinYMargin?1:0)+(_autoresizingMask&CPWindowHeightSizable?1:0)+(_autoresizingMask&CPWindowMaxYMargin?1:0));
if(_autoresizingMask&CPWindowMinXMargin){
_122.origin.x+=dX;
}
if(_autoresizingMask&CPWindowWidthSizable){
_122.size.width+=dX;
}
if(_autoresizingMask&CPWindowMinYMargin){
_122.origin.y+=dY;
}
if(_autoresizingMask&CPWindowHeightSizable){
_122.size.height+=dY;
}
objj_msgSend(self,"setFrame:",_122);
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(self,_cmd,_127){
with(self){
_autoresizingMask=_127;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(self,_cmd){
with(self){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("convertBaseToBridge:"),function(self,_cmd,_12c){
with(self){
var _12d=objj_msgSend(self,"frame").origin;
return CGPointMake(_12c.x+_12d.x,_12c.y+_12d.y);
}
}),new objj_method(sel_getUid("convertBridgeToBase:"),function(self,_cmd,_130){
with(self){
var _131=objj_msgSend(self,"frame").origin;
return CGPointMake(_130.x-_131.x,_130.y-_131.y);
}
}),new objj_method(sel_getUid("undoManager"),function(self,_cmd){
with(self){
if(_delegateRespondsToWindowWillReturnUndoManagerSelector){
return objj_msgSend(_delegate,"windowWillReturnUndoManager:",self);
}
if(!_undoManager){
_undoManager=objj_msgSend(objj_msgSend(CPUndoManager,"alloc"),"init");
}
return _undoManager;
}
}),new objj_method(sel_getUid("undo:"),function(self,_cmd,_136){
with(self){
objj_msgSend(objj_msgSend(self,"undoManager"),"undo");
}
}),new objj_method(sel_getUid("redo:"),function(self,_cmd,_139){
with(self){
objj_msgSend(objj_msgSend(self,"undoManager"),"redo");
}
})]);
var _13a=function(_13b,_13c,_13d){
return _13b+(_13c-_13b)*_13d;
};
var _9=objj_allocateClassPair(CPAnimation,"_CPWindowFrameAnimation"),_a=_9.isa;
class_addIvars(_9,[new objj_ivar("_window"),new objj_ivar("_startFrame"),new objj_ivar("_targetFrame")]);
objj_registerClassPair(_9);
objj_addClassForBundle(_9,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_9,[new objj_method(sel_getUid("initWithWindow:targetFrame:"),function(self,_cmd,_140,_141){
with(self){
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPAnimation")},"initWithDuration:animationCurve:",0.2,CPAnimationLinear);
if(self){
_window=_140;
_targetFrame=CGRectMakeCopy(_141);
_startFrame=CGRectMakeCopy(objj_msgSend(_window,"frame"));
}
return self;
}
}),new objj_method(sel_getUid("startAnimation"),function(self,_cmd){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPAnimation")},"startAnimation");
_window._isAnimating=YES;
}
}),new objj_method(sel_getUid("setCurrentProgress:"),function(self,_cmd,_146){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPAnimation")},"setCurrentProgress:",_146);
var _147=objj_msgSend(self,"currentValue");
if(_147==1){
_window._isAnimating=NO;
}
objj_msgSend(_window,"setFrameOrigin:",CGPointMake(_13a(CGRectGetMinX(_startFrame),CGRectGetMinX(_targetFrame),_147),_13a(CGRectGetMinY(_startFrame),CGRectGetMinY(_targetFrame),_147)));
objj_msgSend(_window,"setFrameSize:",CGSizeMake(_13a(CGRectGetWidth(_startFrame),CGRectGetWidth(_targetFrame),_147),_13a(CGRectGetHeight(_startFrame),CGRectGetHeight(_targetFrame),_147)));
}
})]);
i;14;CPDragServer.ji;19;CPDOMWindowBridge.ji;15;_CPWindowView.ji;8;CPView.jp;20;CPWindowController.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.ji;13;CPResponder.ji;10;CPWindow.ji;12;CPDocument.jc;4651;
var _1=objj_allocateClassPair(CPResponder,"CPWindowController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_owner"),new objj_ivar("_window"),new objj_ivar("_document"),new objj_ivar("_windowCibName")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithWindow:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPResponder")},"init");
if(_3){
objj_msgSend(_3,"setWindow:",_5);
objj_msgSend(_3,"setNextResponder:",CPApp);
}
return _3;
}
}),new objj_method(sel_getUid("initWithWindowCibName:"),function(_6,_7,_8){
with(_6){
return objj_msgSend(_6,"initWithWindowCibName:owner:",_8,_6);
}
}),new objj_method(sel_getUid("initWithWindowCibName:owner:"),function(_9,_a,_b,_c){
with(_9){
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPResponder")},"init");
if(_9){
_owner=_c;
_windowCibName=_b;
objj_msgSend(_9,"setNextResponder:",CPApp);
}
return _9;
}
}),new objj_method(sel_getUid("loadWindow"),function(_d,_e){
with(_d){
objj_msgSend(_d,"windowWillLoad");
objj_msgSend(_d,"setWindow:",CPApp._keyWindow=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CPRectMakeZero(),CPBorderlessBridgeWindowMask|CPTitledWindowMask|CPClosableWindowMask|CPResizableWindowMask));
objj_msgSend(_d,"windowDidLoad");
}
}),new objj_method(sel_getUid("showWindow:"),function(_f,_10,_11){
with(_f){
var _12=objj_msgSend(_f,"window");
if(objj_msgSend(_12,"respondsToSelector:",sel_getUid("becomesKeyOnlyIfNeeded"))&&objj_msgSend(_12,"becomesKeyOnlyIfNeeded")){
objj_msgSend(_12,"orderFront:",_11);
}else{
objj_msgSend(_12,"makeKeyAndOrderFront:",_11);
}
}
}),new objj_method(sel_getUid("isWindowLoaded"),function(_13,_14){
with(_13){
return _window;
}
}),new objj_method(sel_getUid("window"),function(_15,_16){
with(_15){
if(!_window){
objj_msgSend(_15,"loadWindow");
}
return _window;
}
}),new objj_method(sel_getUid("setWindow:"),function(_17,_18,_19){
with(_17){
_window=_19;
objj_msgSend(_window,"setWindowController:",_17);
objj_msgSend(_window,"setNextResponder:",_17);
}
}),new objj_method(sel_getUid("windowDidLoad"),function(_1a,_1b){
with(_1a){
objj_msgSend(_document,"windowControllerDidLoadNib:",_1a);
objj_msgSend(_1a,"synchronizeWindowTitleWithDocumentName");
}
}),new objj_method(sel_getUid("windowWillLoad"),function(_1c,_1d){
with(_1c){
objj_msgSend(_document,"windowControllerWillLoadNib:",_1c);
}
}),new objj_method(sel_getUid("setDocument:"),function(_1e,_1f,_20){
with(_1e){
if(_document==_20){
return;
}
var _21=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_document){
objj_msgSend(_21,"removeObserver:name:object:",_1e,CPDocumentWillSaveNotification,_document);
objj_msgSend(_21,"removeObserver:name:object:",_1e,CPDocumentDidSaveNotification,_document);
objj_msgSend(_21,"removeObserver:name:object:",_1e,CPDocumentDidFailToSaveNotification,_document);
}
_document=_20;
if(_document){
objj_msgSend(_21,"addObserver:selector:name:object:",_1e,sel_getUid("_documentWillSave:"),CPDocumentWillSaveNotification,_document);
objj_msgSend(_21,"addObserver:selector:name:object:",_1e,sel_getUid("_documentDidSave:"),CPDocumentDidSaveNotification,_document);
objj_msgSend(_21,"addObserver:selector:name:object:",_1e,sel_getUid("_documentDidFailToSave:"),CPDocumentDidFailToSaveNotification,_document);
objj_msgSend(_1e,"setDocumentEdited:",objj_msgSend(_document,"isDocumentEdited"));
}
objj_msgSend(_1e,"synchronizeWindowTitleWithDocumentName");
}
}),new objj_method(sel_getUid("_documentWillSave:"),function(_22,_23,_24){
with(_22){
objj_msgSend(objj_msgSend(_22,"window"),"setDocumentSaving:",YES);
}
}),new objj_method(sel_getUid("_documentDidSave:"),function(_25,_26,_27){
with(_25){
objj_msgSend(objj_msgSend(_25,"window"),"setDocumentSaving:",NO);
}
}),new objj_method(sel_getUid("_documentDidFailToSave:"),function(_28,_29,_2a){
with(_28){
objj_msgSend(objj_msgSend(_28,"window"),"setDocumentSaving:",NO);
}
}),new objj_method(sel_getUid("document"),function(_2b,_2c){
with(_2b){
return _document;
}
}),new objj_method(sel_getUid("setDocumentEdited:"),function(_2d,_2e,_2f){
with(_2d){
objj_msgSend(objj_msgSend(_2d,"window"),"setDocumentEdited:",_2f);
}
}),new objj_method(sel_getUid("synchronizeWindowTitleWithDocumentName"),function(_30,_31){
with(_30){
if(!_document||!_window){
return;
}
objj_msgSend(_window,"setTitle:",objj_msgSend(_30,"windowTitleForDocumentDisplayName:",objj_msgSend(_document,"displayName")));
}
}),new objj_method(sel_getUid("windowTitleForDocumentDisplayName:"),function(_32,_33,_34){
with(_32){
return _34;
}
})]);
