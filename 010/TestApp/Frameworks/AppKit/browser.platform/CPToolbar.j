I;21;Foundation/CPObject.ji;15;CPPopUpButton.ji;15;CPToolbarItem.jc;17354;
CPToolbarDisplayModeDefault=0;
CPToolbarDisplayModeIconAndLabel=1;
CPToolbarDisplayModeIconOnly=2;
CPToolbarDisplayModeLabelOnly=3;
var _1=nil;
var _2=nil;
var _3=objj_allocateClassPair(CPObject,"CPToolbar"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_identifier"),new objj_ivar("_displayMode"),new objj_ivar("_showsBaselineSeparator"),new objj_ivar("_allowsUserCustomization"),new objj_ivar("_isVisible"),new objj_ivar("_delegate"),new objj_ivar("_itemIdentifiers"),new objj_ivar("_identifiedItems"),new objj_ivar("_defaultItems"),new objj_ivar("_allowedItems"),new objj_ivar("_selectableItems"),new objj_ivar("_items"),new objj_ivar("_itemsSortedByVisibilityPriority"),new objj_ivar("_toolbarView"),new objj_ivar("_window")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("init"),function(_5,_6){
with(_5){
return objj_msgSend(_5,"initWithIdentifier:","");
}
}),new objj_method(sel_getUid("initWithIdentifier:"),function(_7,_8,_9){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("CPObject")},"init");
if(_7){
_items=[];
_identifier=_9;
_isVisible=YES;
objj_msgSend(CPToolbar,"_addToolbar:forIdentifier:",_7,_identifier);
}
return _7;
}
}),new objj_method(sel_getUid("setDisplayMode:"),function(_a,_b,_c){
with(_a){
}
}),new objj_method(sel_getUid("identifier"),function(_d,_e){
with(_d){
return _identifier;
}
}),new objj_method(sel_getUid("delegate"),function(_f,_10){
with(_f){
return _delegate;
}
}),new objj_method(sel_getUid("isVisible"),function(_11,_12){
with(_11){
return _isVisible;
}
}),new objj_method(sel_getUid("setVisible:"),function(_13,_14,_15){
with(_13){
if(_isVisible===_15){
return;
}
_isVisible=_15;
objj_msgSend(_window,"_noteToolbarChanged");
}
}),new objj_method(sel_getUid("_window"),function(_16,_17){
with(_16){
return _window;
}
}),new objj_method(sel_getUid("_setWindow:"),function(_18,_19,_1a){
with(_18){
_window=_1a;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_1b,_1c,_1d){
with(_1b){
if(_delegate==_1d){
return;
}
_delegate=_1d;
objj_msgSend(_1b,"_reloadToolbarItems");
}
}),new objj_method(sel_getUid("_loadConfiguration"),function(_1e,_1f){
with(_1e){
}
}),new objj_method(sel_getUid("_toolbarView"),function(_20,_21){
with(_20){
if(!_toolbarView){
_toolbarView=objj_msgSend(objj_msgSend(_CPToolbarView,"alloc"),"initWithFrame:",CPRectMake(0,0,1200,59));
objj_msgSend(_toolbarView,"setToolbar:",_20);
objj_msgSend(_toolbarView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_toolbarView,"reloadToolbarItems");
}
return _toolbarView;
}
}),new objj_method(sel_getUid("_reloadToolbarItems"),function(_22,_23){
with(_22){
if(!_delegate){
return;
}
var _24=objj_msgSend(_itemIdentifiers,"count");
if(!_24){
_itemIdentifiers=objj_msgSend(objj_msgSend(_delegate,"toolbarDefaultItemIdentifiers:",_22),"mutableCopy");
_24=objj_msgSend(_itemIdentifiers,"count");
}
_items=[];
var _25=0;
for(;_25<_24;++_25){
var _26=_itemIdentifiers[_25],_27=objj_msgSend(CPToolbarItem,"_standardItemWithItemIdentifier:",_26);
if(!_27){
_27=objj_msgSend(_delegate,"toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:",_22,_26,YES);
}
_27=objj_msgSend(_27,"copy");
if(_27==nil){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,sprintf("_delegate %s returned nil toolbar item returned for identifier %s",_delegate,_26));
}
objj_msgSend(_items,"addObject:",_27);
}
_itemsSortedByVisibilityPriority=objj_msgSend(_items,"sortedArrayUsingFunction:context:",_28,NULL);
objj_msgSend(_toolbarView,"reloadToolbarItems");
}
}),new objj_method(sel_getUid("items"),function(_29,_2a){
with(_29){
return _items;
}
}),new objj_method(sel_getUid("visibleItems"),function(_2b,_2c){
with(_2b){
return objj_msgSend(_toolbarView,"visibleItems");
}
}),new objj_method(sel_getUid("itemsSortedByVisibilityPriority"),function(_2d,_2e){
with(_2d){
return _itemsSortedByVisibilityPriority;
}
}),new objj_method(sel_getUid("_itemForItemIdentifier:willBeInsertedIntoToolbar:"),function(_2f,_30,_31,_32){
with(_2f){
var _33=objj_msgSend(_identifiedItems,"objectForKey:",_31);
if(!_33){
_33=objj_msgSend(CPToolbarItem,"_standardItemWithItemIdentifier:",_31);
if(_delegate&&!_33){
_33=objj_msgSend(objj_msgSend(_delegate,"toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:",_2f,_31,_32),"copy");
if(!_33){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,sprintf("_delegate %s returned nil toolbar item returned for identifier %s",_delegate,_31));
}
}
objj_msgSend(_identifiedItems,"setObject:forKey:",_33,_31);
}
return _33;
}
}),new objj_method(sel_getUid("_itemsWithIdentifiers:"),function(_34,_35,_36){
with(_34){
var _37=[];
for(var i=0;i<_36.length;i++){
objj_msgSend(_37,"addObject:",objj_msgSend(_34,"_itemForItemIdentifier:willBeInsertedIntoToolbar:",_36[i],NO));
}
return _37;
}
}),new objj_method(sel_getUid("_defaultToolbarItems"),function(_39,_3a){
with(_39){
if(!_defaultItems){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("toolbarDefaultItemIdentifiers:"))){
_defaultItems=objj_msgSend(_39,"_itemsWithIdentifiers:",objj_msgSend(_delegate,"toolbarDefaultItemIdentifiers:",_39));
}
}
return _defaultItems;
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("initialize"),function(_3b,_3c){
with(_3b){
if(_3b!=objj_msgSend(CPToolbar,"class")){
return;
}
_1=objj_msgSend(CPDictionary,"dictionary");
_2=objj_msgSend(CPDictionary,"dictionary");
}
}),new objj_method(sel_getUid("_addToolbar:forIdentifier:"),function(_3d,_3e,_3f,_40){
with(_3d){
var _41=objj_msgSend(_1,"objectForKey:",_40);
if(!_41){
_41=[];
objj_msgSend(_1,"setObject:forKey:",_41,_40);
}
objj_msgSend(_41,"addObject:",_3f);
}
})]);
var _42="CPToolbarIdentifierKey",_43="CPToolbarDisplayModeKey",_44="CPToolbarShowsBaselineSeparatorKey",_45="CPToolbarAllowsUserCustomizationKey",_46="CPToolbarIsVisibleKey",_47="CPToolbarDelegateKey",_48="CPToolbarIdentifiedItemsKey",_49="CPToolbarDefaultItemsKey",_4a="CPToolbarAllowedItemsKey",_4b="CPToolbarSelectableItemsKey";
var _3=objj_getClass("CPToolbar");
if(!_3){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPToolbar\""));
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_4c,_4d,_4e){
with(_4c){
_4c=objj_msgSendSuper({receiver:_4c,super_class:objj_getClass("CPObject")},"init");
if(_4c){
_identifier=objj_msgSend(_4e,"decodeObjectForKey:",_42);
_displayMode=objj_msgSend(_4e,"decodeIntForKey:",_43);
_showsBaselineSeparator=objj_msgSend(_4e,"decodeBoolForKey:",_44);
_allowsUserCustomization=objj_msgSend(_4e,"decodeBoolForKey:",_45);
_isVisible=objj_msgSend(_4e,"decodeBoolForKey:",_46);
_identifiedItems=objj_msgSend(_4e,"decodeObjectForKey:",_48);
_defaultItems=objj_msgSend(_4e,"decodeObjectForKey:",_49);
_allowedItems=objj_msgSend(_4e,"decodeObjectForKey:",_4a);
_selectableItems=objj_msgSend(_4e,"decodeObjectForKey:",_4b);
_items=[];
objj_msgSend(CPToolbar,"_addToolbar:forIdentifier:",_4c,_identifier);
objj_msgSend(_4c,"setDelegate:",objj_msgSend(_4e,"decodeObjectForKey:",_47));
}
return _4c;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_4f,_50,_51){
with(_4f){
objj_msgSend(_51,"encodeObject:forKey:",_identifier,_42);
objj_msgSend(_51,"encodeInt:forKey:",_displayMode,_43);
objj_msgSend(_51,"encodeBool:forKey:",_showsBaselineSeparator,_44);
objj_msgSend(_51,"encodeBool:forKey:",_allowsUserCustomization,_45);
objj_msgSend(_51,"encodeBool:forKey:",_isVisible,_46);
objj_msgSend(_51,"encodeObject:forKey:",_identifiedItems,_48);
objj_msgSend(_51,"encodeObject:forKey:",_defaultItems,_49);
objj_msgSend(_51,"encodeObject:forKey:",_allowedItems,_4a);
objj_msgSend(_51,"encodeObject:forKey:",_selectableItems,_4b);
objj_msgSend(_51,"encodeConditionalObject:forKey:",_delegate,_47);
}
})]);
var _52=nil,_53=nil,_54=nil;
var _55=5,_56=10,_57=20;
var _58=function(_59,_5a,_5b,_5c){
return {index:_59,view:_5a,label:_5b,minWidth:_5c};
};
var _3=objj_allocateClassPair(CPView,"_CPToolbarView"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_toolbar"),new objj_ivar("_flexibleWidthIndexes"),new objj_ivar("_visibleFlexibleWidthIndexes"),new objj_ivar("_itemInfos"),new objj_ivar("_visibleItems"),new objj_ivar("_invisibleItems"),new objj_ivar("_additionalItemsButton"),new objj_ivar("_labelColor"),new objj_ivar("_labelShadowColor"),new objj_ivar("_minWidth")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initWithFrame:"),function(_5d,_5e,_5f){
with(_5d){
_5d=objj_msgSendSuper({receiver:_5d,super_class:objj_getClass("CPView")},"initWithFrame:",_5f);
if(_5d){
_minWidth=0;
_labelColor=objj_msgSend(CPColor,"blackColor");
_labelShadowColor=objj_msgSend(CPColor,"colorWithWhite:alpha:",1,0.75);
_additionalItemsButton=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:pullsDown:",CGRectMake(0,0,10,15),YES);
objj_msgSend(_additionalItemsButton,"setBordered:",NO);
objj_msgSend(_additionalItemsButton,"setImagePosition:",CPImageOnly);
objj_msgSend(objj_msgSend(_additionalItemsButton,"menu"),"setShowsStateColumn:",NO);
objj_msgSend(_additionalItemsButton,"setAlternateImage:",_54);
}
return _5d;
}
}),new objj_method(sel_getUid("setToolbar:"),function(_60,_61,_62){
with(_60){
_toolbar=_62;
}
}),new objj_method(sel_getUid("toolbar"),function(_63,_64){
with(_63){
return _toolbar;
}
}),new objj_method(sel_getUid("setLabelColor:"),function(_65,_66,_67){
with(_65){
if(_labelColor===_67){
return;
}
_labelColor=_67;
var _68=objj_msgSend(_toolbar,"items"),_69=objj_msgSend(_68,"count");
while(_69--){
objj_msgSend(objj_msgSend(_65,"labelForItem:",_68[_69]),"setTextColor:",_labelColor);
}
}
}),new objj_method(sel_getUid("setLabelShadowColor:"),function(_6a,_6b,_6c){
with(_6a){
if(_labelShadowColor===_6c){
return;
}
_labelShadowColor=_6c;
var _6d=objj_msgSend(_toolbar,"items"),_6e=objj_msgSend(_6d,"count");
while(_6e--){
objj_msgSend(objj_msgSend(_6a,"labelForItem:",_6d[_6e]),"setTextShadowColor:",_labelShadowColor);
}
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_6f,_70,_71){
with(_6f){
objj_msgSend(_6f,"layoutSubviews");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_72,_73){
with(_72){
var _74=objj_msgSend(_toolbar,"items"),_75=CGRectGetWidth(objj_msgSend(_72,"bounds")),_76=_minWidth,_77=objj_msgSend(CPIndexSet,"indexSet"),_78=[];
_visibleItems=_74;
if(_75<_76){
_75-=_57;
_visibleItems=objj_msgSend(_visibleItems,"copy");
var _79=objj_msgSend(_toolbar,"itemsSortedByVisibilityPriority"),_7a=_79.length;
while(_76>_75){
var _7b=_79[_7a--];
_76-=objj_msgSend(_72,"minWidthForItem:",_7b)+_56;
objj_msgSend(_visibleItems,"removeObjectIdenticalTo:",_7b);
objj_msgSend(_78,"addObject:",_7b);
objj_msgSend(objj_msgSend(_72,"viewForItem:",_7b),"setHidden:",YES);
objj_msgSend(objj_msgSend(_72,"labelForItem:",_7b),"setHidden:",YES);
}
}
var _7c=_visibleItems.length,_7d=0;
while(_7c--){
var _7b=_visibleItems[_7c],_7e=objj_msgSend(_7b,"minSize"),_7f=objj_msgSend(_72,"viewForItem:",_7b);
if(_7e.width!=objj_msgSend(_7b,"maxSize").width){
objj_msgSend(_77,"addIndex:",_7c);
}else{
objj_msgSend(_7f,"setFrameSize:",CGSizeMake(objj_msgSend(_7b,"minSize").width,CGRectGetHeight(objj_msgSend(_7f,"frame"))));
}
objj_msgSend(_7f,"setHidden:",NO);
objj_msgSend(objj_msgSend(_72,"labelForItem:",_7b),"setHidden:",NO);
if(_7d<_7e.height){
_7d=_7e.height;
}
}
var _80=_75-_76,_81=0;
while(_80&&objj_msgSend(_77,"count")){
_81+=_80/objj_msgSend(_77,"count");
_80=0;
var _7c=CPNotFound;
while((_7c=objj_msgSend(_77,"indexGreaterThanIndex:",_7c))!=CPNotFound){
var _7b=_visibleItems[_7c];
_7f=objj_msgSend(_72,"viewForItem:",_7b),_82=objj_msgSend(_7f,"frame"),proposedWidth=objj_msgSend(_7b,"minSize").width+_81,constrainedWidth=MIN(proposedWidth,objj_msgSend(_7b,"maxSize").width);
if(constrainedWidth<proposedWidth){
objj_msgSend(_77,"removeIndex:",_7c);
_80+=proposedWidth-constrainedWidth;
}
objj_msgSend(_7f,"setFrameSize:",CGSizeMake(constrainedWidth,CGRectGetHeight(_82)));
}
}
var _7a=_visibleItems.length,x=_56,_84=[];
for(_7c=0;_7c<_7a;++_7c){
var _7b=_visibleItems[_7c],_7f=objj_msgSend(_72,"viewForItem:",_7b),_82=objj_msgSend(_7f,"frame"),_85=CGRectGetWidth(_82),_86=objj_msgSend(_72,"labelForItem:",_7b),_87=objj_msgSend(_86,"frame"),_88=CGRectGetWidth(_87),_89=MAX(objj_msgSend(_72,"minWidthForItem:",_7b),_85),_8a=CGRectGetHeight(_82);
objj_msgSend(_7f,"setFrame:",CGRectMake(x+(_89-_85)/2,_55+(_7d-_8a)/2,_85,_8a));
objj_msgSend(_86,"setFrameOrigin:",CGPointMake(x+(_89-_88)/2,_55+_7d+2));
x+=_89+_56;
if(objj_msgSend(_7b,"itemIdentifier")==CPToolbarSeparatorItemIdentifier){
_84.push(_7b);
}
}
for(_7c=0,_7a=_84.length;_7c<_7a;++_7c){
var _7f=objj_msgSend(_72,"viewForItem:",_84[_7c]),_8a=53;
objj_msgSend(_7f,"setFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_7f,"frame")),(59-_8a)/2,CGRectGetWidth(objj_msgSend(_7f,"frame")),_8a));
}
if(objj_msgSend(_78,"count")){
var _7c=0,_7a=objj_msgSend(_74,"count");
_invisibleItems=[];
for(;_7c<_7a;++_7c){
var _7b=_74[_7c];
if(objj_msgSend(_78,"indexOfObjectIdenticalTo:",_7b)!=CPNotFound){
objj_msgSend(_invisibleItems,"addObject:",_7b);
}
}
objj_msgSend(_additionalItemsButton,"setFrameOrigin:",CGPointMake(_75+5,(CGRectGetHeight(objj_msgSend(_72,"bounds"))-CGRectGetHeight(objj_msgSend(_additionalItemsButton,"frame")))/2));
objj_msgSend(_72,"addSubview:",_additionalItemsButton);
objj_msgSend(_additionalItemsButton,"removeAllItems");
var _7c=0,_7a=objj_msgSend(_invisibleItems,"count");
objj_msgSend(_additionalItemsButton,"addItemWithTitle:","Additional Items");
objj_msgSend(objj_msgSend(_additionalItemsButton,"itemArray")[0],"setImage:",_53);
for(;_7c<_7a;++_7c){
var _7b=_invisibleItems[_7c];
objj_msgSend(_additionalItemsButton,"addItemWithTitle:",objj_msgSend(_7b,"label"));
var _8b=objj_msgSend(_additionalItemsButton,"itemArray")[_7c+1];
objj_msgSend(_8b,"setImage:",objj_msgSend(_7b,"image"));
objj_msgSend(_8b,"setTarget:",objj_msgSend(_7b,"target"));
objj_msgSend(_8b,"setAction:",objj_msgSend(_7b,"action"));
}
}else{
objj_msgSend(_additionalItemsButton,"removeFromSuperview");
}
}
}),new objj_method(sel_getUid("viewForItem:"),function(_8c,_8d,_8e){
with(_8c){
var _8f=objj_msgSend(_itemInfos,"objectForKey:",objj_msgSend(_8e,"UID"));
if(!_8f){
return nil;
}
return _8f.view;
}
}),new objj_method(sel_getUid("labelForItem:"),function(_90,_91,_92){
with(_90){
var _93=objj_msgSend(_itemInfos,"objectForKey:",objj_msgSend(_92,"UID"));
if(!_93){
return nil;
}
return _93.label;
}
}),new objj_method(sel_getUid("minWidthForItem:"),function(_94,_95,_96){
with(_94){
var _97=objj_msgSend(_itemInfos,"objectForKey:",objj_msgSend(_96,"UID"));
if(!_97){
return 0;
}
return _97.minWidth;
}
}),new objj_method(sel_getUid("reloadToolbarItems"),function(_98,_99){
with(_98){
var _9a=objj_msgSend(_98,"subviews"),_9b=_9a.length;
while(_9b--){
objj_msgSend(_9a[_9b],"removeFromSuperview");
}
var _9c=objj_msgSend(_toolbar,"items"),_9d=0;
_9b=_9c.length;
_itemInfos=objj_msgSend(CPDictionary,"dictionary");
_minWidth=_56;
for(;_9d<_9b;++_9d){
var _9e=_9c[_9d],_9f=objj_msgSend(_9e,"view");
if(!_9f){
_9f=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(0,0,32,32));
objj_msgSend(_9f,"setBordered:",NO);
objj_msgSend(_9f,"setImage:",objj_msgSend(_9e,"image"));
objj_msgSend(_9f,"setAlternateImage:",objj_msgSend(_9e,"alternateImage"));
objj_msgSend(_9f,"setTarget:",objj_msgSend(_9e,"target"));
objj_msgSend(_9f,"setAction:",objj_msgSend(_9e,"action"));
objj_msgSend(_9f,"setTag:",objj_msgSend(_9e,"tag"));
objj_msgSend(_9f,"setImagePosition:",CPImageOnly);
}
objj_msgSend(_98,"addSubview:",_9f);
var _a0=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_a0,"setStringValue:",objj_msgSend(_9e,"label"));
objj_msgSend(_a0,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",11));
objj_msgSend(_a0,"setTextColor:",_labelColor);
objj_msgSend(_a0,"setTextShadowColor:",_labelShadowColor);
objj_msgSend(_a0,"setTextShadowOffset:",CGSizeMake(0,1));
objj_msgSend(_a0,"sizeToFit");
objj_msgSend(_a0,"setTarget:",objj_msgSend(_9e,"target"));
objj_msgSend(_a0,"setAction:",objj_msgSend(_9e,"action"));
objj_msgSend(_98,"addSubview:",_a0);
var _a1=objj_msgSend(_9e,"minSize"),_a2=MAX(_a1.width,CGRectGetWidth(objj_msgSend(_a0,"frame")));
objj_msgSend(_itemInfos,"setObject:forKey:",_58(_9d,_9f,_a0,_a2),objj_msgSend(_9e,"UID"));
_minWidth+=_a2+_56;
}
objj_msgSend(_98,"layoutSubviews");
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("initialize"),function(_a3,_a4){
with(_a3){
if(_a3!=objj_msgSend(_CPToolbarView,"class")){
return;
}
var _a5=objj_msgSend(CPBundle,"bundleForClass:",_a3);
_53=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_a5,"pathForResource:","_CPToolbarView/_CPToolbarViewExtraItemsImage.png"),CPSizeMake(10,15));
_54=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_a5,"pathForResource:","_CPToolbarView/_CPToolbarViewExtraItemsAlternateImage.png"),CGSizeMake(10,15));
}
})]);
var _28=function(lhs,rhs){
var _a8=objj_msgSend(lhs,"visibilityPriority"),_a9=objj_msgSend(rhs,"visibilityPriority");
if(_a8==_a9){
return CPOrderedSame;
}
if(_a8>_a9){
return CPOrderedAscending;
}
return CPOrderedDescending;
};
