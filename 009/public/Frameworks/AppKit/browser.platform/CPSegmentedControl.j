I;20;Foundation/CPArray.ji;11;CPControl.jc;20227;
CPSegmentSwitchTrackingSelectOne=0;
CPSegmentSwitchTrackingSelectAny=1;
CPSegmentSwitchTrackingMomentary=2;
var _1=objj_allocateClassPair(CPControl,"CPSegmentedControl"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_segments"),new objj_ivar("_themeStates"),new objj_ivar("_selectedSegment"),new objj_ivar("_segmentStyle"),new objj_ivar("_trackingMode"),new objj_ivar("_trackingSegment"),new objj_ivar("_trackingHighlighted")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_segments=[];
_themeStates=[];
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPControl")},"initWithFrame:",_5);
if(_3){
_selectedSegment=-1;
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
if(_segments.length==_a){
return;
}
var _b=CGRectGetHeight(objj_msgSend(_8,"bounds"));
if(_segments.length<_a){
for(var _c=_segments.length;_c<_a;++_c){
_segments[_c]=objj_msgSend(objj_msgSend(_CPSegmentItem,"alloc"),"init");
_themeStates[_c]=CPThemeStateNormal;
}
}else{
if(_a<_segments.length){
for(var _c=_a;_c<_segments.length;++_c){
_segments[_c]=nil;
}
}
}
if(_selectedSegment<_segments.length){
_selectedSegment=-1;
}
objj_msgSend(_8,"tileWithChangedSegment:",0);
}
}),new objj_method(sel_getUid("segmentCount"),function(_d,_e){
with(_d){
return _segments.length;
}
}),new objj_method(sel_getUid("setSelectedSegment:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_f,"setSelected:forSegment:",YES,_11);
}
}),new objj_method(sel_getUid("selectedSegment"),function(_12,_13){
with(_12){
return _selectedSegment;
}
}),new objj_method(sel_getUid("selectSegmentWithTag:"),function(_14,_15,_16){
with(_14){
var _17=0;
for(;_17<_segments.length;++_17){
if(_segments[_17].tag==_16){
objj_msgSend(_14,"setSelectedSegment:",_17);
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("isTracking"),function(_18,_19){
with(_18){
}
}),new objj_method(sel_getUid("setTrackingMode:"),function(_1a,_1b,_1c){
with(_1a){
if(_trackingMode==_1c){
return;
}
_trackingMode=_1c;
if(_trackingMode==CPSegmentSwitchTrackingSelectOne){
var _1d=0,_1e=NO;
for(;_1d<_segments.length;++_1d){
if(_segments[_1d].selected){
if(_1e){
objj_msgSend(_1a,"setSelected:forSegment:",NO,_1d);
}else{
_1e=YES;
}
}
}
}else{
if(_trackingMode==CPSegmentSwitchTrackingMomentary){
var _1d=0;
for(;_1d<_segments.length;++_1d){
if(_segments[_1d].selected){
objj_msgSend(_1a,"setSelected:forSegment:",NO,_1d);
}
}
}
}
}
}),new objj_method(sel_getUid("trackingMode"),function(_1f,_20){
with(_1f){
return _trackingMode;
}
}),new objj_method(sel_getUid("setWidth:forSegment:"),function(_21,_22,_23,_24){
with(_21){
_segments[_24].width=_23;
objj_msgSend(_21,"tileWithChangedSegment:",_24);
}
}),new objj_method(sel_getUid("widthForSegment:"),function(_25,_26,_27){
with(_25){
return _segments[_27].width;
}
}),new objj_method(sel_getUid("setImage:forSegment:"),function(_28,_29,_2a,_2b){
with(_28){
var _2c=_segments[_2b];
_2c.image=_2a;
objj_msgSend(_28,"tileWithChangedSegment:",_2b);
}
}),new objj_method(sel_getUid("imageForSegment:"),function(_2d,_2e,_2f){
with(_2d){
return _segments[_2f].image;
}
}),new objj_method(sel_getUid("setLabel:forSegment:"),function(_30,_31,_32,_33){
with(_30){
var _34=_segments[_33];
_segments[_33].label=_32;
objj_msgSend(_30,"tileWithChangedSegment:",_33);
}
}),new objj_method(sel_getUid("labelForSegment:"),function(_35,_36,_37){
with(_35){
return _segments[_37].label;
}
}),new objj_method(sel_getUid("setMenu:forSegment:"),function(_38,_39,_3a,_3b){
with(_38){
_segments[_3b].menu=_3a;
}
}),new objj_method(sel_getUid("menuForSegment:"),function(_3c,_3d,_3e){
with(_3c){
return _segments[_3e].menu;
}
}),new objj_method(sel_getUid("setSelected:forSegment:"),function(_3f,_40,_41,_42){
with(_3f){
var _43=_segments[_42];
if(_43.selected==_41){
return;
}
_43.selected=_41;
_themeStates[_42]=_41?CPThemeStateSelected:CPThemeStateNormal;
if(_41){
var _44=_selectedSegment;
_selectedSegment=_42;
if(_trackingMode==CPSegmentSwitchTrackingSelectOne&&_44!=_42&&_44!=-1){
_segments[_44].selected=NO;
_themeStates[_44]=CPThemeStateNormal;
objj_msgSend(_3f,"drawSegmentBezel:highlight:",_44,NO);
}
}
if(_trackingMode!=CPSegmentSwitchTrackingMomentary){
objj_msgSend(_3f,"drawSegmentBezel:highlight:",_42,NO);
}
objj_msgSend(_3f,"setNeedsLayout");
objj_msgSend(_3f,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("isSelectedForSegment:"),function(_45,_46,_47){
with(_45){
return _segments[_47].selected;
}
}),new objj_method(sel_getUid("setEnabled:forSegment:"),function(_48,_49,_4a,_4b){
with(_48){
_segments[_4b].enabled=_4a;
objj_msgSend(_48,"setNeedsLayout");
objj_msgSend(_48,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("isEnabledForSegment:"),function(_4c,_4d,_4e){
with(_4c){
return _segments[_4e].enabled;
}
}),new objj_method(sel_getUid("setTag:forSegment:"),function(_4f,_50,_51,_52){
with(_4f){
_segments[_52].tag=_51;
}
}),new objj_method(sel_getUid("tagForSegment:"),function(_53,_54,_55){
with(_53){
return _segments[_55].tag;
}
}),new objj_method(sel_getUid("drawSegmentBezel:highlight:"),function(_56,_57,_58,_59){
with(_56){
if(_59){
_themeStates[_58]|=CPThemeStateHighlighted;
}else{
_themeStates[_58]&=~CPThemeStateHighlighted;
}
objj_msgSend(_56,"setNeedsLayout");
objj_msgSend(_56,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("_leftOffsetForSegment:"),function(_5a,_5b,_5c){
with(_5a){
var _5d=objj_msgSend(_5a,"currentValueForThemeAttribute:","bezel-inset");
if(_5c==0){
return _5d.left;
}
var _5e=objj_msgSend(_5a,"currentValueForThemeAttribute:","divider-thickness");
return objj_msgSend(_5a,"_leftOffsetForSegment:",_5c-1)+objj_msgSend(_5a,"widthForSegment:",_5c-1)+_5e;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_5f,_60,_61){
with(_5f){
var _62=objj_msgSend(_5f,"currentValueForThemeAttribute:","default-height"),_63=objj_msgSend(_5f,"currentValueForThemeAttribute:","content-inset"),_64=objj_msgSend(_5f,"currentValueForThemeAttribute:","bezel-inset"),_65=objj_msgSend(_5f,"bounds");
if(_61==="left-segment-bezel"){
return CGRectMake(_64.left,_64.top,_63.left,_62);
}else{
if(_61==="right-segment-bezel"){
return CGRectMake(CGRectGetMaxX(_65)-_63.right-_64.right,_64.top,_63.right,_62);
}else{
if(_61.substring(0,"segment-bezel".length)=="segment-bezel"){
var _66=parseInt(_61.substring("segment-bezel-".length),10),_67=CGRectCreateCopy(_segments[_66].frame);
if(_66==0){
_67.origin.x+=_63.left;
_67.size.width-=_63.left;
}
if(_66==_segments.length-1){
_67.size.width-=_63.right;
}
return _67;
}else{
if(_61.substring(0,"divider-bezel".length)=="divider-bezel"){
var _66=parseInt(_61.substring("divider-bezel-".length),10),_68=objj_msgSend(_5f,"widthForSegment:",_66),_69=objj_msgSend(_5f,"_leftOffsetForSegment:",_66),_6a=objj_msgSend(_5f,"currentValueForThemeAttribute:","divider-thickness");
return CGRectMake(_69+_68,_64.top,_6a,_62);
}else{
if(_61.substring(0,"segment-content".length)=="segment-content"){
var _66=parseInt(_61.substring("segment-content-".length),10);
return objj_msgSend(_5f,"contentFrameForSegment:",_66);
}
}
}
}
}
return objj_msgSendSuper({receiver:_5f,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_61);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_6b,_6c,_6d){
with(_6b){
if(_6d.substring(0,"segment-content".length)=="segment-content"){
return objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
}
return objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_6e,_6f){
with(_6e){
var _70=objj_msgSend(_6e,"valueForThemeAttribute:inState:","left-segment-bezel-color",_themeStates[0]);
var _71=objj_msgSend(_6e,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","left-segment-bezel",CPWindowBelow,nil);
objj_msgSend(_71,"setBackgroundColor:",_70);
var _72=objj_msgSend(_6e,"valueForThemeAttribute:inState:","right-segment-bezel-color",_themeStates[_themeStates.length-1]);
var _73=objj_msgSend(_6e,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","right-segment-bezel",CPWindowBelow,nil);
objj_msgSend(_73,"setBackgroundColor:",_72);
for(var i=0,_75=_themeStates.length;i<_75;i++){
var _76=_themeStates[i];
_76|=_themeState&CPThemeStateDisabled;
var _77=objj_msgSend(_6e,"valueForThemeAttribute:inState:","center-segment-bezel-color",_76);
var _78=objj_msgSend(_6e,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","segment-bezel-"+i,CPWindowBelow,nil);
objj_msgSend(_78,"setBackgroundColor:",_77);
var _79=_segments[i];
var _7a=objj_msgSend(_6e,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","segment-content-"+i,CPWindowAbove,"segment-bezel-"+i);
objj_msgSend(_7a,"setText:",_79.label);
objj_msgSend(_7a,"setImage:",_79.image);
objj_msgSend(_7a,"setFont:",objj_msgSend(_6e,"valueForThemeAttribute:inState:","font",_76));
objj_msgSend(_7a,"setTextColor:",objj_msgSend(_6e,"valueForThemeAttribute:inState:","text-color",_76));
objj_msgSend(_7a,"setAlignment:",objj_msgSend(_6e,"valueForThemeAttribute:inState:","alignment",_76));
objj_msgSend(_7a,"setVerticalAlignment:",objj_msgSend(_6e,"valueForThemeAttribute:inState:","vertical-alignment",_76));
objj_msgSend(_7a,"setLineBreakMode:",objj_msgSend(_6e,"valueForThemeAttribute:inState:","line-break-mode",_76));
objj_msgSend(_7a,"setTextShadowColor:",objj_msgSend(_6e,"valueForThemeAttribute:inState:","text-shadow-color",_76));
objj_msgSend(_7a,"setTextShadowOffset:",objj_msgSend(_6e,"valueForThemeAttribute:inState:","text-shadow-offset",_76));
objj_msgSend(_7a,"setImageScaling:",objj_msgSend(_6e,"valueForThemeAttribute:inState:","image-scaling",_76));
if(_79.image&&_79.label){
objj_msgSend(_7a,"setImagePosition:",objj_msgSend(_6e,"valueForThemeAttribute:inState:","image-position",_76));
}else{
if(_79.image){
objj_msgSend(_7a,"setImagePosition:",CPImageOnly);
}
}
if(i==_75-1){
continue;
}
var _7b=_themeStates[i]|_themeStates[i+1];
_7b=(_7b&CPThemeStateSelected&~CPThemeStateHighlighted)?CPThemeStateSelected:CPThemeStateNormal;
_7b|=_themeState&CPThemeStateDisabled;
var _7c=objj_msgSend(_6e,"valueForThemeAttribute:inState:","divider-bezel-color",_7b);
var _7d=objj_msgSend(_6e,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","divider-bezel-"+i,CPWindowBelow,nil);
objj_msgSend(_7d,"setBackgroundColor:",_7c);
}
}
}),new objj_method(sel_getUid("drawSegment:highlight:"),function(_7e,_7f,_80,_81){
with(_7e){
}
}),new objj_method(sel_getUid("tileWithChangedSegment:"),function(_82,_83,_84){
with(_82){
if(_84>=_segments.length){
return;
}
var _85=_segments[_84],_86=_85.width,_87=_themeStates[_84]|(_themeState&CPThemeStateDisabled),_88=objj_msgSend(_82,"valueForThemeAttribute:inState:","content-inset",_87),_89=objj_msgSend(_82,"valueForThemeAttribute:inState:","font",_87);
if(!_86){
if(_85.image&&_85.label){
_86=objj_msgSend(_85.label,"sizeWithFont:",_89).width+objj_msgSend(_85.image,"size").width+_88.left+_88.right;
}else{
if(_85.image){
_86=objj_msgSend(_85.image,"size").width+_88.left+_88.right;
}else{
if(_85.label){
_86=objj_msgSend(_85.label,"sizeWithFont:",_89).width+_88.left+_88.right;
}else{
_86=0;
}
}
}
}
var _8a=_86-CGRectGetWidth(_85.frame);
if(!_8a){
return;
}
var _8b=objj_msgSend(_82,"frame");
objj_msgSend(_82,"setFrameSize:",CGSizeMake(CGRectGetWidth(_8b)+_8a,CGRectGetHeight(_8b)));
_85.width=_86;
_85.frame=objj_msgSend(_82,"frameForSegment:",_84);
var _8c=_84+1;
for(;_8c<_segments.length;++_8c){
_segments[_8c].frame.origin.x+=_8a;
objj_msgSend(_82,"drawSegmentBezel:highlight:",_8c,NO);
objj_msgSend(_82,"drawSegment:highlight:",_8c,NO);
}
objj_msgSend(_82,"drawSegmentBezel:highlight:",_84,NO);
objj_msgSend(_82,"drawSegment:highlight:",_84,NO);
objj_msgSend(_82,"setNeedsLayout");
objj_msgSend(_82,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("frameForSegment:"),function(_8d,_8e,_8f){
with(_8d){
return objj_msgSend(_8d,"bezelFrameForSegment:",_8f);
}
}),new objj_method(sel_getUid("bezelFrameForSegment:"),function(_90,_91,_92){
with(_90){
var _93=objj_msgSend(_90,"currentValueForThemeAttribute:","default-height"),_94=objj_msgSend(_90,"currentValueForThemeAttribute:","bezel-inset"),_95=objj_msgSend(_90,"widthForSegment:",_92),_96=objj_msgSend(_90,"_leftOffsetForSegment:",_92);
return CGRectMake(_96,_94.top,_95,_93);
}
}),new objj_method(sel_getUid("contentFrameForSegment:"),function(_97,_98,_99){
with(_97){
var _9a=objj_msgSend(_97,"currentValueForThemeAttribute:","default-height"),_9b=objj_msgSend(_97,"currentValueForThemeAttribute:","content-inset"),_9c=objj_msgSend(_97,"widthForSegment:",_99),_9d=objj_msgSend(_97,"_leftOffsetForSegment:",_99);
return CGRectMake(_9d+_9b.left,_9b.top,_9c-_9b.left-_9b.right,_9a-_9b.top-_9b.bottom);
}
}),new objj_method(sel_getUid("testSegment:"),function(_9e,_9f,_a0){
with(_9e){
var _a1=objj_msgSend(_9e,"convertPoint:fromView:",_a0,nil),_a2=_segments.length;
while(_a2--){
if(CGRectContainsPoint(_segments[_a2].frame,_a0)){
return _a2;
}
}
return -1;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_a3,_a4,_a5){
with(_a3){
if(!objj_msgSend(_a3,"isEnabled")){
return;
}
objj_msgSend(_a3,"trackSegment:",_a5);
}
}),new objj_method(sel_getUid("mouseUp:"),function(_a6,_a7,_a8){
with(_a6){
}
}),new objj_method(sel_getUid("trackSegment:"),function(_a9,_aa,_ab){
with(_a9){
var _ac=objj_msgSend(_ab,"type"),_ad=objj_msgSend(_a9,"convertPoint:fromView:",objj_msgSend(_ab,"locationInWindow"),nil);
if(_ac==CPLeftMouseUp){
if(_trackingSegment==-1){
return;
}
if(CGRectContainsPoint(_segments[_trackingSegment].frame,_ad)){
if(_trackingMode==CPSegmentSwitchTrackingSelectAny){
objj_msgSend(_a9,"setSelected:forSegment:",!objj_msgSend(_a9,"isSelectedForSegment:",_trackingSegment),_trackingSegment);
_selectedSegment=_trackingSegment;
}else{
objj_msgSend(_a9,"setSelected:forSegment:",YES,_trackingSegment);
}
objj_msgSend(_a9,"sendAction:to:",objj_msgSend(_a9,"action"),objj_msgSend(_a9,"target"));
if(_trackingMode==CPSegmentSwitchTrackingMomentary){
objj_msgSend(_a9,"setSelected:forSegment:",NO,_trackingSegment);
_selectedSegment=-1;
}
}
objj_msgSend(_a9,"drawSegmentBezel:highlight:",_trackingSegment,NO);
_trackingSegment=-1;
return;
}
if(_ac==CPLeftMouseDown){
_trackingHighlighted=YES;
_trackingSegment=objj_msgSend(_a9,"testSegment:",_ad);
objj_msgSend(_a9,"drawSegmentBezel:highlight:",_trackingSegment,YES);
}else{
if(_ac==CPLeftMouseDragged){
if(_trackingSegment==-1){
return;
}
var _ae=CGRectContainsPoint(_segments[_trackingSegment].frame,_ad);
if(_ae!=_trackingHighlighted){
_trackingHighlighted=_ae;
objj_msgSend(_a9,"drawSegmentBezel:highlight:",_trackingSegment,_trackingHighlighted);
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_a9,sel_getUid("trackSegment:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("setFont:"),function(_af,_b0,_b1){
with(_af){
objj_msgSendSuper({receiver:_af,super_class:objj_getClass("CPControl")},"setFont:",_b1);
objj_msgSend(_af,"tileWithChangedSegment:",0);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("themeClass"),function(_b2,_b3){
with(_b2){
return "segmented-control";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_b4,_b5){
with(_b4){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[CPCenterTextAlignment,CPCenterVerticalTextAlignment,CPImageLeft,CPScaleNone,{top:(0),right:(0),bottom:(0),left:(0)},{top:(0),right:(0),bottom:(0),left:(0)},nil,nil,nil,nil,1,24],["alignment","vertical-alignment","image-position","image-scaling","bezel-inset","content-inset","left-segment-bezel-color","right-segment-bezel-color","center-segment-bezel-color","divider-bezel-color","divider-thickness","default-height"]);
}
})]);
var _b6="CPSegmentedControlSegmentsKey",_b7="CPSegmentedControlSelectedKey",_b8="CPSegmentedControlSegmentStyleKey",_b9="CPSegmentedControlTrackingModeKey";
var _1=objj_getClass("CPSegmentedControl");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSegmentedControl\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_ba,_bb,_bc){
with(_ba){
_ba=objj_msgSendSuper({receiver:_ba,super_class:objj_getClass("CPControl")},"initWithCoder:",_bc);
if(_ba){
var _bd=objj_msgSend(_ba,"frame"),_be=_bd.size.width;
_bd.size.width=0;
objj_msgSend(_ba,"setFrame:",_bd);
_segments=objj_msgSend(_bc,"decodeObjectForKey:",_b6);
_segmentStyle=objj_msgSend(_bc,"decodeIntForKey:",_b8);
_themeStates=[];
if(objj_msgSend(_bc,"containsValueForKey:",_b7)){
_selectedSegment=objj_msgSend(_bc,"decodeIntForKey:",_b7);
}else{
_selectedSegment=-1;
}
if(objj_msgSend(_bc,"containsValueForKey:",_b9)){
_trackingMode=objj_msgSend(_bc,"decodeIntForKey:",_b9);
}else{
_trackingMode=CPSegmentSwitchTrackingSelectOne;
}
for(var i=0;i<_segments.length;i++){
_themeStates[i]=_segments[i].selected?CPThemeStateSelected:CPThemeStateNormal;
objj_msgSend(_ba,"tileWithChangedSegment:",i);
}
var _c0=MAX(_be-objj_msgSend(_ba,"frame").size.width,0),_c1=FLOOR(_c0/_segments.length);
for(var i=0;i<_segments.length;i++){
objj_msgSend(_ba,"setWidth:forSegment:",_segments[i].width+_c1,i);
}
objj_msgSend(_ba,"tileWithChangedSegment:",0);
}
return _ba;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_c2,_c3,_c4){
with(_c2){
objj_msgSendSuper({receiver:_c2,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_c4);
objj_msgSend(_c4,"encodeObject:forKey:",_segments,_b6);
objj_msgSend(_c4,"encodeInt:forKey:",_selectedSegment,_b7);
objj_msgSend(_c4,"encodeInt:forKey:",_segmentStyle,_b8);
objj_msgSend(_c4,"encodeInt:forKey:",_trackingMode,_b9);
}
})]);
var _1=objj_allocateClassPair(CPObject,"_CPSegmentItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("image"),new objj_ivar("label"),new objj_ivar("menu"),new objj_ivar("selected"),new objj_ivar("enabled"),new objj_ivar("tag"),new objj_ivar("width"),new objj_ivar("frame")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_c5,_c6){
with(_c5){
if(_c5=objj_msgSendSuper({receiver:_c5,super_class:objj_getClass("CPObject")},"init")){
image=nil;
label="";
menu=nil;
selected=NO;
enabled=NO;
tag=0;
width=0;
frame=CGRectMakeZero();
}
return _c5;
}
})]);
var _c7="CPSegmentItemImageKey",_c8="CPSegmentItemLabelKey",_c9="CPSegmentItemMenuKey",_ca="CPSegmentItemSelectedKey",_cb="CPSegmentItemEnabledKey",_cc="CPSegmentItemTagKey",_cd="CPSegmentItemWidthKey";
var _1=objj_getClass("_CPSegmentItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPSegmentItem\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_ce,_cf,_d0){
with(_ce){
_ce=objj_msgSendSuper({receiver:_ce,super_class:objj_getClass("CPObject")},"init");
if(_ce){
image=objj_msgSend(_d0,"decodeObjectForKey:",_c7);
label=objj_msgSend(_d0,"decodeObjectForKey:",_c8);
menu=objj_msgSend(_d0,"decodeObjectForKey:",_c9);
selected=objj_msgSend(_d0,"decodeBoolForKey:",_ca);
enabled=objj_msgSend(_d0,"decodeBoolForKey:",_cb);
tag=objj_msgSend(_d0,"decodeIntForKey:",_cc);
width=objj_msgSend(_d0,"decodeFloatForKey:",_cd);
frame=CGRectMakeZero();
}
return _ce;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_d1,_d2,_d3){
with(_d1){
objj_msgSend(_d3,"encodeObject:forKey:",image,_c7);
objj_msgSend(_d3,"encodeObject:forKey:",label,_c8);
objj_msgSend(_d3,"encodeObject:forKey:",menu,_c9);
objj_msgSend(_d3,"encodeBool:forKey:",selected,_ca);
objj_msgSend(_d3,"encodeBool:forKey:",enabled,_cb);
objj_msgSend(_d3,"encodeInt:forKey:",tag,_cc);
objj_msgSend(_d3,"encodeFloat:forKey:",width,_cd);
}
})]);
