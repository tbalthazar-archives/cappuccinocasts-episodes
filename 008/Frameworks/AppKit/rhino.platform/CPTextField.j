i;11;CPControl.ji;17;CPStringDrawing.ji;17;CPCompatibility.jc;19478;
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
CGInsetMake=function(top,_2b,_2c,_2d){
return {top:(top),left:(_2b),bottom:(_2c),right:(_2d)};
};
CGInsetMakeZero=function(){
return {top:(0),left:(0),bottom:(0),right:(0)};
};
CGInsetMakeCopy=function(_2e){
return {top:(_2e.top),left:(_2e.left),bottom:(_2e.bottom),right:(_2e.right)};
};
CGInsetIsEmpty=function(_2f){
return ((_2f).left===0&&(_2f).top===0&&(_2f).right===0&&(_2f).bottom===0);
};
CGRectContainsRect=function(_30,_31){
var _32=CGRectUnion(_30,_31);
return ((_32.origin.x==_30.origin.x&&_32.origin.y==_30.origin.y)&&(_32.size.width==_30.size.width&&_32.size.height==_30.size.height));
};
CGRectIntersectsRect=function(_33,_34){
var _35=CGRectIntersection(_33,_34);
return !(_35.size.width<=0||_35.size.height<=0);
};
CGRectIntegral=function(_36){
_36=CGRectStandardize(_36);
var x=FLOOR((_36.origin.x)),y=FLOOR((_36.origin.y));
_36.size.width=CEIL((_36.origin.x+_36.size.width))-x;
_36.size.height=CEIL((_36.origin.y+_36.size.height))-y;
_36.origin.x=x;
_36.origin.y=y;
return _36;
};
CGRectIntersection=function(_39,_3a){
var _3b={origin:{x:MAX((_39.origin.x),(_3a.origin.x)),y:MAX((_39.origin.y),(_3a.origin.y))},size:{width:0,height:0}};
_3b.size.width=MIN((_39.origin.x+_39.size.width),(_3a.origin.x+_3a.size.width))-(_3b.origin.x);
_3b.size.height=MIN((_39.origin.y+_39.size.height),(_3a.origin.y+_3a.size.height))-(_3b.origin.y);
return (_3b.size.width<=0||_3b.size.height<=0)?{origin:{x:0,y:0},size:{width:0,height:0}}:_3b;
};
CGRectStandardize=function(_3c){
var _3d=(_3c.size.width),_3e=(_3c.size.height),_3f=_3c;
if(_3d<0){
if(_3f==_3c){
_3f={origin:{x:_3c.origin.x,y:_3c.origin.y},size:{width:_3c.size.width,height:_3c.size.height}};
}
_3f.origin.x+=_3d;
_3f.size.width=-_3d;
}
if(_3e<0){
if(_3f==_3c){
_3f={origin:{x:_3c.origin.x,y:_3c.origin.y},size:{width:_3c.size.width,height:_3c.size.height}};
}
_3f.origin.y+=_3e;
_3f.size.height=-_3e;
}
return _3f;
};
CGRectUnion=function(_40,_41){
var _42=MIN((_40.origin.x),(_41.origin.x)),_43=MIN((_40.origin.y),(_41.origin.y)),_44=MAX((_40.origin.x+_40.size.width),(_41.origin.x+_41.size.width)),_45=MAX((_40.origin.y+_40.size.height),(_41.origin.y+_41.size.height));
return {origin:{x:_42,y:_43},size:{width:_44-_42,height:_45-_43}};
};
CGPointFromString=function(_46){
var _47=_46.indexOf(",");
return {x:parseInt(_46.substr(1,_47-1)),y:parseInt(_46.substring(_47+1,_46.length))};
};
CGSizeFromString=function(_48){
var _49=_48.indexOf(",");
return {width:parseInt(_48.substr(1,_49-1)),height:parseInt(_48.substring(_49+1,_48.length))};
};
CGRectFromString=function(_4a){
var _4b=_4a.indexOf(",",_4a.indexOf(",")+1);
return {origin:CGPointFromString(_4a.substr(1,_4b-1)),size:CGSizeFromString(_4a.substring(_4b+2,_4a.length))};
};
CGPointFromEvent=function(_4c){
return {x:_4c.clientX,y:_4c.clientY};
};
CPStringFromInset=function(_4d){
return _4d.top+" "+_4d.left+" "+_4d.bottom+" "+_4d.right;
};
CPLineBreakByWordWrapping=0;
CPLineBreakByCharWrapping=1;
CPLineBreakByClipping=2;
CPLineBreakByTruncatingHead=3;
CPLineBreakByTruncatingTail=4;
CPLineBreakByTruncatingMiddle=5;
CPTextFieldSquareBezel=0;
CPTextFieldRoundedBezel=1;
var _4e="¥";
var _4f=objj_getClass("CPString");
if(!_4f){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _50=_4f.isa;
class_addMethods(_4f,[new objj_method(sel_getUid("string"),function(_51,_52){
with(_51){
return _51;
}
})]);
CPTextFieldStateRounded=1<<12;
CPTextFieldStatePlaceholder=1<<13;
var _4f=objj_allocateClassPair(CPControl,"CPTextField"),_50=_4f.isa;
class_addIvars(_4f,[new objj_ivar("_isEditable"),new objj_ivar("_isSelectable"),new objj_ivar("_isSecure"),new objj_ivar("_drawsBackground"),new objj_ivar("_textFieldBackgroundColor"),new objj_ivar("_placeholderString"),new objj_ivar("_delegate"),new objj_ivar("_textDidChangeValue"),new objj_ivar("_bezelStyle"),new objj_ivar("_isBordered"),new objj_ivar("_controlSize")]);
objj_registerClassPair(_4f);
objj_addClassForBundle(_4f,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_4f,[new objj_method(sel_getUid("initWithFrame:"),function(_53,_54,_55){
with(_53){
_53=objj_msgSendSuper({receiver:_53,super_class:objj_getClass("CPControl")},"initWithFrame:",_55);
if(_53){
objj_msgSend(_53,"setStringValue:","");
objj_msgSend(_53,"setPlaceholderString:","");
_sendActionOn=CPKeyUpMask|CPKeyDownMask;
objj_msgSend(_53,"setValue:forThemedAttributeName:",CPLeftTextAlignment,"alignment");
}
return _53;
}
}),new objj_method(sel_getUid("setEditable:"),function(_56,_57,_58){
with(_56){
_isEditable=_58;
}
}),new objj_method(sel_getUid("isEditable"),function(_59,_5a){
with(_59){
return _isEditable;
}
}),new objj_method(sel_getUid("setSelectable:"),function(_5b,_5c,_5d){
with(_5b){
_isSelectable=_5d;
}
}),new objj_method(sel_getUid("isSelectable"),function(_5e,_5f){
with(_5e){
return _isSelectable;
}
}),new objj_method(sel_getUid("setSecure:"),function(_60,_61,_62){
with(_60){
_isSecure=_62;
}
}),new objj_method(sel_getUid("isSecure"),function(_63,_64){
with(_63){
return _isSecure;
}
}),new objj_method(sel_getUid("setBezeled:"),function(_65,_66,_67){
with(_65){
if((!!(_controlState&CPControlStateBezeled))===_67){
return;
}
if(_67){
_controlState|=CPControlStateBezeled;
}else{
_controlState&=~CPControlStateBezeled;
}
objj_msgSend(_65,"setNeedsLayout");
objj_msgSend(_65,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("isBezeled"),function(_68,_69){
with(_68){
return !!(_controlState&CPControlStateBezeled);
}
}),new objj_method(sel_getUid("setBezelStyle:"),function(_6a,_6b,_6c){
with(_6a){
var _6d=_6c===CPTextFieldRoundedBezel;
if((!!(_controlState&CPTextFieldStateRounded))===_6d){
return;
}
if(_6d){
_controlState|=CPTextFieldStateRounded;
}else{
_controlState&=~CPTextFieldStateRounded;
}
objj_msgSend(_6a,"setNeedsLayout");
objj_msgSend(_6a,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("bezelStyle"),function(_6e,_6f){
with(_6e){
if(_controlState&CPTextFieldStateRounded){
return CPTextFieldRoundedBezel;
}
return CPTextFieldSquareBezel;
}
}),new objj_method(sel_getUid("setBordered:"),function(_70,_71,_72){
with(_70){
if((!!(_controlState&CPControlStateBordered))===_72){
return;
}
if(_72){
_controlState|=CPControlStateBordered;
}else{
_controlState&=~CPControlStateBordered;
}
objj_msgSend(_70,"setNeedsLayout");
objj_msgSend(_70,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("isBordered"),function(_73,_74){
with(_73){
return !!(_controlState&CPControlStateBordered);
}
}),new objj_method(sel_getUid("setDrawsBackground:"),function(_75,_76,_77){
with(_75){
if(_drawsBackground==_77){
return;
}
_drawsBackground=_77;
objj_msgSend(_75,"setNeedsLayout");
objj_msgSend(_75,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("drawsBackground"),function(_78,_79){
with(_78){
return _drawsBackground;
}
}),new objj_method(sel_getUid("setTextFieldBackgroundColor:"),function(_7a,_7b,_7c){
with(_7a){
if(_textFieldBackgroundColor==_7c){
return;
}
_textFieldBackgroundColor=_7c;
objj_msgSend(_7a,"setNeedsLayout");
objj_msgSend(_7a,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("textFieldBackgroundColor"),function(_7d,_7e){
with(_7d){
return _textFieldBackgroundColor;
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_7f,_80){
with(_7f){
return objj_msgSend(_7f,"isEditable")&&objj_msgSend(_7f,"isEnabled");
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_81,_82){
with(_81){
if(CPTextFieldInputOwner&&objj_msgSend(CPTextFieldInputOwner,"window")!==objj_msgSend(_81,"window")){
objj_msgSend(objj_msgSend(CPTextFieldInputOwner,"window"),"makeFirstResponder:",nil);
}
_controlState|=CPControlStateEditing;
objj_msgSend(_81,"_updatePlaceholderState");
objj_msgSend(_81,"setNeedsLayout");
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_83,_84){
with(_83){
_controlState&=~CPControlStateEditing;
objj_msgSend(_83,"_updatePlaceholderState");
objj_msgSend(_83,"setNeedsLayout");
objj_msgSend(_83,"textDidEndEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidBeginEditingNotification,_83,nil));
return YES;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_85,_86,_87){
with(_85){
if(objj_msgSend(_85,"isEditable")&&objj_msgSend(_85,"isEnabled")){
return objj_msgSend(objj_msgSend(_85,"window"),"makeFirstResponder:",_85);
}else{
return objj_msgSend(objj_msgSend(_85,"nextResponder"),"mouseDown:",_87);
}
}
}),new objj_method(sel_getUid("objectValue"),function(_88,_89){
with(_88){
return objj_msgSendSuper({receiver:_88,super_class:objj_getClass("CPControl")},"objectValue");
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_8a,_8b,_8c){
with(_8a){
objj_msgSendSuper({receiver:_8a,super_class:objj_getClass("CPControl")},"setObjectValue:",_8c);
objj_msgSend(_8a,"_updatePlaceholderState");
}
}),new objj_method(sel_getUid("_updatePlaceholderState"),function(_8d,_8e){
with(_8d){
var _8f=objj_msgSend(_8d,"stringValue"),_90=_controlState;
if((!_8f||objj_msgSend(_8f,"length")===0)&&!(_controlState&CPControlStateEditing)){
_controlState|=CPTextFieldStatePlaceholder;
}else{
_controlState&=~CPTextFieldStatePlaceholder;
}
if(_controlState!==_90){
objj_msgSend(_8d,"setNeedsLayout");
objj_msgSend(_8d,"setNeedsDisplay:",YES);
}
}
}),new objj_method(sel_getUid("setPlaceholderString:"),function(_91,_92,_93){
with(_91){
if(_placeholderString===_93){
return;
}
_placeholderString=_93;
if(_controlState&CPTextFieldStatePlaceholder){
objj_msgSend(_91,"setNeedsLayout");
objj_msgSend(_91,"setNeedsDisplay:",YES);
}
}
}),new objj_method(sel_getUid("placeholderString"),function(_94,_95){
with(_94){
return _placeholderString;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_96,_97){
with(_96){
var _98=objj_msgSend((objj_msgSend(_96,"stringValue")||" "),"sizeWithFont:",objj_msgSend(_96,"font")),_99=objj_msgSend(_96,"currentValueForThemedAttributeName:","content-inset");
objj_msgSend(_96,"setFrameSize:",CGSizeMake(_98.width+_99.left+_99.right,_98.height+_99.top+_99.bottom));
}
}),new objj_method(sel_getUid("selectText:"),function(_9a,_9b,_9c){
with(_9a){
}
}),new objj_method(sel_getUid("setDelegate:"),function(_9d,_9e,_9f){
with(_9d){
var _a0=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
objj_msgSend(_a0,"removeObserver:name:object:",_delegate,CPControlTextDidBeginEditingNotification,_9d);
objj_msgSend(_a0,"removeObserver:name:object:",_delegate,CPControlTextDidChangeNotification,_9d);
objj_msgSend(_a0,"removeObserver:name:object:",_delegate,CPControlTextDidEndEditingNotification,_9d);
}
_delegate=_9f;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidBeginEditing:"))){
objj_msgSend(_a0,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidBeginEditing:"),CPControlTextDidBeginEditingNotification,_9d);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidChange:"))){
objj_msgSend(_a0,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidChange:"),CPControlTextDidChangeNotification,_9d);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidEndEditing:"))){
objj_msgSend(_a0,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidEndEditing:"),CPControlTextDidEndEditingNotification,_9d);
}
}
}),new objj_method(sel_getUid("delegate"),function(_a1,_a2){
with(_a1){
return _delegate;
}
}),new objj_method(sel_getUid("contentRectForBounds:"),function(_a3,_a4,_a5){
with(_a3){
var _a6=objj_msgSend(_a3,"currentValueForThemedAttributeName:","content-inset");
if(!_a6){
return _a5;
}
_a5.origin.x+=_a6.left;
_a5.origin.y+=_a6.top;
_a5.size.width-=_a6.left+_a6.right;
_a5.size.height-=_a6.top+_a6.bottom;
return _a5;
}
}),new objj_method(sel_getUid("bezelRectForBounds:"),function(_a7,_a8,_a9){
with(_a7){
var _aa=objj_msgSend(_a7,"currentValueForThemedAttributeName:","bezel-inset");
if(((_aa).left===0&&(_aa).top===0&&(_aa).right===0&&(_aa).bottom===0)){
return _a9;
}
_a9.origin.x+=_aa.left;
_a9.origin.y+=_aa.top;
_a9.size.width-=_aa.left+_aa.right;
_a9.size.height-=_aa.top+_aa.bottom;
return _a9;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_ab,_ac,_ad){
with(_ab){
if(_ad==="bezel-view"){
return objj_msgSend(_ab,"bezelRectForBounds:",objj_msgSend(_ab,"bounds"));
}else{
if(_ad==="content-view"){
return objj_msgSend(_ab,"contentRectForBounds:",objj_msgSend(_ab,"bounds"));
}
}
return objj_msgSendSuper({receiver:_ab,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_ad);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_ae,_af,_b0){
with(_ae){
if(_b0==="bezel-view"){
var _b1=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_b1,"setHitTests:",NO);
return _b1;
}else{
var _b1=objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
return _b1;
}
return objj_msgSendSuper({receiver:_ae,super_class:objj_getClass("CPControl")},"createEphemeralSubviewNamed:",_b0);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_b2,_b3){
with(_b2){
var _b4=objj_msgSend(_b2,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bezel-view",CPWindowBelow,"content-view");
if(_b4){
objj_msgSend(_b4,"setBackgroundColor:",objj_msgSend(_b2,"currentValueForThemedAttributeName:","bezel-color"));
}
var _b5=objj_msgSend(_b2,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
if(_b5){
objj_msgSend(_b5,"setHidden:",_controlState&CPControlStateEditing);
var _b6="";
if(_controlState&CPTextFieldStatePlaceholder){
_b6=objj_msgSend(_b2,"placeholderString");
}else{
_b6=objj_msgSend(_b2,"stringValue");
if(objj_msgSend(_b2,"isSecure")){
_b6=_b7(_b6);
}
}
objj_msgSend(_b5,"setText:",_b6);
objj_msgSend(_b5,"setTextColor:",objj_msgSend(_b2,"currentValueForThemedAttributeName:","text-color"));
objj_msgSend(_b5,"setFont:",objj_msgSend(_b2,"currentValueForThemedAttributeName:","font"));
objj_msgSend(_b5,"setAlignment:",objj_msgSend(_b2,"currentValueForThemedAttributeName:","alignment"));
objj_msgSend(_b5,"setVerticalAlignment:",objj_msgSend(_b2,"currentValueForThemedAttributeName:","vertical-alignment"));
objj_msgSend(_b5,"setLineBreakMode:",objj_msgSend(_b2,"currentValueForThemedAttributeName:","line-break-mode"));
objj_msgSend(_b5,"setTextShadowColor:",objj_msgSend(_b2,"currentValueForThemedAttributeName:","text-shadow-color"));
objj_msgSend(_b5,"setTextShadowOffset:",objj_msgSend(_b2,"currentValueForThemedAttributeName:","text-shadow-offset"));
}
}
})]);
class_addMethods(_50,[new objj_method(sel_getUid("themedAttributes"),function(_b8,_b9){
with(_b8){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[{top:(0),left:(0),bottom:(0),right:(0)},{top:(2),left:(2),bottom:(2),right:(2)},{top:(2),left:(2),bottom:(2),right:(2)},nil],["bezel-inset","content-inset","bezeled-content-inset","bezel-color"]);
}
})]);
var _b7=function(_ba){
if(!_ba){
return "";
}
var _bb="",_bc=_ba.length;
while(_bc--){
_bb+=_4e;
}
return _bb;
};
var _bd="CPTextFieldIsEditableKey",_be="CPTextFieldIsSelectableKey",_bf="CPTextFieldIsBorderedKey",_c0="CPTextFieldIsBezeledKey",_c1="CPTextFieldBezelStyleKey",_c2="CPTextFieldDrawsBackgroundKey",_c3="CPTextFieldLineBreakModeKey",_c4="CPTextFieldBackgroundColorKey",_c5="CPTextFieldPlaceholderStringKey";
var _4f=objj_getClass("CPTextField");
if(!_4f){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTextField\""));
}
var _50=_4f.isa;
class_addMethods(_4f,[new objj_method(sel_getUid("initWithCoder:"),function(_c6,_c7,_c8){
with(_c6){
_c6=objj_msgSendSuper({receiver:_c6,super_class:objj_getClass("CPControl")},"initWithCoder:",_c8);
if(_c6){
objj_msgSend(_c6,"setEditable:",objj_msgSend(_c8,"decodeBoolForKey:",_bd));
objj_msgSend(_c6,"setSelectable:",objj_msgSend(_c8,"decodeBoolForKey:",_be));
objj_msgSend(_c6,"setDrawsBackground:",objj_msgSend(_c8,"decodeBoolForKey:",_c2));
objj_msgSend(_c6,"setTextFieldBackgroundColor:",objj_msgSend(_c8,"decodeObjectForKey:",_c4));
objj_msgSend(_c6,"setPlaceholderString:",objj_msgSend(_c8,"decodeObjectForKey:",_c5));
}
return _c6;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_c9,_ca,_cb){
with(_c9){
objj_msgSendSuper({receiver:_c9,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_cb);
objj_msgSend(_cb,"encodeBool:forKey:",_isEditable,_bd);
objj_msgSend(_cb,"encodeBool:forKey:",_isSelectable,_be);
objj_msgSend(_cb,"encodeBool:forKey:",_drawsBackground,_c2);
objj_msgSend(_cb,"encodeObject:forKey:",_textFieldBackgroundColor,_c4);
objj_msgSend(_cb,"encodeObject:forKey:",_placeholderString,_c5);
}
})]);
