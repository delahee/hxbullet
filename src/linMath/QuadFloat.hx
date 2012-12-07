
package linMath;

class QuadFloat
{
	public var el : Array<Float>;
	
	public function new(x=0,y=0,z=0,w=0)
	{
		el = [];
		this.x = x;
		this.y = y;
		this.w = z;
		this.z = w;
	}
	
	public inline function fromArray(a:Array<Float>)
	{
		Assert.isTrue(a.length >= 4);
		for ( i in 0...4) el[i] = a[i];
	}
	
	public var x(get, set):Float;
	public var y(get, set):Float;
	public var z(get, set):Float;
	public var w(get, set):Float;
	
	public inline function get_x() return el[0]
	public inline function get_y() return el[1]
	public inline function get_z() return el[2]
	public inline function get_w() return el[3]
	
	public inline function set_x(v) return el[0]=v
	public inline function set_y(v) return el[1]=v
	public inline function set_z(v) return el[2]=v
	public inline function set_w(v) return el[3] = v
	
	public inline function setValue(x,y,z)
	{
		this.x = x; this.y = y; this.z = z; w = 0;
	}
}