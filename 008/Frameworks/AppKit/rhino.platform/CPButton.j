i;21;_CPImageAndTextView.ji;12;CGGeometry.ji;11;CPControl.jc;12871;
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
class_addIvars(_6,[new objj_ivar("_tag"),new objj_ivar("_state"),new objj_ivar("_allowsMixedState"),new objj_ivar("_title"),new objj_ivar("_alternateTitle"),new objj_ivar("_image"),new objj_ivar("_alternateImage"),new objj_ivar("_bezelInset"),new objj_ivar("_contentInset"),new objj_ivar("_bezelColor"),new objj_ivar("_bezelView"),new objj_ivar("_contentView"),new objj_ivar("_bezelStyle"),new objj_ivar("_isBordered"),new objj_ivar("_controlSize")]);
objj_registerClassPair(_6);
objj_addClassForBundle(_6,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_6,[new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPControl")},"initWithFrame:",_a);
if(_8){
objj_msgSend(_8,"setValue:forThemedAttributeName:",CPCenterTextAlignment,"alignment");
objj_msgSend(_8,"setValue:forThemedAttributeName:",CPCenterVerticalTextAlignment,"vertical-alignment");
objj_msgSend(_8,"setValue:forThemedAttributeName:",CPImageLeft,"image-position");
objj_msgSend(_8,"setValue:forThemedAttributeName:",CPScaleNone,"image-scaling");
_controlSize=CPRegularControlSize;
objj_msgSend(_8,"setBordered:",YES);
}
return _8;
}
}),new objj_method(sel_getUid("allowsMixedState"),function(_b,_c){
with(_b){
return _allowsMixedState;
}
}),new objj_method(sel_getUid("setAllowsMixedState:"),function(_d,_e,_f){
with(_d){
_allowsMixedState=_f;
}
}),new objj_method(sel_getUid("nextState"),function(_10,_11){
with(_10){
if(_state==CPOffState){
return CPOnState;
}else{
return (_state>=CPOnState&&_allowsMixedState)?CPMixedState:CPOffState;
}
}
}),new objj_method(sel_getUid("setNextState"),function(_12,_13){
with(_12){
objj_msgSend(_12,"setState:",objj_msgSend(_12,"nextState"));
}
}),new objj_method(sel_getUid("setState:"),function(_14,_15,_16){
with(_14){
_state=_16;
}
}),new objj_method(sel_getUid("state"),function(_17,_18){
with(_17){
return _state;
}
}),new objj_method(sel_getUid("setTitle:"),function(_19,_1a,_1b){
with(_19){
if(_title===_1b){
return;
}
_title=_1b;
objj_msgSend(_19,"setNeedsLayout");
objj_msgSend(_19,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("title"),function(_1c,_1d){
with(_1c){
return _title;
}
}),new objj_method(sel_getUid("setAlternateTitle:"),function(_1e,_1f,_20){
with(_1e){
if(_alternateTitle===_20){
return;
}
_alternateTitle=_20;
objj_msgSend(_1e,"setNeedsLayout");
objj_msgSend(_1e,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("alternateTitle"),function(_21,_22){
with(_21){
return _alternateTitle;
}
}),new objj_method(sel_getUid("setImage:"),function(_23,_24,_25){
with(_23){
if(_image===_25){
return;
}
_image=_25;
objj_msgSend(_23,"setNeedsLayout");
objj_msgSend(_23,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("image"),function(_26,_27){
with(_26){
return _image;
}
}),new objj_method(sel_getUid("setAlternateImage:"),function(_28,_29,_2a){
with(_28){
if(_alternateImage===_2a){
return;
}
_alternateImage=_2a;
objj_msgSend(_28,"setNeedsLayout");
objj_msgSend(_28,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("alternateImage"),function(_2b,_2c){
with(_2b){
return _alternateImage;
}
}),new objj_method(sel_getUid("highlight:"),function(_2d,_2e,_2f){
with(_2d){
objj_msgSendSuper({receiver:_2d,super_class:objj_getClass("CPControl")},"highlight:",_2f);
objj_msgSend(_2d,"drawBezelWithHighlight:",_2f);
}
}),new objj_method(sel_getUid("setTag:"),function(_30,_31,_32){
with(_30){
_tag=_32;
}
}),new objj_method(sel_getUid("tag"),function(_33,_34){
with(_33){
return _tag;
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(_35,_36,_37){
with(_35){
objj_msgSend(_35,"highlight:",YES);
return objj_msgSendSuper({receiver:_35,super_class:objj_getClass("CPControl")},"startTrackingAt:",_37);
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(_38,_39,_3a,_3b,_3c){
with(_38){
objj_msgSend(_38,"highlight:",NO);
objj_msgSendSuper({receiver:_38,super_class:objj_getClass("CPControl")},"stopTracking:at:mouseIsUp:",_3a,_3b,_3c);
}
}),new objj_method(sel_getUid("drawBezelWithHighlight:"),function(_3d,_3e,_3f){
with(_3d){
return;
_bezelBorderNeedsUpdate=!objj_msgSend(_3d,"window");
if(_bezelBorderNeedsUpdate){
return;
}
objj_msgSend(_3d,"setBackgroundColorWithName:",_3f?CPControlHighlightedBackgroundColor:CPControlNormalBackgroundColor);
}
}),new objj_method(sel_getUid("createBezelView"),function(_40,_41){
with(_40){
var _42=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_42,"setHitTests:",NO);
return _42;
}
}),new objj_method(sel_getUid("createContentView"),function(_43,_44){
with(_43){
var _45=objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
return _45;
}
}),new objj_method(sel_getUid("contentRectForBounds:"),function(_46,_47,_48){
with(_46){
var _49=objj_msgSend(_46,"currentValueForThemedAttributeName:","content-inset");
if(((_49).left===0&&(_49).top===0&&(_49).right===0&&(_49).bottom===0)){
return _48;
}
_48.origin.x+=_49.left;
_48.origin.y+=_49.top;
_48.size.width-=_49.left+_49.right;
_48.size.height-=_49.top+_49.bottom;
return _48;
}
}),new objj_method(sel_getUid("bezelRectForBounds:"),function(_4a,_4b,_4c){
with(_4a){
if(!objj_msgSend(_4a,"isBordered")){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
var _4d=objj_msgSend(_4a,"currentValueForThemedAttributeName:","bezel-inset");
if(((_4d).left===0&&(_4d).top===0&&(_4d).right===0&&(_4d).bottom===0)){
return _4c;
}
_4c.origin.x+=_4d.left;
_4c.origin.y+=_4d.top;
_4c.size.width-=_4d.left+_4d.right;
_4c.size.height-=_4d.top+_4d.bottom;
return _4c;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_4e,_4f){
with(_4e){
var _50=objj_msgSend((objj_msgSend(_4e,"title")||" "),"sizeWithFont:",objj_msgSend(_4e,"font")),_51=objj_msgSend(_4e,"currentValueForThemedAttributeName:","content-inset"),_52=objj_msgSend(_4e,"currentValueForThemedAttributeName:","default-height");
objj_msgSend(_4e,"setFrameSize:",CGSizeMake(_50.width+_51.left+_51.right,_52));
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_53,_54,_55){
with(_53){
if(_55==="bezel-view"){
return objj_msgSend(_53,"bezelRectForBounds:",objj_msgSend(_53,"bounds"));
}else{
if(_55==="content-view"){
return objj_msgSend(_53,"contentRectForBounds:",objj_msgSend(_53,"bounds"));
}
}
return objj_msgSendSuper({receiver:_53,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_55);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_56,_57,_58){
with(_56){
if(_58==="bezel-view"){
var _59=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_59,"setHitTests:",NO);
return _59;
}else{
return objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
}
return objj_msgSendSuper({receiver:_56,super_class:objj_getClass("CPControl")},"createEphemeralSubviewNamed:",_58);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_5a,_5b){
with(_5a){
var _5c=objj_msgSend(_5a,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bezel-view",CPWindowBelow,"content-view");
if(_5c){
objj_msgSend(_5c,"setBackgroundColor:",objj_msgSend(_5a,"currentValueForThemedAttributeName:","bezel-color"));
}
var _5d=objj_msgSend(_5a,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
if(_5d){
objj_msgSend(_5d,"setText:",((_controlState&CPControlStateHighlighted)&&_alternateTitle)?_alternateTitle:_title);
objj_msgSend(_5d,"setImage:",((_controlState&CPControlStateHighlighted)&&_alternateImage)?_alternateImage:_image);
objj_msgSend(_5d,"setFont:",objj_msgSend(_5a,"currentValueForThemedAttributeName:","font"));
objj_msgSend(_5d,"setTextColor:",objj_msgSend(_5a,"currentValueForThemedAttributeName:","text-color"));
objj_msgSend(_5d,"setAlignment:",objj_msgSend(_5a,"currentValueForThemedAttributeName:","alignment"));
objj_msgSend(_5d,"setVerticalAlignment:",objj_msgSend(_5a,"currentValueForThemedAttributeName:","vertical-alignment"));
objj_msgSend(_5d,"setLineBreakMode:",objj_msgSend(_5a,"currentValueForThemedAttributeName:","line-break-mode"));
objj_msgSend(_5d,"setTextShadowColor:",objj_msgSend(_5a,"currentValueForThemedAttributeName:","text-shadow-color"));
objj_msgSend(_5d,"setTextShadowOffset:",objj_msgSend(_5a,"currentValueForThemedAttributeName:","text-shadow-offset"));
objj_msgSend(_5d,"setImagePosition:",objj_msgSend(_5a,"currentValueForThemedAttributeName:","image-position"));
objj_msgSend(_5d,"setImageScaling:",objj_msgSend(_5a,"currentValueForThemedAttributeName:","image-scaling"));
}
}
}),new objj_method(sel_getUid("setDefaultButton:"),function(_5e,_5f,_60){
with(_5e){
if((!!(_controlState&CPControlStateDefault))===_60){
return;
}
if(_60){
_controlState|=CPControlStateDefault;
}else{
_controlState&=~CPControlStateDefault;
}
objj_msgSend(_5e,"setNeedsLayout");
objj_msgSend(_5e,"setNeedsDisplay:",YES);
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("themedAttributes"),function(_61,_62){
with(_61){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[{top:(0),left:(0),bottom:(0),right:(0)},{top:(0),left:(0),bottom:(0),right:(0)},nil,24],["bezel-inset","content-inset","bezel-color","default-height"]);
}
})]);
var _6=objj_getClass("CPButton");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPButton\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("setBezelStyle:"),function(_63,_64,_65){
with(_63){
}
}),new objj_method(sel_getUid("bezelStyle"),function(_66,_67){
with(_66){
}
}),new objj_method(sel_getUid("setBordered:"),function(_68,_69,_6a){
with(_68){
if((!!(_controlState&CPControlStateBordered))===_6a){
return;
}
if(_6a){
_controlState|=CPControlStateBordered;
}else{
_controlState&=~CPControlStateBordered;
}
objj_msgSend(_68,"setNeedsLayout");
objj_msgSend(_68,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("isBordered"),function(_6b,_6c){
with(_6b){
return !!(_controlState&CPControlStateBordered);
}
})]);
var _6d="CPButtonImageKey",_6e="CPButtonAlternateImageKey",_6f="CPButtonTitleKey",_70="CPButtonAlternateTitleKey",_71="CPButtonContentInsetKey",_72="CPButtonBezelInsetKey",_73="CPButtonBezelColorKey",_74="CPButtonImageAndTitleViewKey",_75="CPButtonImagePositionKey",_76="CPButtonImageScalingKey",_77="CPButtonIsBorderedKey",_78="CPButtonBezelStyleKey",_74="CPButtonImageAndTitleViewKey";
var _6=objj_getClass("CPButton");
if(!_6){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPButton\""));
}
var _7=_6.isa;
class_addMethods(_6,[new objj_method(sel_getUid("initWithCoder:"),function(_79,_7a,_7b){
with(_79){
_79=objj_msgSendSuper({receiver:_79,super_class:objj_getClass("CPControl")},"initWithCoder:",_7b);
if(_79){
_controlSize=CPRegularControlSize;
objj_msgSend(_79,"setImage:",objj_msgSend(_7b,"decodeObjectForKey:",_6d));
objj_msgSend(_79,"setAlternateImage:",objj_msgSend(_7b,"decodeObjectForKey:",_6e));
objj_msgSend(_79,"setTitle:",objj_msgSend(_7b,"decodeObjectForKey:",_6f));
objj_msgSend(_79,"setAlternateTitle:",objj_msgSend(_7b,"decodeObjectForKey:",_70));
objj_msgSend(_79,"setNeedsLayout");
objj_msgSend(_79,"setNeedsDisplay:",YES);
}
return _79;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7c,_7d,_7e){
with(_7c){
objj_msgSendSuper({receiver:_7c,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_7e);
objj_msgSend(_7e,"encodeObject:forKey:",_image,_6d);
objj_msgSend(_7e,"encodeObject:forKey:",_alternateImage,_6e);
objj_msgSend(_7e,"encodeObject:forKey:",_title,_6f);
objj_msgSend(_7e,"encodeObject:forKey:",_alternateTitle,_70);
objj_msgSend(_7e,"encodeInt:forKey:",_bezelStyle,_78);
}
})]);
