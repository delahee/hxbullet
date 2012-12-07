
package linMath;

class Mtx33
{
	var el:Array<Vec3>;
	public function new(v0:Vec3,v1:Vec3,v2:Vec3)
	{
		el = [ v0, v1, v2 ];
	}
}