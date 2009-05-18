i;13;CPTableView.jc;2698;
var _1=objj_allocateClassPair(CPTableView,"CPOutlineView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_outlineDataSource"),new objj_ivar("_itemsByRow")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPTableView")},"initWithFrame:",_5);
if(_3){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPTableView")},"setDataSource:",_3);
_itemsByRow=objj_msgSend(objj_msgSend(CPArray,"alloc"),"init");
}
return _3;
}
}),new objj_method(sel_getUid("setDataSource:"),function(_6,_7,_8){
with(_6){
if(!objj_msgSend(_8,"respondsToSelector:",sel_getUid("outlineView:child:ofItem"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source must implement 'outlineView:child:ofItem'");
}
if(!objj_msgSend(_8,"respondsToSelector:",sel_getUid("outlineView:isItemExpandable"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source must implement 'outlineView:isItemExpandable'");
}
if(!objj_msgSend(_8,"respondsToSelector:",sel_getUid("outlineView:numberOfChildrenOfItem"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source must implement 'outlineView:numberOfChildrenOfItem'");
}
if(!objj_msgSend(_8,"respondsToSelector:",sel_getUid("outlineView:objectValueForTableColumn:byItem"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,"Data source must implement 'outlineView:objectValueForTableColumn:byItem'");
}
_outlineDataSource=_8;
objj_msgSend(_6,"reloadData");
}
}),new objj_method(sel_getUid("reloadData"),function(_9,_a){
with(_9){
_numberOfVisibleItems=objj_msgSend(_outlineDataSource,"outlineView:numberOfChildrenOfItem:",_9,nil);
_numberOfRows=_numberOfVisibleItems;
var i=0;
for(;i<_numberOfVisibleItems;++i){
_itemsByRow[i]=objj_msgSend(_outlineDataSource,"outlineView:child:ofItem:",_9,i,nil);
}
objj_msgSend(_9,"loadTableCellsInRect:",objj_msgSend(_9,"bounds"));
}
})]);
var _1=objj_getClass("CPOutlineView");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPOutlineView\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("numberOfRowsInTableView:"),function(_c,_d,_e){
with(_c){
return _numberOfVisibleItems;
}
}),new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"),function(_f,_10,_11,_12,_13){
with(_f){
return objj_msgSend(_outlineDataSource,"outlineView:objectValueForTableColumn:byItem:",_f,_12,_itemsByRow[_13]);
}
})]);
