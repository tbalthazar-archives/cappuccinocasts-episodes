I;21;Foundation/CPString.ji;9;CPColor.ji;8;CPFont.ji;9;CPImage.ji;13;CPTextField.ji;8;CPView.jc;10378;
CPTopVerticalTextAlignment = 1,
CPCenterVerticalTextAlignment = 2,
CPBottomVerticalTextAlignment = 3;
var _CPimageAndTextViewFrameSizeChangedFlag = 1 << 0,
    _CPImageAndTextViewImageChangedFlag = 1 << 1,
    _CPImageAndTextViewTextChangedFlag = 1 << 2,
    _CPImageAndTextViewAlignmentChangedFlag = 1 << 3,
    _CPImageAndTextViewVerticalAlignmentChangedFlag = 1 << 4,
    _CPImageAndTextViewLineBreakModeChangedFlag = 1 << 5,
    _CPImageAndTextViewTextColorChangedFlag = 1 << 6,
    _CPImageAndTextViewFontChangedFlag = 1 << 7,
    _CPImageAndTextViewTextShadowColorChangedFlag = 1 << 8,
    _CPImageAndTextViewImagePositionChangedFlag = 1 << 9,
    _CPImageAndTextViewImageScalingChangedFlag = 1 << 10;
var HORIZONTAL_MARGIN = 3.0,
    VERTICAL_MARGIN = 5.0;
{var the_class = objj_allocateClassPair(CPView, "_CPImageAndTextView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_alignment"), new objj_ivar("_verticalAlignment"), new objj_ivar("_lineBreakMode"), new objj_ivar("_textColor"), new objj_ivar("_font"), new objj_ivar("_textShadowColor"), new objj_ivar("_textShadowOffset"), new objj_ivar("_imagePosition"), new objj_ivar("_imageScaling"), new objj_ivar("_image"), new objj_ivar("_text"), new objj_ivar("_textSize"), new objj_ivar("_flags")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:control:"), function(self, _cmd, aFrame, aControl)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithFrame:", aFrame);
    if (self)
    {
        _textShadowOffset = { width:0.0, height:0.0 };
        objj_msgSend(self, "setVerticalAlignment:", CPTopVerticalTextAlignment);
        if (aControl)
        {
            objj_msgSend(self, "setLineBreakMode:", objj_msgSend(aControl, "lineBreakMode"));
            objj_msgSend(self, "setTextColor:", objj_msgSend(aControl, "textColor"));
            objj_msgSend(self, "setAlignment:", objj_msgSend(aControl, "alignment"));
            objj_msgSend(self, "setVerticalAlignment:", objj_msgSend(aControl, "verticalAlignment"));
            objj_msgSend(self, "setFont:", objj_msgSend(aControl, "font"));
            objj_msgSend(self, "setImagePosition:", objj_msgSend(aControl, "imagePosition"));
            objj_msgSend(self, "setImageScaling:", objj_msgSend(aControl, "imageScaling"));
        }
        else
        {
            objj_msgSend(self, "setLineBreakMode:", CPLineBreakByClipping);
            objj_msgSend(self, "setAlignment:", CPCenterTextAlignment);
            objj_msgSend(self, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 12.0));
            objj_msgSend(self, "setImagePosition:", CPNoImage);
            objj_msgSend(self, "setImageScaling:", CPScaleNone);
        }
        _textSize = NULL;
    }
    return self;
}
}), new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{ with(self)
{
    return objj_msgSend(self, "initWithFrame:control:", aFrame, nil);
}
}), new objj_method(sel_getUid("setAlignment:"), function(self, _cmd, anAlignment)
{ with(self)
{
    if (_alignment === anAlignment)
        return;
    _alignment = anAlignment;
}
}), new objj_method(sel_getUid("alignment"), function(self, _cmd)
{ with(self)
{
    return _alignment;
}
}), new objj_method(sel_getUid("setVerticalAlignment:"), function(self, _cmd, anAlignment)
{ with(self)
{
    if (_verticalAlignment === anAlignment)
        return;
    _verticalAlignment = anAlignment;
    _flags |= _CPImageAndTextViewVerticalAlignmentChangedFlag;
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("verticalAlignment"), function(self, _cmd)
{ with(self)
{
    return _verticalAlignment;
}
}), new objj_method(sel_getUid("setLineBreakMode:"), function(self, _cmd, aLineBreakMode)
{ with(self)
{
    if (_lineBreakMode === aLineBreakMode)
        return;
    _lineBreakMode = aLineBreakMode;
    _flags |= _CPImageAndTextViewLineBreakModeChangedFlag;
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("lineBreakMode"), function(self, _cmd)
{ with(self)
{
    return _lineBreakMode;
}
}), new objj_method(sel_getUid("setImagePosition:"), function(self, _cmd, anImagePosition)
{ with(self)
{
    if (_imagePosition == anImagePosition)
        return;
    _imagePosition = anImagePosition;
    _flags |= _CPImageAndTextViewImagePositionChangedFlag;
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("imagePosition"), function(self, _cmd)
{ with(self)
{
    return _imagePosition;
}
}), new objj_method(sel_getUid("setImageScaling:"), function(self, _cmd, anImageScaling)
{ with(self)
{
    if (_imageScaling == anImageScaling)
        return;
    _imageScaling = anImageScaling;
    _flags |= _CPImageAndTextViewImageScalingChangedFlag;
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("imageScaling"), function(self, _cmd)
{ with(self)
{
    return _imageScaling;
}
}), new objj_method(sel_getUid("setTextColor:"), function(self, _cmd, aTextColor)
{ with(self)
{
    if (_textColor === aTextColor)
        return;
    _textColor = aTextColor;
}
}), new objj_method(sel_getUid("textColor"), function(self, _cmd)
{ with(self)
{
    return _textColor;
}
}), new objj_method(sel_getUid("setFont:"), function(self, _cmd, aFont)
{ with(self)
{
    if (_font === aFont)
        return;
    _font = aFont;
    _flags |= _CPImageAndTextViewFontChangedFlag;
    _textSize = NULL;
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("font"), function(self, _cmd)
{ with(self)
{
    return _font;
}
}), new objj_method(sel_getUid("setTextShadowColor:"), function(self, _cmd, aColor)
{ with(self)
{
    if (_textShadowColor === aColor)
        return;
    _textShadowColor = aColor;
    _flags |= _CPImageAndTextViewTextShadowColorChangedFlag;
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("textShadowColor"), function(self, _cmd)
{ with(self)
{
    return _textShadowColor;
}
}), new objj_method(sel_getUid("setTextShadowOffset:"), function(self, _cmd, anOffset)
{ with(self)
{
    if ((_textShadowOffset.width == anOffset.width && _textShadowOffset.height == anOffset.height))
        return;
    _textShadowOffset = { width:anOffset.width, height:anOffset.height };
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("textShadowOffset"), function(self, _cmd)
{ with(self)
{
    return _textShadowOffset;
}
}), new objj_method(sel_getUid("setImage:"), function(self, _cmd, anImage)
{ with(self)
{
    if (_image == anImage)
        return;
    _image = anImage;
    _flags |= _CPImageAndTextViewImageChangedFlag;
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("image"), function(self, _cmd)
{ with(self)
{
    return _image;
}
}), new objj_method(sel_getUid("setText:"), function(self, _cmd, text)
{ with(self)
{
    if (_text === text)
        return;
    _text = text;
    _flags |= _CPImageAndTextViewTextChangedFlag;
    _textSize = NULL;
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("text"), function(self, _cmd)
{ with(self)
{
    return _text;
}
}), new objj_method(sel_getUid("layoutSubviews"), function(self, _cmd)
{ with(self)
{
    var size = objj_msgSend(self, "bounds").size,
        textRect = { origin: { x:0.0, y:0.0 }, size: { width:size.width, height:size.height } };
    if (hasDOMImageElement)
    {
        if (!imageStyle)
            var imageStyle = _DOMImageElement.style;
        if (_flags & _CPImageAndTextViewImageChangedFlag)
            _DOMImageElement.src = objj_msgSend(_image, "filename");
        var centerX = size.width / 2.0,
            centerY = size.height / 2.0,
            imageSize = objj_msgSend(_image, "size"),
            imageWidth = imageSize.width,
            imageHeight = imageSize.height;
        if (_imageScaling === CPScaleToFit)
        {
            imageWidth = size.width;
            imageHeight = size.height;
        }
        else if (_imageScaling === CPScaleProportionally)
        {
            var scale = MIN(MIN(size.width, imageWidth) / imageWidth, MIN(size.height, imageHeight) / imageHeight);
            imageWidth *= scale;
            imageHeight *= scale;
        }
        if (_imagePosition === CPImageBelow)
        {
            textRect.size.height = size.height - imageHeight - VERTICAL_MARGIN;
        }
        else if (_imagePosition === CPImageAbove)
        {
            textRect.origin.y += imageHeight + VERTICAL_MARGIN;
            textRect.size.height = size.height - imageHeight - VERTICAL_MARGIN;
        }
        else if (_imagePosition === CPImageLeft)
        {
            textRect.origin.x = imageWidth + HORIZONTAL_MARGIN;
            textRect.size.width -= imageWidth + HORIZONTAL_MARGIN;
        }
        else if (_imagePosition === CPImageRight)
        {
            textRect.size.width -= imageWidth + HORIZONTAL_MARGIN;
        }
        else if (_imagePosition === CPImageOnly)
        {
        }
    }
    _flags = 0;
}
}), new objj_method(sel_getUid("sizeToFit"), function(self, _cmd)
{ with(self)
{
    var size = CGSizeMakeZero();
    if ((_imagePosition !== CPNoImage) && _image)
    {
        var imageSize = objj_msgSend(_image, "size");
        size.width += imageSize.width;
        size.height += imageSize.height;
    }
    if ((_imagePosition !== CPImageOnly) && objj_msgSend(_text, "length") > 0)
    {
        if (!_textSize)
            _textSize = objj_msgSend(_text, "sizeWithFont:", _font ? _font : objj_msgSend(CPFont, "systemFontOfSize:", 12.0));
        if (_imagePosition === CPImageLeft || _imagePosition === CPImageRight)
        {
            size.width += _textSize.width + HORIZONTAL_MARGIN;
            size.height = MAX(size.height, _textSize.height);
        }
        else if (_imagePosition === CPImageAbove || _imagePosition === CPImageBelow)
        {
            size.width = MAX(size.width, _textSize.width);
            size.height += _textSize.height + VERTICAL_MARGIN;
        }
        else
        {
            size.width = MAX(size.width, _textSize.width);
            size.height = MAX(size.height, _textSize.height);
        }
    }
    objj_msgSend(self, "setFrameSize:", size);
}
})]);
}

