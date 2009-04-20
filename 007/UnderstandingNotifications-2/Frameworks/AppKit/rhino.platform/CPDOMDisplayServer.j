I;22;Foundation/CPRunLoop.jc;6104;
var CPDOMDisplayRunLoop = nil;
CPDOMDisplayServerInstructions = [];
CPDOMDisplayServerInstructionCount = 0;
CPDOMDisplayServerViews = [];
CPDOMDisplayServerViewsCount = 0;
CPDOMDisplayServerViewsContext = {};
{var the_class = objj_allocateClassPair(CPObject, "CPDOMDisplayServer"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(meta_class, [new objj_method(sel_getUid("start"), function(self, _cmd)
{ with(self)
{
    CPDOMDisplayRunLoop = objj_msgSend(CPRunLoop, "currentRunLoop");
    objj_msgSend(CPDOMDisplayRunLoop, "performSelector:target:argument:order:modes:", sel_getUid("run"), CPDOMDisplayServer, nil, 0, [CPDefaultRunLoopMode]);
}
}), new objj_method(sel_getUid("run"), function(self, _cmd)
{ with(self)
{
    while (CPDOMDisplayServerInstructionCount || CPDOMDisplayServerViewsCount)
    {
        var index = 0;
        while (index < CPDOMDisplayServerInstructionCount)
        {
            var instruction = CPDOMDisplayServerInstructions[index++];
    try{
            switch (instruction)
            {
                case 0:
                case 1:
                case 2:
                case 3: var element = CPDOMDisplayServerInstructions[index],
                                                style = element.style,
                                                x = (instruction == 0 || instruction == 2) ? "left" : "right",
                                                y = (instruction == 0 || instruction == 1) ? "top" : "bottom";
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            var transform = CPDOMDisplayServerInstructions[index++];
                                            if (transform)
                                            {
                                                var point = { x:CPDOMDisplayServerInstructions[index++], y:CPDOMDisplayServerInstructions[index++] },
                                                    transformed = { x:point.x * transform.a + point.y * transform.c + transform.tx, y:point.x * transform.b + point.y * transform.d + transform.ty };
                                                style[x] = ROUND(transformed.x) + "px";
                                                style[y] = ROUND(transformed.y) + "px";
                                            }
                                            else
                                            {
                                                style[x] = ROUND(CPDOMDisplayServerInstructions[index++]) + "px";
                                                style[y] = ROUND(CPDOMDisplayServerInstructions[index++]) + "px";
                                            }
                                            element.CPDOMDisplayContext[0] = -1;
                                            break;
                case 4: var element = CPDOMDisplayServerInstructions[index],
                                                style = element.style;
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            element.CPDOMDisplayContext[4] = -1;
                                            style.width = MAX(0.0, ROUND(CPDOMDisplayServerInstructions[index++])) + "px";
                                            style.height = MAX(0.0, ROUND(CPDOMDisplayServerInstructions[index++])) + "px";
                                            break;
                case 5: var element = CPDOMDisplayServerInstructions[index];
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            element.CPDOMDisplayContext[5] = -1;
                                            element.width = MAX(0.0, ROUND(CPDOMDisplayServerInstructions[index++]));
                                            element.height = MAX(0.0, ROUND(CPDOMDisplayServerInstructions[index++]));
                                            break;
                case 6: CPDOMDisplayServerInstructions[index].appendChild(CPDOMDisplayServerInstructions[index + 1]);
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            break;
                case 7: CPDOMDisplayServerInstructions[index].insertBefore(CPDOMDisplayServerInstructions[index + 1], CPDOMDisplayServerInstructions[index + 2]);
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            break;
                case 8: CPDOMDisplayServerInstructions[index].removeChild(CPDOMDisplayServerInstructions[index + 1]);
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            CPDOMDisplayServerInstructions[index++] = nil;
                                            break;
                }}catch(e) { CPLog("here?" + instruction) }
        }
        CPDOMDisplayServerInstructionCount = 0;
        var views = CPDOMDisplayServerViews,
            index = 0,
            count = CPDOMDisplayServerViewsCount;
        CPDOMDisplayServerViews = [];
        CPDOMDisplayServerViewsCount = 0;
        for (; index < count; ++index)
        {
            var view = views[index];
            delete CPDOMDisplayServerViewsContext[objj_msgSend(view, "hash")];
            objj_msgSend(view, "layoutIfNeeded");
            objj_msgSend(view, "displayIfNeeded");
        }
    }
    objj_msgSend(CPDOMDisplayRunLoop, "performSelector:target:argument:order:modes:", sel_getUid("run"), CPDOMDisplayServer, nil, 0, [CPDefaultRunLoopMode]);
}
})]);
}
objj_msgSend(CPDOMDisplayServer, "start");

