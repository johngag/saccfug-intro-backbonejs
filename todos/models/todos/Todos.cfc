component accessors="true"
{
	property name="id" type="string";
	property name="done" type="string";
	property name="ordernum" type="string";
	property name="text" type="string";
	
	public todos function init(string id="", string done="", string ordernum="", string text="")
	{
		setid(arguments.id);
		setdone(arguments.done);
		setordernum(arguments.ordernum);
		settext(arguments.text);
	
		return this;
	}
}