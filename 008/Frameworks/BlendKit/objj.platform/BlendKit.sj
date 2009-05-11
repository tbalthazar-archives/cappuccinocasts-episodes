@STATIC;1.0;p;22;BKShowcaseController.jI;16;AppKit/CPTheme.jI;15;AppKit/CPView.ji;13;BKUtilities.jc;3672;
var _1=objj_allocateClassPair(CPObject,"BKShowcaseController"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("applicationDidFinishLaunching:"),function(_3,_4,_5){
with(_3){
var _6=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMakeZero(),CPBorderlessBridgeWindowMask),_7=objj_msgSend(_6,"contentView"),_8=objj_msgSend(_7,"bounds"),_9=BKThemeDescriptorClasses();
var _a=objj_msgSend(objj_msgSend(CPTabView,"alloc"),"initWithFrame:",_8);
objj_msgSend(_a,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_7,"addSubview:",_a);
var _b=objj_msgSend(_9,"count");
while(_b--){
var _c=_9[_b],_d=objj_msgSend(objj_msgSend(CPTabViewItem,"alloc"),"initWithIdentifier:",objj_msgSend(_c,"themeName")),_e=BKThemeObjectTemplatesForClass(_c),_f=objj_msgSend(_e,"count"),_10=[],_11=CGSizeMake(0,0);
while(_f--){
var _12=_e[_f],_13=objj_msgSend(_12,"valueForKey:","themedObject");
if(objj_msgSend(_13,"isKindOfClass:",objj_msgSend(CPView,"class"))){
var _14=objj_msgSend(_13,"frame").size,_15=objj_msgSend(objj_msgSend(_12,"valueForKey:","label"),"sizeWithFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12)).width+20;
if(_14.width>_11.width){
_11.width=_14.width;
}
if(_15>_11.width){
_11.width=_15;
}
if(_14.height>_11.height){
_11.height=_14.height;
}
objj_msgSend(_10,"addObject:",_12);
}
}
_11.height+=30;
var _16=objj_msgSend(objj_msgSend(CPCollectionView,"alloc"),"initWithFrame:",CGRectMakeZero()),_17=objj_msgSend(objj_msgSend(CPCollectionViewItem,"alloc"),"init");
objj_msgSend(_17,"setView:",objj_msgSend(objj_msgSend(BKShowcaseCell,"alloc"),"init"));
objj_msgSend(_16,"setItemPrototype:",_17);
objj_msgSend(_16,"setMinItemSize:",_11);
objj_msgSend(_16,"setMaxItemSize:",_11);
objj_msgSend(_16,"setVerticalMargin:",5);
objj_msgSend(_16,"setContent:",_10);
objj_msgSend(_d,"setLabel:",objj_msgSend(_c,"themeName"));
objj_msgSend(_d,"setView:",_16);
objj_msgSend(_a,"addTabViewItem:",_d);
}
objj_msgSend(_6,"orderFront:",_3);
}
})]);
var _1=objj_allocateClassPair(CPView,"BKShowcaseCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_view"),new objj_ivar("_label")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("setRepresentedObject:"),function(_18,_19,_1a){
with(_18){
if(!_label){
_label=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_label,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_label,"setAutoresizingMask:",CPViewMinYMargin|CPViewWidthSizable);
objj_msgSend(_label,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(_18,"addSubview:",_label);
}
objj_msgSend(_label,"setStringValue:",objj_msgSend(_1a,"valueForKey:","label"));
objj_msgSend(_label,"sizeToFit");
objj_msgSend(_label,"setFrame:",CGRectMake(0,CGRectGetHeight(objj_msgSend(_18,"bounds"))-CGRectGetHeight(objj_msgSend(_label,"frame")),CGRectGetWidth(objj_msgSend(_18,"bounds")),CGRectGetHeight(objj_msgSend(_label,"frame"))));
if(_view){
objj_msgSend(_view,"removeFromSuperview");
}
_view=objj_msgSend(_1a,"valueForKey:","themedObject");
objj_msgSend(_view,"setAutoresizingMask:",CPViewMinXMargin|CPViewMaxXMargin|CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(_view,"setFrameOrigin:",CGPointMake((CGRectGetWidth(objj_msgSend(_18,"bounds"))-CGRectGetWidth(objj_msgSend(_view,"frame")))/2,(CGRectGetMinY(objj_msgSend(_label,"frame"))-CGRectGetHeight(objj_msgSend(_view,"frame")))/2));
objj_msgSend(_18,"addSubview:",_view);
}
})]);
p;13;BKUtilities.jc;3002;
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
p;10;BlendKit.ji;22;BKShowcaseController.ji;13;BKUtilities.j