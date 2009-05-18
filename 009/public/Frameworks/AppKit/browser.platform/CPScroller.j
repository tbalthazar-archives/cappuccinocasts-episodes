i;11;CPControl.jc;15123;
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
var _1=[CPScrollerKnobSlot,CPScrollerDecrementLine,CPScrollerIncrementLine,CPScrollerKnob],_2={},_3={};
_2[CPScrollerDecrementLine]="decrement-line";
_2[CPScrollerIncrementLine]="increment-line";
_2[CPScrollerKnobSlot]="knob-slot";
_2[CPScrollerKnob]="knob";
var _4=objj_allocateClassPair(CPControl,"CPScroller"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_controlSize"),new objj_ivar("_usableParts"),new objj_ivar("_partRects"),new objj_ivar("_isVertical"),new objj_ivar("_knobProportion"),new objj_ivar("_hitPart"),new objj_ivar("_trackingPart"),new objj_ivar("_trackingFloatValue"),new objj_ivar("_trackingStartPoint")]);
objj_registerClassPair(_4);
objj_addClassForBundle(_4,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4,[new objj_method(sel_getUid("isVertical"),function(_6,_7){
with(_6){
return _isVertical;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPControl")},"initWithFrame:",_a);
if(_8){
_controlSize=CPRegularControlSize;
_partRects=[];
objj_msgSend(_8,"setFloatValue:knobProportion:",0,1);
_hitPart=CPScrollerNoPart;
objj_msgSend(_8,"_recalculateIsVertical");
}
return _8;
}
}),new objj_method(sel_getUid("setControlSize:"),function(_b,_c,_d){
with(_b){
if(_controlSize==_d){
return;
}
_controlSize=_d;
objj_msgSend(_b,"setNeedsLayout");
objj_msgSend(_b,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("controlSize"),function(_e,_f){
with(_e){
return _controlSize;
}
}),new objj_method(sel_getUid("setFloatValue:"),function(_10,_11,_12){
with(_10){
objj_msgSendSuper({receiver:_10,super_class:objj_getClass("CPControl")},"setFloatValue:",MIN(1,MAX(0,_12)));
objj_msgSend(_10,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setFloatValue:knobProportion:"),function(_13,_14,_15,_16){
with(_13){
_knobProportion=MIN(1,MAX(0.0001,_16));
objj_msgSend(_13,"setFloatValue:",_15);
}
}),new objj_method(sel_getUid("knobProportion"),function(_17,_18){
with(_17){
return _knobProportion;
}
}),new objj_method(sel_getUid("currentValueForThemeAttribute:"),function(_19,_1a,_1b){
with(_19){
var _1c=_themeState;
if(_2[_hitPart]+"-color"!==_1b){
_1c&=~CPThemeStateHighlighted;
}
return objj_msgSend(_19,"valueForThemeAttribute:inState:",_1b,_1c);
}
}),new objj_method(sel_getUid("rectForPart:"),function(_1d,_1e,_1f){
with(_1d){
if(_1f==CPScrollerNoPart){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
return _partRects[_1f];
}
}),new objj_method(sel_getUid("testPart:"),function(_20,_21,_22){
with(_20){
_22=objj_msgSend(_20,"convertPoint:fromView:",_22,nil);
if(CGRectContainsPoint(objj_msgSend(_20,"rectForPart:",CPScrollerKnob),_22)){
return CPScrollerKnob;
}
if(CGRectContainsPoint(objj_msgSend(_20,"rectForPart:",CPScrollerDecrementPage),_22)){
return CPScrollerDecrementPage;
}
if(CGRectContainsPoint(objj_msgSend(_20,"rectForPart:",CPScrollerIncrementPage),_22)){
return CPScrollerIncrementPage;
}
if(CGRectContainsPoint(objj_msgSend(_20,"rectForPart:",CPScrollerDecrementLine),_22)){
return CPScrollerDecrementLine;
}
if(CGRectContainsPoint(objj_msgSend(_20,"rectForPart:",CPScrollerIncrementLine),_22)){
return CPScrollerIncrementLine;
}
if(CGRectContainsPoint(objj_msgSend(_20,"rectForPart:",CPScrollerKnobSlot),_22)){
return CPScrollerKnobSlot;
}
return CPScrollerNoPart;
}
}),new objj_method(sel_getUid("checkSpaceForParts"),function(_23,_24){
with(_23){
var _25=objj_msgSend(_23,"bounds");
if(_knobProportion===1){
_usableParts=CPNoScrollerParts;
_partRects[CPScrollerDecrementPage]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerKnob]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerIncrementPage]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerDecrementLine]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerIncrementLine]={origin:{x:0,y:0},size:{width:0,height:0}};
_partRects[CPScrollerKnobSlot]={origin:{x:_25.origin.x,y:_25.origin.y},size:{width:_25.size.width,height:_25.size.height}};
return;
}
_usableParts=CPAllScrollerParts;
var _26=objj_msgSend(_23,"currentValueForThemeAttribute:","track-overlap-inset"),_27=(_25.size.width),_28=(_25.size.height);
if(objj_msgSend(_23,"isVertical")){
var _29=objj_msgSend(_23,"currentValueForThemeAttribute:","decrement-line-size"),_2a=objj_msgSend(_23,"currentValueForThemeAttribute:","increment-line-size"),_2b=_29.height-_26.top,_2c=_2a.height-_26.bottom,_2d=_28-_2b-_2c,_2e=objj_msgSend(_23,"currentValueForThemeAttribute:","minimum-knob-size"),_2f=MAX(_2e.height,(_2d*_knobProportion)),_30=_2b+(_2d-_2f)*objj_msgSend(_23,"floatValue");
_partRects[CPScrollerDecrementPage]={origin:{x:0,y:_2b},size:{width:_27,height:_30-_2b}};
_partRects[CPScrollerKnob]={origin:{x:(_27-_2e.width)/2,y:_30},size:{width:_2e.width,height:_2f}};
_partRects[CPScrollerIncrementPage]={origin:{x:0,y:_30+_2f},size:{width:_27,height:_28-(_30+_2f)-_2c}};
_partRects[CPScrollerKnobSlot]={origin:{x:0,y:_2b},size:{width:_27,height:_2d}};
_partRects[CPScrollerDecrementLine]={origin:{x:0,y:0},size:{width:_29.width,height:_29.height}};
_partRects[CPScrollerIncrementLine]={origin:{x:0,y:_28-_2a.height},size:{width:_2a.width,height:_2a.height}};
}else{
var _29=objj_msgSend(_23,"currentValueForThemeAttribute:","decrement-line-size"),_2a=objj_msgSend(_23,"currentValueForThemeAttribute:","increment-line-size"),_31=_29.width-_26.left,_32=_2a.width-_26.right;
slotWidth=_27-_31-_32,_2e=objj_msgSend(_23,"currentValueForThemeAttribute:","minimum-knob-size"),knobWidth=MAX(_2e.width,(slotWidth*_knobProportion)),_30=_31+(slotWidth-knobWidth)*objj_msgSend(_23,"floatValue");
_partRects[CPScrollerDecrementPage]={origin:{x:_31,y:0},size:{width:_30-_31,height:_28}};
_partRects[CPScrollerKnob]={origin:{x:_30,y:0},size:{width:knobWidth,height:_2e.height}};
_partRects[CPScrollerIncrementPage]={origin:{x:_30+knobWidth,y:0},size:{width:_27-(_30+knobWidth)-_32,height:_28}};
_partRects[CPScrollerKnobSlot]={origin:{x:_31,y:0},size:{width:slotWidth,height:_28}};
_partRects[CPScrollerDecrementLine]={origin:{x:0,y:0},size:{width:_29.width,height:_29.height}};
_partRects[CPScrollerIncrementLine]={origin:{x:_27-_2a.width,y:0},size:{width:_2a.width,height:_2a.height}};
}
}
}),new objj_method(sel_getUid("usableParts"),function(_33,_34){
with(_33){
return _usableParts;
}
}),new objj_method(sel_getUid("drawArrow:highlight:"),function(_35,_36,_37,_38){
with(_35){
}
}),new objj_method(sel_getUid("drawKnob"),function(_39,_3a){
with(_39){
}
}),new objj_method(sel_getUid("drawKnobSlot"),function(_3b,_3c){
with(_3b){
}
}),new objj_method(sel_getUid("createViewForPart:"),function(_3d,_3e,_3f){
with(_3d){
var _40=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_40,"setHitTests:",NO);
return _40;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_41,_42,_43){
with(_41){
return _partRects[_43];
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_44,_45,_46){
with(_44){
var _47=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_47,"setHitTests:",NO);
return _47;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_48,_49){
with(_48){
objj_msgSend(_48,"checkSpaceForParts");
var _4a=0,_4b=_1.length;
for(;_4a<_4b;++_4a){
var _4c=_1[_4a];
if(_4a===0){
view=objj_msgSend(_48,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:",_4c,CPWindowBelow,_1[_4a+1]);
}else{
view=objj_msgSend(_48,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:",_4c,CPWindowAbove,_1[_4a-1]);
}
if(view){
objj_msgSend(view,"setBackgroundColor:",objj_msgSend(_48,"currentValueForThemeAttribute:",_2[_4c]+"-color"));
}
}
}
}),new objj_method(sel_getUid("drawParts"),function(_4d,_4e){
with(_4d){
objj_msgSend(_4d,"drawKnobSlot");
objj_msgSend(_4d,"drawKnob");
objj_msgSend(_4d,"drawArrow:highlight:",CPScrollerDecrementArrow,NO);
objj_msgSend(_4d,"drawArrow:highlight:",CPScrollerIncrementArrow,NO);
}
}),new objj_method(sel_getUid("hitPart"),function(_4f,_50){
with(_4f){
return _hitPart;
}
}),new objj_method(sel_getUid("trackKnob:"),function(_51,_52,_53){
with(_51){
var _54=objj_msgSend(_53,"type");
if(_54===CPLeftMouseUp){
_hitPart=CPScrollerNoPart;
return;
}
if(_54===CPLeftMouseDown){
_trackingFloatValue=objj_msgSend(_51,"floatValue");
_trackingStartPoint=objj_msgSend(_51,"convertPoint:fromView:",objj_msgSend(_53,"locationInWindow"),nil);
}else{
if(_54===CPLeftMouseDragged){
var _55=objj_msgSend(_51,"rectForPart:",CPScrollerKnob),_56=objj_msgSend(_51,"rectForPart:",CPScrollerKnobSlot),_57=!objj_msgSend(_51,"isVertical")?((_56.size.width)-(_55.size.width)):((_56.size.height)-(_55.size.height));
if(_57<=0){
objj_msgSend(_51,"setFloatValue:",0);
}else{
var _58=objj_msgSend(_51,"convertPoint:fromView:",objj_msgSend(_53,"locationInWindow"),nil);
delta=!objj_msgSend(_51,"isVertical")?_58.x-_trackingStartPoint.x:_58.y-_trackingStartPoint.y;
objj_msgSend(_51,"setFloatValue:",_trackingFloatValue+delta/_57);
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_51,sel_getUid("trackKnob:"),CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
objj_msgSend(_51,"sendAction:to:",objj_msgSend(_51,"action"),objj_msgSend(_51,"target"));
}
}),new objj_method(sel_getUid("trackScrollButtons:"),function(_59,_5a,_5b){
with(_59){
var _5c=objj_msgSend(_5b,"type");
if(_5c===CPLeftMouseUp){
objj_msgSend(_59,"highlight:",NO);
objj_msgSend(CPEvent,"stopPeriodicEvents");
_hitPart=CPScrollerNoPart;
return;
}
if(_5c===CPLeftMouseDown){
_trackingPart=objj_msgSend(_59,"hitPart");
_trackingStartPoint=objj_msgSend(_59,"convertPoint:fromView:",objj_msgSend(_5b,"locationInWindow"),nil);
if(objj_msgSend(_5b,"modifierFlags")&CPAlternateKeyMask){
if(_trackingPart==CPScrollerDecrementLine){
_hitPart=CPScrollerDecrementPage;
}else{
if(_trackingPart==CPScrollerIncrementLine){
_hitPart=CPScrollerIncrementPage;
}else{
if(_trackingPart==CPScrollerDecrementPage||_trackingPart==CPScrollerIncrementPage){
var _5d=objj_msgSend(_59,"rectForPart:",CPScrollerKnob),_5e=!objj_msgSend(_59,"isVertical")?(_5d.size.width):(_5d.size.height),_5f=objj_msgSend(_59,"rectForPart:",CPScrollerKnobSlot),_60=(!objj_msgSend(_59,"isVertical")?(_5f.size.width):(_5f.size.height))-_5e;
objj_msgSend(_59,"setFloatValue:",((!objj_msgSend(_59,"isVertical")?_trackingStartPoint.x-(_5f.origin.x):_trackingStartPoint.y-(_5f.origin.y))-_5e/2)/_60);
_hitPart=CPScrollerKnob;
objj_msgSend(_59,"sendAction:to:",objj_msgSend(_59,"action"),objj_msgSend(_59,"target"));
return objj_msgSend(_59,"trackKnob:",_5b);
}
}
}
}
objj_msgSend(_59,"highlight:",YES);
objj_msgSend(_59,"sendAction:to:",objj_msgSend(_59,"action"),objj_msgSend(_59,"target"));
objj_msgSend(CPEvent,"startPeriodicEventsAfterDelay:withPeriod:",0.5,0.04);
}else{
if(_5c===CPLeftMouseDragged){
_trackingStartPoint=objj_msgSend(_59,"convertPoint:fromView:",objj_msgSend(_5b,"locationInWindow"),nil);
if(_trackingPart==CPScrollerDecrementPage||_trackingPart==CPScrollerIncrementPage){
var _61=objj_msgSend(_59,"testPart:",objj_msgSend(_5b,"locationInWindow"));
if(_61==CPScrollerDecrementPage||_61==CPScrollerIncrementPage){
_trackingPart=_61;
_hitPart=_61;
}
}
objj_msgSend(_59,"highlight:",CGRectContainsPoint(objj_msgSend(_59,"rectForPart:",_trackingPart),_trackingStartPoint));
}else{
if(_5c==CPPeriodic&&CGRectContainsPoint(objj_msgSend(_59,"rectForPart:",_trackingPart),_trackingStartPoint)){
objj_msgSend(_59,"sendAction:to:",objj_msgSend(_59,"action"),objj_msgSend(_59,"target"));
}
}
}
objj_msgSend(CPApp,"setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:",_59,sel_getUid("trackScrollButtons:"),CPPeriodicMask|CPLeftMouseDraggedMask|CPLeftMouseUpMask,nil,nil,YES);
}
}),new objj_method(sel_getUid("_recalculateIsVertical"),function(_62,_63){
with(_62){
var _64=objj_msgSend(_62,"bounds"),_65=(_64.size.width),_66=(_64.size.height);
_isVertical=_65<_66?1:(_65>_66?0:-1);
if(_isVertical===1){
objj_msgSend(_62,"setThemeState:",CPThemeStateVertical);
}else{
if(_isVertical===0){
objj_msgSend(_62,"unsetThemeState:",CPThemeStateVertical);
}
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_67,_68,_69){
with(_67){
objj_msgSendSuper({receiver:_67,super_class:objj_getClass("CPControl")},"setFrameSize:",_69);
objj_msgSend(_67,"_recalculateIsVertical");
objj_msgSend(_67,"checkSpaceForParts");
objj_msgSend(_67,"setNeedsLayout");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_6a,_6b,_6c){
with(_6a){
if(!objj_msgSend(_6a,"isEnabled")){
return;
}
_hitPart=objj_msgSend(_6a,"testPart:",objj_msgSend(_6c,"locationInWindow"));
switch(_hitPart){
case CPScrollerKnob:
return objj_msgSend(_6a,"trackKnob:",_6c);
case CPScrollerDecrementLine:
case CPScrollerIncrementLine:
case CPScrollerDecrementPage:
case CPScrollerIncrementPage:
return objj_msgSend(_6a,"trackScrollButtons:",_6c);
}
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("themeClass"),function(_6d,_6e){
with(_6d){
return "scroller";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_6f,_70){
with(_6f){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[{top:(0),right:(0),bottom:(0),left:(0)},nil,nil,nil,nil,{width:0,height:0},{width:0,height:0},{width:0,height:0}],["track-overlap-inset","knob-slot-color","decrement-line-color","increment-line-color","knob-color","decrement-line-size","increment-line-size","minimum-knob-size"]);
}
}),new objj_method(sel_getUid("scrollerWidth"),function(_71,_72){
with(_71){
return 17;
}
}),new objj_method(sel_getUid("scrollerWidthForControlSize:"),function(_73,_74,_75){
with(_73){
return 17;
}
})]);
var _76="CPScrollerControlSize",_77="CPScrollerKnobProportion";
var _4=objj_getClass("CPScroller");
if(!_4){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPScroller\""));
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_78,_79,_7a){
with(_78){
if(_78=objj_msgSendSuper({receiver:_78,super_class:objj_getClass("CPControl")},"initWithCoder:",_7a)){
_controlSize=CPRegularControlSize;
if(objj_msgSend(_7a,"containsValueForKey:",_76)){
_controlSize=objj_msgSend(_7a,"decodeIntForKey:",_76);
}
_knobProportion=1;
if(objj_msgSend(_7a,"containsValueForKey:",_77)){
_knobProportion=objj_msgSend(_7a,"decodeFloatForKey:",_77);
}
_partRects=[];
_hitPart=CPScrollerNoPart;
objj_msgSend(_78,"_recalculateIsVertical");
}
return _78;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7b,_7c,_7d){
with(_7b){
objj_msgSendSuper({receiver:_7b,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_7d);
objj_msgSend(_7d,"encodeInt:forKey:",_controlSize,_76);
objj_msgSend(_7d,"encodeFloat:forKey:",_knobProportion,_77);
}
})]);
