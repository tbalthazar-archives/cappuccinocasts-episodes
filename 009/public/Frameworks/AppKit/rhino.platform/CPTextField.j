i;11;CPControl.ji;17;CPStringDrawing.ji;17;CPCompatibility.jc;13657;
CPLineBreakByWordWrapping=0;
CPLineBreakByCharWrapping=1;
CPLineBreakByClipping=2;
CPLineBreakByTruncatingHead=3;
CPLineBreakByTruncatingTail=4;
CPLineBreakByTruncatingMiddle=5;
CPTextFieldSquareBezel=0;
CPTextFieldRoundedBezel=1;
var _1="\u2022";
var _2=objj_getClass("CPString");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("string"),function(_4,_5){
with(_4){
return _4;
}
})]);
CPTextFieldStateRounded=CPThemeState("rounded");
CPTextFieldStatePlaceholder=CPThemeState("placeholder");
var _2=objj_allocateClassPair(CPControl,"CPTextField"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_isEditable"),new objj_ivar("_isSelectable"),new objj_ivar("_isSecure"),new objj_ivar("_drawsBackground"),new objj_ivar("_textFieldBackgroundColor"),new objj_ivar("_placeholderString"),new objj_ivar("_delegate"),new objj_ivar("_textDidChangeValue"),new objj_ivar("_bezelStyle"),new objj_ivar("_isBordered"),new objj_ivar("_controlSize")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_6,_7,_8){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPControl")},"initWithFrame:",_8);
if(_6){
objj_msgSend(_6,"setStringValue:","");
objj_msgSend(_6,"setPlaceholderString:","");
_sendActionOn=CPKeyUpMask|CPKeyDownMask;
objj_msgSend(_6,"setValue:forThemeAttribute:",CPLeftTextAlignment,"alignment");
}
return _6;
}
}),new objj_method(sel_getUid("setEditable:"),function(_9,_a,_b){
with(_9){
_isEditable=_b;
}
}),new objj_method(sel_getUid("isEditable"),function(_c,_d){
with(_c){
return _isEditable;
}
}),new objj_method(sel_getUid("setSelectable:"),function(_e,_f,_10){
with(_e){
_isSelectable=_10;
}
}),new objj_method(sel_getUid("isSelectable"),function(_11,_12){
with(_11){
return _isSelectable;
}
}),new objj_method(sel_getUid("setSecure:"),function(_13,_14,_15){
with(_13){
_isSecure=_15;
}
}),new objj_method(sel_getUid("isSecure"),function(_16,_17){
with(_16){
return _isSecure;
}
}),new objj_method(sel_getUid("setBezeled:"),function(_18,_19,_1a){
with(_18){
if(_1a){
objj_msgSend(_18,"setThemeState:",CPThemeStateBezeled);
}else{
objj_msgSend(_18,"unsetThemeState:",CPThemeStateBezeled);
}
}
}),new objj_method(sel_getUid("isBezeled"),function(_1b,_1c){
with(_1b){
return objj_msgSend(_1b,"hasThemeState:",CPThemeStateBezeled);
}
}),new objj_method(sel_getUid("setBezelStyle:"),function(_1d,_1e,_1f){
with(_1d){
var _20=_1f===CPTextFieldRoundedBezel;
if(_20){
objj_msgSend(_1d,"setThemeState:",CPTextFieldStateRounded);
}else{
objj_msgSend(_1d,"unsetThemeState:",CPTextFieldStateRounded);
}
}
}),new objj_method(sel_getUid("bezelStyle"),function(_21,_22){
with(_21){
if(objj_msgSend(_21,"hasThemeState:",CPTextFieldStateRounded)){
return CPTextFieldRoundedBezel;
}
return CPTextFieldSquareBezel;
}
}),new objj_method(sel_getUid("setBordered:"),function(_23,_24,_25){
with(_23){
if(_25){
objj_msgSend(_23,"setThemeState:",CPThemeStateBordered);
}else{
objj_msgSend(_23,"unsetThemeState:",CPThemeStateBordered);
}
}
}),new objj_method(sel_getUid("isBordered"),function(_26,_27){
with(_26){
return objj_msgSend(_26,"hasThemeState:",CPThemeStateBordered);
}
}),new objj_method(sel_getUid("setDrawsBackground:"),function(_28,_29,_2a){
with(_28){
if(_drawsBackground==_2a){
return;
}
_drawsBackground=_2a;
objj_msgSend(_28,"setNeedsLayout");
objj_msgSend(_28,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("drawsBackground"),function(_2b,_2c){
with(_2b){
return _drawsBackground;
}
}),new objj_method(sel_getUid("setTextFieldBackgroundColor:"),function(_2d,_2e,_2f){
with(_2d){
if(_textFieldBackgroundColor==_2f){
return;
}
_textFieldBackgroundColor=_2f;
objj_msgSend(_2d,"setNeedsLayout");
objj_msgSend(_2d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("textFieldBackgroundColor"),function(_30,_31){
with(_30){
return _textFieldBackgroundColor;
}
}),new objj_method(sel_getUid("acceptsFirstResponder"),function(_32,_33){
with(_32){
return objj_msgSend(_32,"isEditable")&&objj_msgSend(_32,"isEnabled");
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_34,_35){
with(_34){
if(CPTextFieldInputOwner&&objj_msgSend(CPTextFieldInputOwner,"window")!==objj_msgSend(_34,"window")){
objj_msgSend(objj_msgSend(CPTextFieldInputOwner,"window"),"makeFirstResponder:",nil);
}
objj_msgSend(_34,"setThemeState:",CPThemeStateEditing);
objj_msgSend(_34,"_updatePlaceholderState");
objj_msgSend(_34,"setNeedsLayout");
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_36,_37){
with(_36){
objj_msgSend(_36,"unsetThemeState:",CPThemeStateEditing);
objj_msgSend(_36,"_updatePlaceholderState");
objj_msgSend(_36,"setNeedsLayout");
objj_msgSend(_36,"textDidEndEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidBeginEditingNotification,_36,nil));
return YES;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_38,_39,_3a){
with(_38){
if(objj_msgSend(_38,"isEditable")&&objj_msgSend(_38,"isEnabled")){
return objj_msgSend(objj_msgSend(_38,"window"),"makeFirstResponder:",_38);
}else{
return objj_msgSend(objj_msgSend(_38,"nextResponder"),"mouseDown:",_3a);
}
}
}),new objj_method(sel_getUid("objectValue"),function(_3b,_3c){
with(_3b){
return objj_msgSendSuper({receiver:_3b,super_class:objj_getClass("CPControl")},"objectValue");
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_3d,_3e,_3f){
with(_3d){
objj_msgSendSuper({receiver:_3d,super_class:objj_getClass("CPControl")},"setObjectValue:",_3f);
objj_msgSend(_3d,"_updatePlaceholderState");
}
}),new objj_method(sel_getUid("_updatePlaceholderState"),function(_40,_41){
with(_40){
var _42=objj_msgSend(_40,"stringValue");
if((!_42||objj_msgSend(_42,"length")===0)&&!objj_msgSend(_40,"hasThemeState:",CPThemeStateEditing)){
objj_msgSend(_40,"setThemeState:",CPTextFieldStatePlaceholder);
}else{
objj_msgSend(_40,"unsetThemeState:",CPTextFieldStatePlaceholder);
}
}
}),new objj_method(sel_getUid("setPlaceholderString:"),function(_43,_44,_45){
with(_43){
if(_placeholderString===_45){
return;
}
_placeholderString=_45;
if(objj_msgSend(_43,"hasThemeState:",CPTextFieldStatePlaceholder)){
objj_msgSend(_43,"setNeedsLayout");
objj_msgSend(_43,"setNeedsDisplay:",YES);
}
}
}),new objj_method(sel_getUid("placeholderString"),function(_46,_47){
with(_46){
return _placeholderString;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_48,_49){
with(_48){
var _4a=objj_msgSend((objj_msgSend(_48,"stringValue")||" "),"sizeWithFont:",objj_msgSend(_48,"font")),_4b=objj_msgSend(_48,"currentValueForThemeAttribute:","content-inset");
objj_msgSend(_48,"setFrameSize:",CGSizeMake(_4a.width+_4b.left+_4b.right,_4a.height+_4b.top+_4b.bottom));
}
}),new objj_method(sel_getUid("selectText:"),function(_4c,_4d,_4e){
with(_4c){
}
}),new objj_method(sel_getUid("setDelegate:"),function(_4f,_50,_51){
with(_4f){
var _52=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
objj_msgSend(_52,"removeObserver:name:object:",_delegate,CPControlTextDidBeginEditingNotification,_4f);
objj_msgSend(_52,"removeObserver:name:object:",_delegate,CPControlTextDidChangeNotification,_4f);
objj_msgSend(_52,"removeObserver:name:object:",_delegate,CPControlTextDidEndEditingNotification,_4f);
}
_delegate=_51;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidBeginEditing:"))){
objj_msgSend(_52,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidBeginEditing:"),CPControlTextDidBeginEditingNotification,_4f);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidChange:"))){
objj_msgSend(_52,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidChange:"),CPControlTextDidChangeNotification,_4f);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("controlTextDidEndEditing:"))){
objj_msgSend(_52,"addObserver:selector:name:object:",_delegate,sel_getUid("controlTextDidEndEditing:"),CPControlTextDidEndEditingNotification,_4f);
}
}
}),new objj_method(sel_getUid("delegate"),function(_53,_54){
with(_53){
return _delegate;
}
}),new objj_method(sel_getUid("contentRectForBounds:"),function(_55,_56,_57){
with(_55){
var _58=objj_msgSend(_55,"currentValueForThemeAttribute:","content-inset");
if(!_58){
return _57;
}
_57.origin.x+=_58.left;
_57.origin.y+=_58.top;
_57.size.width-=_58.left+_58.right;
_57.size.height-=_58.top+_58.bottom;
return _57;
}
}),new objj_method(sel_getUid("bezelRectForBounds:"),function(_59,_5a,_5b){
with(_59){
var _5c=objj_msgSend(_59,"currentValueForThemeAttribute:","bezel-inset");
if(((_5c).top===0&&(_5c).right===0&&(_5c).bottom===0&&(_5c).left===0)){
return _5b;
}
_5b.origin.x+=_5c.left;
_5b.origin.y+=_5c.top;
_5b.size.width-=_5c.left+_5c.right;
_5b.size.height-=_5c.top+_5c.bottom;
return _5b;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_5d,_5e,_5f){
with(_5d){
if(_5f==="bezel-view"){
return objj_msgSend(_5d,"bezelRectForBounds:",objj_msgSend(_5d,"bounds"));
}else{
if(_5f==="content-view"){
return objj_msgSend(_5d,"contentRectForBounds:",objj_msgSend(_5d,"bounds"));
}
}
return objj_msgSendSuper({receiver:_5d,super_class:objj_getClass("CPControl")},"rectForEphemeralSubviewNamed:",_5f);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_60,_61,_62){
with(_60){
if(_62==="bezel-view"){
var _63=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
objj_msgSend(_63,"setHitTests:",NO);
return _63;
}else{
var _63=objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",{origin:{x:0,y:0},size:{width:0,height:0}});
return _63;
}
return objj_msgSendSuper({receiver:_60,super_class:objj_getClass("CPControl")},"createEphemeralSubviewNamed:",_62);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_64,_65){
with(_64){
var _66=objj_msgSend(_64,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","bezel-view",CPWindowBelow,"content-view");
if(_66){
objj_msgSend(_66,"setBackgroundColor:",objj_msgSend(_64,"currentValueForThemeAttribute:","bezel-color"));
}
var _67=objj_msgSend(_64,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
if(_67){
objj_msgSend(_67,"setHidden:",objj_msgSend(_64,"hasThemeState:",CPThemeStateEditing));
var _68="";
if(objj_msgSend(_64,"hasThemeState:",CPTextFieldStatePlaceholder)){
_68=objj_msgSend(_64,"placeholderString");
}else{
_68=objj_msgSend(_64,"stringValue");
if(objj_msgSend(_64,"isSecure")){
_68=_69(_68);
}
}
objj_msgSend(_67,"setText:",_68);
objj_msgSend(_67,"setTextColor:",objj_msgSend(_64,"currentValueForThemeAttribute:","text-color"));
objj_msgSend(_67,"setFont:",objj_msgSend(_64,"currentValueForThemeAttribute:","font"));
objj_msgSend(_67,"setAlignment:",objj_msgSend(_64,"currentValueForThemeAttribute:","alignment"));
objj_msgSend(_67,"setVerticalAlignment:",objj_msgSend(_64,"currentValueForThemeAttribute:","vertical-alignment"));
objj_msgSend(_67,"setLineBreakMode:",objj_msgSend(_64,"currentValueForThemeAttribute:","line-break-mode"));
objj_msgSend(_67,"setTextShadowColor:",objj_msgSend(_64,"currentValueForThemeAttribute:","text-shadow-color"));
objj_msgSend(_67,"setTextShadowOffset:",objj_msgSend(_64,"currentValueForThemeAttribute:","text-shadow-offset"));
}
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("themeClass"),function(_6a,_6b){
with(_6a){
return "textfield";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_6c,_6d){
with(_6c){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[{top:(0),right:(0),bottom:(0),left:(0)},{top:(2),right:(2),bottom:(2),left:(2)},nil],["bezel-inset","content-inset","bezel-color"]);
}
})]);
var _69=function(_6e){
if(!_6e){
return "";
}
var _6f="",_70=_6e.length;
while(_70--){
_6f+=_1;
}
return _6f;
};
var _71="CPTextFieldIsEditableKey",_72="CPTextFieldIsSelectableKey",_73="CPTextFieldIsBorderedKey",_74="CPTextFieldIsBezeledKey",_75="CPTextFieldBezelStyleKey",_76="CPTextFieldDrawsBackgroundKey",_77="CPTextFieldLineBreakModeKey",_78="CPTextFieldBackgroundColorKey",_79="CPTextFieldPlaceholderStringKey";
var _2=objj_getClass("CPTextField");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTextField\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_7a,_7b,_7c){
with(_7a){
_7a=objj_msgSendSuper({receiver:_7a,super_class:objj_getClass("CPControl")},"initWithCoder:",_7c);
if(_7a){
objj_msgSend(_7a,"setEditable:",objj_msgSend(_7c,"decodeBoolForKey:",_71));
objj_msgSend(_7a,"setSelectable:",objj_msgSend(_7c,"decodeBoolForKey:",_72));
objj_msgSend(_7a,"setDrawsBackground:",objj_msgSend(_7c,"decodeBoolForKey:",_76));
objj_msgSend(_7a,"setTextFieldBackgroundColor:",objj_msgSend(_7c,"decodeObjectForKey:",_78));
objj_msgSend(_7a,"setPlaceholderString:",objj_msgSend(_7c,"decodeObjectForKey:",_79));
}
return _7a;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_7d,_7e,_7f){
with(_7d){
objj_msgSendSuper({receiver:_7d,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_7f);
objj_msgSend(_7f,"encodeBool:forKey:",_isEditable,_71);
objj_msgSend(_7f,"encodeBool:forKey:",_isSelectable,_72);
objj_msgSend(_7f,"encodeBool:forKey:",_drawsBackground,_76);
objj_msgSend(_7f,"encodeObject:forKey:",_textFieldBackgroundColor,_78);
objj_msgSend(_7f,"encodeObject:forKey:",_placeholderString,_79);
}
})]);
