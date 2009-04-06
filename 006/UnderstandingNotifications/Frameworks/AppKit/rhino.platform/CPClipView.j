i;8;CPView.jc;4767;
{var the_class = objj_allocateClassPair(CPView, "CPClipView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_documentView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("setDocumentView:"), function(self, _cmd, aView)
{ with(self)
{
    if (_documentView == aView)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    if (_documentView)
    {
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPViewFrameDidChangeNotification, _documentView);
        objj_msgSend(defaultCenter, "removeObserver:name:object:", self, CPViewBoundsDidChangeNotification, _documentView);
        objj_msgSend(_documentView, "removeFromSuperview");
    }
    _documentView = aView;
    if (_documentView)
    {
        objj_msgSend(self, "addSubview:", _documentView);
  objj_msgSend(_documentView, "setPostsFrameChangedNotifications:", YES);
  objj_msgSend(_documentView, "setPostsBoundsChangedNotifications:", YES);
  objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("viewFrameChanged:"), CPViewFrameDidChangeNotification, _documentView);
  objj_msgSend(defaultCenter, "addObserver:selector:name:object:", self, sel_getUid("viewBoundsChanged:"), CPViewBoundsDidChangeNotification, _documentView);
    }
}
}), new objj_method(sel_getUid("documentView"), function(self, _cmd)
{ with(self)
{
    return _documentView;
}
}), new objj_method(sel_getUid("constrainScrollPoint:"), function(self, _cmd, aPoint)
{ with(self)
{
    if (!_documentView)
        return { x:0.0, y:0.0 };
    var documentFrame = objj_msgSend(_documentView, "frame");
    aPoint.x = MAX(0.0, MIN(aPoint.x, MAX((documentFrame.size.width) - (_bounds.size.width), 0.0)));
    aPoint.y = MAX(0.0, MIN(aPoint.y, MAX((documentFrame.size.height) - (_bounds.size.height), 0.0)));
    return aPoint;
}
}), new objj_method(sel_getUid("setBoundsOrigin:"), function(self, _cmd, aPoint)
{ with(self)
{
    if ((_bounds.origin.x == aPoint.x && _bounds.origin.y == aPoint.y))
        return;
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "setBoundsOrigin:", aPoint);
    var superview = objj_msgSend(self, "superview");
    if(objj_msgSend(superview, "isKindOfClass:", objj_msgSend(CPScrollView, "class")))
        objj_msgSend(superview, "reflectScrolledClipView:", self);
}
}), new objj_method(sel_getUid("scrollToPoint:"), function(self, _cmd, aPoint)
{ with(self)
{
    objj_msgSend(self, "setBoundsOrigin:", objj_msgSend(self, "constrainScrollPoint:", aPoint));
}
}), new objj_method(sel_getUid("viewBoundsChanged:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "_constrainScrollPoint");
}
}), new objj_method(sel_getUid("viewFrameChanged:"), function(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(self, "_constrainScrollPoint");
}
}), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function(self, _cmd, aSize)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "resizeSubviewsWithOldSize:", aSize);
    objj_msgSend(self, "_constrainScrollPoint");
}
}), new objj_method(sel_getUid("_constrainScrollPoint"), function(self, _cmd)
{ with(self)
{
    var oldScrollPoint = objj_msgSend(self, "bounds").origin;
    objj_msgSend(self, "scrollToPoint:", oldScrollPoint);
    if (!CGPointEqualToPoint(oldScrollPoint, objj_msgSend(self, "bounds").origin))
        return;
    var superview = objj_msgSend(self, "superview");
    if (objj_msgSend(superview, "isKindOfClass:", objj_msgSend(CPScrollView, "class")))
        objj_msgSend(superview, "reflectScrolledClipView:", self);
}
})]);
}
var CPClipViewDocumentViewKey = "CPScrollViewDocumentView";
{
var the_class = objj_getClass("CPClipView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPClipView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "initWithCoder:", aCoder))
        objj_msgSend(self, "setDocumentView:", objj_msgSend(aCoder, "decodeObjectForKey:", CPClipViewDocumentViewKey));
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPView") }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", _documentView, CPClipViewDocumentViewKey);
}
})]);
}

