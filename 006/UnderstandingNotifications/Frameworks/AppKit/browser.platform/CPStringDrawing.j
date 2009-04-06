I;21;Foundation/CPString.jc;2353;
var CPStringReferenceElement = nil,
    CPStringDefaultFont = nil;
{
var the_class = objj_getClass("CPString")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPString\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("cssString"), function(self, _cmd)
{ with(self)
{
    return self;
}
}), new objj_method(sel_getUid("sizeWithFont:"), function(self, _cmd, aFont)
{ with(self)
{
    return objj_msgSend(self, "sizeWithFont:inWidth:", aFont, NULL);
}
}), new objj_method(sel_getUid("sizeWithFont:inWidth:"), function(self, _cmd, aFont, aWidth)
{ with(self)
{
    if (!CPStringReferenceElement)
    {
        CPStringReferenceElement = document.createElement("span");
        var style = CPStringReferenceElement.style;
        style.position = "absolute";
        style.whiteSpace = "pre";
        style.visibility = "visible";
        style.padding = "0px";
        style.margin = "0px";
        style.left = "-100000px";
        style.top = "-100000px";
        style.zIndex = "10000";
        style.background = "red";
        document.getElementsByTagName("body")[0].appendChild(CPStringReferenceElement);
    }
    if (!aFont)
    {
        if (!CPStringDefaultFont)
            CPStringDefaultFont = objj_msgSend(CPFont, "systemFontOfSize:", 12.0);
        aFont = CPStringDefaultFont;
    }
    var style = CPStringReferenceElement.style;
    if (aWidth === NULL)
    {
        style.width = "";
        style.whiteSpace = "pre";
    }
    else
    {
        style.width = ROUND(aWidth) + "px";
        if (document.attachEvent)
            style.wordWrap = "break-word";
        else
        {
            style.whiteSpace = "-o-pre-wrap";
            style.whiteSpace = "-pre-wrap";
            style.whiteSpace = "-moz-pre-wrap";
            style.whiteSpace = "pre-wrap";
        }
    }
    style.font = objj_msgSend(aFont, "cssString");
    if (CPFeatureIsCompatible(CPJavascriptInnerTextFeature))
        CPStringReferenceElement.innerText = self;
    else if (CPFeatureIsCompatible(CPJavascriptTextContentFeature))
        CPStringReferenceElement.textContent = self;
    return CGSizeMake(CPStringReferenceElement.clientWidth, CPStringReferenceElement.clientHeight);
    return { width:0.0, height:0.0 };
}
})]);
}

