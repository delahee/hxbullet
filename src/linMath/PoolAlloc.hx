package linMath;

class PoolAlloc<T>
{
	var maxElements : Int;
	var freeCount : Int;
	var pool : List<T>;
	var create:Void->T;
	
	var sig : Int;
	public function new(maxElements:Int, create:Void->T) 
	{
		this.create = create;
		this.maxElements = maxElements;
		freeCount = maxElements;
		pool = new List();
		for( i in  0...maxElements)
			pool.push( create() );
		sig = Std.random(13371337);
	}
	
	public function destroy()
	{
		pool = null;
	}
	
	public inline function getFreeCount() 	return pool.length
	public inline function getUsedCount() 	return maxElements - pool.length
	public inline function getMaxCount() 	return maxElements
	
	//size is ommitted because it is meant for sub meme splitting which we do not support
	function allocate() : T
	{
		var r = pool.pop();
		Reflect.setField(r, "__pool_sig", sig);
		return r;
	}

	function isValid( t : T )		return t!=null && Reflect.field(t, "__pool_sig") == sig
	function freeMemory(t : T)
		pool.add(t)
	
}