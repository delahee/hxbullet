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
		return v == true
		
	public static function isFalse(v)
		return v == false
	
	public static function nz(v)
	{
		if ( v == 0.0) 
			throw "assert_nz";
	}
}