/*
Copyright (c) 2003-2006 Gino van den Bergen / Erwin Coumans  http://continuousphysics.com/Bullet/

This software is provided 'as-is', without any express or implied warranty.
In no event will the authors be held liable for any damages arising from the use of this software.
Permission is granted to anyone to use this software for any purpose, 
including commercial applications, and to alter it and redistribute it freely, 
subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation would be appreciated but is not required.
2. Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.
3. This notice may not be removed or altered from any source distribution.

ported from bullet physics http://bullet.googlecode.com/svn/tags/bullet-2.81 to haxe by David Elahee
*/

package linMath;

class Vec3 extends QuadFloat
{
	//public inline function new(x=0,y=0,z=0)
	//	super(x, y, z)
	
	public inline  function opIncr(v:Vec3)
	{
		x += v.x;  y += v.y; z += v.z;
		return this;
	}
	
	public inline  function opDecr(v:Vec3)
	{
		x -= v.x;  y -= v.y; z -= v.z;
		return this;
	}
	
	public inline function opScale(v)
	{
		x *= v; y *= v; z *= v;
		return this;
	}
	
	public inline function opDiv(v)
	{
		
	}
}