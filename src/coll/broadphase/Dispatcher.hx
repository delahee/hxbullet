package coll.broadphase.Dispatcher;

import haxe.Public;
import linMath.Vec3;

enum DISPATCH_FUNC
{
	DISPATCH_NULL;
	DISPATCH_DISCRETE;
	DISPATCH_CONTINUOUS;
}

class DispatcherInfo implements Public
{
	var timeStep = 0.0;
	var stepCount = 0;
	var dispatchFunc = DISPATCH_DISCRETE;
	var timeOfImpact = 1.0;
	var useContinuous = true;
	var debugDraw : IDebugDraw = null;
	var enableSatConvex = false;
	//var enable spu;
	var allowedCcdPenetration = 0.04;
	var useConvexConservativeDistanceUntil = false;
}

class CollisionObjectWrapper { };
class PersitentManifold { };
class CollisionObject;
typedef CollisionAlgorithm = Dynamic;

class Dispatcher
{
	function destroy()
	{
		
	}
	
	function findAlgortithm( body0Wrap : CollisionObjectWrapper, 
	body1Wrap :  CollisionObjectWrapper, persistentManifold:PersistentManifold,
	)
	{
		Assert.brk("implement me");
	}
	
	function getNewManifold(b0 : CollisionObject,b1 : CollisionObject): PersistentManifold 
		return Assert.brk("implement me")

	function releaseManifold(manifold:PersistentManifold) 	: Void 	Assert.impl()
	function clearManifold(manifold:PersistentManifold) 	: Void 	Assert.impl()
	
	function needsCollision(body0:CollisionObject,body1:CollisionObject) : Bool 	return Assert.impl()
	function needsResponse(body0::CollisionObject,body1::CollisionObject) : Bool 	return Assert.impl()

	function dispatchAllCollisionPairs( pairCache : OverlappingPairCache, dispatchInfo : DispatcherInfo, dispatcher : Dispatcher )	Assert.impl()

	function getNumManifolds() : Int 												return Assert.impl()
	function getManifoldByIndexInternal(index:Int) : PersistentManifold				return Assert.impl()
	function getInternalManifoldPointer() : Array<PersistentManifold>				return Assert.impl()
	function getInternalManifoldPool() : Pool<PersistentManifold>			return Assert.impl()

	function allocateCollisionAlgorithm(var size : Int):CollisionAlgorithm 	return Assert.impl()
	function freeCollisionAlgorithm(ptr:CollisionAlgorithm) 				Assert.impl();	
}


