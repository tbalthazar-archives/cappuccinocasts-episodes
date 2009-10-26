I;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;16;AppKit/CPImage.jI;15;AppKit/CPView.jc;9830;
CPToolbarItemVisibilityPriorityStandard=0;
CPToolbarItemVisibilityPriorityLow=-1000;
CPToolbarItemVisibilityPriorityHigh=1000;
CPToolbarItemVisibilityPriorityUser=2000;
CPToolbarSeparatorItemIdentifier="CPToolbarSeparatorItemIdentifier";
CPToolbarSpaceItemIdentifier="CPToolbarSpaceItemIdentifier";
CPToolbarFlexibleSpaceItemIdentifier="CPToolbarFlexibleSpaceItemIdentifier";
CPToolbarShowColorsItemIdentifier="CPToolbarShowColorsItemIdentifier";
CPToolbarShowFontsItemIdentifier="CPToolbarShowFontsItemIdentifier";
CPToolbarCustomizeToolbarItemIdentifier="CPToolbarCustomizeToolbarItemIdentifier";
CPToolbarPrintItemIdentifier="CPToolbarPrintItemIdentifier";
var _1=objj_allocateClassPair(CPObject,"CPToolbarItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_itemIdentifier"),new objj_ivar("_toolbar"),new objj_ivar("_label"),new objj_ivar("_paletteLabel"),new objj_ivar("_toolTip"),new objj_ivar("_tag"),new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_isEnabled"),new objj_ivar("_image"),new objj_ivar("_alternateImage"),new objj_ivar("_view"),new objj_ivar("_minSize"),new objj_ivar("_maxSize"),new objj_ivar("_visibilityPriority")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"initWithItemIdentifier:","");
}
}),new objj_method(sel_getUid("initWithItemIdentifier:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_itemIdentifier=_7;
_tag=0;
_isEnabled=YES;
_minSize=CGSizeMakeZero();
_maxSize=CGSizeMakeZero();
_visibilityPriority=CPToolbarItemVisibilityPriorityStandard;
}
return _5;
}
}),new objj_method(sel_getUid("itemIdentifier"),function(_8,_9){
with(_8){
return _itemIdentifier;
}
}),new objj_method(sel_getUid("toolbar"),function(_a,_b){
with(_a){
return _toolbar;
}
}),new objj_method(sel_getUid("label"),function(_c,_d){
with(_c){
return _label;
}
}),new objj_method(sel_getUid("setLabel:"),function(_e,_f,_10){
with(_e){
_label=_10;
}
}),new objj_method(sel_getUid("paletteLabel"),function(_11,_12){
with(_11){
return _paletteLabel;
}
}),new objj_method(sel_getUid("setPaletteLabel:"),function(_13,_14,_15){
with(_13){
_paletteLabel=_15;
}
}),new objj_method(sel_getUid("toolTip"),function(_16,_17){
with(_16){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("toolTip"))){
return objj_msgSend(_view,"toolTip");
}
return _toolTip;
}
}),new objj_method(sel_getUid("setToolTip:"),function(_18,_19,_1a){
with(_18){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setToolTip:"))){
objj_msgSend(view,"setToolTip:",_1a);
}
_toolTip=_1a;
}
}),new objj_method(sel_getUid("tag"),function(_1b,_1c){
with(_1b){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("tag"))){
return objj_msgSend(_view,"tag");
}
return _tag;
}
}),new objj_method(sel_getUid("setTag:"),function(_1d,_1e,_1f){
with(_1d){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setTag:"))){
objj_msgSend(_view,"setTag:",_1f);
}
_tag=_1f;
}
}),new objj_method(sel_getUid("target"),function(_20,_21){
with(_20){
if(_view){
return objj_msgSend(_view,"respondsToSelector:",sel_getUid("target"))?objj_msgSend(_view,"target"):nil;
}
return _target;
}
}),new objj_method(sel_getUid("setTarget:"),function(_22,_23,_24){
with(_22){
if(!_view){
_target=_24;
}else{
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setTarget:"))){
objj_msgSend(_view,"setTarget:",_24);
}
}
}
}),new objj_method(sel_getUid("action"),function(_25,_26){
with(_25){
if(_view){
return objj_msgSend(_view,"respondsToSelector:",sel_getUid("action"))?objj_msgSend(_view,"action"):nil;
}
return _action;
}
}),new objj_method(sel_getUid("setAction:"),function(_27,_28,_29){
with(_27){
if(!_view){
_action=_29;
}else{
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setAction:"))){
objj_msgSend(_view,"setAction:",_29);
}
}
}
}),new objj_method(sel_getUid("isEnabled"),function(_2a,_2b){
with(_2a){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("isEnabled"))){
return objj_msgSend(_view,"isEnabled");
}
return _isEnabled;
}
}),new objj_method(sel_getUid("setEnabled:"),function(_2c,_2d,_2e){
with(_2c){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setEnabled:"))){
objj_msgSend(_view,"setEnabled:",_2e);
}
_isEnabled=_2e;
}
}),new objj_method(sel_getUid("image"),function(_2f,_30){
with(_2f){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("image"))){
return objj_msgSend(_view,"image");
}
return _image;
}
}),new objj_method(sel_getUid("setImage:"),function(_31,_32,_33){
with(_31){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setImage:"))){
objj_msgSend(_view,"setImage:",_33);
}
_image=_33;
if(!_image){
return;
}
if(_minSize.width==0&&_minSize.height==0&&_maxSize.width==0&&_maxSize.height==0){
var _34=objj_msgSend(_image,"size");
if(_34.width>0||_34.height>0){
objj_msgSend(_31,"setMinSize:",_34);
objj_msgSend(_31,"setMaxSize:",_34);
}
}
}
}),new objj_method(sel_getUid("setAlternateImage:"),function(_35,_36,_37){
with(_35){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("setAlternateImage:"))){
objj_msgSend(_view,"setAlternateImage:",_37);
}
_alternateImage=_37;
}
}),new objj_method(sel_getUid("alternateImage"),function(_38,_39){
with(_38){
if(objj_msgSend(_view,"respondsToSelector:",sel_getUid("alternateIamge"))){
return objj_msgSend(_view,"alternateImage");
}
return _alternateImage;
}
}),new objj_method(sel_getUid("view"),function(_3a,_3b){
with(_3a){
return _view;
}
}),new objj_method(sel_getUid("setView:"),function(_3c,_3d,_3e){
with(_3c){
if(_view==_3e){
return;
}
_view=_3e;
if(_view){
if(_tag!==0&&objj_msgSend(_view,"respondsToSelector:",sel_getUid("setTag:"))){
objj_msgSend(_view,"setTag:",_tag);
}
_target=nil;
_action=nil;
}
}
}),new objj_method(sel_getUid("minSize"),function(_3f,_40){
with(_3f){
return _minSize;
}
}),new objj_method(sel_getUid("setMinSize:"),function(_41,_42,_43){
with(_41){
_minSize=CGSizeMakeCopy(_43);
_maxSize=CGSizeMake(MAX(_minSize.width,_maxSize.width),MAX(_minSize.height,_maxSize.height));
}
}),new objj_method(sel_getUid("maxSize"),function(_44,_45){
with(_44){
return _maxSize;
}
}),new objj_method(sel_getUid("setMaxSize:"),function(_46,_47,_48){
with(_46){
_maxSize=CGSizeMakeCopy(_48);
_minSize=CGSizeMake(MIN(_minSize.width,_maxSize.width),MIN(_minSize.height,_maxSize.height));
}
}),new objj_method(sel_getUid("visibilityPriority"),function(_49,_4a){
with(_49){
return _visibilityPriority;
}
}),new objj_method(sel_getUid("setVisibilityPriority:"),function(_4b,_4c,_4d){
with(_4b){
_visibilityPriority=_4d;
}
})]);
var _1=objj_getClass("CPToolbarItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPToolbarItem\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("copy"),function(_4e,_4f){
with(_4e){
var _50=objj_msgSend(objj_msgSend(objj_msgSend(_4e,"class"),"alloc"),"initWithItemIdentifier:",_itemIdentifier);
if(_view){
objj_msgSend(_50,"setView:",objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_view)));
}
objj_msgSend(_50,"setLabel:",_label);
objj_msgSend(_50,"setPaletteLabel:",_paletteLabel);
objj_msgSend(_50,"setToolTip:",objj_msgSend(_4e,"toolTip"));
objj_msgSend(_50,"setTag:",objj_msgSend(_4e,"tag"));
objj_msgSend(_50,"setTarget:",objj_msgSend(_4e,"target"));
objj_msgSend(_50,"setAction:",objj_msgSend(_4e,"action"));
objj_msgSend(_50,"setEnabled:",objj_msgSend(_4e,"isEnabled"));
objj_msgSend(_50,"setImage:",objj_msgSend(_4e,"image"));
objj_msgSend(_50,"setAlternateImage:",objj_msgSend(_4e,"alternateImage"));
objj_msgSend(_50,"setMinSize:",_minSize);
objj_msgSend(_50,"setMaxSize:",_maxSize);
objj_msgSend(_50,"setVisibilityPriority:",_visibilityPriority);
return _50;
}
})]);
var _51=nil,_52=nil;
var _1=objj_getClass("CPToolbarItem");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPToolbarItem\""));
}
var _2=_1.isa;
class_addMethods(_2,[new objj_method(sel_getUid("_separatorItemView"),function(_53,_54){
with(_53){
if(!_51){
_51=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,2,32));
sizes={};
sizes["CPToolbarItemSeparator"]=[CGSizeMake(2,26),CGSizeMake(2,1),CGSizeMake(2,26)];
objj_msgSend(_51,"setBackgroundColor:",_CPControlThreePartImagePattern(YES,sizes,"CPToolbarItem","Separator"));
}
return _51;
}
}),new objj_method(sel_getUid("_spaceItemView"),function(_55,_56){
with(_55){
if(!_52){
_52=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
}
return _52;
}
}),new objj_method(sel_getUid("_standardItemWithItemIdentifier:"),function(_57,_58,_59){
with(_57){
var _5a=objj_msgSend(objj_msgSend(CPToolbarItem,"alloc"),"initWithItemIdentifier:",_59);
switch(_59){
case CPToolbarSeparatorItemIdentifier:
objj_msgSend(_5a,"setView:",objj_msgSend(_57,"_separatorItemView"));
objj_msgSend(_5a,"setMinSize:",CGSizeMake(2,0));
objj_msgSend(_5a,"setMaxSize:",CGSizeMake(2,100000));
return _5a;
case CPToolbarSpaceItemIdentifier:
objj_msgSend(_5a,"setView:",objj_msgSend(_57,"_spaceItemView"));
objj_msgSend(_5a,"setMinSize:",CGSizeMake(32,32));
objj_msgSend(_5a,"setMaxSize:",CGSizeMake(32,32));
return _5a;
case CPToolbarFlexibleSpaceItemIdentifier:
objj_msgSend(_5a,"setView:",objj_msgSend(_57,"_spaceItemView"));
objj_msgSend(_5a,"setMinSize:",CGSizeMake(32,32));
objj_msgSend(_5a,"setMaxSize:",CGSizeMake(10000,32));
return _5a;
case CPToolbarShowColorsItemIdentifier:
return nil;
case CPToolbarShowFontsItemIdentifier:
return nil;
case CPToolbarCustomizeToolbarItemIdentifier:
return nil;
case CPToolbarPrintItemIdentifier:
return nil;
}
return nil;
}
})]);
