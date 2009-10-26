i;15;_CPWindowView.jc;10990;
var _1=41;
var _2=nil,_3=nil;
var _4=objj_allocateClassPair(CPView,"_CPTexturedWindowHeadView"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_gradientView"),new objj_ivar("_solidView"),new objj_ivar("_dividerView")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("initWithFrame:"),function(_6,_7,_8){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPView")},"initWithFrame:",_8);
if(_6){
var _9=objj_msgSend(_6,"class"),_a=objj_msgSend(_6,"bounds");
_gradientView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_a),_1));
objj_msgSend(_gradientView,"setBackgroundColor:",objj_msgSend(_9,"gradientColor"));
objj_msgSend(_6,"addSubview:",_gradientView);
_solidView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,_1,CGRectGetWidth(_a),CGRectGetHeight(_a)-_1));
objj_msgSend(_solidView,"setBackgroundColor:",objj_msgSend(_9,"solidColor"));
objj_msgSend(_6,"addSubview:",_solidView);
}
return _6;
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_b,_c,_d){
with(_b){
var _e=objj_msgSend(_b,"bounds");
objj_msgSend(_gradientView,"setFrameSize:",CGSizeMake(CGRectGetWidth(_e),_1));
objj_msgSend(_solidView,"setFrameSize:",CGSizeMake(CGRectGetWidth(_e),CGRectGetHeight(_e)-_1));
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("gradientColor"),function(_f,_10){
with(_f){
if(!_2){
var _11=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_CPWindowView,"class"));
_2=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPThreePartImage,"alloc"),"initWithImageSlices:isVertical:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_11,"pathForResource:","CPWindow/Standard/CPWindowStandardTop0.png"),CGSizeMake(6,41)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_11,"pathForResource:","CPWindow/Standard/CPWindowStandardTop1.png"),CGSizeMake(1,41)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_11,"pathForResource:","CPWindow/Standard/CPWindowStandardTop2.png"),CGSizeMake(6,41))],NO));
}
return _2;
}
}),new objj_method(sel_getUid("solidColor"),function(_12,_13){
with(_12){
if(!_3){
_3=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",195/255,195/255,195/255,1);
}
return _3;
}
})]);
var _14=nil,_15=nil,_16=nil,_17=nil,_18=nil,_19=nil,_1a=nil;
var _1b=41;
STANDARD_TITLEBAR_HEIGHT=25;
var _4=objj_allocateClassPair(_CPWindowView,"_CPStandardWindowView"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_headView"),new objj_ivar("_dividerView"),new objj_ivar("_bodyView"),new objj_ivar("_toolbarView"),new objj_ivar("_titleField"),new objj_ivar("_closeButton"),new objj_ivar("_minimizeButton")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("contentRectForFrameRect:"),function(_1c,_1d,_1e){
with(_1c){
var _1f=objj_msgSend(objj_msgSend(_1c,"class"),"contentRectForFrameRect:",_1e),_20=objj_msgSend(objj_msgSend(_1c,"window"),"toolbar");
if(objj_msgSend(_20,"isVisible")){
toolbarHeight=CGRectGetHeight(objj_msgSend(objj_msgSend(_20,"_toolbarView"),"frame"));
_1f.origin.y+=toolbarHeight;
_1f.size.height-=toolbarHeight;
}
return _1f;
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_21,_22,_23){
with(_21){
var _24=objj_msgSend(objj_msgSend(_21,"class"),"frameRectForContentRect:",_23),_25=objj_msgSend(objj_msgSend(_21,"window"),"toolbar");
if(objj_msgSend(_25,"isVisible")){
toolbarHeight=CGRectGetHeight(objj_msgSend(objj_msgSend(_25,"_toolbarView"),"frame"));
_24.origin.y-=toolbarHeight;
_24.size.height+=toolbarHeight;
}
return _24;
}
}),new objj_method(sel_getUid("initWithFrame:styleMask:"),function(_26,_27,_28,_29){
with(_26){
_26=objj_msgSendSuper({receiver:_26,super_class:objj_getClass("_CPWindowView")},"initWithFrame:styleMask:",_28,_29);
if(_26){
var _2a=objj_msgSend(_26,"class"),_2b=objj_msgSend(_26,"bounds");
_headView=objj_msgSend(objj_msgSend(_CPTexturedWindowHeadView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_2b),objj_msgSend(objj_msgSend(_26,"class"),"titleBarHeight")));
objj_msgSend(_headView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_headView,"setHitTests:",NO);
objj_msgSend(_26,"addSubview:",_headView);
_dividerView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,CGRectGetMaxY(objj_msgSend(_headView,"frame")),CGRectGetWidth(_2b),1));
objj_msgSend(_dividerView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_dividerView,"setBackgroundColor:",objj_msgSend(_2a,"dividerBackgroundColor"));
objj_msgSend(_dividerView,"setHitTests:",NO);
objj_msgSend(_26,"addSubview:",_dividerView);
var y=CGRectGetMaxY(objj_msgSend(_dividerView,"frame"));
_bodyView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,y,CGRectGetWidth(_2b),CGRectGetHeight(_2b)-y));
objj_msgSend(_bodyView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_bodyView,"setBackgroundColor:",objj_msgSend(_2a,"bodyBackgroundColor"));
objj_msgSend(_bodyView,"setHitTests:",NO);
objj_msgSend(_26,"addSubview:",_bodyView);
objj_msgSend(_26,"setResizeIndicatorOffset:",CGSizeMake(2,2));
_titleField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_titleField,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(_titleField,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_titleField,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(_titleField,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_titleField,"setTextShadowColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_titleField,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_titleField,"setStringValue:","Untitled");
objj_msgSend(_titleField,"sizeToFit");
objj_msgSend(_titleField,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_titleField,"setStringValue:","");
objj_msgSend(_26,"addSubview:",_titleField);
if(_styleMask&CPClosableWindowMask){
if(!_17){
var _2d=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_17=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2d,"pathForResource:","CPWindow/Standard/CPWindowStandardCloseButton.png"),CGSizeMake(16,16));
_18=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2d,"pathForResource:","CPWindow/Standard/CPWindowStandardCloseButtonHighlighted.png"),CGSizeMake(16,16));
}
_closeButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(8,7,16,16));
objj_msgSend(_closeButton,"setBordered:",NO);
objj_msgSend(_closeButton,"setImage:",_17);
objj_msgSend(_closeButton,"setAlternateImage:",_18);
objj_msgSend(_26,"addSubview:",_closeButton);
}
if(_styleMask&CPMiniaturizableWindowMask&&!objj_msgSend(CPPlatform,"isBrowser")){
if(!_19){
var _2d=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(CPWindow,"class"));
_19=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2d,"pathForResource:","CPWindow/Standard/CPWindowStandardMinimizeButton.png"),CGSizeMake(16,16));
_1a=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2d,"pathForResource:","CPWindow/Standard/CPWindowStandardMinimizeButtonHighlighted.png"),CGSizeMake(16,16));
}
_minimizeButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(27,7,16,16));
objj_msgSend(_minimizeButton,"setBordered:",NO);
objj_msgSend(_minimizeButton,"setImage:",_19);
objj_msgSend(_minimizeButton,"setAlternateImage:",_1a);
objj_msgSend(_26,"addSubview:",_minimizeButton);
}
objj_msgSend(_26,"tile");
}
return _26;
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_2e,_2f){
with(_2e){
objj_msgSend(_closeButton,"setTarget:",objj_msgSend(_2e,"window"));
objj_msgSend(_closeButton,"setAction:",sel_getUid("performClose:"));
objj_msgSend(_minimizeButton,"setTarget:",objj_msgSend(_2e,"window"));
objj_msgSend(_minimizeButton,"setAction:",sel_getUid("performMiniaturize:"));
}
}),new objj_method(sel_getUid("toolbarOffset"),function(_30,_31){
with(_30){
return CGSizeMake(0,objj_msgSend(objj_msgSend(_30,"class"),"titleBarHeight"));
}
}),new objj_method(sel_getUid("tile"),function(_32,_33){
with(_32){
objj_msgSendSuper({receiver:_32,super_class:objj_getClass("_CPWindowView")},"tile");
var _34=objj_msgSend(_32,"window"),_35=objj_msgSend(_32,"bounds"),_36=CGRectGetWidth(_35);
objj_msgSend(_headView,"setFrameSize:",CGSizeMake(_36,objj_msgSend(_32,"toolbarMaxY")));
objj_msgSend(_dividerView,"setFrame:",CGRectMake(0,CGRectGetMaxY(objj_msgSend(_headView,"frame")),_36,1));
var _37=CGRectGetMaxY(objj_msgSend(_dividerView,"frame"));
objj_msgSend(_bodyView,"setFrame:",CGRectMake(0,_37,_36,CGRectGetHeight(_35)-_37));
var _38=8;
if(_closeButton){
_38+=19;
}
if(_minimizeButton){
_38+=19;
}
objj_msgSend(_titleField,"setFrame:",CGRectMake(_38,5,_36-_38*2,CGRectGetHeight(objj_msgSend(_titleField,"frame"))));
objj_msgSend(objj_msgSend(_34,"contentView"),"setFrameOrigin:",CGPointMake(0,CGRectGetMaxY(objj_msgSend(_dividerView,"frame"))));
}
}),new objj_method(sel_getUid("setTitle:"),function(_39,_3a,_3b){
with(_39){
objj_msgSend(_titleField,"setStringValue:",_3b);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_3c,_3d,_3e){
with(_3c){
if(CGRectContainsPoint(objj_msgSend(_headView,"frame"),objj_msgSend(_3c,"convertPoint:fromView:",objj_msgSend(_3e,"locationInWindow"),nil))){
return objj_msgSend(_3c,"trackMoveWithEvent:",_3e);
}
objj_msgSendSuper({receiver:_3c,super_class:objj_getClass("_CPWindowView")},"mouseDown:",_3e);
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("bodyBackgroundColor"),function(_3f,_40){
with(_3f){
if(!_14){
_14=objj_msgSend(CPColor,"colorWithWhite:alpha:",0.96,1);
}
return _14;
}
}),new objj_method(sel_getUid("dividerBackgroundColor"),function(_41,_42){
with(_41){
if(!_15){
_15=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",125/255,125/255,125/255,1);
}
return _15;
}
}),new objj_method(sel_getUid("titleColor"),function(_43,_44){
with(_43){
if(!_16){
_16=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",44/255,44/255,44/255,1);
}
return _16;
}
}),new objj_method(sel_getUid("contentRectForFrameRect:"),function(_45,_46,_47){
with(_45){
var _48=CGRectMakeCopy(_47),_49=objj_msgSend(_45,"titleBarHeight")+1;
_48.origin.y+=_49;
_48.size.height-=_49;
return _48;
}
}),new objj_method(sel_getUid("frameRectForContentRect:"),function(_4a,_4b,_4c){
with(_4a){
var _4d=CGRectMakeCopy(_4c),_4e=objj_msgSend(_4a,"titleBarHeight")+1;
_4d.origin.y-=_4e;
_4d.size.height+=_4e;
return _4d;
}
}),new objj_method(sel_getUid("titleBarHeight"),function(_4f,_50){
with(_4f){
return STANDARD_TITLEBAR_HEIGHT;
}
})]);
