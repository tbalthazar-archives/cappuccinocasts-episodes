i;10;CPButton.ji;12;CPGeometry.ji;8;CPMenu.ji;12;CPMenuItem.jc;13597;
var _1=7;
CPPopUpButtonStatePullsDown=1<<12;
var _2=objj_allocateClassPair(CPButton,"CPPopUpButton"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_selectedIndex"),new objj_ivar("_preferredEdge"),new objj_ivar("_menu")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:pullsDown:"),function(_4,_5,_6,_7){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CPButton")},"initWithFrame:",_6);
if(_4){
_selectedIndex=CPNotFound;
_preferredEdge=CPMaxYEdge;
objj_msgSend(_4,"setValue:forThemedAttributeName:",CPImageLeft,"image-position");
objj_msgSend(_4,"setValue:forThemedAttributeName:",CPLeftTextAlignment,"alignment");
objj_msgSend(_4,"setValue:forThemedAttributeName:",CPLineBreakByTruncatingTail,"line-break-mode");
objj_msgSend(_4,"setMenu:",objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:",""));
objj_msgSend(_4,"setPullsDown:",_7);
}
return _4;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
return objj_msgSend(_8,"initWithFrame:pullsDown:",_a,NO);
}
}),new objj_method(sel_getUid("setPullsDown:"),function(_b,_c,_d){
with(_b){
if((!!(_controlState&CPPopUpButtonStatePullsDown))===_d){
return;
}
if(_d){
_controlState|=CPPopUpButtonStatePullsDown;
}else{
_controlState&=~CPPopUpButtonStatePullsDown;
}
var _e=objj_msgSend(_menu,"itemArray");
if(objj_msgSend(_e,"count")<=0){
return;
}
objj_msgSend(_e[0],"setHidden:",objj_msgSend(_b,"pullsDown"));
objj_msgSend(_b,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("pullsDown"),function(_f,_10){
with(_f){
return _controlState&CPPopUpButtonStatePullsDown;
}
}),new objj_method(sel_getUid("addItem:"),function(_11,_12,_13){
with(_11){
objj_msgSend(_menu,"addItem:",_13);
}
}),new objj_method(sel_getUid("addItemWithTitle:"),function(_14,_15,_16){
with(_14){
objj_msgSend(_menu,"addItemWithTitle:action:keyEquivalent:",_16,NULL,nil);
}
}),new objj_method(sel_getUid("addItemsWithTitles:"),function(_17,_18,_19){
with(_17){
var _1a=0,_1b=objj_msgSend(_19,"count");
for(;_1a<_1b;++_1a){
objj_msgSend(_17,"addItemWithTitle:",_19[_1a]);
}
}
}),new objj_method(sel_getUid("insertItemWithTitle:atIndex:"),function(_1c,_1d,_1e,_1f){
with(_1c){
var _20=objj_msgSend(_1c,"itemArray"),_21=objj_msgSend(_20,"count");
while(_21--){
if(objj_msgSend(_20[_21],"title")==_1e){
objj_msgSend(_1c,"removeItemAtIndex:",_21);
}
}
objj_msgSend(_menu,"insertItemWithTitle:action:keyEquivalent:atIndex:",_1e,NULL,nil,_1f);
}
}),new objj_method(sel_getUid("removeAllItems"),function(_22,_23){
with(_22){
var _24=objj_msgSend(_menu,"numberOfItems");
while(_24--){
objj_msgSend(_menu,"removeItemAtIndex:",0);
}
}
}),new objj_method(sel_getUid("removeItemWithTitle:"),function(_25,_26,_27){
with(_25){
objj_msgSend(_25,"removeItemAtIndex:",objj_msgSend(_25,"indexOfItemWithTitle:",_27));
objj_msgSend(_25,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("removeItemAtIndex:"),function(_28,_29,_2a){
with(_28){
objj_msgSend(_menu,"removeItemAtIndex:",_2a);
objj_msgSend(_28,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("selectedItem"),function(_2b,_2c){
with(_2b){
if(_selectedIndex<0){
return nil;
}
return objj_msgSend(_menu,"itemAtIndex:",_selectedIndex);
}
}),new objj_method(sel_getUid("titleOfSelectedItem"),function(_2d,_2e){
with(_2d){
return objj_msgSend(objj_msgSend(_2d,"selectedItem"),"title");
}
}),new objj_method(sel_getUid("indexOfSelectedItem"),function(_2f,_30){
with(_2f){
return _selectedIndex;
}
}),new objj_method(sel_getUid("objectValue"),function(_31,_32){
with(_31){
return _selectedIndex;
}
}),new objj_method(sel_getUid("selectItem:"),function(_33,_34,_35){
with(_33){
objj_msgSend(_33,"selectItemAtIndex:",objj_msgSend(_33,"indexOfItem:",_35));
}
}),new objj_method(sel_getUid("selectItemAtIndex:"),function(_36,_37,_38){
with(_36){
if(_selectedIndex==_38){
return;
}
if(_selectedIndex>=0&&!objj_msgSend(_36,"pullsDown")){
objj_msgSend(objj_msgSend(_36,"selectedItem"),"setState:",CPOffState);
}
_selectedIndex=_38;
if(_selectedIndex>=0&&!objj_msgSend(_36,"pullsDown")){
objj_msgSend(objj_msgSend(_36,"selectedItem"),"setState:",CPOnState);
}
objj_msgSend(_36,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("selectItemWithTag:"),function(_39,_3a,_3b){
with(_39){
objj_msgSend(_39,"selectItemAtIndex:",objj_msgSend(_39,"indexOfItemWithTag:",_3b));
}
}),new objj_method(sel_getUid("selectItemWithTitle:"),function(_3c,_3d,_3e){
with(_3c){
objj_msgSend(_3c,"selectItemAtIndex:",objj_msgSend(_3c,"indexOfItemWithTitle:",_3e));
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_3f,_40,_41){
with(_3f){
objj_msgSend(_3f,"selectItemAtIndex:",objj_msgSend(_41,"intValue"));
}
}),new objj_method(sel_getUid("menu"),function(_42,_43){
with(_42){
return _menu;
}
}),new objj_method(sel_getUid("setMenu:"),function(_44,_45,_46){
with(_44){
if(_menu===_46){
return;
}
var _47=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_menu){
objj_msgSend(_47,"removeObserver:name:object:",_44,CPMenuDidAddItemNotification,_menu);
objj_msgSend(_47,"removeObserver:name:object:",_44,CPMenuDidChangeItemNotification,_menu);
objj_msgSend(_47,"removeObserver:name:object:",_44,CPMenuDidRemoveItemNotification,_menu);
}
_menu=_46;
if(_menu){
objj_msgSend(_47,"addObserver:selector:name:object:",_44,sel_getUid("menuDidAddItem:"),CPMenuDidAddItemNotification,_menu);
objj_msgSend(_47,"addObserver:selector:name:object:",_44,sel_getUid("menuDidChangeItem:"),CPMenuDidChangeItemNotification,_menu);
objj_msgSend(_47,"addObserver:selector:name:object:",_44,sel_getUid("menuDidRemoveItem:"),CPMenuDidRemoveItemNotification,_menu);
}
objj_msgSend(_44,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("numberOfItems"),function(_48,_49){
with(_48){
return objj_msgSend(_menu,"numberOfItems");
}
}),new objj_method(sel_getUid("itemArray"),function(_4a,_4b){
with(_4a){
return objj_msgSend(_menu,"itemArray");
}
}),new objj_method(sel_getUid("itemAtIndex:"),function(_4c,_4d,_4e){
with(_4c){
return objj_msgSend(_menu,"itemAtIndex:",_4e);
}
}),new objj_method(sel_getUid("itemTitleAtIndex:"),function(_4f,_50,_51){
with(_4f){
return objj_msgSend(objj_msgSend(_menu,"itemAtIndex:",_51),"title");
}
}),new objj_method(sel_getUid("itemTitles"),function(_52,_53){
with(_52){
var _54=[],_55=objj_msgSend(_52,"itemArray"),_56=0,_57=objj_msgSend(_55,"count");
for(;_56<_57;++_56){
_55.push(objj_msgSend(_55[_56],"title"));
}
}
}),new objj_method(sel_getUid("itemWithTitle:"),function(_58,_59,_5a){
with(_58){
return objj_msgSend(_menu,"itemAtIndex:",objj_msgSend(_menu,"indexOfItemWithTitle:",_5a));
}
}),new objj_method(sel_getUid("lastItem"),function(_5b,_5c){
with(_5b){
return objj_msgSend(objj_msgSend(_menu,"itemArray"),"lastObject");
}
}),new objj_method(sel_getUid("indexOfItem:"),function(_5d,_5e,_5f){
with(_5d){
return objj_msgSend(_menu,"indexOfItem:",_5f);
}
}),new objj_method(sel_getUid("indexOfItemWithTag:"),function(_60,_61,_62){
with(_60){
return objj_msgSend(_menu,"indexOfItemWithTag:",_62);
}
}),new objj_method(sel_getUid("indexOfItemWithTitle:"),function(_63,_64,_65){
with(_63){
return objj_msgSend(_menu,"indexOfItemWithTitle:",_65);
}
}),new objj_method(sel_getUid("indexOfItemWithRepresentedObject:"),function(_66,_67,_68){
with(_66){
return objj_msgSend(_menu,"indexOfItemWithRepresentedObject:",_68);
}
}),new objj_method(sel_getUid("indexOfItemWithTarget:action:"),function(_69,_6a,_6b,_6c){
with(_69){
return objj_msgSend(_menu,"indexOfItemWithTarget:action:",_6b,_6c);
}
}),new objj_method(sel_getUid("preferredEdge"),function(_6d,_6e){
with(_6d){
return _preferredEdge;
}
}),new objj_method(sel_getUid("setPreferredEdge:"),function(_6f,_70,_71){
with(_6f){
_preferredEdge=_71;
}
}),new objj_method(sel_getUid("setTitle:"),function(_72,_73,_74){
with(_72){
if(objj_msgSend(_72,"title")===_74){
return;
}
if(objj_msgSend(_72,"pullsDown")){
var _75=objj_msgSend(_menu,"itemArray");
if(objj_msgSend(_75,"count")<=0){
objj_msgSend(_72,"addItemWithTitle:",_74);
}else{
objj_msgSend(_75[0],"setTitle:",_74);
objj_msgSend(_72,"synchronizeTitleAndSelectedItem");
}
}else{
var _76=objj_msgSend(_72,"indexOfItemWithTitle:",_74);
if(_76<0){
objj_msgSend(_72,"addItemWithTitle:",_74);
_76=objj_msgSend(_72,"numberOfItems")-1;
}
objj_msgSend(_72,"selectItemAtIndex:",_76);
}
}
}),new objj_method(sel_getUid("setImage:"),function(_77,_78,_79){
with(_77){
}
}),new objj_method(sel_getUid("synchronizeTitleAndSelectedItem"),function(_7a,_7b){
with(_7a){
var _7c=nil;
if(objj_msgSend(_7a,"pullsDown")){
var _7d=objj_msgSend(_menu,"itemArray");
if(objj_msgSend(_7d,"count")>0){
_7c=_7d[0];
}
}else{
_7c=objj_msgSend(_7a,"selectedItem");
}
objj_msgSendSuper({receiver:_7a,super_class:objj_getClass("CPButton")},"setImage:",objj_msgSend(_7c,"image"));
objj_msgSendSuper({receiver:_7a,super_class:objj_getClass("CPButton")},"setTitle:",objj_msgSend(_7c,"title"));
}
}),new objj_method(sel_getUid("menuDidAddItem:"),function(_7e,_7f,_80){
with(_7e){
var _81=objj_msgSend(objj_msgSend(_80,"userInfo"),"objectForKey:","CPMenuItemIndex");
if(_selectedIndex<0){
objj_msgSend(_7e,"selectItemAtIndex:",0);
}else{
if(_81==_selectedIndex){
objj_msgSend(_7e,"synchronizeTitleAndSelectedItem");
}else{
if(_81<_selectedIndex){
++_selectedIndex;
}
}
}
if(_81==0&&objj_msgSend(_7e,"pullsDown")){
var _82=objj_msgSend(_menu,"itemArray");
objj_msgSend(_82[0],"setHidden:",YES);
if(_82.length>0){
objj_msgSend(_82[1],"setHidden:",NO);
}
}
var _83=objj_msgSend(_menu,"itemArray")[_81],_84=objj_msgSend(_83,"action");
if(!_84||(_84===sel_getUid("_popUpItemAction:"))){
objj_msgSend(_83,"setTarget:",_7e);
objj_msgSend(_83,"setAction:",sel_getUid("_popUpItemAction:"));
}
}
}),new objj_method(sel_getUid("menuDidChangeItem:"),function(_85,_86,_87){
with(_85){
var _88=objj_msgSend(objj_msgSend(_87,"userInfo"),"objectForKey:","CPMenuItemIndex");
if(objj_msgSend(_85,"pullsDown")&&_88!=0){
return;
}
if(!objj_msgSend(_85,"pullsDown")&&_88!=_selectedIndex){
return;
}
objj_msgSend(_85,"synchronizeTitleAndSelectedItem");
}
}),new objj_method(sel_getUid("menuDidRemoveItem:"),function(_89,_8a,_8b){
with(_89){
var _8c=objj_msgSend(_89,"numberOfItems");
if(_8c<=_selectedIndex){
objj_msgSend(_89,"selectItemAtIndex:",_8c-1);
}
}
}),new objj_method(sel_getUid("mouseDown:"),function(_8d,_8e,_8f){
with(_8d){
if(!objj_msgSend(_8d,"isEnabled")){
return;
}
objj_msgSend(_8d,"highlight:",YES);
var _90=objj_msgSend(_8d,"menu"),_91=objj_msgSend(_8d,"window"),_92=objj_msgSend(_CPMenuWindow,"menuWindowWithMenu:font:",_90,objj_msgSend(_8d,"font"));
objj_msgSend(_92,"setDelegate:",_8d);
objj_msgSend(_92,"setBackgroundStyle:",_CPMenuWindowPopUpBackgroundStyle);
if(objj_msgSend(_8d,"pullsDown")){
var _93=objj_msgSend(_91,"convertBaseToBridge:",objj_msgSend(_8d,"convertPoint:toView:",CGPointMake(0,CGRectGetMaxY(objj_msgSend(_8d,"bounds"))),nil));
}else{
var _94=objj_msgSend(_8d,"convertRect:toView:",objj_msgSend(_8d,"contentRectForBounds:",objj_msgSend(_8d,"bounds")),nil),_93=objj_msgSend(_91,"convertBaseToBridge:",_94.origin),_95=objj_msgSend(_92,"rectForItemAtIndex:",_selectedIndex);
_93.x-=CGRectGetMinX(_95)+objj_msgSend(_92,"overlapOffsetWidth")+objj_msgSend(objj_msgSend(objj_msgSend(_90,"itemAtIndex:",_selectedIndex),"_menuItemView"),"overlapOffsetWidth");
_93.y-=CGRectGetMinY(_95)+(CGRectGetHeight(_95)-CGRectGetHeight(_94))/2;
}
objj_msgSend(_92,"setFrameOrigin:",_93);
var _96=CGRectGetMaxX(objj_msgSend(_92,"frame")),_97=objj_msgSend(_91,"convertBaseToBridge:",CGPointMake(CGRectGetMaxX(objj_msgSend(_8d,"convertRect:toView:",objj_msgSend(_8d,"bounds"),nil)),0)).x;
if(_96<_97){
objj_msgSend(_92,"setMinWidth:",CGRectGetWidth(objj_msgSend(_92,"frame"))+_97-_96-(objj_msgSend(_8d,"pullsDown")?0:_1));
}
objj_msgSend(_92,"orderFront:",_8d);
objj_msgSend(_92,"beginTrackingWithEvent:sessionDelegate:didEndSelector:",_8f,_8d,sel_getUid("menuWindowDidFinishTracking:highlightedItem:"));
}
}),new objj_method(sel_getUid("menuWindowDidFinishTracking:highlightedItem:"),function(_98,_99,_9a,_9b){
with(_98){
objj_msgSend(_CPMenuWindow,"poolMenuWindow:",_9a);
objj_msgSend(_98,"highlight:",NO);
var _9c=objj_msgSend(_menu,"indexOfItem:",_9b);
if(_9c==CPNotFound){
return;
}
objj_msgSend(_98,"selectItemAtIndex:",_9c);
objj_msgSend(CPApp,"sendAction:to:from:",objj_msgSend(_9b,"action"),objj_msgSend(_9b,"target"),_9b);
}
}),new objj_method(sel_getUid("_popUpItemAction:"),function(_9d,_9e,_9f){
with(_9d){
objj_msgSend(_9d,"sendAction:to:",objj_msgSend(_9d,"action"),objj_msgSend(_9d,"target"));
}
})]);
var _a0="CPPopUpButtonMenuKey",_a1="CPPopUpButtonSelectedIndexKey",_a2="CPPopUpButtonPullsDownKey";
var _2=objj_getClass("CPPopUpButton");
if(!_2){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPPopUpButton\""));
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_a3,_a4,_a5){
with(_a3){
_a3=objj_msgSendSuper({receiver:_a3,super_class:objj_getClass("CPButton")},"initWithCoder:",_a5);
if(_a3){
_selectedIndex=-1;
objj_msgSend(_a3,"setMenu:",objj_msgSend(_a5,"decodeObjectForKey:",_a0));
objj_msgSend(_a3,"selectItemAtIndex:",objj_msgSend(_a5,"decodeObjectForKey:",_a1));
}
return _a3;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a6,_a7,_a8){
with(_a6){
objj_msgSendSuper({receiver:_a6,super_class:objj_getClass("CPButton")},"encodeWithCoder:",_a8);
objj_msgSend(_a8,"encodeObject:forKey:",_menu,_a0);
objj_msgSend(_a8,"encodeInt:forKey:",_selectedIndex,_a1);
}
})]);
