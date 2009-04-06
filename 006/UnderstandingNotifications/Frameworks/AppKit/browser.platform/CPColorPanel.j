i;10;CPButton.ji;10;CPCookie.ji;9;CPPanel.ji;8;CPView.jc;18939;
CPColorPanelColorDidChangeNotification = "CPColorPanelColorDidChangeNotification";
var PREVIEW_HEIGHT = 20.0,
    TOOLBAR_HEIGHT = 32.0,
    SWATCH_HEIGHT = 14.0,
    ICON_WIDTH = 32.0,
    ICON_PADDING = 12.0;
var SharedColorPanel = nil,
    ColorPickerClasses = [];
CPWheelColorPickerMode = 1;
CPSliderColorPickerMode = 2;
CPColorPickerViewWidth = 265,
CPColorPickerViewHeight = 370;
{var the_class = objj_allocateClassPair(CPPanel, "CPColorPanel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_toolbar"), new objj_ivar("_swatchView"), new objj_ivar("_previewView"), new objj_ivar("_previewLabel"), new objj_ivar("_swatchLabel"), new objj_ivar("_colorPickers"), new objj_ivar("_currentView"), new objj_ivar("_activePicker"), new objj_ivar("_color"), new objj_ivar("_target"), new objj_ivar("_action"), new objj_ivar("_mode")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPanel") }, "initWithContentRect:styleMask:", CGRectMake(500.0, 50.0, 219.0, 322.0), (CPTitledWindowMask | CPClosableWindowMask | CPResizableWindowMask));
    if (self)
    {
        objj_msgSend(self, "setTitle:", "Color Panel");
        objj_msgSend(self, "setLevel:", CPFloatingWindowLevel);
        objj_msgSend(self, "setFloatingPanel:", YES);
        objj_msgSend(self, "setBecomesKeyOnlyIfNeeded:", YES);
        objj_msgSend(self, "setMinSize:", CGSizeMake(219.0, 342.0));
        objj_msgSend(self, "setMaxSize:", CGSizeMake(323.0, 537.0));
    }
    return self;
}
}), new objj_method(sel_getUid("setColor:"), function(self, _cmd, aColor)
{ with(self)
{
    _color = aColor;
    objj_msgSend(_previewView, "setBackgroundColor:",  _color);
    objj_msgSend(CPApp, "sendAction:to:from:", sel_getUid("changeColor:"), nil, self);
    if (_target && _action)
        objj_msgSend(CPApp, "sendAction:to:from:", _action, _target, self);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPColorPanelColorDidChangeNotification, self);
    objj_msgSend(_activePicker, "setColor:", _color);
}
}), new objj_method(sel_getUid("setColor:updatePicker:"), function(self, _cmd, aColor, bool)
{ with(self)
{
    objj_msgSend(self, "setColor:", aColor);
    if (bool)
        objj_msgSend(_activePicker, "setColor:", _color);
}
}), new objj_method(sel_getUid("color"), function(self, _cmd)
{ with(self)
{
    return _color;
}
}), new objj_method(sel_getUid("setTarget:"), function(self, _cmd, aTarget)
{ with(self)
{
    _target = aTarget;
}
}), new objj_method(sel_getUid("target"), function(self, _cmd)
{ with(self)
{
    return _target;
}
}), new objj_method(sel_getUid("setAction:"), function(self, _cmd, anAction)
{ with(self)
{
    _action = anAction;
}
}), new objj_method(sel_getUid("action"), function(self, _cmd)
{ with(self)
{
    return _action;
}
}), new objj_method(sel_getUid("setMode:"), function(self, _cmd, mode)
{ with(self)
{
    _mode = mode;
}
}), new objj_method(sel_getUid("_setPicker:"), function(self, _cmd, sender)
{ with(self)
{
    var picker = _colorPickers[objj_msgSend(sender, "tag")],
        view = objj_msgSend(picker, "provideNewView:", NO);
    if (!view)
        view = objj_msgSend(picker, "provideNewView:", YES);
    if (view == _currentView)
        return;
    if (_currentView)
        objj_msgSend(view, "setFrame:", objj_msgSend(_currentView, "frame"));
    else
    {
        var height = (TOOLBAR_HEIGHT+10+PREVIEW_HEIGHT+5+SWATCH_HEIGHT+10),
            bounds = objj_msgSend(objj_msgSend(self, "contentView"), "bounds");
        objj_msgSend(view, "setFrameSize:",  CPSizeMake(bounds.size.width - 10, bounds.size.height - height));
        objj_msgSend(view, "setFrameOrigin:",  CPPointMake(5, height));
    }
    objj_msgSend(_currentView, "removeFromSuperview");
    objj_msgSend(objj_msgSend(self, "contentView"), "addSubview:", view);
    _currentView = view;
    _activePicker = picker;
    objj_msgSend(picker, "setColor:", objj_msgSend(self, "color"));
}
}), new objj_method(sel_getUid("mode"), function(self, _cmd)
{ with(self)
{
    return _mode;
}
}), new objj_method(sel_getUid("orderFront:"), function(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "_loadContentsIfNecessary");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPPanel") }, "orderFront:", aSender);
}
}), new objj_method(sel_getUid("_loadContentsIfNecessary"), function(self, _cmd)
{ with(self)
{
    if (_toolbar)
        return;
    _colorPickers = [];
    var count = objj_msgSend(ColorPickerClasses, "count");
    for (var i=0; i<count; i++)
    {
        var currentPickerClass = ColorPickerClasses[i],
            currentPicker = objj_msgSend(objj_msgSend(currentPickerClass, "alloc"), "initWithPickerMask:colorPanel:", 0, self);
        _colorPickers.push(currentPicker);
    }
    var contentView = objj_msgSend(self, "contentView"),
        bounds = objj_msgSend(contentView, "bounds");
    _toolbar = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0, 6, CGRectGetWidth(bounds), TOOLBAR_HEIGHT));
    objj_msgSend(_toolbar, "setAutoresizingMask:",  CPViewWidthSizable);
    var totalToolbarWidth = count * ICON_WIDTH + (count - 1) * ICON_PADDING,
        leftOffset = (CGRectGetWidth(bounds) - totalToolbarWidth) / 2.0,
        buttonForLater = nil;
    for (var i=0; i<count; i++)
    {
        var image = objj_msgSend(_colorPickers[i], "provideNewButtonImage"),
            highlightImage = objj_msgSend(_colorPickers[i], "provideNewAlternateButtonImage"),
            button = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(leftOffset + i*(ICON_WIDTH+ICON_PADDING), 0, ICON_WIDTH, ICON_WIDTH));
        objj_msgSend(button, "setTag:", i);
        objj_msgSend(button, "setTarget:", self);
        objj_msgSend(button, "setAction:", sel_getUid("_setPicker:"));
        objj_msgSend(button, "setBordered:", NO);
        objj_msgSend(button, "setAutoresizingMask:", CPViewMinXMargin|CPViewMaxXMargin);
        objj_msgSend(button, "setImage:", image);
        objj_msgSend(button, "setAlternateImage:", highlightImage);
        objj_msgSend(_toolbar, "addSubview:", button);
        if (!buttonForLater)
            buttonForLater = button;
    }
    var previewBox = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(76, TOOLBAR_HEIGHT + 10, CGRectGetWidth(bounds) - 86, PREVIEW_HEIGHT));
    _previewView = objj_msgSend(objj_msgSend(_CPColorPanelPreview, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(previewBox, "bounds"), 2.0, 2.0));
    objj_msgSend(_previewView, "setColorPanel:", self);
    objj_msgSend(_previewView, "setAutoresizingMask:", CPViewWidthSizable);
    objj_msgSend(previewBox, "setBackgroundColor:", objj_msgSend(CPColor, "grayColor"));
    objj_msgSend(previewBox, "setAutoresizingMask:", CPViewWidthSizable);
    objj_msgSend(previewBox, "addSubview:", _previewView);
    _previewLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CPRectMake(10, TOOLBAR_HEIGHT + 13, 60, 15));
    objj_msgSend(_previewLabel, "setStringValue:",  "Preview:");
    objj_msgSend(_previewLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    objj_msgSend(_previewLabel, "setAlignment:", CPRightTextAlignment);
    var swatchBox = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(76, TOOLBAR_HEIGHT + 10 + PREVIEW_HEIGHT + 5, CGRectGetWidth(bounds) - 86, SWATCH_HEIGHT + 2.0));
    objj_msgSend(swatchBox, "setBackgroundColor:", objj_msgSend(CPColor, "grayColor"));
    objj_msgSend(swatchBox, "setAutoresizingMask:", CPViewWidthSizable);
    _swatchView = objj_msgSend(objj_msgSend(_CPColorPanelSwatches, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(swatchBox, "bounds"), 1.0, 1.0));
    objj_msgSend(_swatchView, "setColorPanel:",  self);
    objj_msgSend(_swatchView, "setAutoresizingMask:",  CPViewWidthSizable);
    objj_msgSend(swatchBox, "addSubview:", _swatchView);
    _swatchLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:",  CPRectMake(10, TOOLBAR_HEIGHT + 8 + PREVIEW_HEIGHT + 7, 60, 15));
    objj_msgSend(_swatchLabel, "setStringValue:",  "Swatches:");
    objj_msgSend(_swatchLabel, "setTextColor:", objj_msgSend(CPColor, "blackColor"));
    objj_msgSend(_swatchLabel, "setAlignment:", CPRightTextAlignment);
    objj_msgSend(contentView, "addSubview:",  _toolbar);
    objj_msgSend(contentView, "addSubview:",  previewBox);
    objj_msgSend(contentView, "addSubview:",  _previewLabel);
    objj_msgSend(contentView, "addSubview:",  swatchBox);
    objj_msgSend(contentView, "addSubview:",  _swatchLabel);
    _target = nil;
    _action = nil;
    _activePicker = nil;
    objj_msgSend(_previewView, "setBackgroundColor:",  _color ? _color : objj_msgSend(CPColor, "whiteColor"));
    if (buttonForLater)
        objj_msgSend(self, "_setPicker:", buttonForLater);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("provideColorPickerClass:"), function(self, _cmd, aColorPickerSubclass)
{ with(self)
{
    ColorPickerClasses.push(aColorPickerSubclass);
}
}), new objj_method(sel_getUid("sharedColorPanel"), function(self, _cmd)
{ with(self)
{
    if (!SharedColorPanel)
        SharedColorPanel = objj_msgSend(objj_msgSend(CPColorPanel, "alloc"), "init");
    return SharedColorPanel;
}
}), new objj_method(sel_getUid("setPickerMode:"), function(self, _cmd, mode)
{ with(self)
{
    var panel = objj_msgSend(CPColorPanel, "sharedColorPanel");
    objj_msgSend(panel, "setMode:",  mode);
}
})]);
}
CPColorDragType = "CPColorDragType";
var CPColorPanelSwatchesCookie = "CPColorPanelSwatchesCookie";
{var the_class = objj_allocateClassPair(CPView, "_CPColorPanelSwatches"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_swatches"), new objj_ivar("_dragColor"), new objj_ivar("_colorPanel"), new objj_ivar("_swatchCookie")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    objj_msgSend(self, "setBackgroundColor:",  objj_msgSend(CPColor, "grayColor"));
    objj_msgSend(self, "registerForDraggedTypes:", objj_msgSend(CPArray, "arrayWithObjects:", CPColorDragType));
    var whiteColor = objj_msgSend(CPColor, "whiteColor");
    _swatchCookie = objj_msgSend(objj_msgSend(CPCookie, "alloc"), "initWithName:",  CPColorPanelSwatchesCookie);
    var colorList = objj_msgSend(self, "startingColorList");
    _swatches = [];
    for(var i=0; i < 50; i++)
    {
        var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:",  CPRectMake(13*i+1, 1, 12, 12)),
            fillView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(view, "bounds"), 1.0, 1.0));
        objj_msgSend(view, "setBackgroundColor:", whiteColor);
        objj_msgSend(fillView, "setBackgroundColor:",  (i < colorList.length) ? colorList[i] : whiteColor);
        objj_msgSend(view, "addSubview:", fillView);
        objj_msgSend(self, "addSubview:",  view);
        _swatches.push(view);
    }
    return self;
}
}), new objj_method(sel_getUid("isOpaque"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("startingColorList"), function(self, _cmd)
{ with(self)
{
    var cookieValue = objj_msgSend(_swatchCookie, "value");
    if(cookieValue == "")
    {
        return [
            objj_msgSend(CPColor, "blackColor"),
            objj_msgSend(CPColor, "darkGrayColor"),
            objj_msgSend(CPColor, "grayColor"),
            objj_msgSend(CPColor, "lightGrayColor"),
            objj_msgSend(CPColor, "whiteColor"),
            objj_msgSend(CPColor, "redColor"),
            objj_msgSend(CPColor, "greenColor"),
            objj_msgSend(CPColor, "blueColor"),
            objj_msgSend(CPColor, "yellowColor")
        ];
    }
    var cookieValue = eval(cookieValue);
    var result = [];
    for(var i=0; i<cookieValue.length; i++)
        result.push(objj_msgSend(CPColor, "colorWithHexString:",  cookieValue[i]));
    return result;
}
}), new objj_method(sel_getUid("saveColorList"), function(self, _cmd)
{ with(self)
{
    var result = [];
    for(var i=0; i<_swatches.length; i++)
        result.push(objj_msgSend(objj_msgSend(objj_msgSend(_swatches[i], "subviews")[0], "backgroundColor"), "hexString"));
    var future = new Date();
    future.setYear(2019);
    objj_msgSend(_swatchCookie, "setValue:expires:domain:",  CPJSObjectCreateJSON(result), future,  nil);
}
}), new objj_method(sel_getUid("setColorPanel:"), function(self, _cmd, panel)
{ with(self)
{
    _colorPanel = panel;
}
}), new objj_method(sel_getUid("colorPanel"), function(self, _cmd)
{ with(self)
{
    return _colorPanel;
}
}), new objj_method(sel_getUid("colorAtIndex:"), function(self, _cmd, index)
{ with(self)
{
    return objj_msgSend(objj_msgSend(_swatches[index], "subviews")[0], "backgroundColor");
}
}), new objj_method(sel_getUid("setColor:atIndex:"), function(self, _cmd, aColor, index)
{ with(self)
{
    objj_msgSend(objj_msgSend(_swatches[index], "subviews")[0], "setBackgroundColor:", aColor);
    objj_msgSend(self, "saveColorList");
}
}), new objj_method(sel_getUid("mouseUp:"), function(self, _cmd, anEvent)
{ with(self)
{
    var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    if(point.x > objj_msgSend(self, "bounds").size.width - 1 || point.x < 1)
        return NO;
    objj_msgSend(_colorPanel, "setColor:updatePicker:",  objj_msgSend(self, "colorAtIndex:", FLOOR(point.x / 13)),  YES);
}
}), new objj_method(sel_getUid("mouseDragged:"), function(self, _cmd, anEvent)
{ with(self)
{
    var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
     if(point.x > objj_msgSend(self, "bounds").size.width - 1 || point.x < 1)
        return NO;
    objj_msgSend(objj_msgSend(CPPasteboard, "pasteboardWithName:", CPDragPboard), "declareTypes:owner:", objj_msgSend(CPArray, "arrayWithObject:", CPColorDragType), self);
    var swatch = _swatches[FLOOR(point.x / 13)];
    _dragColor = objj_msgSend(objj_msgSend(swatch, "subviews")[0], "backgroundColor");
    var bounds = CPRectCreateCopy(objj_msgSend(swatch, "bounds"));
    var dragView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:",  bounds);
        dragFillView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectInset(bounds, 1.0, 1.0));
    objj_msgSend(dragView, "setBackgroundColor:", objj_msgSend(CPColor, "blackColor"));
    objj_msgSend(dragFillView, "setBackgroundColor:", _dragColor);
    objj_msgSend(dragView, "addSubview:", dragFillView);
    objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:",  dragView,  CPPointMake(point.x - bounds.size.width / 2.0, point.y - bounds.size.height / 2.0),  CPPointMake(0.0, 0.0),  anEvent,  nil,  self,  YES);
}
}), new objj_method(sel_getUid("pasteboard:provideDataForType:"), function(self, _cmd, aPasteboard, aType)
{ with(self)
{
    if(aType == CPColorDragType)
        objj_msgSend(aPasteboard, "setData:forType:", _dragColor, aType);
}
}), new objj_method(sel_getUid("performDragOperation:"), function(self, _cmd, aSender)
{ with(self)
{
    var location = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(aSender, "draggingLocation"), nil),
        pasteboard = objj_msgSend(aSender, "draggingPasteboard"),
        swatch = nil;
    if(!objj_msgSend(pasteboard, "availableTypeFromArray:", [CPColorDragType]) || location.x > objj_msgSend(self, "bounds").size.width - 1 || location.x < 1)
        return NO;
    objj_msgSend(self, "setColor:atIndex:", objj_msgSend(pasteboard, "dataForType:", CPColorDragType),  FLOOR(location.x / 13));
}
})]);
}
{var the_class = objj_allocateClassPair(CPView, "_CPColorPanelPreview"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_colorPanel")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    objj_msgSend(self, "registerForDraggedTypes:", objj_msgSend(CPArray, "arrayWithObjects:", CPColorDragType));
    return self;
}
}), new objj_method(sel_getUid("setColorPanel:"), function(self, _cmd, aPanel)
{ with(self)
{
    _colorPanel = aPanel;
}
}), new objj_method(sel_getUid("colorPanel"), function(self, _cmd)
{ with(self)
{
    return _colorPanel;
}
}), new objj_method(sel_getUid("performDragOperation:"), function(self, _cmd, aSender)
{ with(self)
{
    var pasteboard = objj_msgSend(aSender, "draggingPasteboard");
    if(!objj_msgSend(pasteboard, "availableTypeFromArray:", [CPColorDragType]))
        return NO;
    var color = objj_msgSend(pasteboard, "dataForType:", CPColorDragType);
    objj_msgSend(_colorPanel, "setColor:updatePicker:",  color,  YES);
}
}), new objj_method(sel_getUid("isOpaque"), function(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("mouseDragged:"), function(self, _cmd, anEvent)
{ with(self)
{
    var point = objj_msgSend(self, "convertPoint:fromView:", objj_msgSend(anEvent, "locationInWindow"), nil);
    objj_msgSend(objj_msgSend(CPPasteboard, "pasteboardWithName:", CPDragPboard), "declareTypes:owner:", objj_msgSend(CPArray, "arrayWithObject:", CPColorDragType), self);
    var bounds = CPRectMake(0, 0, 15, 15);
    var dragView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:",  bounds);
        dragFillView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectInset(bounds, 1.0, 1.0));
    objj_msgSend(dragView, "setBackgroundColor:", objj_msgSend(CPColor, "blackColor"));
    objj_msgSend(dragFillView, "setBackgroundColor:", objj_msgSend(self, "backgroundColor"));
    objj_msgSend(dragView, "addSubview:", dragFillView);
    objj_msgSend(self, "dragView:at:offset:event:pasteboard:source:slideBack:",  dragView,  CPPointMake(point.x - bounds.size.width / 2.0, point.y - bounds.size.height / 2.0),  CPPointMake(0.0, 0.0),  anEvent,  nil,  self,  YES);
}
}), new objj_method(sel_getUid("pasteboard:provideDataForType:"), function(self, _cmd, aPasteboard, aType)
{ with(self)
{
    if(aType == CPColorDragType)
        objj_msgSend(aPasteboard, "setData:forType:", objj_msgSend(self, "backgroundColor"), aType);
}
})]);
}
i;15;CPColorPicker.ji;21;CPSliderColorPicker.jc;160;
objj_msgSend(CPColorPanel, "provideColorPickerClass:", CPColorWheelColorPicker);
objj_msgSend(CPColorPanel, "provideColorPickerClass:", CPSliderColorPicker);

