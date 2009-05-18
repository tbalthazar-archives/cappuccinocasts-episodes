i;21;_CPImageAndTextView.ji;12;CGGeometry.ji;11;CPControl.jc;15807;
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
CPNoButtonMask=0;
CPContentsButtonMask=1;
CPPushInButtonMask=2;
CPGrayButtonMask=4;
CPBackgroundButtonMask=8;
CPNoCellMask=CPNoButtonMask;
CPContentsCellMask=CPContentsButtonMask;
CPPushInCellMask=CPPushInButtonMask;
CPChangeGrayCellMask=CPGrayButtonMask;
CPChangeBackgroundCellMask=CPBackgroundButtonMask;
CPButtonStateMixed=CPThemeState("mixed");
var _1=objj_allocateClassPair(CPControl,"CPButton"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_allowsMixedState"),new objj_ivar("_title"),new objj_ivar("_alternateTitle"),new objj_ivar("_image"),new objj_ivar("_alternateImage"),new objj_ivar("_showsStateBy"),new objj_ivar("_highlightsBy"),new objj_ivar("_imageDimsWhenDisabled"),new objj_ivar("_bezelStyle"),new objj_ivar("_controlSize")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("standardRadioWithTitle:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(CPRadio,"standardButtonWithTitle:",_5);
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_6,_7,_8){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPControl")},"initWithFrame:",_8);
if(_6){
objj_msgSend(_6,"setValue:forThemeAttribute:",CPCenterTextAlignment,"alignment");
objj_msgSend(_6,"setValue:forThemeAttribute:",CPCenterVerticalTextAlignment,"vertical-alignment");
objj_msgSend(_6,"setValue:forThemeAttribute:",CPImageLeft,"image-position");
objj_msgSend(_6,"setValue:forThemeAttribute:",CPScaleNone,"image-scaling");
_controlSize=CPRegularControlSize;
objj_msgSend(_6,"setBordered:",YES);
}
return _6;
}
}),new objj_method(sel_getUid("allowsMixedState"),function(_9,_a){
with(_9){
return _allowsMixedState;
}
}),new objj_method(sel_getUid("setAllowsMixedState:"),function(_b,_c,_d){
with(_b){
_d=!!_d;
if(_allowsMixedState===_d){
return;
}
_allowsMixedState=_d;
if(!_allowsMixedState){
objj_msgSend(_b,"unsetThemeState:",CPButtonStateMixed);
}
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_e,_f,_10){
with(_e){
if(!_10||_10===""||(objj_msgSend(_10,"intValue")===0)){
_10=CPOffState;
}else{
if(!objj_msgSend(_10,"isKindOfClass:",objj_msgSend(CPNumber,"class"))){
_10=CPOnState;
}else{
if(_10>CPOnState){
_10=CPOnState;
}else{
if(_10<CPOffState){
if(objj_msgSend(_e,"allowsMixedState")){
_10=CPMixedState;
}else{
_10=CPOnState;
}
}
}
}
}
objj_msgSendSuper({receiver:_e,super_class:objj_getClass("CPControl")},"setObjectValue:",_10);
switch(objj_msgSend(_e,"objectValue")){
case CPMixedState:
objj_msgSend(_e,"unsetThemeState:",CPThemeStateSelected);
objj_msgSend(_e,"setThemeState:",CPButtonStateMixed);
break;
case CPOnState:
objj_msgSend(_e,"unsetThemeState:",CPButtonStateMixed);
objj_msgSend(_e,"setThemeState:",CPThemeStateSelected);
break;
case CPOffState:
objj_msgSend(_e,"unsetThemeState:",CPThemeStateSelected|CPButtonStateMixed);
}
}
}),new objj_method(sel_getUid("nextState"),function(_11,_12){
with(_11){
if(objj_msgSend(_11,"allowsMixedState")){
var _13=objj_msgSend(_11,"state");
return _13-((_13===-1)?-2:1);
}
return 1-objj_msgSend(_11,"state");
}
}),new objj_method(sel_getUid("setNextState"),function(_14,_15){
with(_14){
objj_msgSend(_14,"setState:",objj_msgSend(_14,"nextState"));
}
}),new objj_method(sel_getUid("setState:"),function(_16,_17,_18){
with(_16){
objj_msgSend(_16,"setIntValue:",_18);
}
}),new objj_method(sel_getUid("state"),function(_19,_1a){
with(_19){
return objj_msgSend(_19,"intValue");
}
}),new objj_method(sel_getUid("setTitle:"),function(_1b,_1c,_1d){
with(_1b){
if(_title===_1d){
return;
}
_title=_1d;
objj_msgSend(_1b,"setNeedsLayout");
objj_msgSend(_1b,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("title"),function(_1e,_1f){
with(_1e){
return _title;
}
}),new objj_method(sel_getUid("setAlternateTitle:"),function(_20,_21,_22){
with(_20){
if(_alternateTitle===_22){
return;
}
_alternateTitle=_22;
objj_msgSend(_20,"setNeedsLayout");
objj_msgSend(_20,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("alternateTitle"),function(_23,_24){
with(_23){
return _alternateTitle;
}
}),new objj_method(sel_getUid("setImage:"),function(_25,_26,_27){
with(_25){
if(_image===_27){
return;
}
_image=_27;
objj_msgSend(_25,"setNeedsLayout");
objj_msgSend(_25,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("image"),function(_28,_29){
with(_28){
return _image;
}
}),new objj_method(sel_getUid("setAlternateImage:"),function(_2a,_2b,_2c){
with(_2a){
if(_alternateImage===_2c){
return;
}
_alternateImage=_2c;
objj_msgSend(_2a,"setNeedsLayout");
objj_msgSend(_2a,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("alternateImage"),function(_2d,_2e){
with(_2d){
return _alternateImage;
}
}),new objj_method(sel_getUid("setShowsStateBy:"),function(_2f,_30,_31){
with(_2f){
if(_showsStateBy===_31){
return;
}
_showsStateBy=_31;
objj_msgSend(_2f,"setNeedsDisplay:",YES);
objj_msgSend(_2f,"setNeedsLayout");
}
}),new objj_method(sel_getUid("showsStateBy"),function(_32,_33){
with(_32){
return _showsStateBy;
}
}),new objj_method(sel_getUid("setHighlightsBy:"),function(_34,_35,_36){
with(_34){
if(_highlightsBy===_36){
return;
}
_highlightsBy=_36;
if(objj_msgSend(_34,"hasThemeState:",CPThemeStateHighlighted)){
objj_msgSend(_34,"setNeedsDisplay:",YES);
objj_msgSend(_34,"setNeedsLayout");
}
}
}),new objj_method(sel_getUid("setButtonType:"),function(_37,_38,_39){
with(_37){
switch(buttonType){
case CPMomentaryLightButton:
objj_msgSend(_37,"setHighlightsBy:",CPChangeBackgroundCellMask);
objj_msgSend(_37,"setShowsStateBy:",CPNoCellMask);
break;
case CPMomentaryPushInButton:
objj_msgSend(_37,"setHighlightsBy:",CPPushInCellMask|CPChangeGrayCellMask);
objj_msgSend(_37,"setShowsStateBy:",CPNoCellMask);
break;
case CPMomentaryChangeButton:
objj_msgSend(_37,"setHighlightsBy:",CPContentsCellMask);
objj_msgSend(_37,"setShowsStateBy:",CPNoCellMask);
break;
case CPPushOnPushOffButton:
objj_msgSend(_37,"setHighlightsBy:",CPPushInCellMask|CPChangeGrayCellMask);
objj_msgSend(_37,"setShowsStateBy:",CPChangeBackgroundCellMask);
break;
case CPOnOffButton:
objj_msgSend(_37,"setHighlightsBy:",CPChangeBackgroundCellMask);
objj_msgSend(_37,"setShowsStateBy:",CPChangeBackgroundCellMask);
break;
case CPToggleButton:
objj_msgSend(_37,"setHighlightsBy:",CPPushInCellMask|NSContentsCellMask);
objj_msgSend(_37,"setShowsStateBy:",CPContentsCellMask);
break;
case CPSwitchButton:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The CPSwitchButton type is not supported in Cappuccino, use the CPCheckBox class instead.");
case CPRadioButton:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"The CPRadioButton type is not supported in Cappuccino, use the CPRadio class instead.");
default:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Unknown button type.");
}
objj_msgSend(_37,"setImageDimsWhenDisabled:",YES);
}
}),new objj_method(sel_getUid("setImageDimsWhenDisabled:"),function(_3a,_3b,_3c){
with(_3a){
_3c=!!_3c;
if(_imageDimsWhenDisabled===_3c){
return;
}
_imageDimsWhenDisabled=_3c;
if(_imageDimsWhenDisabled){
objj_msgSend(_3a,"setNeedsDisplay:",YES);
objj_msgSend(_3a,"setNeedsLayout");
}
}
}),new objj_method(sel_getUid("imageDimsWhenDisabled"),function(_3d,_3e){
with(_3d){
return _imageDimsWhenDisabled;
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(_3f,_40,_41){
with(_3f){
objj_msgSend(_3f,"highlight:",YES);
return objj_msgSendSuper({receiver:_3f,super_class:objj_getClass("CPControl")},"startTrackingAt:",_41);
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(_42,_43,_44,_45,_46){
with(_42){
objj_msgSend(_42,"highlight:",NO);
objj_msgSendSuper({receiver:_42,super_class:objj_getClass("CPControl")},"stopTracking:at:mouseIsUp:",_44,_45,_46);
if(_46&&CGRectContainsPoint(objj_msgSend(_42,"bounds"),_45)){
objj_msgSend(_42,"setNextState");
}
}
}),new objj_method(sel_getUid("contentRectForBounds:"),function(_47,_48,_49){
with(_47){
var _4a=objj_msgSend(_47,"currentValueForThemeAttribute:","content-inset");
if(((_4a).top===0&&(_4a).right===0&&(_4a).bottom===0&&(_4a).left===0)){
return _49;
}
_49.origin.x+=_4a.left;
_49.origin.y+=_4a.top;
_49.size.width-=_4a.left+_4a.right;
_49.size.height-=_4a.top+_4a.bottom;
return _49;
}
}),new objj_method(sel_getUid("bezelRectForBounds:"),function(_4b,_4c,_4d){
with(_4b){
if(!objj_msgSend(_4b,"isBordered")){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
var _4e=objj_msgSend(_4b,"currentValueForThemeAttribute:","bezel-inset");
if(((_4e).top===0&&(_4e).right===0&&(_4e).bottom===0&&(_4e).left===0)){
return _4d;
}
_4d.origin.x+=_4e.left;
_4d.origin.y+=_4e.top;
_4d.size.width-=_4e.left+_4e.right;
_4d.size.height-=_4e.top+_4e.bottom;
return _4d;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_4f,_50){
with(_4f){
var _51=objj_msgSend((objj_msgSend(_4f,"title")||" "),"sizeWithFont:",objj_msgSend(_4f,"font")),_52=objj_msgSend(_4f,"currentValueForThemeAttribute:","content-inset"),_53=objj_msgSend(_4f,"currentValueForThemeAttribute:","default-height");
objj_msgSend(_4f,"setFrameSize:",CGSizeMake(_51.width+_52.left+_52.right,_53));
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_54,_55,_56){
with(_54){
if(_56==="bezel-view"){
return objj_msgSend(_54,"bezelRectForBounds:",objj_msgSend(_54,"bounds"));
}else{
if(_56==="content-view"){
return objj_msgSend(_54,"contentRectForBounds:",objj_msgSend(_54,"bounds"));
}
}
return objj_msgSendSuper({receiver:_54,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_56);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_57,_58,_59){
with(_57){
if(_59==="bezel-view"){
var _5a=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_5a,"setHitTests:",NO);
return _5a;
}else{
return objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
}
return objj_msgSendSuper({receiver:_57,super_class:objj_getClass("CPControl")},"createEphemeralSubviewNamed:",_59);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_5b,_5c){
with(_5b){
var _5d=objj_msgSend(_5b,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bezel-view",CPWindowBelow,"content-view");
if(_5d){
objj_msgSend(_5d,"setBackgroundColor:",objj_msgSend(_5b,"currentValueForThemeAttribute:","bezel-color"));
}
var _5e=objj_msgSend(_5b,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
if(_5e){
objj_msgSend(_5e,"setText:",(objj_msgSend(_5b,"hasThemeState:",CPThemeStateHighlighted)&&_alternateTitle)?_alternateTitle:_title);
objj_msgSend(_5e,"setImage:",(objj_msgSend(_5b,"hasThemeState:",CPThemeStateHighlighted)&&_alternateImage)?_alternateImage:_image);
objj_msgSend(_5e,"setFont:",objj_msgSend(_5b,"currentValueForThemeAttribute:","font"));
objj_msgSend(_5e,"setTextColor:",objj_msgSend(_5b,"currentValueForThemeAttribute:","text-color"));
objj_msgSend(_5e,"setAlignment:",objj_msgSend(_5b,"currentValueForThemeAttribute:","alignment"));
objj_msgSend(_5e,"setVerticalAlignment:",objj_msgSend(_5b,"currentValueForThemeAttribute:","vertical-alignment"));
objj_msgSend(_5e,"setLineBreakMode:",objj_msgSend(_5b,"currentValueForThemeAttribute:","line-break-mode"));
objj_msgSend(_5e,"setTextShadowColor:",objj_msgSend(_5b,"currentValueForThemeAttribute:","text-shadow-color"));
objj_msgSend(_5e,"setTextShadowOffset:",objj_msgSend(_5b,"currentValueForThemeAttribute:","text-shadow-offset"));
objj_msgSend(_5e,"setImagePosition:",objj_msgSend(_5b,"currentValueForThemeAttribute:","image-position"));
objj_msgSend(_5e,"setImageScaling:",objj_msgSend(_5b,"currentValueForThemeAttribute:","image-scaling"));
}
}
}),new objj_method(sel_getUid("setDefaultButton:"),function(_5f,_60,_61){
with(_5f){
if(_61){
objj_msgSend(_5f,"setThemeState:",CPThemeStateDefault);
}else{
objj_msgSend(_5f,"unsetThemeState:",CPThemeStateDefault);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("standardButtonWithTitle:"),function(_62,_63,_64){
with(_62){
var _65=objj_msgSend(objj_msgSend(CPButton,"alloc"),"init");
objj_msgSend(_65,"setTitle:",_64);
return _65;
}
}),new objj_method(sel_getUid("standardCheckBoxWithTitle:"),function(_66,_67,_68){
with(_66){
return objj_msgSend(CPCheckBox,"standardButtonWithTitle:",_68);
}
}),new objj_method(sel_getUid("themeClass"),function(_69,_6a){
with(_69){
return "button";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_6b,_6c){
with(_6b){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[{top:(0),right:(0),bottom:(0),left:(0)},{top:(0),right:(0),bottom:(0),left:(0)},nil,24],["bezel-inset","content-inset","bezel-color","default-height"]);
}
})]);
var _1=objj_getClass("CPButton");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPButton\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setBezelStyle:"),function(_6d,_6e,_6f){
with(_6d){
}
}),new objj_method(sel_getUid("bezelStyle"),function(_70,_71){
with(_70){
}
}),new objj_method(sel_getUid("setBordered:"),function(_72,_73,_74){
with(_72){
if(_74){
objj_msgSend(_72,"setThemeState:",CPThemeStateBordered);
}else{
objj_msgSend(_72,"unsetThemeState:",CPThemeStateBordered);
}
}
}),new objj_method(sel_getUid("isBordered"),function(_75,_76){
with(_75){
return objj_msgSend(_75,"hasThemeState:",CPThemeStateBordered);
}
})]);
var _77="CPButtonImageKey",_78="CPButtonAlternateImageKey",_79="CPButtonTitleKey",_7a="CPButtonAlternateTitleKey",_7b="CPButtonIsBorderedKey",_7c="CPButtonBezelStyleKey";
var _1=objj_getClass("CPButton");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPButton\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_7d,_7e,_7f){
with(_7d){
_7d=objj_msgSendSuper({receiver:_7d,super_class:objj_getClass("CPControl")},"initWithCoder:",_7f);
if(_7d){
_controlSize=CPRegularControlSize;
objj_msgSend(_7d,"setImage:",objj_msgSend(_7f,"decodeObjectForKey:",_77));
objj_msgSend(_7d,"setAlternateImage:",objj_msgSend(_7f,"decodeObjectForKey:",_78));
objj_msgSend(_7d,"setTitle:",objj_msgSend(_7f,"decodeObjectForKey:",_79));
objj_msgSend(_7d,"setAlternateTitle:",objj_msgSend(_7f,"decodeObjectForKey:",_7a));
objj_msgSend(_7d,"setNeedsLayout");
objj_msgSend(_7d,"setNeedsDisplay:",YES);
}
return _7d;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_80,_81,_82){
with(_80){
objj_msgSendSuper({receiver:_80,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_82);
objj_msgSend(_82,"encodeObject:forKey:",_image,_77);
objj_msgSend(_82,"encodeObject:forKey:",_alternateImage,_78);
objj_msgSend(_82,"encodeObject:forKey:",_title,_79);
objj_msgSend(_82,"encodeObject:forKey:",_alternateTitle,_7a);
objj_msgSend(_82,"encodeInt:forKey:",_bezelStyle,_7c);
}
})]);
i;12;CPCheckBox.ji;9;CPRadio.j