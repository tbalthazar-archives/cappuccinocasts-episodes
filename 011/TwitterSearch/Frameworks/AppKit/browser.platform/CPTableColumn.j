I;25;Foundation/CPDictionary.jI;21;Foundation/CPObject.jI;29;Foundation/CPSortDescriptor.jI;21;Foundation/CPString.ji;19;CPTableHeaderView.jc;8548;
CPTableColumnNoResizing=0;
CPTableColumnAutoresizingMask=1;
CPTableColumnUserResizingMask=2;
var _1=objj_allocateClassPair(CPObject,"CPTableColumn"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_tableView"),new objj_ivar("_headerView"),new objj_ivar("_dataView"),new objj_ivar("_dataViewData"),new objj_ivar("_width"),new objj_ivar("_minWidth"),new objj_ivar("_maxWidth"),new objj_ivar("_identifier"),new objj_ivar("_isEditable"),new objj_ivar("_sortDescriptorPrototype"),new objj_ivar("_isHidden"),new objj_ivar("_headerToolTip")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"initWithIdentifier:","");
}
}),new objj_method(sel_getUid("initWithIdentifier:"),function(_5,_6,_7){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPObject")},"init");
if(_5){
_dataViewData={};
_width=100;
_minWidth=10;
_maxWidth=1000000;
objj_msgSend(_5,"setIdentifier:",_7);
objj_msgSend(_5,"setHeaderView:",objj_msgSend(CPTextField,"new"));
objj_msgSend(_5,"setDataView:",objj_msgSend(CPTextField,"new"));
}
return _5;
}
}),new objj_method(sel_getUid("setTableView:"),function(_8,_9,_a){
with(_8){
_tableView=_a;
}
}),new objj_method(sel_getUid("tableView"),function(_b,_c){
with(_b){
return _tableView;
}
}),new objj_method(sel_getUid("setWidth:"),function(_d,_e,_f){
with(_d){
_f=+_f;
if(_width===_f){
return;
}
var _10=MIN(MAX(_f,objj_msgSend(_d,"minWidth")),objj_msgSend(_d,"maxWidth"));
if(_width===_10){
return;
}
var _11=_width;
_width=_10;
var _12=objj_msgSend(_d,"tableView");
if(_12){
var _13=objj_msgSend(objj_msgSend(_12,"tableColumns"),"indexOfObjectIdenticalTo:",_d);
_12._reloadAllRows=YES;
_12._dirtyTableColumnRangeIndex=_12._dirtyTableColumnRangeIndex<0?_13:MIN(_13,_12._dirtyTableColumnRangeIndex);
objj_msgSend(_12,"tile");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPTableViewColumnDidResizeNotification,_12,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_d,_11],["CPTableColumn","CPOldWidth"]));
}
}
}),new objj_method(sel_getUid("width"),function(_14,_15){
with(_14){
return _width;
}
}),new objj_method(sel_getUid("setMinWidth:"),function(_16,_17,_18){
with(_16){
_18=+_18;
if(_minWidth===_18){
return;
}
_minWidth=_18;
var _19=objj_msgSend(_16,"width"),_1a=MAX(_19,objj_msgSend(_16,"minWidth"));
if(_19!==_1a){
objj_msgSend(_16,"setWidth:",_1a);
}
}
}),new objj_method(sel_getUid("minWidth"),function(_1b,_1c){
with(_1b){
return _minWidth;
}
}),new objj_method(sel_getUid("setMaxWidth:"),function(_1d,_1e,_1f){
with(_1d){
_1f=+_1f;
if(_maxWidth===_1f){
return;
}
_maxWidth=_1f;
var _20=objj_msgSend(_1d,"width"),_21=MAX(_20,objj_msgSend(_1d,"maxWidth"));
if(_20!==_21){
objj_msgSend(_1d,"setWidth:",_21);
}
}
}),new objj_method(sel_getUid("maxWidth"),function(_22,_23){
with(_22){
return _maxWidth;
}
}),new objj_method(sel_getUid("setResizingMask:"),function(_24,_25,_26){
with(_24){
_resizingMask=_26;
}
}),new objj_method(sel_getUid("resizingMask"),function(_27,_28){
with(_27){
return _resizingMask;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_29,_2a){
with(_29){
var _2b=_CGRectGetWidth(objj_msgSend(_headerView,"frame"));
if(_2b<objj_msgSend(_29,"minWidth")){
objj_msgSend(_29,"setMinWidth:",_2b);
}else{
if(_2b>objj_msgSend(_29,"maxWidth")){
objj_msgSend(_29,"setMaxWidth:",_2b);
}
}
if(_width!==_2b){
objj_msgSend(_29,"setWidth:",_2b);
}
}
}),new objj_method(sel_getUid("setHeaderView:"),function(_2c,_2d,_2e){
with(_2c){
if(!_2e){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Attempt to set nil header view on "+objj_msgSend(_2c,"description"));
}
_headerView=_2e;
}
}),new objj_method(sel_getUid("headerView"),function(_2f,_30){
with(_2f){
return _headerView;
}
}),new objj_method(sel_getUid("setDataView:"),function(_31,_32,_33){
with(_31){
if(_dataView===_33){
return;
}
if(_dataView){
_dataViewData[objj_msgSend(_dataView,"UID")]=nil;
}
_dataView=_33;
_dataViewData[objj_msgSend(_33,"UID")]=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_33);
}
}),new objj_method(sel_getUid("dataView"),function(_34,_35){
with(_34){
return _dataView;
}
}),new objj_method(sel_getUid("dataViewForRow:"),function(_36,_37,_38){
with(_36){
return objj_msgSend(_36,"dataView");
}
}),new objj_method(sel_getUid("_newDataViewForRow:"),function(_39,_3a,_3b){
with(_39){
var _3c=objj_msgSend(_39,"dataViewForRow:",_3b),_3d=objj_msgSend(_3c,"UID");
var x=objj_msgSend(_39,"tableView")._cachedDataViews[_3d];
if(x&&x.length){
return x.pop();
}
if(!_dataViewData[_3d]){
_dataViewData[_3d]=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_3c);
}
var _3f=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_dataViewData[_3d]);
_3f.identifier=_3d;
return _3f;
}
}),new objj_method(sel_getUid("setIdentifier:"),function(_40,_41,_42){
with(_40){
_identifier=_42;
}
}),new objj_method(sel_getUid("identifier"),function(_43,_44){
with(_43){
return _identifier;
}
}),new objj_method(sel_getUid("setEditable:"),function(_45,_46,_47){
with(_45){
_isEditable=_47;
}
}),new objj_method(sel_getUid("isEditable"),function(_48,_49){
with(_48){
return _isEditable;
}
}),new objj_method(sel_getUid("setSortDescriptorPrototype:"),function(_4a,_4b,_4c){
with(_4a){
_sortDescriptorPrototype=_4c;
}
}),new objj_method(sel_getUid("sortDescriptorPrototype"),function(_4d,_4e){
with(_4d){
return _sortDescriptorPrototype;
}
}),new objj_method(sel_getUid("setHidden:"),function(_4f,_50,_51){
with(_4f){
_isHidden=_51;
}
}),new objj_method(sel_getUid("isHidden"),function(_52,_53){
with(_52){
return _isHidden;
}
}),new objj_method(sel_getUid("setHeaderToolTip:"),function(_54,_55,_56){
with(_54){
_headerToolTip=_56;
}
}),new objj_method(sel_getUid("headerToolTip"),function(_57,_58){
with(_57){
return _headerToolTip;
}
})]);
var _59="CPTableColumnIdentifierKey",_5a="CPTableColumnHeaderViewKey",_5b="CPTableColumnDataViewKey",_5c="CPTableColumnWidthKey",_5d="CPTableColumnMinWidthKey",_5e="CPTableColumnMaxWidthKey",_5f="CPTableColumnResizingMaskKey";
var _1=objj_getClass("CPTableColumn");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTableColumn\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_60,_61,_62){
with(_60){
_60=objj_msgSendSuper({receiver:_60,super_class:objj_getClass("CPObject")},"init");
if(_60){
_dataViewData={};
_width=objj_msgSend(_62,"decodeFloatForKey:",_5c);
_minWidth=objj_msgSend(_62,"decodeFloatForKey:",_5d);
_maxWidth=objj_msgSend(_62,"decodeFloatForKey:",_5e);
objj_msgSend(_60,"setIdentifier:",objj_msgSend(_62,"decodeObjectForKey:",_59));
objj_msgSend(_60,"setHeaderView:",objj_msgSend(CPTextField,"new"));
objj_msgSend(_60,"setDataView:",objj_msgSend(CPTextField,"new"));
}
return _60;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_63,_64,_65){
with(_63){
objj_msgSend(_65,"encodeObject:forKey:",_identifier,_59);
objj_msgSend(_65,"encodeObject:forKey:",_width,_5c);
objj_msgSend(_65,"encodeObject:forKey:",_minWidth,_5d);
objj_msgSend(_65,"encodeObject:forKey:",_maxWidth,_5e);
}
})]);
var _1=objj_getClass("CPTableColumn");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTableColumn\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setHeaderCell:"),function(_66,_67,_68){
with(_66){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"setHeaderCell: is not supported. -setHeaderCell:aView instead.");
}
}),new objj_method(sel_getUid("headerCell"),function(_69,_6a){
with(_69){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"headCell is not supported. -headerView instead.");
}
}),new objj_method(sel_getUid("setDataCell:"),function(_6b,_6c,_6d){
with(_6b){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"setDataCell: is not supported. Use -setHeaderCell:aView instead.");
}
}),new objj_method(sel_getUid("dataCell"),function(_6e,_6f){
with(_6e){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"dataCell is not supported. Use -dataCell instead.");
}
}),new objj_method(sel_getUid("dataCellForRow:"),function(_70,_71,row){
with(_70){
objj_msgSend(CPException,"raise:reason:",CPUnsupportedMethodException,"dataCellForRow: is not supported. Use -dataViewForRow:row instead.");
}
})]);
