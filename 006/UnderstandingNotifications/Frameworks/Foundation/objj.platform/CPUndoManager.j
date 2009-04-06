i;10;CPObject.ji;14;CPInvocation.jc;17180;
var CPUndoManagerNormal = 0,
    CPUndoManagerUndoing = 1,
    CPUndoManagerRedoing = 2;
CPUndoManagerCheckpointNotification = "CPUndoManagerCheckpointNotification";
CPUndoManagerDidOpenUndoGroupNotification = "CPUndoManagerDidOpenUndoGroupNotification";
CPUndoManagerDidRedoChangeNotification = "CPUndoManagerDidRedoChangeNotification";
CPUndoManagerDidUndoChangeNotification = "CPUndoManagerDidUndoChangeNotification";
CPUndoManagerWillCloseUndoGroupNotification = "CPUndoManagerWillCloseUndoGroupNotification";
CPUndoManagerWillRedoChangeNotification = "CPUndoManagerWillRedoChangeNotification";
CPUndoManagerWillUndoChangeNotification = "CPUndoManagerWillUndoChangeNotification";
CPUndoCloseGroupingRunLoopOrdering = 350000;
var _CPUndoGroupingPool = [],
    _CPUndoGroupingPoolCapacity = 5;
{var the_class = objj_allocateClassPair(CPObject, "_CPUndoGrouping"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_parent"), new objj_ivar("_invocations")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithParent:"), function(self, _cmd, anUndoGrouping)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _parent = anUndoGrouping;
        _invocations = [];
    }
    return self;
}
}), new objj_method(sel_getUid("parent"), function(self, _cmd)
{ with(self)
{
    return _parent;
}
}), new objj_method(sel_getUid("addInvocation:"), function(self, _cmd, anInvocation)
{ with(self)
{
    _invocations.push(anInvocation);
}
}), new objj_method(sel_getUid("addInvocationsFromArray:"), function(self, _cmd, invocations)
{ with(self)
{
    objj_msgSend(_invocations, "addObjectsFromArray:", invocations);
}
}), new objj_method(sel_getUid("removeInvocationsWithTarget:"), function(self, _cmd, aTarget)
{ with(self)
{
    var index = _invocations.length;
    while (index--)
        if (objj_msgSend(_invocations[index], "target") == aTarget)
            _invocations.splice(index, 1);
}
}), new objj_method(sel_getUid("invocations"), function(self, _cmd)
{ with(self)
{
    return _invocations;
}
}), new objj_method(sel_getUid("invoke"), function(self, _cmd)
{ with(self)
{
    var index = _invocations.length;
    while (index--)
        objj_msgSend(_invocations[index], "invoke");
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("_poolUndoGrouping:"), function(self, _cmd, anUndoGrouping)
{ with(self)
{
    if (!anUndoGrouping || _CPUndoGroupingPool.length >= _CPUndoGroupingPoolCapacity)
        return;
    _CPUndoGroupingPool.push(anUndoGrouping);
}
}), new objj_method(sel_getUid("undoGroupingWithParent:"), function(self, _cmd, anUndoGrouping)
{ with(self)
{
    if (_CPUndoGroupingPool.length)
    {
        var grouping = _CPUndoGroupingPool.pop();
        grouping._parent = anUndoGrouping;
        if (grouping._invocations.length)
            grouping._invocations = [];
        return grouping;
    }
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithParent:", anUndoGrouping);
}
})]);
}
var _CPUndoGroupingParentKey = "_CPUndoGroupingParentKey",
    _CPUndoGroupingInvocationsKey = "_CPUndoGroupingInvocationsKey";
{
var the_class = objj_getClass("_CPUndoGrouping")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"_CPUndoGrouping\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _parent = objj_msgSend(aCoder, "decodeObjectForKey:", _CPUndoGroupingParentKey);
        _invocations = objj_msgSend(aCoder, "decodeObjectForKey:", _CPUndoGroupingInvocationsKey);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _parent, _CPUndoGroupingParentKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _invocations, _CPUndoGroupingInvocationsKey);
}
})]);
}
{var the_class = objj_allocateClassPair(CPObject, "CPUndoManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_redoStack"), new objj_ivar("_undoStack"), new objj_ivar("_groupsByEvent"), new objj_ivar("_disableCount"), new objj_ivar("_levelsOfUndo"), new objj_ivar("_currentGrouping"), new objj_ivar("_state"), new objj_ivar("_actionName"), new objj_ivar("_preparedTarget"), new objj_ivar("_runLoopModes"), new objj_ivar("_registeredWithRunLoop")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _redoStack = [];
        _undoStack = [];
        _state = CPUndoManagerNormal;
        objj_msgSend(self, "setRunLoopModes:", [CPDefaultRunLoopMode]);
        objj_msgSend(self, "setGroupsByEvent:", YES);
        _performRegistered = NO;
    }
    return self;
}
}), new objj_method(sel_getUid("registerUndoWithTarget:selector:object:"), function(self, _cmd, aTarget, aSelector, anObject)
{ with(self)
{
    if (!_currentGrouping)
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "No undo group is currently open");
    if (_disableCount > 0)
        return;
    var invocation = objj_msgSend(CPInvocation, "invocationWithMethodSignature:", nil);
    objj_msgSend(invocation, "setTarget:", aTarget);
    objj_msgSend(invocation, "setSelector:", aSelector);
    objj_msgSend(invocation, "setArgument:atIndex:", anObject, 2);
    objj_msgSend(_currentGrouping, "addInvocation:", invocation);
    if (_state == CPUndoManagerNormal)
        objj_msgSend(_redoStack, "removeAllObjects");
}
}), new objj_method(sel_getUid("prepareWithInvocationTarget:"), function(self, _cmd, aTarget)
{ with(self)
{
    _preparedTarget = aTarget;
    return self;
}
}), new objj_method(sel_getUid("methodSignatureForSelector:"), function(self, _cmd, aSelector)
{ with(self)
{
    if (objj_msgSend(_preparedTarget, "respondsToSelector:", aSelector))
        return 1;
    return nil;
}
}), new objj_method(sel_getUid("forwardInvocation:"), function(self, _cmd, anInvocation)
{ with(self)
{
    if (_disableCount > 0)
        return;
    objj_msgSend(anInvocation, "setTarget:", _preparedTarget);
    objj_msgSend(_currentGrouping, "addInvocation:", anInvocation);
    if (_state == CPUndoManagerNormal)
        objj_msgSend(_redoStack, "removeAllObjects");
    _preparedTarget = nil;
}
}), new objj_method(sel_getUid("canRedo"), function(self, _cmd)
{ with(self)
{
    return _redoStack.length > 0;
}
}), new objj_method(sel_getUid("canUndo"), function(self, _cmd)
{ with(self)
{
    if (_undoStack.length > 0)
        return YES;
    return objj_msgSend(_currentGrouping, "actions").length > 0;
}
}), new objj_method(sel_getUid("undo"), function(self, _cmd)
{ with(self)
{
    if (objj_msgSend(self, "groupingLevel") == 1)
        objj_msgSend(self, "endUndoGrouping");
    objj_msgSend(self, "undoNestedGroup");
}
}), new objj_method(sel_getUid("undoNestedGroup"), function(self, _cmd)
{ with(self)
{
    if (_undoStack.length == 0)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    objj_msgSend(defaultCenter, "postNotificationName:object:", CPUndoManagerWillUndoChangeNotification, self);
    var undoGrouping = _undoStack.pop();
    _state = CPUndoManagerUndoing;
    objj_msgSend(self, "beginUndoGrouping");
    objj_msgSend(undoGrouping, "invoke");
    objj_msgSend(self, "endUndoGrouping");
    objj_msgSend(_CPUndoGrouping, "_poolUndoGrouping:", undoGrouping);
    _state = CPUndoManagerNormal;
    objj_msgSend(defaultCenter, "postNotificationName:object:", CPUndoManagerDidUndoChangeNotification, self);
}
}), new objj_method(sel_getUid("redo"), function(self, _cmd)
{ with(self)
{
    if (_redoStack.length == 0)
        return;
    var defaultCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
    objj_msgSend(defaultCenter, "postNotificationName:object:", CPUndoManagerWillRedoChangeNotification, self);
    var oldUndoGrouping = _currentGrouping,
        undoGrouping = _redoStack.pop();
    _currentGrouping = nil;
    _state = CPUndoManagerRedoing;
    objj_msgSend(self, "beginUndoGrouping");
    objj_msgSend(undoGrouping, "invoke");
    objj_msgSend(self, "endUndoGrouping");
    objj_msgSend(_CPUndoGrouping, "_poolUndoGrouping:", undoGrouping);
    _currentGrouping = oldUndoGrouping;
    _state = CPUndoManagerNormal;
    objj_msgSend(defaultCenter, "postNotificationName:object:", CPUndoManagerDidRedoChangeNotification, self);
}
}), new objj_method(sel_getUid("beginUndoGrouping"), function(self, _cmd)
{ with(self)
{
    _currentGrouping = objj_msgSend(_CPUndoGrouping, "undoGroupingWithParent:", _currentGrouping);
}
}), new objj_method(sel_getUid("endUndoGrouping"), function(self, _cmd)
{ with(self)
{
    if (!_currentGrouping)
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "endUndoGrouping. No undo group is currently open.");
    var parent = objj_msgSend(_currentGrouping, "parent");
    if (!parent && objj_msgSend(_currentGrouping, "invocations").length > 0)
    {
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", CPUndoManagerWillCloseUndoGroupNotification, self);
        var stack = _state == CPUndoManagerUndoing ? _redoStack : _undoStack;
        stack.push(_currentGrouping);
        if (_levelsOfUndo > 0 && stack.length > _levelsOfUndo)
            stack.splice(0, 1);
    }
    else
    {
        objj_msgSend(parent, "addInvocationsFromArray:", objj_msgSend(_currentGrouping, "invocations"));
        objj_msgSend(_CPUndoGrouping, "_poolUndoGrouping:", _currentGrouping);
    }
    _currentGrouping = parent;
}
}), new objj_method(sel_getUid("enableUndoRegistration"), function(self, _cmd)
{ with(self)
{
    if (_disableCount <= 0)
        objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, "enableUndoRegistration. There are no disable messages in effect right now.");
    _disableCount--;
}
}), new objj_method(sel_getUid("groupsByEvent"), function(self, _cmd)
{ with(self)
{
    return _groupsByEvent;
}
}), new objj_method(sel_getUid("setGroupsByEvent:"), function(self, _cmd, aFlag)
{ with(self)
{
    if (_groupsByEvent == aFlag)
        return;
    _groupsByEvent = aFlag;
    if (_groupsByEvent)
    {
        objj_msgSend(self, "_registerWithRunLoop");
        if (!_currentGrouping)
            objj_msgSend(self, "beginUndoGrouping");
    }
    else
        objj_msgSend(self, "_unregisterWithRunLoop");
}
}), new objj_method(sel_getUid("groupingLevel"), function(self, _cmd)
{ with(self)
{
    var grouping = _currentGrouping,
        level = _currentGrouping != nil;
    while (grouping = objj_msgSend(grouping, "parent"))
        ++level;
    return level;
}
}), new objj_method(sel_getUid("disableUndoRegistration"), function(self, _cmd)
{ with(self)
{
    ++_disableCount;
}
}), new objj_method(sel_getUid("isUndoRegistrationEnabled"), function(self, _cmd)
{ with(self)
{
    return _disableCount == 0;
}
}), new objj_method(sel_getUid("isUndoing"), function(self, _cmd)
{ with(self)
{
    return _state == CPUndoManagerUndoing;
}
}), new objj_method(sel_getUid("isRedoing"), function(self, _cmd)
{ with(self)
{
    return _state == CPUndoManagerRedoing;
}
}), new objj_method(sel_getUid("removeAllActions"), function(self, _cmd)
{ with(self)
{
    _redoStack = [];
    _undoStack = [];
    _disableCount = 0;
}
}), new objj_method(sel_getUid("removeAllActionsWithTarget:"), function(self, _cmd, aTarget)
{ with(self)
{
    objj_msgSend(_currentGrouping, "removeInvocationsWithTarget:", aTarget);
    var index = _redoStack.length;
    while (index--)
    {
        var grouping = _redoStack[index];
        objj_msgSend(grouping, "removeInvocationsWithTarget:", aTarget);
        if (!objj_msgSend(grouping, "invocations").length)
            _redoStack.splice(index, 1);
    }
    index = _undoStack.length;
    while (index--)
    {
        var grouping = _undoStack[index];
        objj_msgSend(grouping, "removeInvocationsWithTarget:", aTarget);
        if (!objj_msgSend(grouping, "invocations").length)
            _undoStack.splice(index, 1);
    }
}
}), new objj_method(sel_getUid("setActionName:"), function(self, _cmd, anActionName)
{ with(self)
{
    _actionName = anActionName;
}
}), new objj_method(sel_getUid("redoActionName"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "canRedo") ? _actionName : nil;
}
}), new objj_method(sel_getUid("undoActionName"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "canUndo") ? _actionName : nil;
}
}), new objj_method(sel_getUid("runLoopModes"), function(self, _cmd)
{ with(self)
{
    return _runLoopModes;
}
}), new objj_method(sel_getUid("setRunLoopModes:"), function(self, _cmd, modes)
{ with(self)
{
    _runLoopModes = modes;
    objj_msgSend(self, "_unregisterWithRunLoop");
    if (_groupsByEvent)
        objj_msgSend(self, "_registerWithRunLoop");
}
}), new objj_method(sel_getUid("beginUndoGroupingForEvent"), function(self, _cmd)
{ with(self)
{
    if (!_groupsByEvent)
        return;
    if (_currentGrouping != nil)
        objj_msgSend(self, "endUndoGrouping");
    objj_msgSend(self, "beginUndoGrouping");
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelector:target:argument:order:modes:", sel_getUid("beginUndoGroupingForEvent"), self, nil, CPUndoCloseGroupingRunLoopOrdering, _runLoopModes);
}
}), new objj_method(sel_getUid("_registerWithRunLoop"), function(self, _cmd)
{ with(self)
{
    if (_registeredWithRunLoop)
        return;
    _registeredWithRunLoop = YES;
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "performSelector:target:argument:order:modes:", sel_getUid("beginUndoGroupingForEvent"), self, nil, CPUndoCloseGroupingRunLoopOrdering, _runLoopModes);
}
}), new objj_method(sel_getUid("_unregisterWithRunLoop"), function(self, _cmd)
{ with(self)
{
    if (!_registeredWithRunLoop)
        return;
    _registeredWithRunLoop = NO;
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "cancelPerformSelector:target:argument:", sel_getUid("beginUndoGroupingForEvent"), self, nil);
}
})]);
}
var CPUndoManagerRedoStackKey = "CPUndoManagerRedoStackKey",
    CPUndoManagerUndoStackKey = "CPUndoManagerUndoStackKey";
    CPUndoManagerLevelsOfUndoKey = "CPUndoManagerLevelsOfUndoKey";
    CPUndoManagerActionNameKey = "CPUndoManagerActionNameKey";
    CPUndoManagerCurrentGroupingKey = "CPUndoManagerCurrentGroupingKey";
    CPUndoManagerRunLoopModesKey = "CPUndoManagerRunLoopModesKey";
    CPUndoManagerGroupsByEventKey = "CPUndoManagerGroupsByEventKey";
{
var the_class = objj_getClass("CPUndoManager")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPUndoManager\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
    {
        _redoStack = objj_msgSend(aCoder, "decodeObjectForKey:", CPUndoManagerRedoStackKey);
        _undoStack = objj_msgSend(aCoder, "decodeObjectForKey:", CPUndoManagerUndoStackKey);
        _levelsOfUndo = objj_msgSend(aCoder, "decodeObjectForKey:", CPUndoManagerLevelsOfUndoKey);
        _actionName = objj_msgSend(aCoder, "decodeObjectForKey:", CPUndoManagerActionNameKey);
        _currentGrouping = objj_msgSend(aCoder, "decodeObjectForKey:", CPUndoManagerCurrentGroupingKey);
        _state = CPUndoManagerNormal;
        objj_msgSend(self, "setRunLoopModes:", objj_msgSend(aCoder, "decodeObjectForKey:", CPUndoManagerRunLoopModesKey));
        objj_msgSend(self, "setGroupsByEvent:", objj_msgSend(aCoder, "decodeBoolForKey:", CPUndoManagerGroupsByEventKey));
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _redoStack, CPUndoManagerRedoStackKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _undoStack, CPUndoManagerUndoStackKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", _levelsOfUndo, CPUndoManagerLevelsOfUndoKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _actionName, CPUndoManagerActionNameKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _currentGrouping, CPUndoManagerCurrentGroupingKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", _runLoopModes, CPUndoManagerRunLoopModesKey);
    objj_msgSend(aCoder, "encodeBool:forKey:", _groupsByEvent, CPUndoManagerGroupsByEventKey);
}
})]);
}

