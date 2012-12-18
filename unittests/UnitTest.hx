package ;

/**
 * ...
 * @author de
 */

import haxe.Stack;
typedef Callstack = Array<haxe.Stack.StackItem>;

enum UnitTestPass
{
	LinMath;
	BulletOnly;
}

typedef TestFrame = { total:Int, failed:Int, fails:List<Callstack> };

class UnitTest 
{
	public static var listener : IntHash<TestFrame> = new IntHash();
	
	public function new() 
	{
		listener = new IntHash();
	}
	
	public static function main()
	{
		new TestLinMath();
		new TestBulletOnly();
	}
	
}