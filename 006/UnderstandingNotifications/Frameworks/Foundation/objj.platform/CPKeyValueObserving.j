i;9;CPArray.ji;14;CPDictionary.ji;13;CPException.ji;10;CPObject.ji;7;CPSet.jc;20115;
{
var the_class = objj_getClass("CPObject")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPObject\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("willChangeValueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
}
}), new objj_method(sel_getUid("didChangeValueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
}
}), new objj_method(sel_getUid("willChange:valuesAtIndexes:forKey:"), function(self, _cmd, change, indexes, key)
{ with(self)
{
}
}), new objj_method(sel_getUid("didChange:valuesAtIndexes:forKey:"), function(self, _cmd, change, indexes, key)
{ with(self)
{
}
}), new objj_method(sel_getUid("addObserver:forKeyPath:options:context:"), function(self, _cmd, anObserver, aPath, options, aContext)
{ with(self)
{
    if (!anObserver || !aPath)
        return;
    objj_msgSend(objj_msgSend(_CPKVOProxy, "proxyForObject:", self), "_addObserver:forKeyPath:options:context:", anObserver, aPath, options, aContext);
}
}), new objj_method(sel_getUid("removeObserver:forKeyPath:"), function(self, _cmd, anObserver, aPath)
{ with(self)
{
    if (!anObserver || !aPath)
        return;
    objj_msgSend(objj_msgSend(KVOProxyMap, "objectForKey:", objj_msgSend(self, "hash")), "_removeObserver:forKeyPath:", anObserver, aPath);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("automaticallyNotifiesObserversForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("keyPathsForValuesAffectingValueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    var capitalizedKey = aKey.charAt(0).toUpperCase()+aKey.substring(1);
        selector = "keyPathsForValuesAffectingValueFor"+capitalizedKey;
    if (objj_msgSend(objj_msgSend(self, "class"), "respondsToSelector:", selector))
        return objj_msgSend(objj_msgSend(self, "class"), selector);
    return objj_msgSend(CPSet, "set");
}
})]);
}
CPKeyValueObservingOptionNew = 1 << 0;
CPKeyValueObservingOptionOld = 1 << 1;
CPKeyValueObservingOptionInitial = 1 << 2;
CPKeyValueObservingOptionPrior = 1 << 3;
CPKeyValueChangeKindKey = "CPKeyValueChangeKindKey";
CPKeyValueChangeNewKey = "CPKeyValueChangeNewKey";
CPKeyValueChangeOldKey = "CPKeyValueChangeOldKey";
CPKeyValueChangeIndexesKey = "CPKeyValueChangeIndexesKey";
CPKeyValueChangeNotificationIsPriorKey = "CPKeyValueChangeNotificationIsPriorKey";
CPKeyValueChangeSetting = 1;
CPKeyValueChangeInsertion = 2;
CPKeyValueChangeRemoval = 3;
CPKeyValueChangeReplacement = 4;
var kvoNewAndOld = CPKeyValueObservingOptionNew|CPKeyValueObservingOptionOld;
var KVOProxyMap = objj_msgSend(CPDictionary, "dictionary"),
    DependentKeysMap = objj_msgSend(CPDictionary, "dictionary");
{var the_class = objj_allocateClassPair(CPObject, "_CPKVOProxy"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_targetObject"), new objj_ivar("_nativeClass"), new objj_ivar("_changesForKey"), new objj_ivar("_observersForKey"), new objj_ivar("_replacedKeys")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithTarget:"), function(self, _cmd, aTarget)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    _targetObject = aTarget;
    _nativeClass = objj_msgSend(aTarget, "class");
    _observersForKey = objj_msgSend(CPDictionary, "dictionary");
    _changesForKey = objj_msgSend(CPDictionary, "dictionary");
    _replacedKeys = objj_msgSend(CPSet, "set");
    return self;
}
}), new objj_method(sel_getUid("_replaceClass"), function(self, _cmd)
{ with(self)
{
    var currentClass = _nativeClass,
        kvoClassName = "$KVO_"+class_getName(_nativeClass),
        existingKVOClass = objj_lookUpClass(kvoClassName);
    if (existingKVOClass)
    {
        _targetObject.isa = existingKVOClass;
        return;
    }
    var kvoClass = objj_allocateClassPair(currentClass, kvoClassName);
    objj_registerClassPair(kvoClass);
    _class_initialize(kvoClass);
    var methodList = _CPKVOModelSubclass.method_list,
        count = methodList.length;
    for (var i=0; i<count; i++)
    {
        var method = methodList[i];
        class_addMethod(kvoClass, method_getName(method), method_getImplementation(method), "");
    }
    _targetObject.isa = kvoClass;
}
}), new objj_method(sel_getUid("_replaceSetterForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    if (objj_msgSend(_replacedKeys, "containsObject:", aKey) || !objj_msgSend(_nativeClass, "automaticallyNotifiesObserversForKey:", aKey))
        return;
    var currentClass = _nativeClass,
        capitalizedKey = aKey.charAt(0).toUpperCase() + aKey.substring(1),
        found = false,
        replacementMethods = [
            "set"+capitalizedKey+":", _kvoMethodForMethod,
            "_set"+capitalizedKey+":", _kvoMethodForMethod,
            "insertObject:in"+capitalizedKey+"AtIndex:", _kvoInsertMethodForMethod,
            "replaceObjectIn"+capitalizedKey+"AtIndex:withObject:", _kvoReplaceMethodForMethod,
            "removeObjectFrom"+capitalizedKey+"AtIndex:", _kvoRemoveMethodForMethod
        ];
    for (var i=0, count=replacementMethods.length; i<count; i+=2)
    {
        var theSelector = sel_getName(replacementMethods[i]),
            theReplacementMethod = replacementMethods[i+1];
        if (objj_msgSend(_nativeClass, "instancesRespondToSelector:", theSelector))
        {
            var theMethod = class_getInstanceMethod(_nativeClass, theSelector);
            class_addMethod(_targetObject.isa, theSelector, theReplacementMethod(aKey, theMethod), "");
            found = true;
        }
    }
    if (found)
        return;
    var composedOfKeys = objj_msgSend(objj_msgSend(_nativeClass, "keyPathsForValuesAffectingValueForKey:", aKey), "allObjects");
    if (!composedOfKeys)
        return;
    var dependentKeysForClass = objj_msgSend(DependentKeysMap, "objectForKey:", objj_msgSend(_nativeClass, "hash"));
    if (!dependentKeysForClass)
    {
        dependentKeysForClass = objj_msgSend(CPDictionary, "new");
        objj_msgSend(DependentKeysMap, "setObject:forKey:", dependentKeysForClass, objj_msgSend(_nativeClass, "hash"));
    }
    for (var i=0, count=composedOfKeys.length; i<count; i++)
    {
        var componentKey = composedOfKeys[i],
            keysComposedOfKey = objj_msgSend(dependentKeysForClass, "objectForKey:", componentKey);
        if (!keysComposedOfKey)
        {
            keysComposedOfKey = objj_msgSend(CPSet, "new");
            objj_msgSend(dependentKeysForClass, "setObject:forKey:", keysComposedOfKey, componentKey);
        }
        objj_msgSend(keysComposedOfKey, "addObject:", aKey);
        objj_msgSend(self, "_replaceSetterForKey:", componentKey);
    }
}
}), new objj_method(sel_getUid("_addObserver:forKeyPath:options:context:"), function(self, _cmd, anObserver, aPath, options, aContext)
{ with(self)
{
    if (!anObserver)
        return;
    var forwarder = nil;
    if (aPath.indexOf('.') != CPNotFound)
        forwarder = objj_msgSend(objj_msgSend(_CPKVOForwardingObserver, "alloc"), "initWithKeyPath:object:observer:options:context:", aPath, _targetObject, anObserver, options, aContext);
    else
        objj_msgSend(self, "_replaceSetterForKey:", aPath);
    var observers = objj_msgSend(_observersForKey, "objectForKey:", aPath);
    if (!observers)
    {
        observers = objj_msgSend(CPDictionary, "dictionary");
        objj_msgSend(_observersForKey, "setObject:forKey:", observers, aPath);
    }
    objj_msgSend(observers, "setObject:forKey:", _CPKVOInfoMake(anObserver, options, aContext, forwarder), objj_msgSend(anObserver, "hash"));
    if (options & CPKeyValueObservingOptionInitial)
    {
        var newValue = objj_msgSend(_targetObject, "valueForKeyPath:", aPath);
        if (newValue === nil || newValue === undefined)
            newValue = objj_msgSend(CPNull, "null");
        var changes = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", newValue, CPKeyValueChangeNewKey);
        objj_msgSend(anObserver, "observeValueForKeyPath:ofObject:change:context:", aPath, self, changes, aContext);
    }
}
}), new objj_method(sel_getUid("_removeObserver:forKeyPath:"), function(self, _cmd, anObserver, aPath)
{ with(self)
{
    var observers = objj_msgSend(_observersForKey, "objectForKey:", aPath);
    if (aPath.indexOf('.') != CPNotFound)
    {
        var forwarder = objj_msgSend(observers, "objectForKey:", objj_msgSend(anObserver, "hash")).forwarder;
        objj_msgSend(forwarder, "finalize");
    }
    objj_msgSend(observers, "removeObjectForKey:", objj_msgSend(anObserver, "hash"));
    if (!objj_msgSend(observers, "count"))
        objj_msgSend(_observersForKey, "removeObjectForKey:", aPath);
    if (!objj_msgSend(_observersForKey, "count"))
    {
        _targetObject.isa = _nativeClass;
        objj_msgSend(KVOProxyMap, "removeObjectForKey:", objj_msgSend(_targetObject, "hash"));
    }
}
}), new objj_method(sel_getUid("_sendNotificationsForKey:changeOptions:isBefore:"), function(self, _cmd, aKey, changeOptions, isBefore)
{ with(self)
{
    var changes = objj_msgSend(_changesForKey, "objectForKey:", aKey);
    if (isBefore)
    {
        changes = changeOptions;
        var indexes = objj_msgSend(changes, "objectForKey:", CPKeyValueChangeIndexesKey);
        if (indexes)
        {
            var type = objj_msgSend(changes, "objectForKey:", CPKeyValueChangeKindKey);
            if (type == CPKeyValueChangeReplacement || type == CPKeyValueChangeRemoval)
            {
                var oldValues = objj_msgSend(objj_msgSend(_targetObject, "mutableArrayValueForKeyPath:", aKey), "objectsAtIndexes:", indexes);
                objj_msgSend(changes, "setValue:forKey:", oldValues, CPKeyValueChangeOldKey);
            }
        }
        else
        {
            var oldValue = objj_msgSend(_targetObject, "valueForKey:", aKey);
            if (oldValue === nil || oldValue === undefined)
                oldValue = objj_msgSend(CPNull, "null");
            objj_msgSend(changes, "setObject:forKey:", oldValue, CPKeyValueChangeOldKey);
        }
        objj_msgSend(changes, "setObject:forKey:", 1, CPKeyValueChangeNotificationIsPriorKey);
        objj_msgSend(_changesForKey, "setObject:forKey:", changes, aKey);
    }
    else
    {
        objj_msgSend(changes, "removeObjectForKey:", CPKeyValueChangeNotificationIsPriorKey);
        var indexes = objj_msgSend(changes, "objectForKey:", CPKeyValueChangeIndexesKey);
        if (indexes)
        {
            var type = objj_msgSend(changes, "objectForKey:", CPKeyValueChangeKindKey);
            if (type == CPKeyValueChangeReplacement || type == CPKeyValueChangeInsertion)
            {
                var oldValues = objj_msgSend(objj_msgSend(_targetObject, "mutableArrayValueForKeyPath:", aKey), "objectsAtIndexes:", indexes);
                objj_msgSend(changes, "setValue:forKey:", oldValues, CPKeyValueChangeNewKey);
            }
        }
        else
        {
            var newValue = objj_msgSend(_targetObject, "valueForKey:", aKey);
            if (newValue === nil || newValue === undefined)
                newValue = objj_msgSend(CPNull, "null");
            objj_msgSend(changes, "setObject:forKey:", newValue, CPKeyValueChangeNewKey);
        }
    }
    var observers = objj_msgSend(objj_msgSend(_observersForKey, "objectForKey:", aKey), "allValues"),
        count = objj_msgSend(observers, "count");
    while (count--)
    {
        var observerInfo = observers[count];
        if (isBefore && (observerInfo.options & CPKeyValueObservingOptionPrior))
            objj_msgSend(observerInfo.observer, "observeValueForKeyPath:ofObject:change:context:", aKey, _targetObject, changes, observerInfo.context);
        else if (!isBefore)
            objj_msgSend(observerInfo.observer, "observeValueForKeyPath:ofObject:change:context:", aKey, _targetObject, changes, observerInfo.context);
    }
    var keysComposedOfKey = objj_msgSend(objj_msgSend(objj_msgSend(DependentKeysMap, "objectForKey:", objj_msgSend(_nativeClass, "hash")), "objectForKey:", aKey), "allObjects");
    if (!keysComposedOfKey)
        return;
    for (var i=0, count=keysComposedOfKey.length; i<count; i++)
        objj_msgSend(self, "_sendNotificationsForKey:changeOptions:isBefore:", keysComposedOfKey[i], changeOptions, isBefore);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("proxyForObject:"), function(self, _cmd, anObject)
{ with(self)
{
    var proxy = objj_msgSend(KVOProxyMap, "objectForKey:", objj_msgSend(anObject, "hash"));
    if (proxy)
        return proxy;
    proxy = objj_msgSend(objj_msgSend(self, "alloc"), "initWithTarget:", anObject);
    objj_msgSend(proxy, "_replaceClass");
    objj_msgSend(KVOProxyMap, "setObject:forKey:", proxy, objj_msgSend(anObject, "hash"));
    return proxy;
}
})]);
}
{var the_class = objj_allocateClassPair(Nil, "_CPKVOModelSubclass"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("willChangeValueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    if (!aKey)
        return;
    var changeOptions = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", CPKeyValueChangeSetting, CPKeyValueChangeKindKey);
    objj_msgSend(objj_msgSend(_CPKVOProxy, "proxyForObject:", self), "_sendNotificationsForKey:changeOptions:isBefore:", aKey, changeOptions, YES);
}
}), new objj_method(sel_getUid("didChangeValueForKey:"), function(self, _cmd, aKey)
{ with(self)
{
    if (!aKey)
        return;
    objj_msgSend(objj_msgSend(_CPKVOProxy, "proxyForObject:", self), "_sendNotificationsForKey:changeOptions:isBefore:", aKey, nil, NO);
}
}), new objj_method(sel_getUid("willChange:valuesAtIndexes:forKey:"), function(self, _cmd, change, indexes, aKey)
{ with(self)
{
    if (!aKey)
        return;
    var changeOptions = objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [change, indexes], [CPKeyValueChangeKindKey, CPKeyValueChangeIndexesKey]);
    objj_msgSend(objj_msgSend(_CPKVOProxy, "proxyForObject:", self), "_sendNotificationsForKey:changeOptions:isBefore:", aKey, changeOptions, YES);
}
}), new objj_method(sel_getUid("didChange:valuesAtIndexes:forKey:"), function(self, _cmd, change, indexes, aKey)
{ with(self)
{
    if (!aKey)
        return;
    objj_msgSend(objj_msgSend(_CPKVOProxy, "proxyForObject:", self), "_sendNotificationsForKey:changeOptions:isBefore:", aKey, nil, NO);
}
}), new objj_method(sel_getUid("class"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(KVOProxyMap, "objectForKey:", objj_msgSend(self, "hash"))._nativeClass;
}
}), new objj_method(sel_getUid("superclass"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "class"), "superclass");
}
}), new objj_method(sel_getUid("isKindOfClass:"), function(self, _cmd, aClass)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "class"), "isSubclassOfClass:", aClass);
}
}), new objj_method(sel_getUid("isMemberOfClass:"), function(self, _cmd, aClass)
{ with(self)
{
    return objj_msgSend(self, "class") == aClass;
}
}), new objj_method(sel_getUid("className"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "class").name;
}
})]);
}
{var the_class = objj_allocateClassPair(CPObject, "_CPKVOForwardingObserver"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_object"), new objj_ivar("_observer"), new objj_ivar("_context"), new objj_ivar("_firstPart"), new objj_ivar("_secondPart"), new objj_ivar("_value")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithKeyPath:object:observer:options:context:"), function(self, _cmd, aKeyPath, anObject, anObserver, options, aContext)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    _context = aContext;
    _observer = anObserver;
    _object = anObject;
    var dotIndex = aKeyPath.indexOf('.');
    if (dotIndex == CPNotFound)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "Created _CPKVOForwardingObserver without compound key path: "+aKeyPath);
    _firstPart = aKeyPath.substring(0, dotIndex);
    _secondPart = aKeyPath.substring(dotIndex+1);
    objj_msgSend(_object, "addObserver:forKeyPath:options:context:", self, _firstPart, kvoNewAndOld, nil);
    _value = objj_msgSend(_object, "valueForKey:", _firstPart);
    if (_value)
        objj_msgSend(_value, "addObserver:forKeyPath:options:context:", self, _secondPart, kvoNewAndOld, nil);
    return self;
}
}), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function(self, _cmd, aKeyPath, anObject, changes, aContext)
{ with(self)
{
    if (anObject == _object)
    {
        objj_msgSend(_observer, "observeValueForKeyPath:ofObject:change:context:", _firstPart, _object, changes, _context);
        if (_value)
            objj_msgSend(_value, "removeObserver:forKeyPath:", self, _secondPart);
        _value = objj_msgSend(_object, "valueForKey:", _firstPart);
        if (_value)
            objj_msgSend(_value, "addObserver:forKeyPath:options:context:", self, _secondPart, kvoNewAndOld, nil);
    }
    else
    {
        objj_msgSend(_observer, "observeValueForKeyPath:ofObject:change:context:", _firstPart+"."+aKeyPath, _object, changes, _context);
    }
}
}), new objj_method(sel_getUid("finalize"), function(self, _cmd)
{ with(self)
{
    if (_value)
        objj_msgSend(_value, "removeObserver:forKeyPath:", self, _secondPart);
    objj_msgSend(_object, "removeObserver:forKeyPath:", self, _firstPart);
    _object = nil;
    _observer = nil;
    _context = nil;
    _value = nil;
}
})]);
}
var _CPKVOInfoMake = _CPKVOInfoMake= function(anObserver, theOptions, aContext, aForwarder)
{
    return {
        observer: anObserver,
        options: theOptions,
        context: aContext,
        forwarder: aForwarder
    };
}
var _kvoMethodForMethod = _kvoMethodForMethod= function(theKey, theMethod)
{
    return function(self, _cmd, object)
    {
        objj_msgSend(self, "willChangeValueForKey:", theKey);
        theMethod.method_imp(self, _cmd, object);
        objj_msgSend(self, "didChangeValueForKey:", theKey);
    }
}
var _kvoInsertMethodForMethod = _kvoInsertMethodForMethod= function(theKey, theMethod)
{
    return function(self, _cmd, object, index)
    {
        objj_msgSend(self, "willChange:valuesAtIndexes:forKey:", CPKeyValueChangeInsertion, objj_msgSend(CPIndexSet, "indexSetWithIndex:", index), theKey);
        theMethod.method_imp(self, _cmd, object, index);
        objj_msgSend(self, "didChange:valuesAtIndexes:forKey:", CPKeyValueChangeInsertion, objj_msgSend(CPIndexSet, "indexSetWithIndex:", index), theKey)
    }
}
var _kvoReplaceMethodForMethod = _kvoReplaceMethodForMethod= function(theKey, theMethod)
{
    return function(self, _cmd, index, object)
    {
        objj_msgSend(self, "willChange:valuesAtIndexes:forKey:", CPKeyValueChangeReplacement, objj_msgSend(CPIndexSet, "indexSetWithIndex:", index), theKey);
        theMethod.method_imp(self, _cmd, index, object);
        objj_msgSend(self, "didChange:valuesAtIndexes:forKey:", CPKeyValueChangeReplacement, objj_msgSend(CPIndexSet, "indexSetWithIndex:", index), theKey)
    }
}
var _kvoRemoveMethodForMethod = _kvoRemoveMethodForMethod= function(theKey, theMethod)
{
    return function(self, _cmd, index)
    {
        objj_msgSend(self, "willChange:valuesAtIndexes:forKey:", CPKeyValueChangeRemoval, objj_msgSend(CPIndexSet, "indexSetWithIndex:", index), theKey);
        theMethod.method_imp(self, _cmd, index);
        objj_msgSend(self, "didChange:valuesAtIndexes:forKey:", CPKeyValueChangeRemoval, objj_msgSend(CPIndexSet, "indexSetWithIndex:", index), theKey)
    }
}
i;13;CPArray+KVO.j