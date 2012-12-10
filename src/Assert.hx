package ;

/**
 * ...
 * @author de
 */

class Assert
{
	public static function nn(v)
	{
		if ( v == null) throw "assert_nn";
	}
	
	public static function isTrue(v)
		if (!( v == true))
			throw "assert_isTrue"
		
	public static function isFalse(v)
	if (!( v == false))
			throw "assert_isFalse"
	
	public static inline function doublesEqual(v0, v1, d)
		floatsEqual(v0, v1, d)
		
	public static function floatsEqual(v0:Float, v1:Float, d:Float)
		isTrue(Math.abs(v0 - v1) <= d )
		
	//asserts value is not 0.0
	public static function nz(v)
	{
		if ( v == 0.0) 
			throw "assert_nz";
	}
}