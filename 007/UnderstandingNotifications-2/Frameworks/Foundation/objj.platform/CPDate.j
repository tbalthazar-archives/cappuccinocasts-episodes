i;10;CPObject.ji;10;CPString.jc;4092;
var CPDateReferenceDate = new Date(Date.UTC(2001,1,1,0,0,0,0));
{var the_class = objj_allocateClassPair(CPObject, "CPDate"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("initWithTimeIntervalSinceNow:"), function(self, _cmd, seconds)
{ with(self)
{
    self = new Date((new Date()).getTime() + seconds * 1000);
    return self;
}
}), new objj_method(sel_getUid("initWithTimeIntervalSince1970:"), function(self, _cmd, seconds)
{ with(self)
{
    self = new Date(seconds * 1000);
    return self;
}
}), new objj_method(sel_getUid("initWithTimeIntervalSinceReferenceDate:"), function(self, _cmd, seconds)
{ with(self)
{
    self = objj_msgSend(self, "initWithTimeInterval:sinceDate:", seconds, CPDateReferenceDate);
    return self;
}
}), new objj_method(sel_getUid("initWithTimeInterval:sinceDate:"), function(self, _cmd, seconds, refDate)
{ with(self)
{
    self = new Date(refDate.getTime() + seconds * 1000);
    return self;
}
}), new objj_method(sel_getUid("initWithString:"), function(self, _cmd, description)
{ with(self)
{
    self = new Date(description);
    return self;
}
}), new objj_method(sel_getUid("timeIntervalSinceDate:"), function(self, _cmd, anotherDate)
{ with(self)
{
    return (self.getTime() - anotherDate.getTime()) / 1000.0;
}
}), new objj_method(sel_getUid("timeIntervalSinceNow"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "timeIntervalSinceDate:", objj_msgSend(CPDate, "date"));
}
}), new objj_method(sel_getUid("timeIntervalSince1970"), function(self, _cmd)
{ with(self)
{
    return self.getTime() / 1000.0;
}
}), new objj_method(sel_getUid("timeIntervalSinceReferenceDate"), function(self, _cmd)
{ with(self)
{
    return (self.getTime() - CPDateReferenceDate.getTime()) / 1000.0;
}
}), new objj_method(sel_getUid("isEqualToDate:"), function(self, _cmd, anotherDate)
{ with(self)
{
    return !(self < anotherDate || self > anotherDate);
}
}), new objj_method(sel_getUid("compare:"), function(self, _cmd, anotherDate)
{ with(self)
{
    return (self > anotherDate) ? CPOrderedDescending : ((self < anotherDate) ? CPOrderedAscending : CPOrderedSame);
}
}), new objj_method(sel_getUid("earlierDate:"), function(self, _cmd, anotherDate)
{ with(self)
{
    return (self < anotherDate) ? self : anotherDate;
}
}), new objj_method(sel_getUid("laterDate:"), function(self, _cmd, anotherDate)
{ with(self)
{
    return (self > anotherDate) ? self : anotherDate;
}
}), new objj_method(sel_getUid("description"), function(self, _cmd)
{ with(self)
{
    return self.toString();
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("alloc"), function(self, _cmd)
{ with(self)
{
    return new Date;
}
}), new objj_method(sel_getUid("date"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "alloc"), "init");
}
}), new objj_method(sel_getUid("dateWithTimeIntervalSinceNow:"), function(self, _cmd, seconds)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPDate, "alloc"), "initWithTimeIntervalSinceNow:", seconds);
}
}), new objj_method(sel_getUid("dateWithTimeIntervalSince1970:"), function(self, _cmd, seconds)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPDate, "alloc"), "initWithTimeIntervalSince1970:", seconds);
}
}), new objj_method(sel_getUid("dateWithTimeIntervalSinceReferenceDate:"), function(self, _cmd, seconds)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPDate, "alloc"), "initWithTimeIntervalSinceReferenceDate:", seconds);
}
}), new objj_method(sel_getUid("distantPast"), function(self, _cmd)
{ with(self)
{
    return new Date(-10000,1,1,0,0,0,0);
}
}), new objj_method(sel_getUid("distantFuture"), function(self, _cmd)
{ with(self)
{
    return new Date(10000,1,1,0,0,0,0);
}
}), new objj_method(sel_getUid("timeIntervalSinceReferenceDate"), function(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(CPDate, "date"), "timeIntervalSinceReferenceDate");
}
})]);
}
Date.prototype.isa = CPDate;

