/*
Copyright (c) 2003-2006 Gino van den Bergen / Erwin Coumans  http://continuousphysics.com/Bullet/
Haxe Port Copyright (c) 2012 David Elahee 

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

package coll.broadphase;
import linMath.Vec3;

//todo shapetype real type
//multisap proxy real type

class Dispatcher{}
class BroadphaseProxy { }
class OverlappingPairCache { }

class Broadphase 
{
	function destroy() Assert.impl()
	
	function createProxy( aabbMin : Vec3, aaabbMax : Vec3, shapeType : Int, data:Dynamic, 
	collisionFilterGroup : Int,
	collisionfilterMask : Int,
	dispatcher : Dispatcher,
	multiSapProxy : Dynamic
	) : BroadphaseProxy
		return Assert.impl()
	
	function destroyProxy(proxy:BroadphaseProxy, dispatcher:Dispatcher)								Assert.impl()
	function setAabb(proxy:BroadphaseProxy, aabbMin : Vec3, aaabbMax : Vec3, dispatcher:Dispatcher)	Assert.impl()
	function getAabb(proxy:BroadphaseProxy, aabbMin : Vec3, aaabbMax : Vec3)						Assert.impl()
	
	function rayTest(rayFrom:Vec3, rayTo:Vec3, rayCallback : Dynamic->Dynamic, aabbMin:Vec3 /*defaults to vec0*/, aabbMax:Vec3 /*defaults to vec0*/)
																									Assert.impl()
	function aabbTest(aabbMin : Vec3, aaabbMax : Vec3, cbk : Dynamic->Dynamic)						Assert.impl()
	function calculateOverlappingPairs( dispatcher : Dispatcher)									Assert.impl()
	function getOverlappingPairCache() : OverlappingPairCache										return Assert.impl()

	function getBroadphaseAabb(aabbMin: Vec3, aabbMax : Vec3)										Assert.impl()
	function resetPool( dispatcher )																{/*do nothing*/}
	
	function printStats()																			Assert.impl()
}