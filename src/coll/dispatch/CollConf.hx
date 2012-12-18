package coll.dispatch;

import linMath.PoolAlloc;
import coll.narrowphase.PersistentManifold;
import coll.broadphase.BroadphaseNativeTypes;
class CollisionAlgorithmCreateFunc { }
class CollAlgo {}

interface CollConf 
{
	function getPersistentManifoldPool() : PoolAlloc<PersistentManifold>;
	function getCollisionAlgorithmPool() :  PoolAlloc<CollAlgo>;
	function getCollisionAlgortihmCreateFunc( proxyType0: BroadphaseNativeTypes, proxyType1 : BroadphaseNativeTypes ) : CollisionAlgorithmCreateFunc;
	
}