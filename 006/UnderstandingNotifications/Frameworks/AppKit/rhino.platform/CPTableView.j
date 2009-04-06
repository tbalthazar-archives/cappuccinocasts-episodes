i;11;CPControl.ji;15;CPTableColumn.ji;9;CPColor.ji;13;CPTextField.jc;38378;
CPTableViewColumnDidMoveNotification = "CPTableViewColumnDidMoveNotification";
CPTableViewColumnDidResizeNotification = "CPTableViewColumnDidResizeNotification";
CPTableViewSelectionDidChangeNotification = "CPTableViewSelectionDidChangeNotification";
CPTableViewSelectionIsChangingNotification = "CPTableViewSelectionIsChangingNotification";
var _CPTableViewWillDisplayCellSelector = 1 << 0,
    _CPTableViewShouldSelectRowSelector = 1 << 1,
    _CPTableViewShouldSelectTableColumnSelector = 1 << 2,
    _CPTableViewSelectionShouldChangeSelector = 1 << 3,
    _CPTableViewShouldEditTableColumnSelector = 1 << 4,
    _CPTableViewSelectionIndexesForProposedSelectionSelector = 1 << 5,
    _CPTableViewHeightOfRowSelector = 1 << 6;
{var the_class = objj_allocateClassPair(CPControl, "CPTableView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_dataSource"), new objj_ivar("_delegate"), new objj_ivar("_tableColumns"), new objj_ivar("_selectedRowIndexes"), new objj_ivar("_rowHeight"), new objj_ivar("_intercellSpacing"), new objj_ivar("_allowsMultipleSelection"), new objj_ivar("_allowsEmptySelection"), new objj_ivar("_delegateSelectorsCache"), new objj_ivar("_numberOfRows"), new objj_ivar("_hasVariableHeightRows"), new objj_ivar("_columnHeight"), new objj_ivar("_rowHeights"), new objj_ivar("_rowMinYs"), new objj_ivar("_tableCells"), new objj_ivar("_tableColumnViews"), new objj_ivar("_dataViewCache"), new objj_ivar("_objectValueCache"), new objj_ivar("_visibleRows"), new objj_ivar("_visibleColumns"), new objj_ivar("_populatedRows"), new objj_ivar("_populatedColumns"), new objj_ivar("_previousSelectedRowIndexes"), new objj_ivar("_selectionStartRow"), new objj_ivar("_selectionModifier"), new objj_ivar("_currentlySelected"), new objj_ivar("_selectionViews"), new objj_ivar("_selectionViewsPool"), new objj_ivar("_scrollTimer")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    if (self)
    {
        objj_msgSend(self, "_init");
    }
    return self;
}
}), new objj_method(sel_getUid("_init"), function(self, _cmd)
{ with(self)
{
    _tableColumns = [];
    _selectedRowIndexes = objj_msgSend(CPIndexSet, "indexSet");
    _rowHeight = 17.0;
    _intercellSpacing = CPSizeMake(3.0, 2.0);
    _allowsMultipleSelection = YES;
    _allowsEmptySelection = YES;
    _tableCells = [];
    _tableColumnViews = [];
    _dataViewCache = {};
    _objectValueCache = [];
    _visibleRows = CPMakeRange(0, 0);
    _visibleColumns = CPMakeRange(0, 0);
    _rowHeights = [];
    _rowMinYs = [];
}
}), new objj_method(sel_getUid("_columnHeight"), function(self, _cmd)
{ with(self)
{
    return _columnHeight;
}
}), new objj_method(sel_getUid("newCellForRow:column:avoidingRows:"), function(self, _cmd, aRowIndex, aColumnIndex, rows)
{ with(self)
{
    var dataView = objj_msgSend(_tableColumns[aColumnIndex], "_newDataViewForRow:avoidingRows:", aRowIndex, rows);
    objj_msgSend(dataView, "setFrame:", CGRectMake(0.0, (_hasVariableHeightRows ? _rowMinYs[aRowIndex] : (aRowIndex * (_rowHeight + _intercellSpacing.height))), objj_msgSend(_tableColumns[aColumnIndex], "width"), (_hasVariableHeightRows ? _rowHeights[aRowIndex] : _rowHeight)));
    if (objj_msgSend(dataView, "respondsToSelector:", sel_getUid("highlight:")))
        objj_msgSend(dataView, "highlight:", objj_msgSend(_selectedRowIndexes, "containsIndex:", aRowIndex));
    if (!_objectValueCache[aColumnIndex])
        _objectValueCache[aColumnIndex] = [];
    if (_objectValueCache[aColumnIndex][aRowIndex] === undefined)
        _objectValueCache[aColumnIndex][aRowIndex] = objj_msgSend(_dataSource, "tableView:objectValueForTableColumn:row:", self, _tableColumns[aColumnIndex], aRowIndex);
    objj_msgSend(dataView, "setObjectValue:", _objectValueCache[aColumnIndex][aRowIndex]);
    return dataView;
}
}), new objj_method(sel_getUid("clearCells"), function(self, _cmd)
{ with(self)
{
    var columnEnd = CPMaxRange(_visibleColumns),
        rowEnd = CPMaxRange(_visibleRows);
    for (var column = _visibleColumns.location; column < columnEnd; column++)
    {
        var tableColumn = _tableColumns[column],
            tableColumnCells = _tableCells[column];
        for (var row = _visibleRows.location; row < rowEnd; row++)
        {
            var cell = tableColumnCells[row];
            if (cell)
            {
                tableColumnCells[row] = nil;
                objj_msgSend(tableColumn, "_markView:inRow:asPurgable:", cell, row, YES);
            }
            else
            {
                CPLog.warn("Missing cell? " + row + "," + column);
            }
        }
    }
    _visibleColumns = CPMakeRange(0,0);
    _visibleRows = CPMakeRange(0,0);
}
}), new objj_method(sel_getUid("loadTableCellsInRect:"), function(self, _cmd, aRect)
{ with(self)
{
   if (!_dataSource)
        return;
    var rowStart = MAX(0, objj_msgSend(self, "_rowAtY:", CGRectGetMinY(aRect)) - 1),
        rowEnd = MIN(_numberOfRows, objj_msgSend(self, "_rowAtY:", CGRectGetMaxY(aRect)) + 1),
        visibleRows = CPMakeRange(rowStart, rowEnd - rowStart),
        columnStart = MAX(0, objj_msgSend(self, "_columnAtX:", CGRectGetMinX(aRect))),
        columnEnd = MIN(_tableColumns.length, objj_msgSend(self, "_columnAtX:", CGRectGetMaxX(aRect)) + 1),
        visibleColumns = CPMakeRange(columnStart, columnEnd - columnStart);
    if (CPEqualRanges(_visibleRows, visibleRows) && CPEqualRanges(_visibleColumns, visibleColumns))
        return;
    var unionVisibleRows = CPUnionRange(_visibleRows, visibleRows),
        unionVisibleColumns = CPUnionRange(_visibleColumns, visibleColumns);
    if (unionVisibleRows.length * unionVisibleColumns.length <=
        (_visibleRows.length * _visibleColumns.length) + (visibleRows.length * visibleColumns.length))
    {
        var cEnd = CPMaxRange(unionVisibleColumns),
            rEnd = CPMaxRange(unionVisibleRows),
            cell;
        for (var column = unionVisibleColumns.location; column < cEnd; ++column)
        {
            var tableColumn = _tableColumns[column],
                tableColumnCells = _tableCells[column],
                columnIsVisible = CPLocationInRange(column, visibleColumns),
                newCells = [];
            for (var row = unionVisibleRows.location; row < rEnd; ++row)
            {
                if (cell = tableColumnCells[row])
                {
                    if (!columnIsVisible || !CPLocationInRange(row, visibleRows))
                    {
                        tableColumnCells[row] = nil;
                        objj_msgSend(tableColumn, "_markView:inRow:asPurgable:", cell, row, YES);
                    }
                }
                else
                {
                    newCells.push(row);
                }
            }
            while (newCells.length > 0)
            {
                var row = newCells.pop();
                tableColumnCells[row] = objj_msgSend(self, "newCellForRow:column:avoidingRows:", row, column, visibleRows);
                if (!tableColumnCells[row]._superview)
                    objj_msgSend(_tableColumnViews[column], "addSubview:", tableColumnCells[row]);
                else if (tableColumnCells[row]._isHidden)
                    objj_msgSend(tableColumnCells[row], "setHidden:", NO);
            }
            objj_msgSend(tableColumn, "_purge");
        }
    }
    else {
        var cEnd = CPMaxRange(_visibleColumns),
            rEnd = CPMaxRange(_visibleRows),
            cell;
        for (var column = _visibleColumns.location; column < cEnd; ++column)
        {
            var tableColumn = _tableColumns[column],
                tableColumnCells = _tableCells[column],
                columnIsVisible = CPLocationInRange(column, visibleColumns);
            for (var row = _visibleRows.location; row < rEnd; ++row)
            {
                if (cell = tableColumnCells[row])
                {
                    if (!columnIsVisible || !CPLocationInRange(row, visibleRows))
                    {
                        tableColumnCells[row] = nil;
                        objj_msgSend(tableColumn, "_markView:inRow:asPurgable:", cell, row, YES);
                    }
                }
            }
        }
        var cEnd = CPMaxRange(visibleColumns),
            rEnd = CPMaxRange(visibleRows);
        for (var column = visibleColumns.location; column < cEnd; ++column)
        {
            var tableColumn = _tableColumns[column],
                tableColumnCells = _tableCells[column];
            for (var row = visibleRows.location; row < rEnd; ++row)
            {
                tableColumnCells[row] = objj_msgSend(self, "newCellForRow:column:avoidingRows:", row, column, visibleRows);
                if (!tableColumnCells[row]._superview)
                    objj_msgSend(_tableColumnViews[column], "addSubview:", tableColumnCells[row]);
                else if (tableColumnCells[row]._isHidden)
                    objj_msgSend(tableColumnCells[row], "setHidden:", NO);
            }
            objj_msgSend(tableColumn, "_purge");
        }
    }
    _visibleRows = visibleRows;
    _visibleColumns = visibleColumns;
}
}), new objj_method(sel_getUid("setIntercellSpacing:"), function(self, _cmd, aSize)
{ with(self)
{
    if (_intercellSpacing.width != aSize.width)
    {
        var i = 1,
            delta = aSize.width - _intercellSpacing.width;
            total = delta;
        for (; i < _tableColumns.length; ++i, total += delta)
        {
            var origin = objj_msgSend(_tableColumnViews[i], "frame").origin;
            objj_msgSend(_tableColumnViews[i], "setFrameOrigin:", CGPointMake(origin.x + total, origin.y));
        }
    }
    if (_intercellSpacing.height != aSize.height)
    {
        var i = 0;
        for (; i < _tableColumns.length; ++i, total += delta)
        {
            objj_msgSend(_tableColumnViews[i], "setFrameSize:", CGSizeMake(objj_msgSend(_tableColumnViews[i], "width"), _numberOfRows * (_rowHeight + _intercellSpacing.height)));
            var j = 1,
                y = _rowHeight + _intercellSpacing.height;
            for (; j < _numberOfRows; ++i, y += _rowHeight + _intercellSpacing.height)
            {
                if (!_tableCells[i][j])
                    continue;
                objj_msgSend(_tableCells[i][j], "setFrameOrigin:", CPPointMake(0.0, y));
            }
        }
    }
    _intercellSpacing = CPSizeCreateCopy(aSize);
}
}), new objj_method(sel_getUid("intercellSpacing"), function(self, _cmd)
{ with(self)
{
    return _intercellSpacing;
}
}), new objj_method(sel_getUid("setRowHeight:"), function(self, _cmd, aRowHeight)
{ with(self)
{
    if (_rowHeight == aRowHeight)
        return;
    _rowHeight = aRowHeight;
    if (_hasVariableHeightRows)
        return;
    for (var row = 0; row < _numberOfRows; ++row)
        for (var column = 0; column < _tableColumns.length; ++column)
            objj_msgSend(_tableCells[column][row], "setFrameOrigin:", CPPointMake(0.0, row * (_rowHeight + _intercellSpacing.height)));
}
}), new objj_method(sel_getUid("rowHeight"), function(self, _cmd)
{ with(self)
{
    return _rowHeight;
}
}), new objj_method(sel_getUid("addTableColumn:"), function(self, _cmd, aTableColumn)
{ with(self)
{
    var i = 0,
        x = _tableColumns.length ? CPRectGetMaxX(objj_msgSend(self, "rectOfColumn:", _tableColumns.length - 1)) + _intercellSpacing.width : 0.0,
        tableColumnView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CPRectMake(x, 0.0, objj_msgSend(aTableColumn, "width"), objj_msgSend(self, "_columnHeight"))),
        tableColumnCells = [];
    objj_msgSend(_tableColumns, "addObject:", aTableColumn);
    objj_msgSend(_tableColumnViews, "addObject:", tableColumnView);
    objj_msgSend(self, "addSubview:", tableColumnView);
    objj_msgSend(_tableCells, "addObject:", tableColumnCells);
    for (; i < _numberOfRows; ++i)
        _tableCells[_tableColumns.length-1][i] = nil;
}
}), new objj_method(sel_getUid("removeTableColumn:"), function(self, _cmd, aTableColumn)
{ with(self)
{
    var frame = objj_msgSend(self, "frame"),
        width = objj_msgSend(aTableColumn, "width") + _intercellSpacing.width,
        index = objj_msgSend(_tableColumns, "indexOfObjectIdenticalTo:", aTableColumn);
    objj_msgSend(_tableColumnViews[i], "removeFromSuperview");
    objj_msgSend(_tableCells, "removeObjectAtIndex:", index);
    objj_msgSend(_tableColumns, "removeObjectAtIndex:", index);
    objj_msgSend(_tabelColumnViews, "removeObjectAtIndex:", index);
    for (; index < _tableColumns.length; ++ index)
        objj_msgSend(_tableColumnViews[index], "setFrameOrigin:", CPPointMake(CPRectGetMinX(objj_msgSend(_tableColumnViews[index], "frame")) - width, 0.0))
    objj_msgSend(self, "setFrameSize:", CPSizeMake(CPRectGetWidth(frame) - width, CPRectGetHeight(frame)));
}
}), new objj_method(sel_getUid("moveColumn:toColumn:"), function(self, _cmd, fromIndex, toIndex)
{ with(self)
{
    if (fromIndex == toIndex)
        return;
}
}), new objj_method(sel_getUid("tableColumns"), function(self, _cmd)
{ with(self)
{
    return _tableColumns;
}
}), new objj_method(sel_getUid("tableColumnWithIdentifier:"), function(self, _cmd, anObject)
{ with(self)
{
    for (var i = 0; i < _tableColumns.length; i++)
        if (objj_msgSend(_tableColumns[i], "isEqual:", anObject))
            return _tableColumns[i];
    return nil;
}
}), new objj_method(sel_getUid("numberOfColumns"), function(self, _cmd)
{ with(self)
{
    return _tableColumns.length;
}
}), new objj_method(sel_getUid("numberOfRows"), function(self, _cmd)
{ with(self)
{
    return _numberOfRows;
}
}), new objj_method(sel_getUid("tile"), function(self, _cmd)
{ with(self)
{
    var HEIGHT = 10.0;
}
}), new objj_method(sel_getUid("setDataSource:"), function(self, _cmd, aDataSource)
{ with(self)
{
    if (!objj_msgSend(aDataSource, "respondsToSelector:", sel_getUid("numberOfRowsInTableView:")))
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Data source doesn't support 'numberOfRowsInTableView:'");
    if (!objj_msgSend(aDataSource, "respondsToSelector:", sel_getUid("tableView:objectValueForTableColumn:row:")))
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "Data source doesn't support 'tableView:objectValueForTableColumn:row:'");
    _dataSource = aDataSource;
    objj_msgSend(self, "reloadData");
}
}), new objj_method(sel_getUid("dataSource"), function(self, _cmd)
{ with(self)
{
    return _dataSource;
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    if (_delegate === aDelegate)
        return;
    var notificationCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewColumnDidMove:")))
        objj_msgSend(notificationCenter, "removeObserver:name:object:", _delegate, CPTableViewColumnDidMoveNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewColumnDidResize:")))
        objj_msgSend(notificationCenter, "removeObserver:name:object:", _delegate, CPTableViewColumnDidResizeNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewSelectionDidChange:")))
        objj_msgSend(notificationCenter, "removeObserver:name:object:", _delegate, CPTableViewSelectionDidChangeNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewSelectionIsChanging:")))
        objj_msgSend(notificationCenter, "removeObserver:name:object:", _delegate, CPTableViewSelectionIsChangingNotification, self);
    _delegate = aDelegate;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewColumnDidMove:")))
        objj_msgSend(notificationCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("tableViewColumnDidMove:"), CPTableViewColumnDidMoveNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewColumnDidResize:")))
        objj_msgSend(notificationCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("tableViewColumnDidResize:"), CPTableViewColumnDidResizeNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewSelectionDidChange:")))
        objj_msgSend(notificationCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("tableViewSelectionDidChange:"), CPTableViewSelectionDidChangeNotification, self);
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableViewSelectionIsChanging:")))
        objj_msgSend(notificationCenter, "addObserver:selector:name:object:", _delegate, sel_getUid("tableViewSelectionIsChanging:"), CPTableViewSelectionIsChangingNotification, self);
    _delegateSelectorsCache = 0;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:willDisplayCell:forTableColumn:row:")))
        _delegateSelectorsCache |= _CPTableViewWillDisplayCellSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:shouldSelectRow:")))
        _delegateSelectorsCache |= _CPTableViewShouldSelectRowSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:shouldSelectTableColumn:")))
        _delegateSelectorsCache |= _CPTableViewShouldSelectTableColumnSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("selectionShouldChangeInTableView:")))
        _delegateSelectorsCache |= _CPTableViewSelectionShouldChangeSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:shouldEditTableColumn:row:")))
        _delegateSelectorsCache |= _CPTableViewShouldEditTableColumnSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:selectionIndexesForProposedSelection:")))
        _delegateSelectorsCache |= _CPTableViewSelectionIndexesForProposedSelectionSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tableView:heightOfRow:")))
    {
        _delegateSelectorsCache |= _CPTableViewHeightOfRowSelector;
        _hasVariableHeightRows = YES;
    }
    else
        _hasVariableHeightRows = NO;
}
}), new objj_method(sel_getUid("noteNumberOfRowsChanged"), function(self, _cmd)
{ with(self)
{
    var numberOfRows = objj_msgSend(_dataSource, "numberOfRowsInTableView:", self);
    if (_numberOfRows != numberOfRows)
    {
        _numberOfRows = numberOfRows;
        objj_msgSend(self, "_recalculateColumnHeight");
    }
}
}), new objj_method(sel_getUid("noteHeightOfRowsWithIndexesChanged:"), function(self, _cmd, indexSet)
{ with(self)
{
    objj_msgSend(self, "_recalculateColumnHeight");
}
}), new objj_method(sel_getUid("rectOfRow:"), function(self, _cmd, aRowIndex)
{ with(self)
{
    return CPRectMake(0.0, (_hasVariableHeightRows ? _rowMinYs[aRowIndex] : (aRowIndex * (_rowHeight + _intercellSpacing.height))), CPRectGetWidth(objj_msgSend(self, "bounds")), (_hasVariableHeightRows ? _rowHeights[aRowIndex] : _rowHeight));
}
}), new objj_method(sel_getUid("rectOfColumn:"), function(self, _cmd, aColumnIndex)
{ with(self)
{
    return objj_msgSend(_tableColumnViews[aColumnIndex], "frame");
}
}), new objj_method(sel_getUid("sizeToFit"), function(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("_recalculateColumnHeight"), function(self, _cmd)
{ with(self)
{
    var oldColumnHeight = _columnHeight;
    if (_hasVariableHeightRows)
    {
        _rowMinYs[0] = 0;
        for (var row = 0; row < _numberOfRows; row++)
        {
            _rowHeights[row] = objj_msgSend(_delegate, "tableView:heightOfRow:", self, row);
            _rowMinYs[row+1] = _rowMinYs[row] + _rowHeights[row] + _intercellSpacing.height;
        }
        _columnHeight = _rowMinYs[_numberOfRows];
    }
    else
        _columnHeight = _numberOfRows * (_rowHeight + _intercellSpacing.height);
    var count = _tableColumnViews.length;
    while (count--)
        objj_msgSend(_tableColumnViews[count], "setFrameSize:", CGSizeMake(objj_msgSend(_tableColumns[count], "width"), _columnHeight));
    objj_msgSend(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(objj_msgSend(self, "frame")), _columnHeight));
}
}), new objj_method(sel_getUid("visibleRectInParent"), function(self, _cmd)
{ with(self)
{
    var superview = objj_msgSend(self, "superview");
    if (!superview)
        return objj_msgSend(self, "bounds");
    return objj_msgSend(self, "convertRect:fromView:", CGRectIntersection(objj_msgSend(superview, "bounds"), objj_msgSend(self, "frame")), superview);
}
}), new objj_method(sel_getUid("reloadData"), function(self, _cmd)
{ with(self)
{
    var oldNumberOfRows = _numberOfRows;
    _numberOfRows = objj_msgSend(_dataSource, "numberOfRowsInTableView:", self);
    if (oldNumberOfRows != _numberOfRows)
    {
        objj_msgSend(self, "_recalculateColumnHeight");
        objj_msgSend(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(objj_msgSend(self, "frame")), objj_msgSend(self, "_columnHeight")));
    }
    _objectValueCache = [];
    objj_msgSend(self, "clearCells");
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("layoutSubviews"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "loadTableCellsInRect:", objj_msgSend(self, "visibleRectInParent"));
}
}), new objj_method(sel_getUid("displaySoon"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(_scrollTimer, "invalidate");
    _scrollTimer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", 0.05, self, sel_getUid("displayNow"), nil, NO);
}
}), new objj_method(sel_getUid("displayNow"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("viewDidMoveToSuperview"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(objj_msgSend(self, "enclosingScrollView"), "contentView"), "setPostsBoundsChangedNotifications:", YES);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("viewBoundsChanged:"), CPViewBoundsDidChangeNotification, objj_msgSend(objj_msgSend(self, "enclosingScrollView"), "contentView"));
}
}), new objj_method(sel_getUid("viewBoundsChanged:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "displayNow");
}
}), new objj_method(sel_getUid("setAllowsMultipleSelection:"), function(self, _cmd, allowsMultipleSelection)
{ with(self)
{
    if (_allowsMultipleSelection === allowsMultipleSelection)
        return;
    _allowsMultipleSelection = allowsMultipleSelection;
}
}), new objj_method(sel_getUid("allowsMultipleSelection"), function(self, _cmd)
{ with(self)
{
    return _allowsMultipleSelection;
}
}), new objj_method(sel_getUid("setAllowsEmptySelection:"), function(self, _cmd, allowsEmptySelection)
{ with(self)
{
    if (_allowsEmptySelection === allowsEmptySelection)
        return;
    _allowsEmptySelection = allowsEmptySelection;
}
}), new objj_method(sel_getUid("allowsEmptySelection"), function(self, _cmd)
{ with(self)
{
    return _allowsEmptySelection;
}
}), new objj_method(sel_getUid("rowAtPoint:"), function(self, _cmd, aPoint)
{ with(self)
{
    var index = objj_msgSend(self, "_rowAtY:", aPoint.y)
    if (index >= 0 && index < _numberOfRows)
        return index;
    else
        return CPNotFound;
}
}), new objj_method(sel_getUid("columnAtPoint:"), function(self, _cmd, aPoint)
{ with(self)
{
    var index = objj_msgSend(self, "_columnAtX:", aPoint.x)
    if (index >= 0 && index < _tableColumns.length)
        return index;
    else
        return CPNotFound;
}
}), new objj_method(sel_getUid("_rowAtY:"), function(self, _cmd, y)
{ with(self)
{
    if (_hasVariableHeightRows)
    {
        var a = 0,
            b = _numberOfRows;
        if (y < _rowMinYs[0])
            return -1;
        if (y >= _rowMinYs[_rowMinYs.length-1])
            return _numberOfRows;
        while (true)
        {
            var half = a + Math.floor((b - a) / 2);
            if (y < _rowMinYs[half])
                b = half;
            else if (half < _numberOfRows-1 && y >= _rowMinYs[half+1])
                a = half;
            else
                return half;
        }
    }
    else
        return FLOOR(y / (_rowHeight + _intercellSpacing.height));
}
}), new objj_method(sel_getUid("_columnAtX:"), function(self, _cmd, x)
{ with(self)
{
    var a = 0,
        b = _tableColumns.length;
    var last = objj_msgSend(_tableColumnViews[_tableColumns.length-1], "frame");
    if (x < objj_msgSend(_tableColumnViews[0], "frame").origin.x)
        return -1;
    if (x >= last.origin.x + last.size.width)
        return _tableColumns.length;
    while (true)
    {
        var half = a + Math.floor((b - a) / 2);
        if (x < objj_msgSend(_tableColumnViews[half], "frame").origin.x)
            b = half;
        else if (half < _tableColumns.length-1 && x >= objj_msgSend(_tableColumnViews[half+1], "frame").origin.x)
            a = half;
        else
            return half;
    }
}
}), new objj_method(sel_getUid("selectRowIndexes:byExtendingSelection:"), function(self, _cmd, indexes, extend)
{ with(self)
{
    if (extend)
        _selectedRowIndexes = objj_msgSend(objj_msgSend(_selectedRowIndexes, "copy"), "addIndexes:", indexes);
    else if (objj_msgSend(indexes, "count") > 0 || _allowsEmptySelection)
        _selectedRowIndexes = objj_msgSend(indexes, "copy");
    objj_msgSend(self, "_drawSelection");
}
}), new objj_method(sel_getUid("selectedRowIndexes"), function(self, _cmd)
{ with(self)
{
    return _selectedRowIndexes;
}
}), new objj_method(sel_getUid("numberOfSelectedRows"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_selectedRowIndexes, "count");
}
}), new objj_method(sel_getUid("deselectAll:"), function(self, _cmd, sender)
{ with(self)
{
    if (!_allowsEmptySelection || objj_msgSend(_selectedRowIndexes, "count") === 0 ||
            ((_delegateSelectorsCache & _CPTableViewSelectionShouldChangeSelector) && !objj_msgSend(_delegate, "selectionShouldChangeInTableView:", self)))
        return;
    objj_msgSend(self, "selectRowIndexes:byExtendingSelection:", objj_msgSend(CPIndexSet, "indexSet"), NO);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPTableViewSelectionDidChangeNotification, self, nil);
}
}), new objj_method(sel_getUid("editColumn:row:withEvent:select:"), function(self, _cmd, columnIndex, rowIndex, theEvent, flag)
{ with(self)
{
}
}), new objj_method(sel_getUid("_updateSelectionWithMouseAtRow:"), function(self, _cmd, aRow)
{ with(self)
{
    var newSelection;
    if (_allowsMultipleSelection)
        newSelection = objj_msgSend(CPIndexSet, "indexSetWithIndexesInRange:", CPMakeRange(MIN(aRow, _selectionStartRow), ABS(aRow-_selectionStartRow)+1));
    else if (aRow >= 0 && aRow < _numberOfRows)
        newSelection = objj_msgSend(CPIndexSet, "indexSetWithIndex:", aRow);
    else
        newSelection = objj_msgSend(CPIndexSet, "indexSet");
    if (_allowsMultipleSelection && _selectionModifier & (CPCommandKeyMask | CPControlKeyMask | CPAlternateKeyMask))
    {
        var intersection = objj_msgSend(newSelection, "copy"),
            difference = objj_msgSend(newSelection, "copy");
        objj_msgSend(difference, "removeIndexes:", _previousSelectedRowIndexes);
        objj_msgSend(intersection, "removeIndexes:", difference)
        objj_msgSend(newSelection, "addIndexes:", _previousSelectedRowIndexes);
        objj_msgSend(newSelection, "removeIndexes:", intersection);
    }
    if (!objj_msgSend(newSelection, "isEqualToIndexSet:", _selectedRowIndexes))
    {
        if ((_delegateSelectorsCache & _CPTableViewSelectionShouldChangeSelector) && !objj_msgSend(_delegate, "selectionShouldChangeInTableView:", self))
            return;
        if (_delegateSelectorsCache & _CPTableViewSelectionIndexesForProposedSelectionSelector)
            newSelection = objj_msgSend(_delegate, "tableView:selectionIndexesForProposedSelection:", self, newSelection);
        else if (_delegateSelectorsCache & _CPTableViewShouldSelectRowSelector)
        {
            var indexes = [];
            objj_msgSend(newSelection, "getIndexes:maxCount:inIndexRange:", indexes, Number.MAX_VALUE, nil);
            for (var i = 0; i < indexes.length; i++)
                if (!objj_msgSend(_delegate, "tableView:shouldSelectRow:", self, indexes[i]))
                    objj_msgSend(newSelection, "removeIndex:", indexes[i]);
        }
    }
    if (!_allowsEmptySelection && objj_msgSend(newSelection, "count") === 0)
        return;
    if (!objj_msgSend(newSelection, "isEqualToIndexSet:", _selectedRowIndexes))
    {
        objj_msgSend(self, "selectRowIndexes:byExtendingSelection:", newSelection, NO);
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPTableViewSelectionIsChangingNotification, self, nil);
    }
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(self, "trackSelection:", anEvent);
}
}), new objj_method(sel_getUid("setDoubleAction:"), function(self, _cmd, aSelector)
{ with(self)
{
    _doubleAction = aSelector;
}
}), new objj_method(sel_getUid("doubleAction"), function(self, _cmd)
{ with(self)
{
    return _doubleAction;
}
}), new objj_method(sel_getUid("clickedColumn"), function(self, _cmd)
{ with(self)
{
    return _clickedColumn;
}
}), new objj_method(sel_getUid("clickedRow"), function(self, _cmd)
{ with(self)
{
    return _clickedRow;
}
}), new objj_method(sel_getUid("trackSelection:"), function(self, _cmd, anEvent)
{ with(self)
{
    var type = objj_msgSend(anEvent, "type"),
        point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil),
        currentRow = MAX(0, MIN(_numberOfRows-1, objj_msgSend(self, "_rowAtY:", point.y)));
    if (type == CPLeftMouseUp)
    {
        _clickedRow = objj_msgSend(self, "rowAtPoint:", point);
        _clickedColumn = objj_msgSend(self, "columnAtPoint:", point);
        if (objj_msgSend(anEvent, "clickCount") === 2)
        {
            CPLog.warn("edit?!");
            objj_msgSend(self, "sendAction:to:", _doubleAction, _target);
        }
        else
        {
            if (!objj_msgSend(_previousSelectedRowIndexes, "isEqualToIndexSet:", _selectedRowIndexes))
            {
                objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CPTableViewSelectionDidChangeNotification, self, nil);
            }
            objj_msgSend(self, "sendAction:to:", _action, _target);
        }
        return;
    }
    if (type == CPLeftMouseDown)
    {
        _previousSelectedRowIndexes = _selectedRowIndexes;
        _selectionModifier = objj_msgSend(anEvent, "modifierFlags");
        if (_selectionModifier & CPShiftKeyMask)
            _selectionStartRow = (ABS(objj_msgSend(_previousSelectedRowIndexes, "firstIndex") - currentRow) < ABS(objj_msgSend(_previousSelectedRowIndexes, "lastIndex") - currentRow)) ?
                objj_msgSend(_previousSelectedRowIndexes, "firstIndex") : objj_msgSend(_previousSelectedRowIndexes, "lastIndex");
        else
            _selectionStartRow = currentRow;
        objj_msgSend(self, "_updateSelectionWithMouseAtRow:", currentRow);
    }
    else if (type == CPLeftMouseDragged)
    {
        objj_msgSend(self, "_updateSelectionWithMouseAtRow:", currentRow);
    }
    objj_msgSend(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("trackSelection:"), CPLeftMouseDraggedMask | CPLeftMouseUpMask, nil, nil, YES);
}
}), new objj_method(sel_getUid("_drawSelection"), function(self, _cmd)
{ with(self)
{
    if (!_currentlySelected) {
        _currentlySelected = objj_msgSend(CPIndexSet, "indexSet");
        _selectionViews = [];
        _selectionViewsPool = [];
    }
    var removeSet = objj_msgSend(_currentlySelected, "copy"),
        indexesToRemove = [];
    objj_msgSend(removeSet, "removeIndexes:", _selectedRowIndexes);
    objj_msgSend(removeSet, "getIndexes:maxCount:inIndexRange:", indexesToRemove, Number.MAX_VALUE, nil);
    var addSet = objj_msgSend(_selectedRowIndexes, "copy"),
        indexesToAdd = [];
    objj_msgSend(addSet, "removeIndexes:", _currentlySelected);
    objj_msgSend(addSet, "getIndexes:maxCount:inIndexRange:", indexesToAdd, Number.MAX_VALUE, nil);
    for (var i = 0; i < indexesToRemove.length; i++)
    {
        var row = indexesToRemove[i];
        for (var column = 0; column < _tableColumns.length; column++)
            if (objj_msgSend(_tableCells[column][row], "respondsToSelector:", sel_getUid("highlight:")))
                objj_msgSend(_tableCells[column][row], "highlight:", NO);
    }
    for (var i = 0; i < indexesToAdd.length; i++)
    {
        var row = indexesToAdd[i];
        for (var column = 0; column < _tableColumns.length; column++)
            if (objj_msgSend(_tableCells[column][row], "respondsToSelector:", sel_getUid("highlight:")))
                objj_msgSend(_tableCells[column][row], "highlight:", YES);
    }
    for (var i = 0; i < indexesToAdd.length; i++)
    {
        var index = indexesToAdd[i],
            view;
        if (indexesToRemove.length > 0)
        {
            view = _selectionViews[indexesToRemove.pop()];
        }
        else if (_selectionViewsPool.length > 0)
        {
            view = _selectionViewsPool.pop();
            objj_msgSend(self, "addSubview:positioned:relativeTo:", view, CPWindowBelow, nil);
        }
        else
        {
            view = objj_msgSend(objj_msgSend(CPView, "alloc"), "init");
            objj_msgSend(view, "setBackgroundColor:", objj_msgSend(CPColor, "alternateSelectedControlColor"));
            objj_msgSend(self, "addSubview:positioned:relativeTo:", view, CPWindowBelow, nil);
        }
        _selectionViews[index] = view;
        var frame = objj_msgSend(self, "rectOfRow:", index);
        frame.size.height += _intercellSpacing.height - 1;
        objj_msgSend(view, "setFrame:", frame);
    }
    for (var i = 0; i < indexesToRemove.length; i++)
    {
        var row = indexesToRemove[i],
            view = _selectionViews[row];
        objj_msgSend(view, "removeFromSuperview");
        _selectionViewsPool.push(view);
    }
    _currentlySelected = objj_msgSend(_selectedRowIndexes, "copy");
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
}
})]);
}
var CPTableViewDataSourceKey = "CPTableViewDataSourceKey",
    CPTableViewDelegateKey = "CPTableViewDelegateKey",
    CPTableViewHeaderViewKey = "CPTableViewHeaderViewKey",
    CPTableViewTableColumnsKey = "CPTableViewTableColumnsKey",
    CPTableViewRowHeightKey = "CPTableViewRowHeightKey",
    CPTableViewIntercellSpacingKey = "CPTableViewIntercellSpacingKey",
    CPTableViewMultipleSelectionKey = "CPTableViewMultipleSelectionKey",
    CPTableViewEmptySelectionKey = "CPTableViewEmptySelectionKey";
{
var the_class = objj_getClass("CPTableView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPTableView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder))
    {
        objj_msgSend(self, "_init");
        _dataSource = objj_msgSend(aCoder, "decodeObjectForKey:", CPTableViewDataSourceKey);
        _delegate = objj_msgSend(aCoder, "decodeObjectForKey:", CPTableViewDelegateKey);
        _rowHeight = objj_msgSend(aCoder, "decodeFloatForKey:", CPTableViewRowHeightKey);
        _intercellSpacing = objj_msgSend(aCoder, "decodeSizeForKey:", CPTableViewIntercellSpacingKey);
        _allowsMultipleSelection = objj_msgSend(aCoder, "decodeBoolForKey:", CPTableViewMultipleSelectionKey);
        _allowsEmptySelection = objj_msgSend(aCoder, "decodeBoolForKey:", CPTableViewEmptySelectionKey);
        var tableColumns = objj_msgSend(aCoder, "decodeObjectForKey:", CPTableViewTableColumnsKey);
        for (var i = 0; i < tableColumns.length; i++)
            objj_msgSend(self, "addTableColumn:", tableColumns[i]);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", _dataSource, CPTableViewDataSourceKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _delegate, CPTableViewDelegateKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _tableColumns, CPTableViewTableColumnsKey);
    objj_msgSend(aCoder, "encodeFloat:forKey:", _rowHeight, CPTableViewRowHeightKey);
    objj_msgSend(aCoder, "encodeSize:forKey:", _intercellSpacing, CPTableViewIntercellSpacingKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _allowsMultipleSelection, CPTableViewMultipleSelectionKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _allowsEmptySelection, CPTableViewEmptySelectionKey);
}
})]);
}
{
var the_class = objj_getClass("CPColor")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPColor\""));
var meta_class = the_class.isa;class_addMethods(meta_class, [new objj_method(sel_getUid("alternateSelectedControlColor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.22, 0.46, 0.84, 1.0]);
}
}), new objj_method(sel_getUid("secondarySelectedControlColor"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPColor, "alloc"), "_initWithRGBA:", [0.83, 0.83, 0.83, 1.0]);
}
})]);
}

