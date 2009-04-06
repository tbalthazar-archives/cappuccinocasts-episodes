I;21;Foundation/CPObject.ji;14;CPColorPanel.jc;12356;
{var the_class = objj_allocateClassPair(CPObject, "CPColorPicker"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_panel"), new objj_ivar("_mask")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithPickerMask:colorPanel:"), function(self, _cmd, aMask, aPanel)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    _panel = aPanel;
    _mask = aMask;
    return self;
}
}), new objj_method(sel_getUid("colorPanel"), function(self, _cmd)
{ with(self)
{
    return _panel;
}
}), new objj_method(sel_getUid("provideNewButtonImage"), function(self, _cmd)
{ with(self)
{
    return nil;
}
}), new objj_method(sel_getUid("setMode:"), function(self, _cmd, mode)
{ with(self)
{
    return;
}
}), new objj_method(sel_getUid("setColor:"), function(self, _cmd, aColor)
{ with(self)
{
    return;
}
})]);
}
{var the_class = objj_allocateClassPair(CPColorPicker, "CPColorWheelColorPicker"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_pickerView"), new objj_ivar("_brightnessSlider"), new objj_ivar("_brightnessBarImage"), new objj_ivar("_hueSaturationView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithPickerMask:colorPanel:"), function(self, _cmd, mask, owningColorPanel)
{ with(self)
{
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPColorPicker") }, "initWithPickerMask:colorPanel:", mask,  owningColorPanel);
}
}), new objj_method(sel_getUid("initView"), function(self, _cmd)
{ with(self)
{
    aFrame = CPRectMake(0, 0, CPColorPickerViewWidth, CPColorPickerViewHeight);
    _pickerView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", aFrame);
    objj_msgSend(_pickerView, "setAutoresizingMask:", CPViewWidthSizable|CPViewHeightSizable);
    var path = objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:",  CPColorPicker), "pathForResource:", "brightness_bar.png");
    _brightnessBarImage = new Image();
    _brightnessBarImage.src = path;
    _brightnessBarImage.style.width = "100%";
    _brightnessBarImage.style.height = "100%";
    _brightnessBarImage.style.position = "absolute";
    _brightnessBarImage.style.top = "0px";
    _brightnessBarImage.style.left = "0px";
    var brightnessBarView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:",  CPRectMake(0, (aFrame.size.height - 34), aFrame.size.width, 15));
    objj_msgSend(brightnessBarView, "setAutoresizingMask:",  (CPViewWidthSizable | CPViewMinYMargin));
    brightnessBarView._DOMElement.appendChild(_brightnessBarImage);
    _brightnessSlider = objj_msgSend(objj_msgSend(CPSlider, "alloc"), "initWithFrame:",  CPRectMake(0, aFrame.size.height - 22, aFrame.size.width, 12));
    objj_msgSend(_brightnessSlider, "setMaxValue:",  100.0);
    objj_msgSend(_brightnessSlider, "setMinValue:",  0.0);
    objj_msgSend(_brightnessSlider, "setFloatValue:", 100.0);
    objj_msgSend(_brightnessSlider, "setTarget:",  self);
    objj_msgSend(_brightnessSlider, "setAction:",  sel_getUid("brightnessSliderDidChange:"));
    objj_msgSend(_brightnessSlider, "setAutoresizingMask:",  (CPViewWidthSizable | CPViewMinYMargin));
    _hueSaturationView = objj_msgSend(objj_msgSend(__CPColorWheel, "alloc"), "initWithFrame:",  CPRectMake(0, 0, aFrame.size.width, aFrame.size.height - 38));
    objj_msgSend(_hueSaturationView, "setDelegate:",  self);
    objj_msgSend(_hueSaturationView, "setAutoresizingMask:",  (CPViewWidthSizable | CPViewHeightSizable));
    objj_msgSend(_pickerView, "addSubview:",  brightnessBarView);
    objj_msgSend(_pickerView, "addSubview:",  _hueSaturationView);
    objj_msgSend(_pickerView, "addSubview:",  _brightnessSlider);
}
}), new objj_method(sel_getUid("brightnessSliderDidChange:"), function(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "updateColor");
}
}), new objj_method(sel_getUid("colorWheelDidChange:"), function(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(self, "updateColor");
}
}), new objj_method(sel_getUid("updateColor"), function(self, _cmd)
{ with(self)
{
    var hue = objj_msgSend(_hueSaturationView, "angle"),
        saturation = objj_msgSend(_hueSaturationView, "distance"),
        brightness = objj_msgSend(_brightnessSlider, "floatValue");
    objj_msgSend(_hueSaturationView, "setWheelBrightness:",  brightness / 100.0);
    _brightnessBarImage.style.backgroundColor = "#"+objj_msgSend(objj_msgSend(CPColor, "colorWithHue:saturation:brightness:",  hue,  saturation,  100), "hexString");
    objj_msgSend(objj_msgSend(self, "colorPanel"), "setColor:", objj_msgSend(CPColor, "colorWithHue:saturation:brightness:",  hue,  saturation,  brightness));
}
}), new objj_method(sel_getUid("supportsMode:"), function(self, _cmd, mode)
{ with(self)
{
    return (mode == CPWheelColorPickerMode) ? YES : NO;
}
}), new objj_method(sel_getUid("currentMode"), function(self, _cmd)
{ with(self)
{
    return CPWheelColorPickerMode;
}
}), new objj_method(sel_getUid("provideNewView:"), function(self, _cmd, initialRequest)
{ with(self)
{
    if (initialRequest)
        objj_msgSend(self, "initView");
    return _pickerView;
}
}), new objj_method(sel_getUid("setColor:"), function(self, _cmd, newColor)
{ with(self)
{
    var hsb = objj_msgSend(newColor, "hsbComponents");
    objj_msgSend(_hueSaturationView, "setPositionToColor:", newColor);
    objj_msgSend(_brightnessSlider, "setFloatValue:", hsb[2]);
    objj_msgSend(_hueSaturationView, "setWheelBrightness:", hsb[2] / 100.0);
    _brightnessBarImage.style.backgroundColor = "#"+objj_msgSend(objj_msgSend(CPColor, "colorWithHue:saturation:brightness:", hsb[0], hsb[1], 100), "hexString");
}
}), new objj_method(sel_getUid("provideNewButtonImage"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", CPColorPicker), "pathForResource:", "wheel_button.png"), CGSizeMake(32, 32));
}
}), new objj_method(sel_getUid("provideNewAlternateButtonImage"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:", CPColorPicker), "pathForResource:", "wheel_button_h.png"), CGSizeMake(32, 32));
}
})]);
}
{var the_class = objj_allocateClassPair(CPView, "__CPColorWheel"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_wheelImage"), new objj_ivar("_blackWheelImage"), new objj_ivar("_crosshair"), new objj_ivar("_delegate"), new objj_ivar("_angle"), new objj_ivar("_distance"), new objj_ivar("_radius")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:",  aFrame);
    var path = objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:",  CPColorPicker), "pathForResource:", "wheel.png");
    _wheelImage = new Image();
    _wheelImage.src = path;
    _wheelImage.style.position = "absolute";
    path = objj_msgSend(objj_msgSend(CPBundle, "bundleForClass:",  CPColorPicker), "pathForResource:", "wheel_black.png");
    _blackWheelImage = new Image();
    _blackWheelImage.src = path;
    _blackWheelImage.style.opacity = "0";
    _blackWheelImage.style.filter = "alpha(opacity=0)"
    _blackWheelImage.style.position = "absolute";
    _DOMElement.appendChild(_wheelImage);
    _DOMElement.appendChild(_blackWheelImage);
    objj_msgSend(self, "setWheelSize:",  aFrame.size);
    _crosshair = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CPRectMake(_radius - 2, _radius - 2, 4, 4));
    objj_msgSend(_crosshair, "setBackgroundColor:", objj_msgSend(CPColor, "blackColor"));
    var view = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectInset(objj_msgSend(_crosshair, "bounds"), 1.0, 1.0));
    objj_msgSend(view, "setBackgroundColor:", objj_msgSend(CPColor, "whiteColor"));
    objj_msgSend(_crosshair, "addSubview:", view);
    objj_msgSend(self, "addSubview:",  _crosshair);
    return self;
}
}), new objj_method(sel_getUid("setWheelBrightness:"), function(self, _cmd, brightness)
{ with(self)
{
    _blackWheelImage.style.opacity = 1.0 - brightness;
    _blackWheelImage.style.filter = "alpha(opacity=" + (1.0 - brightness)*100 + ")"
}
}), new objj_method(sel_getUid("setFrameSize:"), function(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setFrameSize:",  aSize);
    objj_msgSend(self, "setWheelSize:",  aSize);
}
}), new objj_method(sel_getUid("setWheelSize:"), function(self, _cmd, aSize)
{ with(self)
{
    var min = MIN(aSize.width, aSize.height);
    _blackWheelImage.style.width = min;
    _blackWheelImage.style.height = min;
    _blackWheelImage.width = min;
    _blackWheelImage.height = min;
    _blackWheelImage.style.top = (aSize.height - min) / 2.0 + "px";
    _blackWheelImage.style.left = (aSize.width - min) / 2.0 + "px";
    _wheelImage.style.width = min;
    _wheelImage.style.height = min;
    _wheelImage.width = min;
    _wheelImage.height = min;
    _wheelImage.style.top = (aSize.height - min) / 2.0 + "px";
    _wheelImage.style.left = (aSize.width - min) / 2.0 + "px";
    _radius = min / 2.0;
    objj_msgSend(self, "setAngle:distance:",  objj_msgSend(self, "degreesToRadians:",  _angle),  (_distance / 100.0) * _radius);
}
}), new objj_method(sel_getUid("setDelegate:"), function(self, _cmd, aDelegate)
{ with(self)
{
    _delegate = aDelegate;
}
}), new objj_method(sel_getUid("delegate"), function(self, _cmd)
{ with(self)
{
    return _delegate;
}
}), new objj_method(sel_getUid("angle"), function(self, _cmd)
{ with(self)
{
    return _angle;
}
}), new objj_method(sel_getUid("distance"), function(self, _cmd)
{ with(self)
{
    return _distance;
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(self, "reposition:",  anEvent);
}
}), new objj_method(sel_getUid("mouseDragged:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(self, "reposition:",  anEvent);
}
}), new objj_method(sel_getUid("reposition:"), function(self, _cmd, anEvent)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds"),
        location = objj_msgSend(self, "convertPoint:fromView:",  objj_msgSend(anEvent, "locationInWindow"),  nil);
    var midX = CGRectGetMidX(bounds);
    var midY = CGRectGetMidY(bounds);
    var distance = MIN(SQRT((location.x - midX)*(location.x - midX) + (location.y - midY)*(location.y - midY)), _radius);
    var angle = ATAN2(location.y - midY, location.x - midX);
    objj_msgSend(self, "setAngle:distance:",  angle,  distance);
    if(_delegate)
        objj_msgSend(_delegate, "colorWheelDidChange:",  self);
}
}), new objj_method(sel_getUid("setAngle:distance:"), function(self, _cmd, angle, distance)
{ with(self)
{
    var bounds = objj_msgSend(self, "bounds");
    var midX = CGRectGetMidX(bounds);
    var midY = CGRectGetMidY(bounds);
    _angle = objj_msgSend(self, "radiansToDegrees:",  angle);
    _distance = (distance / _radius) * 100.0;
    objj_msgSend(_crosshair, "setFrameOrigin:", CPPointMake(COS(angle) * distance + midX - 2.0, SIN(angle) * distance + midY - 2.0));
}
}), new objj_method(sel_getUid("setPositionToColor:"), function(self, _cmd, aColor)
{ with(self)
{
    var hsb = objj_msgSend(aColor, "hsbComponents"),
        bounds = objj_msgSend(self, "bounds");
    var angle = objj_msgSend(self, "degreesToRadians:",  hsb[0]),
        distance = (hsb[1] / 100.0) * _radius;
    objj_msgSend(self, "setAngle:distance:",  angle,  distance);
}
}), new objj_method(sel_getUid("radiansToDegrees:"), function(self, _cmd, radians)
{ with(self)
{
    return ((-radians / PI) * 180 + 360) % 360;
}
}), new objj_method(sel_getUid("degreesToRadians:"), function(self, _cmd, degrees)
{ with(self)
{
    return -(((degrees - 360) / 180) * PI);
}
})]);
}

