package linMath;

/**
 * ...
 * @author 
 */

class Transform 
{
	var basis : Mtx33;
	var origin : Vec3;
	
	inline function new(){}

	public static inline function fromQuat(q:Quat, ?c:Vec3) 
	{
		if (c == null) c = Vec3.ZERO;
		var r = new Transform();
		r.basis = Mtx33.fromQuat( q );
		r.origin = c.clone();
		return r;
	}
	
	public static inline function fromMatrix( m :Mtx33, ?c:Vec3 )
	{
		if ( c == null) c = Vec3.ZERO;
		var r = new Transform();
		r.basis = m.clone();
		r.origin = c.clone();
		return r;
	}
	
	public function clone()
	{
		var r = new Transform();
		r.basis = basis.clone();
		r.origin = origin.clone();
		return r;
	}
	
}


