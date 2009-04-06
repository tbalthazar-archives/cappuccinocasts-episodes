I;33;Foundation/CPNotificationCenter.ji;11;CPControl.ji;9;CPImage.ji;14;CPShadowView.jc;7605;
CPScaleProportionally = 0;
CPScaleToFit = 1;
CPScaleNone = 2;
var CPImageViewShadowBackgroundColor = nil;
var LEFT_SHADOW_INSET = 3.0,
    RIGHT_SHADOW_INSET = 3.0,
    TOP_SHADOW_INSET = 3.0,
    BOTTOM_SHADOW_INSET = 5.0,
    VERTICAL_SHADOW_INSET = TOP_SHADOW_INSET + BOTTOM_SHADOW_INSET,
    HORIZONTAL_SHADOW_INSET = LEFT_SHADOW_INSET + RIGHT_SHADOW_INSET;
{var the_class = objj_allocateClassPair(CPControl, "CPImageView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_DOMImageElement"), new objj_ivar("_hasShadow"), new objj_ivar("_shadowView"), new objj_ivar("_imageRect")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithFrame:", aFrame);
    if (self)
    {
    }
    return self;
}
}), new objj_method(sel_getUid("image"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "objectValue");
}
}), new objj_method(sel_getUid("setImage:"), function(self, _cmd, anImage)
{ with(self)
{
    objj_msgSend(self, "setObjectValue:", anImage);
}
}), new objj_method(sel_getUid("setObjectValue:"), function(self, _cmd, anImage)
{ with(self)
{
    var oldImage = objj_msgSend(self, "objectValue");
    if (oldImage === anImage)
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setObjectValue:", anImage);
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (oldImage)
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPImageDidLoadNotification, oldImage);
    var newImage = objj_msgSend(self, "objectValue");
    var size = objj_msgSend(newImage, "size");
    if (size && size.width === -1 && size.height === -1)
    {
        objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("imageDidLoad:"), CPImageDidLoadNotification, newImage);
        objj_msgSend(_shadowView, "setHidden:", YES);
    }
    else
    {
        objj_msgSend(self, "hideOrDisplayContents");
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
}
}), new objj_method(sel_getUid("imageDidLoad:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "hideOrDisplayContents");
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("hasShadow"), function(self, _cmd)
{ with(self)
{
    return _hasShadow;
}
}), new objj_method(sel_getUid("setHasShadow:"), function(self, _cmd, shouldHaveShadow)
{ with(self)
{
    if (_hasShadow == shouldHaveShadow)
        return;
    _hasShadow = shouldHaveShadow;
    if (_hasShadow)
    {
        _shadowView = objj_msgSend(objj_msgSend(CPShadowView, "alloc"), "initWithFrame:", objj_msgSend(self, "bounds"));
        objj_msgSend(self, "addSubview:", _shadowView);
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
    else
    {
        objj_msgSend(_shadowView, "removeFromSuperview");
        _shadowView = nil;
    }
    objj_msgSend(self, "hideOrDisplayContents");
}
}), new objj_method(sel_getUid("setImageScaling:"), function(self, _cmd, anImageScaling)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "setImageScaling:", anImageScaling);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("hideOrDisplayContents"), function(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "image"))
    {
        objj_msgSend(_shadowView, "setHidden:", YES);
    }
    else
    {
        objj_msgSend(_shadowView, "setHidden:", NO);
    }
}
}), new objj_method(sel_getUid("imageRect"), function(self, _cmd)
{ with(self)
{
    return _imageRect;
}
}), new objj_method(sel_getUid("layoutSubviews"), function(self, _cmd)
{ with(self)
{
    if (!objj_msgSend(self, "image"))
        return;
    var bounds = objj_msgSend(self, "bounds"),
        image = objj_msgSend(self, "image"),
        imageScaling = objj_msgSend(self, "currentValueForThemedAttributeName:", "image-scaling"),
        x = 0.0,
        y = 0.0,
        insetWidth = (_hasShadow ? HORIZONTAL_SHADOW_INSET : 0.0),
        insetHeight = (_hasShadow ? VERTICAL_SHADOW_INSET : 0.0),
        boundsWidth = (bounds.size.width),
        boundsHeight = (bounds.size.height),
        width = boundsWidth - insetWidth,
        height = boundsHeight - insetHeight;
    if (imageScaling === CPScaleToFit)
    {
    }
    else
    {
        var size = objj_msgSend(image, "size");
        if (size.width == -1 && size.height == -1)
            return;
        if (imageScaling === CPScaleProportionally)
        {
            if (width >= size.width && height >= size.height)
            {
                width = size.width;
                height = size.height;
            }
            else
            {
                var imageRatio = size.width / size.height,
                    viewRatio = width / height;
                if (viewRatio > imageRatio)
                    width = height * imageRatio;
                else
                    height = width / imageRatio;
            }
        }
        else
        {
            width = size.width;
            height = size.height;
        }
        if (imageScaling == CPScaleNone)
        {
        }
        var x = (boundsWidth - width) / 2.0,
            y = (boundsHeight - height) / 2.0;
    }
    _imageRect = { origin: { x:x, y:y }, size: { width:width, height:height } };
    if (_hasShadow)
        objj_msgSend(_shadowView, "setFrame:", { origin: { x:x - LEFT_SHADOW_INSET, y:y - TOP_SHADOW_INSET }, size: { width:width + insetWidth, height:height + insetHeight } });
}
}), new objj_method(sel_getUid("mouseDown:"), function(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "nextResponder"), "mouseDown:", anEvent);
}
})]);
}
var CPImageViewImageKey = "CPImageViewImageKey",
    CPImageViewImageScalingKey = "CPImageViewImageScalingKey",
    CPImageViewHasShadowKey = "CPImageViewHasShadowKey";
{
var the_class = objj_getClass("CPImageView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPImageView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "initWithCoder:", aCoder);
    if (self)
    {
        objj_msgSend(self, "setHasShadow:", objj_msgSend(aCoder, "decodeBoolForKey:", CPImageViewHasShadowKey));
        objj_msgSend(self, "setNeedsLayout");
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    if (_shadowView)
    {
        var actualSubviews = _subviews;
        _subviews = objj_msgSend(_subviews, "copy");
        objj_msgSend(_subviews, "removeObjectIdenticalTo:", _shadowView);
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPControl") }, "encodeWithCoder:", aCoder);
    if (_shadowView)
        _subviews = actualSubviews;
    objj_msgSend(aCoder, "encodeBool:forKey:", _hasShadow, CPImageViewHasShadowKey);
}
})]);
}

