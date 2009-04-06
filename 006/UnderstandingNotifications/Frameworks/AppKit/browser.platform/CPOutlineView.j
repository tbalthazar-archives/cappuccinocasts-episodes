i;13;CPTableView.jc;3176;
{var the_class = objj_allocateClassPair(CPTableView, "CPOutlineView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_outlineDataSource"), new objj_ivar("_itemsByRow")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView") }, "initWithFrame:", aFrame);
    if (self)
    {
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTableView") }, "setDataSource:", self);
        _itemsByRow = objj_msgSend(objj_msgSend(CPArray, "alloc"), "init");
    }
    return self;
}
}), new objj_method(sel_getUid("setDataSource:"), function(self, _cmd, aDataSource)
{ with(self)
{
    if (!objj_msgSend(aDataSource, "respondsToSelector:", sel_getUid("outlineView:child:ofItem")))
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Data source must implement 'outlineView:child:ofItem'");
    if (!objj_msgSend(aDataSource, "respondsToSelector:", sel_getUid("outlineView:isItemExpandable")))
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Data source must implement 'outlineView:isItemExpandable'");
    if (!objj_msgSend(aDataSource, "respondsToSelector:", sel_getUid("outlineView:numberOfChildrenOfItem")))
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Data source must implement 'outlineView:numberOfChildrenOfItem'");
    if (!objj_msgSend(aDataSource, "respondsToSelector:", sel_getUid("outlineView:objectValueForTableColumn:byItem")))
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Data source must implement 'outlineView:objectValueForTableColumn:byItem'");
    _outlineDataSource = aDataSource;
    objj_msgSend(self, "reloadData");
}
}), new objj_method(sel_getUid("reloadData"), function(self, _cmd)
{ with(self)
{
    _numberOfVisibleItems = objj_msgSend(_outlineDataSource, "outlineView:numberOfChildrenOfItem:", self, nil);
    _numberOfRows = _numberOfVisibleItems;
    var i = 0;
    for (; i < _numberOfVisibleItems; ++i)
        _itemsByRow[i] = objj_msgSend(_outlineDataSource, "outlineView:child:ofItem:", self, i, nil);
    objj_msgSend(self, "loadTableCellsInRect:", objj_msgSend(self, "bounds"));
}
})]);
}
{
var the_class = objj_getClass("CPOutlineView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPOutlineView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("numberOfRowsInTableView:"), function(self, _cmd, aTableView)
{ with(self)
{
    return _numberOfVisibleItems;
}
}), new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"), function(self, _cmd, aTableView, aTableColumn, aRowIndex)
{ with(self)
{
    return objj_msgSend(_outlineDataSource, "outlineView:objectValueForTableColumn:byItem:", self, aTableColumn, _itemsByRow[aRowIndex]);
}
})]);
}

