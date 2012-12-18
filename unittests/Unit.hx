import UnitTest;

class Unit 
{
	var pass:UnitTestPass;
	
	public function new(v)
	{
		pass = v;
		var f = UnitTest.listener.get(Type.enumIndex(pass));
		if (f == null) UnitTest.listener.set(Type.enumIndex(pass), { total:0, failed:0,fails:new List() } );
	}
	
	public function setUp() { }
	public function tearDown() { }

	function test( p : Void->Void ) {
		var done = false;
		try {
			p();
			done = true;
		}
		catch(d:Dynamic)
		{
			var f = UnitTest.listener.get(Type.enumIndex(pass));
			f.total++;
			f.failed++;
			f.fails.push( haxe.Stack.exceptionStack() );
			done = false;
			trace("test of " + Type.typeof(this)+"#"+f.total+" failed");
		}
		
		if (done)
		{
			var f = UnitTest.listener.get(Type.enumIndex(pass));
			f.total++;
			trace("test of " + Type.typeof(this)+"#"+f.total+" successful");
		}
		
	}
	
	public function tests( p : Array < Void->Void > )
	{
		setUp();
		for (p in p)
			test(p);
		tearDown();
	}
}