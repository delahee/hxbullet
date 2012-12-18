package linMath;


class Scalar {
	public inline function sqrt(x) 	return Math.sqrt(x)
	public inline function cos(x) 	return Math.cos(x)
	public inline function sin(x) 	return Math.sin(x)
	public inline function tan(x) 	return Math.tan(x)
	
	public inline function asin(x)
	{
		if ( x < -1)
			x = -1;
		if ( x > 1 )
			x = 1;
		return Math.asin(x); 
	}
	
	public inline function acos(x)
	{
		if ( x < -1)
			x = -1;
		if ( x > 1 )
			x = 1;
		return Math.acos(x); 
	}
}