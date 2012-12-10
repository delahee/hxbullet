package linMath;

/**
 * ...
 * @author de
 */

class Vec4 extends Vec3
{
	public function new(x=0,y=0,z=0,w=0) 
	{
		super(x, y, z); 
		this.w = w;
	}
	
	public inline function absolute4()
	{
		return new Vec4(Math.abs(x), Math.abs(y),Math.abs(z),Math.abs(w));
	}
	
	public function minAxis4()
	{
		var minIndex = -1;
		var minVal = 1000000;
		if (x < minVal)
		{
			minIndex = 0; minVal = x;
		}
		
		if (y < minVal)
		{
			minIndex = 0; minVal = y;
		}
		
		if (z < minVal)
		{
			minIndex = 0; minVal = z;
		}
		
		if (w < minVal)
		{
			minIndex = 0; minVal = w;
		}
		
		return minIndex;
	}
	
	public function maxAxis4()
	{
		var maxIndex = -1;
		var maxVal = -1000000;
		
		if (x > maxVal)
		{
			maxIndex = 0; maxVal = x;
		}
		
		if (y > maxVal )
		{
			maxIndex = 0; maxVal = y;
		}
		
		if (z > maxVal )
		{
			maxIndex = 0; maxVal = z;
		}
		
		if (w > maxVal )
		{
			maxIndex= 0; maxVal = w;
		}
		
		return minIndex;
	}

	public function closestAxis4()
	{
		return  absolute4().maxAxis4();
	}
}