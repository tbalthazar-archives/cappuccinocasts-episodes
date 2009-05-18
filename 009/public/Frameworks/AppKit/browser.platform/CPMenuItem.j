I;20;Foundation/CPCoder.jI;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;16;AppKit/CPImage.jI;15;AppKit/CPMenu.jI;15;AppKit/CPView.jc;23007;
var _1=objj_allocateClassPair(CPObject,"CPMenuItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_title"),new objj_ivar("_font"),new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_isEnabled"),new objj_ivar("_isHidden"),new objj_ivar("_tag"),new objj_ivar("_state"),new objj_ivar("_image"),new objj_ivar("_alternateImage"),new objj_ivar("_onStateImage"),new objj_ivar("_offStateImage"),new objj_ivar("_mixedStateImage"),new objj_ivar("_submenu"),new objj_ivar("_menu"),new objj_ivar("_keyEquivalent"),new objj_ivar("_keyEquivalentModifierMask"),new objj_ivar("_mnemonicLocation"),new objj_ivar("_isAlternate"),new objj_ivar("_indentationLevel"),new objj_ivar("_toolTip"),new objj_ivar("_representedObject"),new objj_ivar("_view"),new objj_ivar("_menuItemView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithTitle:action:keyEquivalent:"),function(_3,_4,_5,_6,_7){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPObject")},"init");
if(_3){
_title=_5;
_action=_6;
_isEnabled=YES;
_tag=0;
_state=CPOffState;
_keyEquivalent=_7||"";
_keyEquivalentModifierMask=CPPlatformActionKeyMask;
_mnemonicLocation=CPNotFound;
}
return _3;
}
}),new objj_method(sel_getUid("setEnabled:"),function(_8,_9,_a){
with(_8){
if(objj_msgSend(_menu,"autoenablesItems")){
return;
}
_isEnabled=_a;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_8);
}
}),new objj_method(sel_getUid("isEnabled"),function(_b,_c){
with(_b){
return _isEnabled;
}
}),new objj_method(sel_getUid("setHidden:"),function(_d,_e,_f){
with(_d){
if(_isHidden==_f){
return;
}
_isHidden=_f;
objj_msgSend(_menu,"itemChanged:",_d);
}
}),new objj_method(sel_getUid("isHidden"),function(_10,_11){
with(_10){
return _isHidden;
}
}),new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"),function(_12,_13){
with(_12){
if(_isHidden){
return YES;
}
var _14=objj_msgSend(_menu,"supermenu");
if(objj_msgSend(objj_msgSend(_14,"itemAtIndex:",objj_msgSend(_14,"indexOfItemWithSubmenu:",_menu)),"isHiddenOrHasHiddenAncestor")){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("setTarget:"),function(_15,_16,_17){
with(_15){
_target=_17;
}
}),new objj_method(sel_getUid("target"),function(_18,_19){
with(_18){
return _target;
}
}),new objj_method(sel_getUid("setAction:"),function(_1a,_1b,_1c){
with(_1a){
_action=_1c;
}
}),new objj_method(sel_getUid("action"),function(_1d,_1e){
with(_1d){
return _action;
}
}),new objj_method(sel_getUid("setTitle:"),function(_1f,_20,_21){
with(_1f){
_mnemonicLocation=CPNotFound;
if(_title==_21){
return;
}
_title=_21;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_1f);
}
}),new objj_method(sel_getUid("title"),function(_22,_23){
with(_22){
return _title;
}
}),new objj_method(sel_getUid("setTextColor:"),function(_24,_25,_26){
with(_24){
}
}),new objj_method(sel_getUid("setFont:"),function(_27,_28,_29){
with(_27){
if(_font==_29){
return;
}
_font=_29;
objj_msgSend(_menu,"itemChanged:",_27);
objj_msgSend(_menuItemView,"setDirty");
}
}),new objj_method(sel_getUid("font"),function(_2a,_2b){
with(_2a){
return _font;
}
}),new objj_method(sel_getUid("setTag:"),function(_2c,_2d,_2e){
with(_2c){
_tag=_2e;
}
}),new objj_method(sel_getUid("tag"),function(_2f,_30){
with(_2f){
return _tag;
}
}),new objj_method(sel_getUid("setState:"),function(_31,_32,_33){
with(_31){
if(_state==_33){
return;
}
_state=_33;
objj_msgSend(_menu,"itemChanged:",_31);
objj_msgSend(_menuItemView,"setDirty");
}
}),new objj_method(sel_getUid("state"),function(_34,_35){
with(_34){
return _state;
}
}),new objj_method(sel_getUid("setImage:"),function(_36,_37,_38){
with(_36){
if(_image==_38){
return;
}
_image=_38;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_36);
}
}),new objj_method(sel_getUid("image"),function(_39,_3a){
with(_39){
return _image;
}
}),new objj_method(sel_getUid("setAlternateImage:"),function(_3b,_3c,_3d){
with(_3b){
_alternateImage=_3d;
}
}),new objj_method(sel_getUid("alternateImage"),function(_3e,_3f){
with(_3e){
return _alternateImage;
}
}),new objj_method(sel_getUid("setOnStateImage:"),function(_40,_41,_42){
with(_40){
if(_onStateImage==_42){
return;
}
_onStateImage=_42;
objj_msgSend(_menu,"itemChanged:",_40);
}
}),new objj_method(sel_getUid("onStateImage"),function(_43,_44){
with(_43){
return _onStateImage;
}
}),new objj_method(sel_getUid("setOffStateImage:"),function(_45,_46,_47){
with(_45){
if(_offStateImage==_47){
return;
}
_offStateImage=_47;
objj_msgSend(_menu,"itemChanged:",_45);
}
}),new objj_method(sel_getUid("offStateImage"),function(_48,_49){
with(_48){
return _offStateImage;
}
}),new objj_method(sel_getUid("setMixedStateImage:"),function(_4a,_4b,_4c){
with(_4a){
if(_mixedStateImage==_4c){
return;
}
_mixedStateImage=_4c;
objj_msgSend(_menu,"itemChanged:",_4a);
}
}),new objj_method(sel_getUid("mixedStateImage"),function(_4d,_4e){
with(_4d){
return _mixedStateImage;
}
}),new objj_method(sel_getUid("setSubmenu:"),function(_4f,_50,_51){
with(_4f){
var _52=objj_msgSend(_submenu,"supermenu");
if(_52==_4f){
return;
}
if(_52){
return alert("bad");
}
objj_msgSend(_submenu,"setSupermenu:",_menu);
_submenu=_51;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_4f);
}
}),new objj_method(sel_getUid("submenu"),function(_53,_54){
with(_53){
return _submenu;
}
}),new objj_method(sel_getUid("hasSubmenu"),function(_55,_56){
with(_55){
return _submenu?YES:NO;
}
}),new objj_method(sel_getUid("isSeparatorItem"),function(_57,_58){
with(_57){
return NO;
}
}),new objj_method(sel_getUid("setMenu:"),function(_59,_5a,_5b){
with(_59){
_menu=_5b;
}
}),new objj_method(sel_getUid("menu"),function(_5c,_5d){
with(_5c){
return _menu;
}
}),new objj_method(sel_getUid("setKeyEquivalent:"),function(_5e,_5f,_60){
with(_5e){
_keyEquivalent=_60||"";
}
}),new objj_method(sel_getUid("keyEquivalent"),function(_61,_62){
with(_61){
return _keyEquivalent;
}
}),new objj_method(sel_getUid("setKeyEquivalentModifierMask:"),function(_63,_64,_65){
with(_63){
_keyEquivalentModifierMask=_65;
}
}),new objj_method(sel_getUid("keyEquivalentModifierMask"),function(_66,_67){
with(_66){
return _keyEquivalentModifierMask;
}
}),new objj_method(sel_getUid("setMnemonicLocation:"),function(_68,_69,_6a){
with(_68){
_mnemonicLocation=_6a;
}
}),new objj_method(sel_getUid("mnemonicLocation"),function(_6b,_6c){
with(_6b){
return _mnemonicLocation;
}
}),new objj_method(sel_getUid("setTitleWithMnemonicLocation:"),function(_6d,_6e,_6f){
with(_6d){
var _70=objj_msgSend(_6f,"rangeOfString:","&").location;
if(_70==CPNotFound){
objj_msgSend(_6d,"setTitle:",_6f);
}else{
objj_msgSend(_6d,"setTitle:",objj_msgSend(_6f,"substringToIndex:",_70)+objj_msgSend(_6f,"substringFromIndex:",_70+1));
objj_msgSend(_6d,"setMnemonicLocation:",_70);
}
}
}),new objj_method(sel_getUid("mnemonic"),function(_71,_72){
with(_71){
return _mnemonicLocation==CPNotFound?"":objj_msgSend(_title,"characterAtIndex:",_mnemonicLocation);
}
}),new objj_method(sel_getUid("setAlternate:"),function(_73,_74,_75){
with(_73){
_isAlternate=_75;
}
}),new objj_method(sel_getUid("isAlternate"),function(_76,_77){
with(_76){
return _isAlternate;
}
}),new objj_method(sel_getUid("setIndentationLevel:"),function(_78,_79,_7a){
with(_78){
if(_7a<0){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"setIndentationLevel: argument must be greater than 0.");
}
_indentationLevel=MIN(15,_7a);
}
}),new objj_method(sel_getUid("indentationLevel"),function(_7b,_7c){
with(_7b){
return _indentationLevel;
}
}),new objj_method(sel_getUid("setToolTip:"),function(_7d,_7e,_7f){
with(_7d){
_toolTip=_7f;
}
}),new objj_method(sel_getUid("toolTip"),function(_80,_81){
with(_80){
return _toolTip;
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(_82,_83,_84){
with(_82){
_representedObject=_84;
}
}),new objj_method(sel_getUid("representedObject"),function(_85,_86){
with(_85){
return _representedObject;
}
}),new objj_method(sel_getUid("setView:"),function(_87,_88,_89){
with(_87){
if(_view===_89){
return;
}
_view=_89;
objj_msgSend(_menuItemView,"setDirty");
objj_msgSend(_menu,"itemChanged:",_87);
}
}),new objj_method(sel_getUid("view"),function(_8a,_8b){
with(_8a){
return _view;
}
}),new objj_method(sel_getUid("isHighlighted"),function(_8c,_8d){
with(_8c){
return objj_msgSend(objj_msgSend(_8c,"menu"),"highlightedItem")==_8c;
}
}),new objj_method(sel_getUid("_menuItemView"),function(_8e,_8f){
with(_8e){
if(!_menuItemView){
_menuItemView=objj_msgSend(objj_msgSend(_CPMenuItemView,"alloc"),"initWithFrame:forMenuItem:",CGRectMakeZero(),_8e);
}
return _menuItemView;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("separatorItem"),function(_90,_91){
with(_90){
return objj_msgSend(objj_msgSend(_CPMenuItemSeparator,"alloc"),"init");
}
})]);
var _1=objj_allocateClassPair(CPMenuItem,"_CPMenuItemSeparator"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_92,_93){
with(_92){
_92=objj_msgSendSuper({receiver:_92,super_class:objj_getClass("CPMenuItem")},"initWithTitle:action:keyEquivalent:","",nil,nil);
if(_92){
objj_msgSend(_92,"setEnabled:",NO);
}
return _92;
}
}),new objj_method(sel_getUid("isSeparatorItem"),function(_94,_95){
with(_94){
return YES;
}
})]);
var _96="CPMenuItemTitleKey",_97="CPMenuItemTargetKey",_98="CPMenuItemActionKey",_99="CPMenuItemIsEnabledKey",_9a="CPMenuItemIsHiddenKey",_9b="CPMenuItemTagKey",_9c="CPMenuItemImageKey",_9d="CPMenuItemAlternateImageKey",_9e="CPMenuItemSubmenuKey",_9f="CPMenuItemMenuKey",_a0="CPMenuItemRepresentedObjectKey",_a1="CPMenuItemViewKey";
var _1=objj_getClass("CPMenuItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPMenuItem\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_a2,_a3,_a4){
with(_a2){
_a2=objj_msgSendSuper({receiver:_a2,super_class:objj_getClass("CPObject")},"init");
if(_a2){
_title=objj_msgSend(_a4,"decodeObjectForKey:",_96);
_target=objj_msgSend(_a4,"decodeObjectForKey:",_97);
_action=objj_msgSend(_a4,"decodeObjectForKey:",_98);
_isEnabled=objj_msgSend(_a4,"containsValueForKey:",(_99))?objj_msgSend(_a4,"decodeObjectForKey:",(_99)):(YES);
_isHidden=objj_msgSend(_a4,"containsValueForKey:",(_9a))?objj_msgSend(_a4,"decodeObjectForKey:",(_9a)):(NO);
_tag=objj_msgSend(_a4,"containsValueForKey:",(_9b))?objj_msgSend(_a4,"decodeObjectForKey:",(_9b)):(0);
_image=objj_msgSend(_a4,"containsValueForKey:",(_9c))?objj_msgSend(_a4,"decodeObjectForKey:",(_9c)):(nil);
_alternateImage=objj_msgSend(_a4,"containsValueForKey:",(_9d))?objj_msgSend(_a4,"decodeObjectForKey:",(_9d)):(nil);
_submenu=objj_msgSend(_a4,"containsValueForKey:",(_9e))?objj_msgSend(_a4,"decodeObjectForKey:",(_9e)):(nil);
_menu=objj_msgSend(_a4,"containsValueForKey:",(_9f))?objj_msgSend(_a4,"decodeObjectForKey:",(_9f)):(nil);
_representedObject=objj_msgSend(_a4,"containsValueForKey:",(_a0))?objj_msgSend(_a4,"decodeObjectForKey:",(_a0)):(nil);
_view=objj_msgSend(_a4,"containsValueForKey:",(_a1))?objj_msgSend(_a4,"decodeObjectForKey:",(_a1)):(nil);
}
return _a2;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a5,_a6,_a7){
with(_a5){
objj_msgSend(_a7,"encodeObject:forKey:",_title,_96);
objj_msgSend(_a7,"encodeObject:forKey:",_target,_97);
objj_msgSend(_a7,"encodeObject:forKey:",_action,_98);
if((_isEnabled)!==(YES)){
objj_msgSend(_a7,"encodeObject:forKey:",(_isEnabled),(_99));
}
if((_isHidden)!==(NO)){
objj_msgSend(_a7,"encodeObject:forKey:",(_isHidden),(_9a));
}
if((_tag)!==(0)){
objj_msgSend(_a7,"encodeObject:forKey:",(_tag),(_9b));
}
if((_image)!==(nil)){
objj_msgSend(_a7,"encodeObject:forKey:",(_image),(_9c));
}
if((_alternateImage)!==(nil)){
objj_msgSend(_a7,"encodeObject:forKey:",(_alternateImage),(_9d));
}
if((_submenu)!==(nil)){
objj_msgSend(_a7,"encodeObject:forKey:",(_submenu),(_9e));
}
if((_menu)!==(nil)){
objj_msgSend(_a7,"encodeObject:forKey:",(_menu),(_9f));
}
if((_representedObject)!==(nil)){
objj_msgSend(_a7,"encodeObject:forKey:",(_representedObject),(_a0));
}
if((_view)!==(nil)){
objj_msgSend(_a7,"encodeObject:forKey:",(_view),(_a1));
}
}
})]);
var _a8=3,_a9=16,_aa=14,_ab=17,_ac=4;
var _ad=nil,_ae=nil,_af=[],_b0=[];
var _1=objj_allocateClassPair(CPView,"_CPMenuItemView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_menuItem"),new objj_ivar("_font"),new objj_ivar("_textColor"),new objj_ivar("_textShadowColor"),new objj_ivar("_activateColor"),new objj_ivar("_activateShadowColor"),new objj_ivar("_minSize"),new objj_ivar("_isDirty"),new objj_ivar("_showsStateColumn"),new objj_ivar("_belongsToMenuBar"),new objj_ivar("_stateView"),new objj_ivar("_imageAndTextView"),new objj_ivar("_submenuView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:forMenuItem:"),function(_b1,_b2,_b3,_b4){
with(_b1){
_b1=objj_msgSendSuper({receiver:_b1,super_class:objj_getClass("CPView")},"initWithFrame:",_b3);
if(_b1){
_menuItem=_b4;
_showsStateColumn=YES;
_isDirty=YES;
objj_msgSend(_b1,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_b1,"synchronizeWithMenuItem");
}
return _b1;
}
}),new objj_method(sel_getUid("minSize"),function(_b5,_b6){
with(_b5){
return _minSize;
}
}),new objj_method(sel_getUid("setDirty"),function(_b7,_b8){
with(_b7){
_isDirty=YES;
}
}),new objj_method(sel_getUid("synchronizeWithMenuItem"),function(_b9,_ba){
with(_b9){
if(!_isDirty){
return;
}
_isDirty=NO;
var _bb=objj_msgSend(_menuItem,"view");
if(objj_msgSend(_menuItem,"isSeparatorItem")){
var _bc=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,5,10,1));
_bb=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,0,10));
objj_msgSend(_bb,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_bc,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_bc,"setBackgroundColor:",objj_msgSend(CPColor,"lightGrayColor"));
objj_msgSend(_bb,"addSubview:",_bc);
}
if(_bb){
objj_msgSend(_imageAndTextView,"removeFromSuperview");
_imageAndTextView=nil;
objj_msgSend(_stateView,"removeFromSuperview");
_stateView=nil;
objj_msgSend(_submenuView,"removeFromSuperview");
_submenuView=nil;
_minSize=objj_msgSend(_bb,"frame").size;
objj_msgSend(_b9,"setFrameSize:",_minSize);
objj_msgSend(_b9,"addSubview:",_bb);
return;
}
var x=_belongsToMenuBar?0:(_a8+objj_msgSend(_menuItem,"indentationLevel")*_ab);
if(_showsStateColumn){
if(!_stateView){
_stateView=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(x,(CGRectGetHeight(objj_msgSend(_b9,"frame"))-_aa)/2,_aa,_aa));
objj_msgSend(_stateView,"setAutoresizingMask:",CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(_b9,"addSubview:",_stateView);
}
var _be=objj_msgSend(_menuItem,"state");
switch(_be){
case CPOffState:
case CPOnState:
case CPMixedState:
objj_msgSend(_stateView,"setImage:",_af[_be]);
break;
default:
objj_msgSend(_stateView,"setImage:",nil);
}
x+=_aa;
}else{
objj_msgSend(_stateView,"removeFromSuperview");
_stateView=nil;
}
if(!_imageAndTextView){
_imageAndTextView=objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",CGRectMake(0,0,0,0));
objj_msgSend(_imageAndTextView,"setImagePosition:",CPImageLeft);
objj_msgSend(_imageAndTextView,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_b9,"addSubview:",_imageAndTextView);
}
var _bf=objj_msgSend(_menuItem,"font");
if(!_bf){
_bf=_font;
}
objj_msgSend(_imageAndTextView,"setFont:",_bf);
objj_msgSend(_imageAndTextView,"setVerticalAlignment:",CPCenterVerticalTextAlignment);
objj_msgSend(_imageAndTextView,"setImage:",objj_msgSend(_menuItem,"image"));
objj_msgSend(_imageAndTextView,"setText:",objj_msgSend(_menuItem,"title"));
objj_msgSend(_imageAndTextView,"setTextColor:",objj_msgSend(_b9,"textColor"));
objj_msgSend(_imageAndTextView,"setTextShadowColor:",objj_msgSend(_b9,"textShadowColor"));
objj_msgSend(_imageAndTextView,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_imageAndTextView,"setFrameOrigin:",CGPointMake(x,_ac));
objj_msgSend(_imageAndTextView,"sizeToFit");
var _c0=objj_msgSend(_imageAndTextView,"frame");
_c0.size.height+=2*_ac;
x+=CGRectGetWidth(_c0);
if(objj_msgSend(_menuItem,"hasSubmenu")){
x+=3;
if(!_submenuView){
_submenuView=objj_msgSend(objj_msgSend(_CPMenuItemArrowView,"alloc"),"initWithFrame:",CGRectMake(0,0,10,10));
objj_msgSend(_b9,"addSubview:",_submenuView);
}
objj_msgSend(_submenuView,"setHidden:",NO);
objj_msgSend(_submenuView,"setColor:",_belongsToMenuBar?objj_msgSend(_b9,"textColor"):nil);
objj_msgSend(_submenuView,"setFrameOrigin:",CGPointMake(x,(CGRectGetHeight(_c0)-10)/2));
x+=10;
}else{
objj_msgSend(_submenuView,"setHidden:",YES);
}
_minSize=CGSizeMake(x+(_belongsToMenuBar?0:_a9)+3,CGRectGetHeight(_c0));
objj_msgSend(_b9,"setFrameSize:",_minSize);
}
}),new objj_method(sel_getUid("overlapOffsetWidth"),function(_c1,_c2){
with(_c1){
return _a8+(objj_msgSend(objj_msgSend(_menuItem,"menu"),"showsStateColumn")?_aa:0);
}
}),new objj_method(sel_getUid("setShowsStateColumn:"),function(_c3,_c4,_c5){
with(_c3){
_showsStateColumn=_c5;
}
}),new objj_method(sel_getUid("setBelongsToMenuBar:"),function(_c6,_c7,_c8){
with(_c6){
_belongsToMenuBar=_c8;
}
}),new objj_method(sel_getUid("highlight:"),function(_c9,_ca,_cb){
with(_c9){
if(_belongsToMenuBar){
objj_msgSend(_imageAndTextView,"setImage:",_cb?objj_msgSend(_menuItem,"alternateImage"):objj_msgSend(_menuItem,"image"));
}else{
if(objj_msgSend(_menuItem,"isEnabled")){
if(_cb){
objj_msgSend(_c9,"setBackgroundColor:",_ad);
objj_msgSend(_imageAndTextView,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_imageAndTextView,"setTextShadowColor:",_ae);
}else{
objj_msgSend(_c9,"setBackgroundColor:",nil);
objj_msgSend(_imageAndTextView,"setTextColor:",objj_msgSend(_c9,"textColor"));
objj_msgSend(_imageAndTextView,"setTextShadowColor:",objj_msgSend(_c9,"textShadowColor"));
}
var _cc=objj_msgSend(_menuItem,"state");
switch(_cc){
case CPOffState:
case CPOnState:
case CPMixedState:
objj_msgSend(_stateView,"setImage:",_cb?_b0[_cc]:_af[_cc]);
break;
default:
objj_msgSend(_stateView,"setImage:",nil);
}
}
}
}
}),new objj_method(sel_getUid("activate:"),function(_cd,_ce,_cf){
with(_cd){
objj_msgSend(_imageAndTextView,"setImage:",objj_msgSend(_menuItem,"image"));
if(_cf){
objj_msgSend(_imageAndTextView,"setTextColor:",objj_msgSend(_cd,"activateColor")||objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_imageAndTextView,"setTextShadowColor:",objj_msgSend(_cd,"activateShadowColor")||objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_submenuView,"setColor:",objj_msgSend(_cd,"activateColor")||objj_msgSend(CPColor,"whiteColor"));
}else{
objj_msgSend(_imageAndTextView,"setTextColor:",objj_msgSend(_cd,"textColor"));
objj_msgSend(_imageAndTextView,"setTextShadowColor:",objj_msgSend(_cd,"textShadowColor"));
objj_msgSend(_submenuView,"setColor:",objj_msgSend(_cd,"textColor"));
}
}
}),new objj_method(sel_getUid("eventOnSubmenu:"),function(_d0,_d1,_d2){
with(_d0){
if(!objj_msgSend(_menuItem,"hasSubmenu")){
return NO;
}
return CGRectContainsPoint(objj_msgSend(_submenuView,"frame"),objj_msgSend(_d0,"convertPoint:fromView:",objj_msgSend(_d2,"locationInWindow"),nil));
}
}),new objj_method(sel_getUid("isHidden"),function(_d3,_d4){
with(_d3){
return objj_msgSend(_menuItem,"isHidden");
}
}),new objj_method(sel_getUid("menuItem"),function(_d5,_d6){
with(_d5){
return _menuItem;
}
}),new objj_method(sel_getUid("setFont:"),function(_d7,_d8,_d9){
with(_d7){
if(_font==_d9){
return;
}
_font=_d9;
objj_msgSend(_d7,"setDirty");
}
}),new objj_method(sel_getUid("setTextColor:"),function(_da,_db,_dc){
with(_da){
if(_textColor==_dc){
return;
}
_textColor=_dc;
objj_msgSend(_imageAndTextView,"setTextColor:",objj_msgSend(_da,"textColor"));
objj_msgSend(_submenuView,"setColor:",objj_msgSend(_da,"textColor"));
}
}),new objj_method(sel_getUid("textColor"),function(_dd,_de){
with(_dd){
return objj_msgSend(_menuItem,"isEnabled")?(_textColor?_textColor:objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",70/255,69/255,69/255,1)):objj_msgSend(CPColor,"darkGrayColor");
}
}),new objj_method(sel_getUid("setTextShadowColor:"),function(_df,_e0,_e1){
with(_df){
if(_textShadowColor==_e1){
return;
}
_textShadowColor=_e1;
objj_msgSend(_imageAndTextView,"setTextShadowColor:",objj_msgSend(_df,"textShadowColor"));
}
}),new objj_method(sel_getUid("textShadowColor"),function(_e2,_e3){
with(_e2){
return objj_msgSend(_menuItem,"isEnabled")?(_textShadowColor?_textShadowColor:objj_msgSend(CPColor,"colorWithWhite:alpha:",1,0.8)):objj_msgSend(CPColor,"colorWithWhite:alpha:",0.8,0.8);
}
}),new objj_method(sel_getUid("setActivateColor:"),function(_e4,_e5,_e6){
with(_e4){
_activateColor=_e6;
}
}),new objj_method(sel_getUid("activateColor"),function(_e7,_e8){
with(_e7){
return _activateColor;
}
}),new objj_method(sel_getUid("setActivateShadowColor:"),function(_e9,_ea,_eb){
with(_e9){
_activateShadowColor=_eb;
}
}),new objj_method(sel_getUid("activateShadowColor"),function(_ec,_ed){
with(_ec){
return _activateShadowColor;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("initialize"),function(_ee,_ef){
with(_ee){
if(_ee!=objj_msgSend(_CPMenuItemView,"class")){
return;
}
_ad=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",95/255,131/255,185/255,1);
_ae=objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",26/255,73/255,109/255,1);
var _f0=objj_msgSend(CPBundle,"bundleForClass:",_ee);
_af[CPOffState]=nil;
_b0[CPOffState]=nil;
_af[CPOnState]=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f0,"pathForResource:","CPMenuItem/CPMenuItemOnState.png"),CGSizeMake(14,14));
_b0[CPOnState]=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_f0,"pathForResource:","CPMenuItem/CPMenuItemOnStateHighlighted.png"),CGSizeMake(14,14));
_af[CPMixedState]=nil;
_b0[CPMixedState]=nil;
}
}),new objj_method(sel_getUid("leftMargin"),function(_f1,_f2){
with(_f1){
return _a8+_aa;
}
})]);
var _1=objj_allocateClassPair(CPView,"_CPMenuItemArrowView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_color")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("setColor:"),function(_f3,_f4,_f5){
with(_f3){
if(_color==_f5){
return;
}
_color=_f5;
objj_msgSend(_f3,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("drawRect:"),function(_f6,_f7,_f8){
with(_f6){
var _f9=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextBeginPath(_f9);
CGContextMoveToPoint(_f9,1,4);
CGContextAddLineToPoint(_f9,9,4);
CGContextAddLineToPoint(_f9,5,8);
CGContextAddLineToPoint(_f9,1,4);
CGContextClosePath(_f9);
CGContextSetFillColor(_f9,_color);
CGContextFillPath(_f9);
}
})]);
