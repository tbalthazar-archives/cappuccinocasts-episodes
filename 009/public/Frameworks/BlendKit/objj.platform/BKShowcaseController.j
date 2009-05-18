I;16;AppKit/CPTheme.jI;15;AppKit/CPView.ji;13;BKUtilities.jc;3754;
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
class_addMethods(_1,[new objj_method(sel_getUid("setSelected:"),function(_18,_19,_1a){
with(_18){
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(_1b,_1c,_1d){
with(_1b){
if(!_label){
_label=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_label,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_label,"setAutoresizingMask:",CPViewMinYMargin|CPViewWidthSizable);
objj_msgSend(_label,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(_1b,"addSubview:",_label);
}
objj_msgSend(_label,"setStringValue:",objj_msgSend(_1d,"valueForKey:","label"));
objj_msgSend(_label,"sizeToFit");
objj_msgSend(_label,"setFrame:",CGRectMake(0,CGRectGetHeight(objj_msgSend(_1b,"bounds"))-CGRectGetHeight(objj_msgSend(_label,"frame")),CGRectGetWidth(objj_msgSend(_1b,"bounds")),CGRectGetHeight(objj_msgSend(_label,"frame"))));
if(_view){
objj_msgSend(_view,"removeFromSuperview");
}
_view=objj_msgSend(_1d,"valueForKey:","themedObject");
objj_msgSend(_view,"setAutoresizingMask:",CPViewMinXMargin|CPViewMaxXMargin|CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(_view,"setFrameOrigin:",CGPointMake((CGRectGetWidth(objj_msgSend(_1b,"bounds"))-CGRectGetWidth(objj_msgSend(_view,"frame")))/2,(CGRectGetMinY(objj_msgSend(_label,"frame"))-CGRectGetHeight(objj_msgSend(_view,"frame")))/2));
objj_msgSend(_1b,"addSubview:",_view);
}
})]);
