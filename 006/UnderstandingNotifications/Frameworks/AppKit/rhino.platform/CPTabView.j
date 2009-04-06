i;13;CPImageView.ji;15;CPTabViewItem.ji;8;CPView.jc;24556;
CPTopTabsBezelBorder = 0;
CPNoTabsBezelBorder = 4;
CPNoTabsLineBorder = 5;
CPNoTabsNoBorder = 6;
var CPTabViewBezelBorderLeftImage = nil,
    CPTabViewBackgroundCenterImage = nil,
    CPTabViewBezelBorderRightImage = nil,
    CPTabViewBezelBorderColor = nil,
    CPTabViewBezelBorderBackgroundColor = nil;
var LEFT_INSET = 7.0,
    RIGHT_INSET = 7.0;
var CPTabViewDidSelectTabViewItemSelector = 1,
    CPTabViewShouldSelectTabViewItemSelector = 2,
    CPTabViewWillSelectTabViewItemSelector = 4,
    CPTabViewDidChangeNumberOfTabViewItemsSelector = 8;
{var the_class = objj_allocateClassPair(CPView, "CPTabView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_labelsView"), new objj_ivar("_backgroundView"), new objj_ivar("_separatorView"), new objj_ivar("_auxiliaryView"), new objj_ivar("_contentView"), new objj_ivar("_tabViewItems"), new objj_ivar("_selectedTabViewItem"), new objj_ivar("_tabViewType"), new objj_ivar("_delegate"), new objj_ivar("_delegateSelectors")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _tabViewType = CPTopTabsBezelBorder;
        _tabViewItems = [];
    }
    return self;
}
}), new objj_method(sel_getUid("viewDidMoveToWindow"), function(self, _cmd)
{ with(self)
{
    if (_tabViewType != CPTopTabsBezelBorder || _labelsView)
        return;
    objj_msgSend(self, "_createBezelBorder");
    objj_msgSend(self, "layoutSubviews");
}
}), new objj_method(sel_getUid("_createBezelBorder"), function(self, _cmd)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds");
    _labelsView = objj_msgSend(objj_msgSend(_CPTabLabelsView, "alloc"), "initWithFrame:", CGRectMake(0.0, 0.0, CGRectGetWidth(bounds), 0.0));
    objj_msgSend(_labelsView, "setTabView:", self);
    objj_msgSend(_labelsView, "setAutoresizingMask:", CPViewWidthSizable);
    objj_msgSend(self, "addSubview:", _labelsView);
    _backgroundView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(_backgroundView, "setBackgroundColor:", CPTabViewBezelBorderBackgroundColor);
    objj_msgSend(_backgroundView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    objj_msgSend(self, "addSubview:", _backgroundView);
    _separatorView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(_separatorView, "setBackgroundColor:", objj_msgSend(objj_msgSend(self, "class"), "bezelBorderColor"));
    objj_msgSend(_separatorView, "setAutoresizingMask:", CPViewWidthSizable | CPViewMaxYMargin);
    objj_msgSend(self, "addSubview:", _separatorView);
}
}), new objj_method(sel_getUid("layoutSubviews"), function(self, _cmd)
{ with(self)
{
    if (_tabViewType == CPTopTabsBezelBorder)
    {
        var backgroundRect = objj_msgSend(self, "bounds"),
            labelsViewHeight = objj_msgSend(_CPTabLabelsView, "height");
        backgroundRect.origin.y += labelsViewHeight;
        backgroundRect.size.height -= labelsViewHeight;
        objj_msgSend(_backgroundView, "setFrame:", backgroundRect);
        var auxiliaryViewHeight = 5.0;
        if (_auxiliaryView)
        {
            auxiliaryViewHeight = CGRectGetHeight(objj_msgSend(_auxiliaryView, "frame"));
            objj_msgSend(_auxiliaryView, "setFrame:", CGRectMake(LEFT_INSET, labelsViewHeight, CGRectGetWidth(backgroundRect) - LEFT_INSET - RIGHT_INSET, auxiliaryViewHeight));
        }
        objj_msgSend(_separatorView, "setFrame:", CGRectMake(LEFT_INSET, labelsViewHeight + auxiliaryViewHeight, CGRectGetWidth(backgroundRect) - LEFT_INSET - RIGHT_INSET, 1.0));
    }
    objj_msgSend(_contentView, "setFrame:", objj_msgSend(self, "contentRect"));
}
}), new objj_method(sel_getUid("addTabViewItem:"), function(self, _cmd, aTabViewItem)
{ with(self)
{
    objj_msgSend(self, "insertTabViewItem:atIndex:", aTabViewItem, objj_msgSend(_tabViewItems, "count"));
}
}), new objj_method(sel_getUid("insertTabViewItem:atIndex:"), function(self, _cmd, aTabViewItem, anIndex)
{ with(self)
{
    objj_msgSend(_tabViewItems, "insertObject:atIndex:", aTabViewItem, anIndex);
    objj_msgSend(_labelsView, "tabView:didAddTabViewItem:", self, aTabViewItem);
    if (objj_msgSend(_tabViewItems, "count") == 1)
        objj_msgSend(self, "selectFirstTabViewItem:", self);
    if (_delegateSelectors & CPTabViewDidChangeNumberOfTabViewItemsSelector)
        objj_msgSend(_delegate, "tabViewDidChangeNumberOfTabViewItems:", self);
}
}), new objj_method(sel_getUid("removeTabViewItem:"), function(self, _cmd, aTabViewItem)
{ with(self)
{
    objj_msgSend(_tabViewItems, "removeObjectIdenticalTo:", aTabViewItem);
    objj_msgSend(_labelsView, "tabView:didRemoveTabViewItem:", self, aTabViewItem);
    if (_delegateSelectors & CPTabViewDidChangeNumberOfTabViewItemsSelector)
        objj_msgSend(_delegate, "tabViewDidChangeNumberOfTabViewItems:", self);
}
}), new objj_method(sel_getUid("indexOfTabViewItem:"), function(self, _cmd, aTabViewItem)
{ with(self)
{
    return objj_msgSend(_tabViewItems, "indexOfObjectIdenticalTo:", aTabViewItem);
}
}), new objj_method(sel_getUid("indexOfTabViewItemWithIdentifier:"), function(self, _cmd, anIdentifier)
{ with(self)
{
    var index = 0,
        count = objj_msgSend(_tabViewItems, "count");
    for (; index < count; ++index)
        if (objj_msgSend(objj_msgSend(_tabViewItems[index], "identifier"), "isEqual:", anIdentifier))
            return index;
    return index;
}
}), new objj_method(sel_getUid("numberOfTabViewItems"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(_tabViewItems, "count");
}
}), new objj_method(sel_getUid("tabViewItemAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return _tabViewItems[anIndex];
}
}), new objj_method(sel_getUid("tabViewItems"), function(self, _cmd)
{ with(self)
{
    return _tabViewItems;
}
}), new objj_method(sel_getUid("selectFirstTabViewItem:"), function(self, _cmd, aSender)
{ with(self)
{
    var count = objj_msgSend(_tabViewItems, "count");
    if (count)
        objj_msgSend(self, "selectTabViewItemAtIndex:", 0);
}
}), new objj_method(sel_getUid("selectLastTabViewItem:"), function(self, _cmd, aSender)
{ with(self)
{
    var count = objj_msgSend(_tabViewItems, "count");
    if (count)
        objj_msgSend(self, "selectTabViewItemAtIndex:", count - 1);
}
}), new objj_method(sel_getUid("selectNextTabViewItem:"), function(self, _cmd, aSender)
{ with(self)
{
    if (!_selectedTabViewItem)
        return;
    var index = objj_msgSend(self, "indexOfTabViewItem:", _selectedTabViewItem),
        count = objj_msgSend(_tabViewItems, "count");
    objj_msgSend(self, "selectTabViewItemAtIndex:", index + 1 % count);
}
}), new objj_method(sel_getUid("selectPreviousTabViewItem:"), function(self, _cmd, aSender)
{ with(self)
{
    if (!_selectedTabViewItem)
        return;
    var index = objj_msgSend(self, "indexOfTabViewItem:", _selectedTabViewItem),
        count = objj_msgSend(_tabViewItems, "count");
    objj_msgSend(self, "selectTabViewItemAtIndex:", index == 0 ? count : index - 1);
}
}), new objj_method(sel_getUid("selectTabViewItem:"), function(self, _cmd, aTabViewItem)
{ with(self)
{
    if ((_delegateSelectors & CPTabViewShouldSelectTabViewItemSelector) && !objj_msgSend(_delegate, "tabView:shouldSelectTabViewItem:", self, aTabViewItem))
        return;
    if (_delegateSelectors & CPTabViewWillSelectTabViewItemSelector)
        objj_msgSend(_delegate, "tabView:willSelectTabViewItem:", self, aTabViewItem);
    if (_selectedTabViewItem)
    {
        _selectedTabViewItem._tabState = CPBackgroundTab;
        objj_msgSend(_labelsView, "tabView:didChangeStateOfTabViewItem:", self, _selectedTabViewItem);
        objj_msgSend(_contentView, "removeFromSuperview");
        objj_msgSend(_auxiliaryView, "removeFromSuperview");
    }
    _selectedTabViewItem = aTabViewItem;
    _selectedTabViewItem._tabState = CPSelectedTab;
    _contentView = objj_msgSend(_selectedTabViewItem, "view");
    objj_msgSend(_contentView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    _auxiliaryView = objj_msgSend(_selectedTabViewItem, "auxiliaryView");
    objj_msgSend(_auxiliaryView, "setAutoresizingMask:", CPViewWidthSizable);
    objj_msgSend(self, "addSubview:", _contentView);
    if (_auxiliaryView)
        objj_msgSend(self, "addSubview:", _auxiliaryView);
    objj_msgSend(_labelsView, "tabView:didChangeStateOfTabViewItem:", self, _selectedTabViewItem);
    objj_msgSend(self, "layoutSubviews");
    if (_delegateSelectors & CPTabViewDidSelectTabViewItemSelector)
        objj_msgSend(_delegate, "tabView:didSelectTabViewItem:", self, aTabViewItem);
}
}), new objj_method(sel_getUid("selectTabViewItemAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    objj_msgSend(self, "selectTabViewItem:", _tabViewItems[anIndex]);
}
}), new objj_method(sel_getUid("selectedTabViewItem"), function(self, _cmd)
{ with(self)
{
    return _selectedTabViewItem;
}
}), new objj_method(sel_getUid("setTabViewType:"), function(self, _cmd, aTabViewType)
{ with(self)
{
    if (_tabViewType == aTabViewType)
        return;
    _tabViewType = aTabViewType;
    if (_tabViewType == CPNoTabsBezelBorder || _tabViewType == CPNoTabsLineBorder || _tabViewType == CPNoTabsNoBorder)
        objj_msgSend(_labelsView, "removeFromSuperview");
    else if (!objj_msgSend(_labelsView, "superview"))
        objj_msgSend(self, "addSubview:", _labelsView);
    if (_tabViewType == CPNoTabsLineBorder || _tabViewType == CPNoTabsNoBorder)
        objj_msgSend(_backgroundView, "removeFromSuperview");
    else if (!objj_msgSend(_backgroundView, "superview"))
        objj_msgSend(self, "addSubview:", _backgroundView);
    objj_msgSend(self, "layoutSubviews");
}
}), new objj_method(sel_getUid("tabViewType"), function(self, _cmd)
{ with(self)
{
    return _tabViewType;
}
}), new objj_method(sel_getUid("contentRect"), function(self, _cmd)
{ with(self)
{
    var contentRect = CGRectMakeCopy(objj_msgSend(self, "bounds"));
    if (_tabViewType == CPTopTabsBezelBorder)
    {
        var labelsViewHeight = objj_msgSend(_CPTabLabelsView, "height"),
            auxiliaryViewHeight = _auxiliaryView ? CGRectGetHeight(objj_msgSend(_auxiliaryView, "frame")) : 5.0,
            separatorViewHeight = 1.0;
        contentRect.origin.y += labelsViewHeight + auxiliaryViewHeight + separatorViewHeight;
        contentRect.size.height -= labelsViewHeight + auxiliaryViewHeight + separatorViewHeight * 2.0;
        contentRect.origin.x += LEFT_INSET;
        contentRect.size.width -= LEFT_INSET + RIGHT_INSET;
    }
    return contentRect;
}
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    if (_delegate == aDelegate)
        return;
    _delegate = aDelegate;
    _delegateSelectors = 0;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tabView:shouldSelectTabViewItem:")))
        _delegateSelectors |= CPTabViewShouldSelectTabViewItemSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tabView:willSelectTabViewItem:")))
        _delegateSelectors |= CPTabViewWillSelectTabViewItemSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tabView:didSelectTabViewItem:")))
        _delegateSelectors |= CPTabViewDidSelectTabViewItemSelector;
    if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("tabViewDidChangeNumberOfTabViewItems:")))
        _delegateSelectors |= CPTabViewDidChangeNumberOfTabViewItemsSelector;
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    var location = objj_msgSend(_labelsView, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil),
        tabViewItem = objj_msgSend(_labelsView, "representedTabViewItemAtPoint:", location);
    if (tabViewItem)
        objj_msgSend(self, "selectTabViewItem:", tabViewItem);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != CPTabView)
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self),
        emptyImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initByReferencingFile:size:", "", CGSizeMake(7.0, 0.0)),
        backgroundImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/CPTabViewBezelBackgroundCenter.png"), CGSizeMake(1.0, 1.0)),
        bezelBorderLeftImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/CPTabViewBezelBorderLeft.png"), CGSizeMake(7.0, 1.0)),
        bezerBorderImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/CPTabViewBezelBorder.png"), CGSizeMake(1.0, 1.0)),
        bezelBorderRightImage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/CPTabViewBezelBorderRight.png"), CGSizeMake(7.0, 1.0));
    CPTabViewBezelBorderBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", 
        [
            emptyImage,
            emptyImage,
            emptyImage,
            bezelBorderLeftImage,
            backgroundImage,
            bezelBorderRightImage,
            bezelBorderLeftImage,
            bezerBorderImage,
            bezelBorderRightImage
        ]));
    CPTabViewBezelBorderColor = objj_msgSend(CPColor, "colorWithPatternImage:", bezerBorderImage);
}
}), new objj_method(sel_getUid("bezelBorderColor"), function(self, _cmd)
{ with(self)
{
    return CPTabViewBezelBorderColor;
}
})]);
}
var CPTabViewItemsKey = "CPTabViewItemsKey",
    CPTabViewSelectedItemKey = "CPTabViewSelectedItemKey",
    CPTabViewTypeKey = "CPTabViewTypeKey",
    CPTabViewDelegateKey = "CPTabViewDelegateKey";
{
var the_class = objj_getClass("CPTabView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPTabView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithCoder:", aCoder))
    {
        _tabViewType = objj_msgSend(aCoder, "decodeIntForKey:", CPTabViewTypeKey);
        _tabViewItems = [];
        objj_msgSend(self, "_createBezelBorder");
        var items = objj_msgSend(aCoder, "decodeObjectForKey:", CPTabViewItemsKey);
        for (var i = 0; items && i < items.length; i++)
            objj_msgSend(self, "insertTabViewItem:atIndex:", items[i], i);
        var selected = objj_msgSend(aCoder, "decodeObjectForKey:", CPTabViewSelectedItemKey);
        if (selected)
            objj_msgSend(self, "selectTabViewItem:", selected);
        objj_msgSend(self, "setDelegate:", objj_msgSend(aCoder, "decodeObjectForKey:", CPTabViewDelegateKey));
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    var actualSubviews = _subviews;
    _subviews = [];
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "encodeWithCoder:", aCoder);
    _subviews = actualSubviews;
    objj_msgSend(aCoder, "encodeObject:forKey:", _tabViewItems, CPTabViewItemsKey);;
    objj_msgSend(aCoder, "encodeObject:forKey:", _selectedTabViewItem, CPTabViewSelectedItemKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _tabViewType, CPTabViewTypeKey);
    objj_msgSend(aCoder, "encodeConditionalObject:forKey:", _delegate, CPTabViewDelegateKey);
}
})]);
}
var _CPTabLabelsViewBackgroundColor = nil,
    _CPTabLabelsViewInsideMargin = 10.0,
    _CPTabLabelsViewOutsideMargin = 15.0;
{var the_class = objj_allocateClassPair(CPView, "_CPTabLabelsView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_tabView"), new objj_ivar("_tabLabels")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _tabLabels = [];
        objj_msgSend(self, "setBackgroundColor:", _CPTabLabelsViewBackgroundColor);
        objj_msgSend(self, "setFrameSize:", CGSizeMake(CGRectGetWidth(aFrame), 26.0));
    }
    return self;
}
}), new objj_method(sel_getUid("setTabView:"), function(self, _cmd, aTabView)
{ with(self)
{
    _tabView = aTabView;
}
}), new objj_method(sel_getUid("tabView"), function(self, _cmd)
{ with(self)
{
    return _tabView;
}
}), new objj_method(sel_getUid("tabView:didAddTabViewItem:"), function(self, _cmd, aTabView, aTabViewItem)
{ with(self)
{
    var label = objj_msgSend(objj_msgSend(_CPTabLabel, "alloc"), "initWithFrame:", CGRectMakeZero());
    objj_msgSend(label, "setTabViewItem:", aTabViewItem);
    _tabLabels.push(label);
    objj_msgSend(self, "addSubview:", label);
    objj_msgSend(self, "layoutSubviews");
}
}), new objj_method(sel_getUid("tabView:didRemoveTabViewItem:"), function(self, _cmd, aTabView, aTabViewItem)
{ with(self)
{
    var index = objj_msgSend(aTabView, "indexOfTabViewItem:", aTabViewItem),
        label = _tabLabels[index];
    objj_msgSend(_tabLabels, "removeObjectAtIndex:", index);
    objj_msgSend(label, "removeFromSuperview");
    objj_msgSend(self, "layoutSubviews");
}
}), new objj_method(sel_getUid("tabView:didChangeStateOfTabViewItem:"), function(self, _cmd, aTabView, aTabViewItem)
{ with(self)
{
    objj_msgSend(_tabLabels[objj_msgSend(aTabView, "indexOfTabViewItem:", aTabViewItem)], "setTabState:", objj_msgSend(aTabViewItem, "tabState"));
 }
}), new objj_method(sel_getUid("representedTabViewItemAtPoint:"), function(self, _cmd, aPoint)
{ with(self)
{
    var index = 0,
        count = _tabLabels.length;
    for (; index < count; ++index)
    {
        var label = _tabLabels[index];
        if (CGRectContainsPoint(objj_msgSend(label, "frame"), aPoint))
            return objj_msgSend(label, "tabViewItem");
    }
    return nil;
}
}), new objj_method(sel_getUid("layoutSubviews"), function(self, _cmd)
{ with(self)
{
    var index = 0,
        count = _tabLabels.length,
        width = ((objj_msgSend(self, "bounds").size.width) - (count - 1) * _CPTabLabelsViewInsideMargin - 2 * _CPTabLabelsViewOutsideMargin) / count,
        x = _CPTabLabelsViewOutsideMargin;
    for (; index < count; ++index)
    {
        var label = _tabLabels[index],
            frame = { origin: { x:x, y:8.0 }, size: { width:width, height:18.0 } };
        objj_msgSend(label, "setFrame:", frame);
        x = (frame.origin.x + frame.size.width) + _CPTabLabelsViewInsideMargin;
    }
}
}), new objj_method(sel_getUid("setFrameSize:"), function(self, _cmd, aSize)
{ with(self)
{
    if (CGSizeEqualToSize(objj_msgSend(self, "frame").size, aSize))
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setFrameSize:", aSize);
    objj_msgSend(self, "layoutSubviews");
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPTabLabelsView, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPTabLabelsViewBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPThreePartImage, "alloc"), "initWithImageSlices:isVertical:", 
        [
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelsViewLeft.png"), CGSizeMake(12.0, 26.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelsViewCenter.png"), CGSizeMake(1.0, 26.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelsViewRight.png"), CGSizeMake(12.0, 26.0))
        ], NO));
}
}), new objj_method(sel_getUid("height"), function(self, _cmd)
{ with(self)
{
    return 26.0;
}
})]);
}
var _CPTabLabelBackgroundColor = nil,
    _CPTabLabelSelectedBackgroundColor = nil;
{var the_class = objj_allocateClassPair(CPView, "_CPTabLabel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_tabViewItem"), new objj_ivar("_labelField")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _labelField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(_labelField, "setAlignment:", CPCenterTextAlignment);
        objj_msgSend(_labelField, "setFrame:", CGRectMake(5.0, 0.0, CGRectGetWidth(aFrame) - 10.0, 20.0));
        objj_msgSend(_labelField, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(_labelField, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 11.0));
        objj_msgSend(self, "addSubview:", _labelField);
        objj_msgSend(self, "setTabState:", CPBackgroundTab);
    }
    return self;
}
}), new objj_method(sel_getUid("setTabState:"), function(self, _cmd, aTabState)
{ with(self)
{
    objj_msgSend(self, "setBackgroundColor:", aTabState == CPSelectedTab ? _CPTabLabelSelectedBackgroundColor : _CPTabLabelBackgroundColor);
}
}), new objj_method(sel_getUid("setTabViewItem:"), function(self, _cmd, aTabViewItem)
{ with(self)
{
    _tabViewItem = aTabViewItem;
    objj_msgSend(self, "update");
}
}), new objj_method(sel_getUid("tabViewItem"), function(self, _cmd)
{ with(self)
{
    return _tabViewItem;
}
}), new objj_method(sel_getUid("update"), function(self, _cmd)
{ with(self)
{
    objj_msgSend(_labelField, "setStringValue:", objj_msgSend(_tabViewItem, "label"));
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function(self, _cmd)
{ with(self)
{
    if (self != objj_msgSend(_CPTabLabel, "class"))
        return;
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", self);
    _CPTabLabelBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPThreePartImage, "alloc"), "initWithImageSlices:isVertical:", 
        [
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelBackgroundLeft.png"), CGSizeMake(6.0, 18.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelBackgroundCenter.png"), CGSizeMake(1.0, 18.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelBackgroundRight.png"), CGSizeMake(6.0, 18.0))
        ], NO));
    _CPTabLabelSelectedBackgroundColor = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPThreePartImage, "alloc"), "initWithImageSlices:isVertical:", 
        [
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelSelectedLeft.png"), CGSizeMake(3.0, 18.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelSelectedCenter.png"), CGSizeMake(1.0, 18.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "CPTabView/_CPTabLabelSelectedRight.png"), CGSizeMake(3.0, 18.0))
        ], NO));
}
})]);
}

