i;10;CPObject.ji;13;CPException.ji;18;CPSortDescriptor.ji;9;CPValue.jc;11454;
CPCaseInsensitiveSearch = 1;
CPLiteralSearch = 2;
CPBackwardsSearch = 4;
CPAnchoredSearch = 8;
CPNumericSearch = 64;
var CPStringHashes = new objj_dictionary();
{var the_class = objj_allocateClassPair(CPObject, "CPString"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithString:"), function(self, _cmd, aString)
{ with(self)
{
    return String(aString);
}
}), new objj_method(sel_getUid("initWithFormat:"), function(self, _cmd, format)
{ with(self)
{
    if (!format)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "initWithFormat: the format can't be 'nil'");
    self = sprintf.apply(this, Array.prototype.slice.call(arguments, 2));
    return self;
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    return "<" + self.isa.name + " 0x" + objj_msgSend(CPString, "stringWithHash:", objj_msgSend(self, "hash")) + " \"" + self + "\">";
}
}), new objj_method(sel_getUid("length"), function(self, _cmd)
{ with(self)
{
    return length;
}
}), new objj_method(sel_getUid("characterAtIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return charAt(anIndex);
}
}), new objj_method(sel_getUid("stringByAppendingFormat:"), function(self, _cmd, format)
{ with(self)
{
    if (!format)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "initWithFormat: the format can't be 'nil'");
    return self + sprintf.apply(this, Array.prototype.slice.call(arguments, 2));
}
}), new objj_method(sel_getUid("stringByAppendingString:"), function(self, _cmd, aString)
{ with(self)
{
    return self + aString;
}
}), new objj_method(sel_getUid("stringByPaddingToLength:withString:startingAtIndex:"), function(self, _cmd, aLength, aString, anIndex)
{ with(self)
{
    if (length == aLength)
        return self;
    if (aLength < length)
        return substr(0, aLength);
    var string = self,
        substring = aString.substring(anIndex),
        difference = aLength - length;
    while ((difference -= substring.length) >= 0)
        string += substring;
    if (-difference < substring.length)
        string += substring.substring(0, -difference);
    return string;
}
}), new objj_method(sel_getUid("componentsSeparatedByString:"), function(self, _cmd, aString)
{ with(self)
{
    return split(aString);
}
}), new objj_method(sel_getUid("substringFromIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return substr(anIndex);
}
}), new objj_method(sel_getUid("substringWithRange:"), function(self, _cmd, aRange)
{ with(self)
{
    return substr(aRange.location, aRange.length);
}
}), new objj_method(sel_getUid("substringToIndex:"), function(self, _cmd, anIndex)
{ with(self)
{
    return substring(0, anIndex);
}
}), new objj_method(sel_getUid("rangeOfString:"), function(self, _cmd, aString)
{ with(self)
{
   return objj_msgSend(self, "rangeOfString:options:", aString, 0);
}
}), new objj_method(sel_getUid("rangeOfString:options:"), function(self, _cmd, aString, aMask)
{ with(self)
{
    return objj_msgSend(self, "rangeOfString:options:range:", aString, aMask, nil);
}
}), new objj_method(sel_getUid("rangeOfString:options:range:"), function(self, _cmd, aString, aMask, aRange)
{ with(self)
{
    var string = (aRange == nil) ? self : objj_msgSend(self, "substringWithRange:", aRange),
        location = CPNotFound;
    if (aMask & CPCaseInsensitiveSearch)
    {
        string = string.toLowerCase();
        aString = aString.toLowerCase();
    }
    if (aMask & CPBackwardsSearch)
        location = string.lastIndexOf(aString, aMask & CPAnchoredSearch ? length - aString.length : 0);
    else if (aMask & CPAnchoredSearch)
        location = string.substr(0, aString.length).indexOf(aString) != CPNotFound ? 0 : CPNotFound;
    else
        location = string.indexOf(aString);
    return CPMakeRange(location, location == CPNotFound ? 0 : aString.length);
}
}), new objj_method(sel_getUid("stringByReplacingOccurrencesOfString:withString:"), function(self, _cmd, target, replacement)
{ with(self)
{
    return self.replace(new RegExp(target, "g"), replacement);
}
}), new objj_method(sel_getUid("stringByReplacingOccurrencesOfString:withString:options:range:"), function(self, _cmd, target, replacement, options, searchRange)
{ with(self)
{
    var start = substring(0, searchRange.location),
        stringSegmentToSearch = substr(searchRange.location, searchRange.length),
        end = substring(searchRange.location + searchRange.length, self.length),
        regExp;
    if (options & CPCaseInsensitiveSearch)
        regExp = new RegExp(target, "gi");
    else
        regExp = new RegExp(target, "g");
    return start + '' + stringSegmentToSearch.replace(regExp, replacement) + '' + end;
}
}), new objj_method(sel_getUid("stringByReplacingCharactersInRange:withString:"), function(self, _cmd, range, replacement)
{ with(self)
{
 return '' + substring(0, range.location) + replacement + substring(range.location + range.length, self.length);
}
}), new objj_method(sel_getUid("compare:"), function(self, _cmd, aString)
{ with(self)
{
    return objj_msgSend(self, "compare:options:", aString, nil);
}
}), new objj_method(sel_getUid("caseInsensitiveCompare:"), function(self, _cmd, aString)
{ with(self)
{
    return objj_msgSend(self, "compare:options:", aString, CPCaseInsensitiveSearch);
}
}), new objj_method(sel_getUid("compare:options:"), function(self, _cmd, aString, aMask)
{ with(self)
{
    var lhs = self,
        rhs = aString;
    if (aMask & CPCaseInsensitiveSearch)
    {
        lhs = lhs.toLowerCase();
        rhs = rhs.toLowerCase();
    }
    if (lhs < rhs)
        return CPOrderedAscending;
    else if (lhs > rhs)
        return CPOrderedDescending;
    return CPOrderedSame;
}
}), new objj_method(sel_getUid("compare:options:range:"), function(self, _cmd, aString, aMask, range)
{ with(self)
{
    var lhs = objj_msgSend(self, "substringWithRange:", range),
        rhs = aString;
    return objj_msgSend(lhs, "compare:options:", rhs, aMask);
}
}), new objj_method(sel_getUid("hasPrefix:"), function(self, _cmd, aString)
{ with(self)
{
    return aString && aString != "" && indexOf(aString) == 0;
}
}), new objj_method(sel_getUid("hasSuffix:"), function(self, _cmd, aString)
{ with(self)
{
    return aString && aString != "" && lastIndexOf(aString) == (length - aString.length);
}
}), new objj_method(sel_getUid("isEqualToString:"), function(self, _cmd, aString)
{ with(self)
{
    return self == aString;
}
}), new objj_method(sel_getUid("hash"), function(self, _cmd)
{ with(self)
{
    var hash = dictionary_getValue(CPStringHashes, self);
    if (!hash)
    {
        hash = _objj_generateObjectHash();
        dictionary_setValue(CPStringHashes, self, hash);
    }
    return hash;
}
}), new objj_method(sel_getUid("capitalizedString"), function(self, _cmd)
{ with(self)
{
    var parts = self.split(/\b/g);
    for (var i = 0; i < parts.length; i++)
    {
        if (i == 0 || (/\s$/).test(parts[i-1]))
            parts[i] = parts[i].substring(0, 1).toUpperCase() + parts[i].substring(1).toLowerCase();
        else
            parts[i] = parts[i].toLowerCase();
    }
    return parts.join("");
}
}), new objj_method(sel_getUid("lowercaseString"), function(self, _cmd)
{ with(self)
{
    return toLowerCase();
}
}), new objj_method(sel_getUid("uppercaseString"), function(self, _cmd)
{ with(self)
{
    return toUpperCase();
}
}), new objj_method(sel_getUid("doubleValue"), function(self, _cmd)
{ with(self)
{
    return parseFloat(self, 10);
}
}), new objj_method(sel_getUid("boolValue"), function(self, _cmd)
{ with(self)
{
    var replaceRegExp = new RegExp("^\\s*[\\+,\\-]*0*");
    return RegExp("^[Y,y,t,T,1-9]").test(self.replace(replaceRegExp, ''));
}
}), new objj_method(sel_getUid("floatValue"), function(self, _cmd)
{ with(self)
{
    return parseFloat(self, 10);
}
}), new objj_method(sel_getUid("intValue"), function(self, _cmd)
{ with(self)
{
    return parseInt(self, 10);
}
}), new objj_method(sel_getUid("pathComponents"), function(self, _cmd)
{ with(self)
{
    var result = split('/');
    if (result[0] === "")
        result[0] = "/";
    if (result[result.length - 1] === "")
        result.pop();
    return result;
}
}), new objj_method(sel_getUid("pathExtension"), function(self, _cmd)
{ with(self)
{
    return substr(lastIndexOf('.') + 1);
}
}), new objj_method(sel_getUid("lastPathComponent"), function(self, _cmd)
{ with(self)
{
    var components = objj_msgSend(self, "pathComponents");
    return components[components.length -1];
}
}), new objj_method(sel_getUid("stringByDeletingLastPathComponent"), function(self, _cmd)
{ with(self)
{
    var path = self,
        start = length - 1;
    while (path.charAt(start) === '/')
        start--;
    path = path.substr(0, path.lastIndexOf('/', start));
    if (path === "" && charAt(0) === '/')
        return '/';
    return path;
}
}), new objj_method(sel_getUid("stringByStandardizingPath"), function(self, _cmd)
{ with(self)
{
    return objj_standardize_path(self);
}
}), new objj_method(sel_getUid("copy"), function(self, _cmd)
{ with(self)
{
    return new String(self);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function(self, _cmd)
{ with(self)
{
    return new String;
}
}), new objj_method(sel_getUid("string"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
}), new objj_method(sel_getUid("stringWithHash:"), function(self, _cmd, aHash)
{ with(self)
{
    var hashString = parseInt(aHash, 10).toString(16);
    return "000000".substring(0, MAX(6-hashString.length, 0)) + hashString;
}
}), new objj_method(sel_getUid("stringWithString:"), function(self, _cmd, aString)
{ with(self)
{
    if (!aString)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "stringWithString: the string can't be 'nil'");
    return objj_msgSend(objj_msgSend(self, "alloc"), "initWithString:", aString);
}
}), new objj_method(sel_getUid("stringWithFormat:"), function(self, _cmd, format)
{ with(self)
{
    if (!format)
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "initWithFormat: the format can't be 'nil'");
    return sprintf.apply(this, Array.prototype.slice.call(arguments, 2));
}
})]);
}
{
var the_class = objj_getClass("CPString")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPString\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("objectFromJSON"), function(self, _cmd)
{ with(self)
{
    return CPJSObjectCreateWithJSON(self);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("JSONFromObject:"), function(self, _cmd, anObject)
{ with(self)
{
    return CPJSObjectCreateJSON(anObject);
}
})]);
}
{
var the_class = objj_getClass("CPString")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPString\""));
var meta_class = the_class.isa;class_addMethods(meta_class, [new objj_method(sel_getUid("UUID"), function(self, _cmd)
{ with(self)
{
    var g = "";
    for(var i = 0; i < 32; i++)
        g += FLOOR(RAND() * 0xF).toString(0xF);
    return g;
}
})]);
}
String.prototype.isa = CPString;

