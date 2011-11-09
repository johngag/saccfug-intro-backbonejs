component accessors="true"
{
	property name="id" type="string";
	property name="description" type="string";
	property name="price" type="string";
	
	public todos function init(string id="", string description="", string price="")
	{
		setid(arguments.id);
		setdescription(arguments.description);
		setprice(arguments.price);
	
		return this;
	}
}