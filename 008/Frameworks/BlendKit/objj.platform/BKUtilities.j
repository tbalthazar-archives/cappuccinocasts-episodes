c;3002;
var _1=objj_allocateClassPair(CPObject,"AKThemeTemplate"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_name"),new objj_ivar("_description")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_name=objj_msgSend(_5,"decodeObjectForKey:","AKThemeTemplateName");
_description=objj_msgSend(_5,"decodeObjectForKey:","AKThemeTemplateDescription");
}
return _3;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_6,_7,_8){
with(_6){
objj_msgSend(_8,"encodeObject:forKey:",_name,"AKThemeTemplateName");
objj_msgSend(_8,"encodeObject:forKey:",_description,"AKThemeTemplateDescription");
}
})]);
var _1=objj_allocateClassPair(CPView,"AKThemeObjectTemplate"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_label"),new objj_ivar("_themedObject")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_9,_a,_b){
with(_9){
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPView")},"init");
if(_9){
_label=objj_msgSend(_b,"decodeObjectForKey:","AKThemeObjectTemplateLabel");
_themedObject=objj_msgSend(_b,"decodeObjectForKey:","AKThemeObjectTemplateThemedObject");
}
return _9;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_c,_d,_e){
with(_c){
objj_msgSend(_e,"encodeObject:forKey:",_label,"AKThemeObjectTemplateLabel");
objj_msgSend(_e,"encodeObject:forKey:",_themedObject,"AKThemeObjectTemplateThemedObject");
}
})]);
BKThemeDescriptorClasses=function(){
var _f=[];
for(candidate in window){
var _10=objj_getClass(candidate),_11=class_getName(_10),_12=_11.indexOf("ThemeDescriptor");
if((_12>=0)&&(_12===_11.length-"ThemeDescriptor".length)){
_f.push(_10);
}
}
return _f;
};
BKThemeObjectTemplatesForClass=function(_13){
var _14=[],_15=class_copyMethodList(_13.isa),_16=objj_msgSend(_15,"count");
while(_16--){
var _17=_15[_16],_18=method_getName(_17);
if(_18.indexOf("themed")===0){
var _19=method_getImplementation(_17),_1a=_19(_13,_18);
if(_1a){
var _1b=objj_msgSend(objj_msgSend(AKThemeObjectTemplate,"alloc"),"init");
objj_msgSend(_1b,"setValue:forKey:",_1a,"themedObject");
objj_msgSend(_1b,"setValue:forKey:",BKLabelFromIdentifier(_18),"label");
objj_msgSend(_14,"addObject:",_1b);
}
}
}
return _14;
};
BKLabelFromIdentifier=function(_1c){
var _1d=_1c.substr("themed".length);
index=0,count=_1d.length,label="",lastCapital=null,isLeadingCapital=YES;
for(;index<count;++index){
var _1e=_1d.charAt(index),_1f=/^[A-Z]/.test(_1e);
if(_1f){
if(!isLeadingCapital){
if(lastCapital===null){
label+=" "+_1e.toLowerCase();
}else{
label+=_1e;
}
}
lastCapital=_1e;
}else{
if(isLeadingCapital&&lastCapital!==null){
label+=lastCapital;
}
label+=_1e;
lastCapital=null;
isLeadingCapital=NO;
}
}
return label;
};
