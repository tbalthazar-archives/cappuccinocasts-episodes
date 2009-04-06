I;23;Foundation/Foundation.jc;9437;
CPTableColumnNoResizing = 0;
CPTableColumnAutoresizingMask = 1;
CPTableColumnUserResizingMask = 2;
{var the_class = objj_allocateClassPair(CPObject, "CPTableColumn"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_identifier"), new objj_ivar("_headerView"), new objj_ivar("_tableView"), new objj_ivar("_width"), new objj_ivar("_minWidth"), new objj_ivar("_maxWidth"), new objj_ivar("_resizingMask"), new objj_ivar("_dataView"), new objj_ivar("_dataViewData"), new objj_ivar("_dataViewForView"), new objj_ivar("_purgableInfosForDataView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithIdentifier:"), function(self, _cmd, anIdentifier)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        objj_msgSend(self, "_init");
        _identifier = anIdentifier;
        _width = 40.0;
        _minWidth = 8.0;
        _maxWidth = 1000.0;
        var dataView = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CPRectMakeZero());
        objj_msgSend(dataView, "setValue:forThemedAttributeName:inControlState:", objj_msgSend(CPColor, "whiteColor"), "text-color", CPControlStateHighlighted);
        objj_msgSend(self, "setDataView:", dataView);
        _headerView = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CPRectMakeZero());
        objj_msgSend(_headerView, "setBackgroundColor:", objj_msgSend(CPColor, "greenColor"));
    }
    return self;
}
}), new objj_method(sel_getUid("_init"), function(self, _cmd)
{ with(self)
{
    _dataViewData = {};
    _dataViewForView = {};
    _purgableInfosForDataView = {};
}
}), new objj_method(sel_getUid("setIdentifier:"), function(self, _cmd, anIdentifier)
{ with(self)
{
    _identifier = anIdentifier;
}
}), new objj_method(sel_getUid("identifier"), function(self, _cmd)
{ with(self)
{
    return _identifier;
}
}), new objj_method(sel_getUid("setTableView:"), function(self, _cmd, aTableView)
{ with(self)
{
    _tableView = aTableView;
}
}), new objj_method(sel_getUid("tableView"), function(self, _cmd)
{ with(self)
{
    return _tableView;
}
}), new objj_method(sel_getUid("setWidth:"), function(self, _cmd, aWidth)
{ with(self)
{
    _width = aWidth;
}
}), new objj_method(sel_getUid("width"), function(self, _cmd)
{ with(self)
{
    return _width;
}
}), new objj_method(sel_getUid("setMinWidth:"), function(self, _cmd, aWidth)
{ with(self)
{
    if (_width < (_minWidth = aWidth))
        objj_msgSend(self, "setWidth:", _minWidth);
}
}), new objj_method(sel_getUid("minWidth"), function(self, _cmd)
{ with(self)
{
    return _minWidth;
}
}), new objj_method(sel_getUid("setMaxWidth:"), function(self, _cmd, aWidth)
{ with(self)
{
    if (_width > (_maxmimumWidth = aWidth))
        objj_msgSend(self, "setWidth:", _maxWidth);
}
}), new objj_method(sel_getUid("setResizingMask:"), function(self, _cmd, aMask)
{ with(self)
{
    _resizingMask = aMask;
}
}), new objj_method(sel_getUid("resizingMask"), function(self, _cmd)
{ with(self)
{
    return _resizingMask;
}
}), new objj_method(sel_getUid("sizeToFit"), function(self, _cmd)
{ with(self)
{
    var width = CPRectGetWidth(objj_msgSend(_headerView, "frame"));
    if (width < _minWidth)
        objj_msgSend(self, "setMinWidth:", width);
    else if (width > _maxWidth)
        objj_msgSend(self, "setMaxWidth:", width)
    if (_width != width)
        objj_msgSend(self, "setWidth:", width);
}
}), new objj_method(sel_getUid("setEditable:"), function(self, _cmd, aFlag)
{ with(self)
{
    _isEditable = aFlag;
}
}), new objj_method(sel_getUid("isEditable"), function(self, _cmd)
{ with(self)
{
    return _isEditable;
}
}), new objj_method(sel_getUid("setHeaderView:"), function(self, _cmd, aView)
{ with(self)
{
    _headerView = aView;
}
}), new objj_method(sel_getUid("headerView"), function(self, _cmd)
{ with(self)
{
    return _headerView;
}
}), new objj_method(sel_getUid("setDataCell:"), function(self, _cmd, aView)
{ with(self)
{
    objj_msgSend(self, "setDataView:", aView);
}
}), new objj_method(sel_getUid("setDataView:"), function(self, _cmd, aView)
{ with(self)
{
    if (_dataView)
        _dataViewData[objj_msgSend(_dataView, "hash")] = nil;
    _dataView = aView;
    _dataViewData[objj_msgSend(aView, "hash")] = objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", aView);
}
}), new objj_method(sel_getUid("dataCell"), function(self, _cmd)
{ with(self)
{
    return _dataView;
}
}), new objj_method(sel_getUid("dataView"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "dataCell");
}
}), new objj_method(sel_getUid("dataCellForRow:"), function(self, _cmd, aRowIndex)
{ with(self)
{
    return objj_msgSend(self, "dataView");
}
}), new objj_method(sel_getUid("dataViewForRow:"), function(self, _cmd, aRowIndex)
{ with(self)
{
    return objj_msgSend(self, "dataCellForRow:", aRowIndex);
}
}), new objj_method(sel_getUid("_markView:inRow:asPurgable:"), function(self, _cmd, aView, aRow, isPurgable)
{ with(self)
{
    var viewHash = objj_msgSend(aView, "hash"),
        dataViewHash = objj_msgSend(_dataViewForView[viewHash], "hash");
    if (!_purgableInfosForDataView[dataViewHash])
    {
        if (!isPurgable)
            return;
        _purgableInfosForDataView[dataViewHash] = {};
    }
    if (!isPurgable) {
        if (_purgableInfosForDataView[dataViewHash][viewHash])
            CPLog.warn("removing unpurgable " + _purgableInfosForDataView[dataViewHash][viewHash]);
        delete _purgableInfosForDataView[dataViewHash][viewHash];
    }
    else
        _purgableInfosForDataView[dataViewHash][viewHash] = { view:(aView), row:(aRow) };
}
}), new objj_method(sel_getUid("_newDataViewForRow:avoidingRows:"), function(self, _cmd, aRowIndex, rows)
{ with(self)
{
    var view = objj_msgSend(self, "dataViewForRow:", aRowIndex),
        viewHash = objj_msgSend(view, "hash"),
        purgableInfos = _purgableInfosForDataView[viewHash];
    if (purgableInfos)
    {
        for (var key in purgableInfos)
        {
            var info = purgableInfos[key];
                delete purgableInfos[key];
                return ((info).view);
        }
    }
    if (!_dataViewData[viewHash])
        _dataViewData[viewHash] = objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", view);
    var newView = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", _dataViewData[viewHash]);
    _dataViewForView[objj_msgSend(newView, "hash")] = view;
    CPLog.warn("creating cell: %s", newView);
    return newView;
}
}), new objj_method(sel_getUid("_purge"), function(self, _cmd)
{ with(self)
{
    for (var viewHash in _purgableInfosForDataView)
    {
        var purgableInfos = _purgableInfosForDataView[viewHash];
        for (var key in purgableInfos)
        {
            var view = ((purgableInfos[key]).view);
            if (!view)
                CPLog.info("key="+key+" view=" + view + " purgableInfos[key]="+purgableInfos[key])
            else if (view._superview) {
                objj_msgSend(view, "setHidden:", YES);
            }
        }
    }
}
})]);
}
var CPTableColumnIdentifierKey = "CPTableColumnIdentifierKey",
    CPTableColumnHeaderViewKey = "CPTableColumnHeaderViewKey",
    CPTableColumnDataViewKey = "CPTableColumnDataViewKey",
    CPTableColumnWidthKey = "CPTableColumnWidthKey",
    CPTableColumnMinWidthKey = "CPTableColumnMinWidthKey",
    CPTableColumnMaxWidthKey = "CPTableColumnMaxWidthKey",
    CPTableColumnResizingMaskKey = "CPTableColumnResizingMaskKey";
{
var the_class = objj_getClass("CPTableColumn")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPTableColumn\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(self, "_init");
    _identifier = objj_msgSend(aCoder, "decodeObjectForKey:", CPTableColumnIdentifierKey);
    objj_msgSend(self, "setHeaderView:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTableColumnHeaderViewKey));
    objj_msgSend(self, "setDataView:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTableColumnDataViewKey));
    _width = objj_msgSend(aCoder, "decodeFloatForKey:", CPTableColumnWidthKey);
    _minWidth = objj_msgSend(aCoder, "decodeFloatForKey:", CPTableColumnMinWidthKey);
    _maxWidth = objj_msgSend(aCoder, "decodeFloatForKey:", CPTableColumnMaxWidthKey);
    _resizingMask = objj_msgSend(aCoder, "decodeBoolForKey:", CPTableColumnResizingMaskKey);
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _identifier, CPTableColumnIdentifierKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _headerView, CPTableColumnHeaderViewKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _dataView, CPTableColumnDataViewKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _width, CPTableColumnWidthKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _minWidth, CPTableColumnMinWidthKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _maxWidth, CPTableColumnMaxWidthKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _resizingMask, CPTableColumnResizingMaskKey);
}
})]);
}

