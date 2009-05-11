I;20;Foundation/CPArray.ji;11;CPControl.jc;19076;
CPSegmentSwitchTrackingSelectOne=0;
CPSegmentSwitchTrackingSelectAny=1;
CPSegmentSwitchTrackingMomentary=2;
var _1=objj_allocateClassPair(CPControl,"CPSegmentedControl"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_segments"),new objj_ivar("_controlStates"),new objj_ivar("_selectedSegment"),new objj_ivar("_segmentStyle"),new objj_ivar("_trackingMode"),new objj_ivar("_trackingSegment"),new objj_ivar("_trackingHighlighted")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_segments=[];
_controlStates=[];
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
var _c=_segments.length;
for(;_c<_a;++_c){
_segments[_c]=objj_msgSend(objj_msgSend(_CPSegmentItem,"alloc"),"init");
_segments[_c].frame.size.height=_b;
_controlStates[_c]=CPControlStateNormal;
}
}else{
if(_a<_segments.length){
var _c=_a;
for(;_c<_segments.length;++_c){
objj_msgSend(_segments[_c].imageView,"removeFromSuperview");
objj_msgSend(_segments[_c].labelView,"removeFromSuperview");
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
if(!_2a){
objj_msgSend(_2c.imageView,"removeFromSuperview");
_2c.imageView=nil;
}else{
if(!_2c.imageView){
_2c.imageView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_28,"addSubview:",_2c.imageView);
}
objj_msgSend(_2c.imageView,"setImage:",_2a);
objj_msgSend(_2c.imageView,"setFrameSize:",CGSizeMakeCopy(objj_msgSend(_2a,"size")));
}
_2c.image=_2a;
if(_2c.width){
objj_msgSend(_28,"drawSegment:highlight:",_2b,NO);
}else{
objj_msgSend(_28,"tileWithChangedSegment:",_2b);
}
}
}),new objj_method(sel_getUid("imageForSegment:"),function(_2d,_2e,_2f){
with(_2d){
return _segments[_2f].image;
}
}),new objj_method(sel_getUid("setLabel:forSegment:"),function(_30,_31,_32,_33){
with(_30){
var _34=_segments[_33];
if(!_32||!_32.length){
objj_msgSend(_34.labelView,"removeFromSuperview");
_34.labelView=nil;
}else{
if(!_34.labelView){
_34.labelView=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_34.labelView,"setFont:",objj_msgSend(_30,"font"));
objj_msgSend(_30,"addSubview:",_34.labelView);
}
objj_msgSend(_34.labelView,"setStringValue:",_32);
objj_msgSend(_34.labelView,"sizeToFit");
}
_segments[_33].label=_32;
if(_34.width){
objj_msgSend(_30,"drawSegment:highlight:",_33,NO);
}else{
objj_msgSend(_30,"tileWithChangedSegment:",_33);
}
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
_controlStates[_42]=_41?CPControlStateSelected:CPControlStateNormal;
if(_41){
var _44=_selectedSegment;
_selectedSegment=_42;
if(_trackingMode==CPSegmentSwitchTrackingSelectOne&&_44!=_42&&_44!=-1){
_segments[_44].selected=NO;
_controlStates[_44]=CPControlStateNormal;
objj_msgSend(_3f,"drawSegmentBezel:highlight:",_44,NO);
}
}
if(_trackingMode!=CPSegmentSwitchTrackingMomentary){
objj_msgSend(_3f,"drawSegmentBezel:highlight:",_42,NO);
}
objj_msgSend(_3f,"setNeedsLayout");
}
}),new objj_method(sel_getUid("isSelectedForSegment:"),function(_45,_46,_47){
with(_45){
return _segments[_47].selected;
}
}),new objj_method(sel_getUid("setEnabled:forSegment:"),function(_48,_49,_4a,_4b){
with(_48){
_segments[_4b].enabled=_4a;
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
_controlStates[_58]|=CPControlStateHighlighted;
}else{
_controlStates[_58]&=~CPControlStateHighlighted;
}
objj_msgSend(_56,"setNeedsLayout");
}
}),new objj_method(sel_getUid("_leftOffsetForSegment:"),function(_5a,_5b,_5c){
with(_5a){
var _5d=objj_msgSend(_5a,"currentValueForThemedAttributeName:","bezel-inset");
if(_5c==0){
return _5d.left;
}
var _5e=objj_msgSend(_5a,"currentValueForThemedAttributeName:","divider-thickness");
return objj_msgSend(_5a,"_leftOffsetForSegment:",_5c-1)+objj_msgSend(_5a,"widthForSegment:",_5c-1)+_5e;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_5f,_60,_61){
with(_5f){
var _62=objj_msgSend(_5f,"currentValueForThemedAttributeName:","default-height"),_63=objj_msgSend(_5f,"currentValueForThemedAttributeName:","content-inset"),_64=objj_msgSend(_5f,"currentValueForThemedAttributeName:","bezel-inset"),_65=objj_msgSend(_5f,"bounds");
if(_61==="left-segment-bezel"){
return CGRectMake(_64.left,_64.top,_63.left,_62);
}else{
if(_61==="right-segment-bezel"){
return CGRectMake(CGRectGetMaxX(_65)-_63.right,_64.top,_63.right,_62);
}else{
if(_61.substring(0,"segment-bezel".length)=="segment-bezel"){
var _66=parseInt(_61.substring("segment-bezel-".length),10),_67=objj_msgSend(_5f,"widthForSegment:",_66),_68=objj_msgSend(_5f,"_leftOffsetForSegment:",_66);
if(_segments.length==1){
return CGRectMake(_68+_63.left,_64.top,_67-_63.left-_63.right,_62);
}else{
if(_66==0){
return CGRectMake(_68+_63.left,_64.top,_67-_63.left,_62);
}else{
if(_66==_segments.length-1){
return CGRectMake(_68,_64.top,_67-_63.right,_62);
}else{
return CGRectMake(_68,_64.top,_67,_62);
}
}
}
}else{
if(_61.substring(0,"divider-bezel".length)=="divider-bezel"){
var _66=parseInt(_61.substring("divider-bezel-".length),10),_67=objj_msgSend(_5f,"widthForSegment:",_66),_68=objj_msgSend(_5f,"_leftOffsetForSegment:",_66),_69=objj_msgSend(_5f,"currentValueForThemedAttributeName:","divider-thickness");
return CGRectMake(_68+_67,_64.top,_69,_62);
}
}
}
}
return objj_msgSendSuper({receiver:_5f,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_61);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_6a,_6b,_6c){
with(_6a){
return objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_6d,_6e){
with(_6d){
var _6f=objj_msgSend(_6d,"valueForThemedAttributeName:inControlState:","left-segment-bezel-color",_controlStates[0]);
var _70=objj_msgSend(_6d,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","left-segment-bezel",CPWindowBelow,nil);
objj_msgSend(_70,"setBackgroundColor:",_6f);
var _71=objj_msgSend(_6d,"valueForThemedAttributeName:inControlState:","right-segment-bezel-color",_controlStates[_controlStates.length-1]);
var _72=objj_msgSend(_6d,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","right-segment-bezel",CPWindowBelow,nil);
objj_msgSend(_72,"setBackgroundColor:",_71);
for(var i=0,_74=_controlStates.length;i<_74;i++){
var _75=objj_msgSend(_6d,"valueForThemedAttributeName:inControlState:","center-segment-bezel-color",_controlStates[i]);
var _76=objj_msgSend(_6d,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","segment-bezel-"+i,CPWindowBelow,nil);
objj_msgSend(_76,"setBackgroundColor:",_75);
if(i==_74-1){
continue;
}
var _77=_controlStates[i]|_controlStates[i+1];
_77=(_77&CPControlStateSelected&~CPControlStateHighlighted)?CPControlStateSelected:CPControlStateNormal;
var _78=objj_msgSend(_6d,"valueForThemedAttributeName:inControlState:","divider-bezel-color",_77);
var _79=objj_msgSend(_6d,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","divider-bezel-"+i,CPWindowBelow,nil);
objj_msgSend(_79,"setBackgroundColor:",_78);
}
}
}),new objj_method(sel_getUid("drawSegment:highlight:"),function(_7a,_7b,_7c,_7d){
with(_7a){
var _7e=_segments[_7c],_7f=_7e.imageView,_80=_7e.labelView,_81=_7e.frame,_82=CGRectGetMinX(_81),_83=CGRectGetWidth(_81),_84=CGRectGetHeight(_81)-1;
if(_7f&&_80){
var _85=objj_msgSend(_7f,"frame").size,_86=objj_msgSend(_80,"frame").size,_87=_85.height+_86.height,_88=MIN(_86.width,width),y=(_84-_87)/2;
objj_msgSend(_7f,"setFrameOrigin:",CGPointMake(_82+(_83-_85.width)/2,y));
if(_88<_86.width){
objj_msgSend(_80,"setFrameSize:",CGSizeMake(_88,_86.height));
}
objj_msgSend(_80,"setFrameOrigin:",CGPointMake(_82+(_83-_88)/2,y+_85.height));
}else{
if(_7f){
var _85=objj_msgSend(_7f,"frame").size;
objj_msgSend(_7f,"setFrameOrigin:",CGPointMake(_82+(_83-_85.width)/2,(_84-_85.height)/2));
}else{
if(_80){
var _86=objj_msgSend(_80,"frame").size,_88=MIN(_86.width,_83);
if(_88<_86.width){
objj_msgSend(_80,"setFrameSize:",CGSizeMake(_88,_86.height));
}
objj_msgSend(_80,"setFrameOrigin:",CGPointMake(_82+(_83-_88)/2,(_84-_86.height)/2));
}
}
}
}
}),new objj_method(sel_getUid("tileWithChangedSegment:"),function(_8a,_8b,_8c){
with(_8a){
var _8d=_segments[_8c],_8e=_8d.width;
if(!_8e){
if(_8d.labelView&&_8d.imageView){
_8e=MAX(CGRectGetWidth(objj_msgSend(_8d.labelView,"frame")),CGRectGetWidth(objj_msgSend(_8d.imageView,"frame")));
}else{
if(_8d.labelView){
_8e=CGRectGetWidth(objj_msgSend(_8d.labelView,"frame"));
}else{
if(_8d.imageView){
_8e=CGRectGetWidth(objj_msgSend(_8d.imageView,"frame"));
}
}
}
}
var _8f=_8e-CGRectGetWidth(_8d.frame);
if(!_8f){
return;
}
var _90=objj_msgSend(_8a,"frame");
objj_msgSend(_8a,"setFrameSize:",CGSizeMake(CGRectGetWidth(_90)+_8f,CGRectGetHeight(_90)));
_8d.frame.size.width=_8e;
var _91=_8c+1;
for(;_91<_segments.length;++_91){
_segments[_91].frame.origin.x+=_8f;
objj_msgSend(_8a,"drawSegmentBezel:highlight:",_91,NO);
objj_msgSend(_8a,"drawSegment:highlight:",_91,NO);
}
objj_msgSend(_8a,"drawSegmentBezel:highlight:",_8c,NO);
objj_msgSend(_8a,"drawSegment:highlight:",_8c,NO);
}
}),new objj_method(sel_getUid("frameForSegment:"),function(_92,_93,_94){
with(_92){
return _segments[_94].frame;
}
}),new objj_method(sel_getUid("testSegment:"),function(_95,_96,_97){
with(_95){
var _98=objj_msgSend(_95,"convertPoint:fromView:",_97,nil),_99=_segments.length;
while(_99--){
if(CGRectContainsPoint(_segments[_99].frame,_97)){
return _99;
}
}
return -1;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_9a,_9b,_9c){
with(_9a){
if(!objj_msgSend(_9a,"isEnabled")){
return;
}
objj_msgSend(_9a,"trackSegment:",_9c);
}
}),new objj_method(sel_getUid("mouseUp:"),function(_9d,_9e,_9f){
with(_9d){
}
}),new objj_method(sel_getUid("trackSegment:"),function(_a0,_a1,_a2){
with(_a0){
var _a3=objj_msgSend(_a2,"type"),_a4=objj_msgSend(_a0,"convertPoint:fromView:",objj_msgSend(_a2,"locationInWindow"),nil);
if(_a3==CPLeftMouseUp){
if(CGRectContainsPoint(_segments[_trackingSegment].frame,_a4)){
if(_trackingMode==CPSegmentSwitchTrackingSelectAny){
objj_msgSend(_a0,"setSelected:forSegment:",!objj_msgSend(_a0,"isSelectedForSegment:",_trackingSegment),_trackingSegment);
_selectedSegment=_trackingSegment;
}else{
objj_msgSend(_a0,"setSelected:forSegment:",YES,_trackingSegment);
}
objj_msgSend(_a0,"sendAction:to:",objj_msgSend(_a0,"action"),objj_msgSend(_a0,"target"));
if(_trackingMode==CPSegmentSwitchTrackingMomentary){
objj_msgSend(_a0,"setSelected:forSegment:",NO,_trackingSegment);
_selectedSegment=-1;
}
}
objj_msgSend(_a0,"drawSegmentBezel:highlight:",_trackingSegment,NO);
_trackingSegment=-1;
return;
}
if(_a3==CPLeftMouseDown){
_trackingHighlighted=YES;
_trackingSegment=objj_msgSend(_a0,"testSegment:",_a4);
objj_msgSend(_a0,"drawSegmentBezel:highlight:",_trackingSegment,YES);
}else{
if(_a3==CPLeftMouseDragged){
var _a5=CGRectContainsPoint(_segments[_trackingSegment].frame,_a4);
if(_a5!=_trackingHighlighted){
_trackingHighlighted=_a5;
objj_msgSend(_a0,"drawSegmentBezel:highlight:",_trackingSegment,_trackingHighlighted);
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_a0,sel_getUid("trackSegment:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("setFont:"),function(_a6,_a7,_a8){
with(_a6){
objj_msgSendSuper({receiver:_a6,super_class:objj_getClass("CPControl")},"setFont:",_a8);
var _a9=_segments.length;
if(!_a9){
return;
}
while(_a9--){
objj_msgSend(_segments[_a9].labelView,"setFont:",_a8);
}
objj_msgSend(_a6,"tileWithChangedSegment:",0);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("themedAttributes"),function(_aa,_ab){
with(_aa){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[{top:(0),left:(0),bottom:(0),right:(0)},{top:(0),left:(0),bottom:(0),right:(0)},nil,nil,nil,nil,1,24],["bezel-inset","content-inset","left-segment-bezel-color","right-segment-bezel-color","center-segment-bezel-color","divider-bezel-color","divider-thickness","default-height"]);
}
})]);
var _ac="CPSegmentedControlSegmentsKey",_ad="CPSegmentedControlSelectedKey",_ae="CPSegmentedControlSegmentStyleKey",_af="CPSegmentedControlTrackingModeKey";
var _1=objj_getClass("CPSegmentedControl");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPSegmentedControl\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_b0,_b1,_b2){
with(_b0){
_b0=objj_msgSendSuper({receiver:_b0,super_class:objj_getClass("CPControl")},"initWithCoder:",_b2);
if(_b0){
_segments=objj_msgSend(_b2,"decodeObjectForKey:",_ac);
_segmentStyle=objj_msgSend(_b2,"decodeIntForKey:",_ae);
_controlStates=[];
for(var i=0;i<_segments.length;i++){
_controlStates[i]=0;
}
if(objj_msgSend(_b2,"containsValueForKey:",_ad)){
_selectedSegment=objj_msgSend(_b2,"decodeIntForKey:",_ad);
}else{
_selectedSegment=-1;
}
if(objj_msgSend(_b2,"containsValueForKey:",_af)){
_trackingMode=objj_msgSend(_b2,"decodeIntForKey:",_af);
}else{
_trackingMode=CPSegmentSwitchTrackingSelectOne;
}
for(var i=0;i<_segments.length;i++){
if(_segments[i].image!=undefined){
objj_msgSend(_b0,"setImage:forSegment:",_segments[i].image,i);
}
if(_segments[i].label!=undefined){
objj_msgSend(_b0,"setLabel:forSegment:",_segments[i].label,i);
}
}
}
return _b0;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_b4,_b5,_b6){
with(_b4){
var _b7=_subviews;
_subviews=[];
objj_msgSendSuper({receiver:_b4,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_b6);
_subviews=_b7;
objj_msgSend(_b6,"encodeObject:forKey:",_segments,_ac);
objj_msgSend(_b6,"encodeInt:forKey:",_selectedSegment,_ad);
objj_msgSend(_b6,"encodeInt:forKey:",_segmentStyle,_ae);
objj_msgSend(_b6,"encodeInt:forKey:",_trackingMode,_af);
}
})]);
var _1=objj_allocateClassPair(CPObject,"_CPSegmentItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("image"),new objj_ivar("label"),new objj_ivar("menu"),new objj_ivar("selected"),new objj_ivar("enabled"),new objj_ivar("tag"),new objj_ivar("width"),new objj_ivar("labelView"),new objj_ivar("imageView"),new objj_ivar("frame")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_b8,_b9){
with(_b8){
if(_b8=objj_msgSendSuper({receiver:_b8,super_class:objj_getClass("CPObject")},"init")){
image=nil;
label="";
menu=nil;
selected=NO;
enabled=NO;
tag=0;
labelView=nil;
imageView=nil;
width=0;
frame=CGRectMakeZero();
}
return _b8;
}
})]);
var _ba="CPSegmentItemImageKey",_bb="CPSegmentItemLabelKey",_bc="CPSegmentItemMenuKey",_bd="CPSegmentItemSelectedKey",_be="CPSegmentItemEnabledKey",_bf="CPSegmentItemTagKey";
var _1=objj_getClass("_CPSegmentItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPSegmentItem\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_c0,_c1,_c2){
with(_c0){
_c0=objj_msgSendSuper({receiver:_c0,super_class:objj_getClass("CPObject")},"init");
if(_c0){
image=objj_msgSend(_c2,"decodeObjectForKey:",_ba);
label=objj_msgSend(_c2,"decodeObjectForKey:",_bb);
menu=objj_msgSend(_c2,"decodeObjectForKey:",_bc);
selected=objj_msgSend(_c2,"decodeBoolForKey:",_bd);
enabled=objj_msgSend(_c2,"decodeBoolForKey:",_be);
tag=objj_msgSend(_c2,"decodeIntForKey:",_bf);
labelView=nil;
imageView=nil;
width=0;
frame=CGRectMakeZero();
}
return _c0;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_c3,_c4,_c5){
with(_c3){
objj_msgSend(_c5,"encodeObject:forKey:",image,_ba);
objj_msgSend(_c5,"encodeObject:forKey:",label,_bb);
objj_msgSend(_c5,"encodeObject:forKey:",menu,_bc);
objj_msgSend(_c5,"encodeBool:forKey:",selected,_bd);
objj_msgSend(_c5,"encodeBool:forKey:",enabled,_be);
objj_msgSend(_c5,"encodeInt:forKey:",tag,_bf);
}
})]);
