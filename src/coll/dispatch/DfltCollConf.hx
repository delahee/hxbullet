package coll.dispatch;
import coll.narrowphase.PersistentManifold;
import linMath.PoolAlloc;
import coll.broadphase.BroadphaseNativeTypes;

/**
 * ...
 * @author 
 */

class DfltCollisionConfiguration extends coll.dispatch.CollConf
{
	var persistentManifoldPool : PoolAlloc<PersistentManifold>;
	var collisionAlgorithmPool : PoolAlloc<CollAlgo>;
	
	public function new() 
	{
		persistentManifoldPool = new PoolAlloc( function() return PersistentManifold());
		collAlgoPool = new PoolAlloc( function() return CollAlgo());
	}
	
	public override function getPersistentManifoldPool() return persistentManifoldPool
	public override function getCollisionAlgorithmPool() return collAlgoPool
	
	public override function getCollisionAlgortihmCreateFunc( 
		proxyType0: BroadphaseNativeTypes, 
		proxyType1 : BroadphaseNativeTypes ) : CollisionAlgorithmCreateFunc
	{
		if ((proxyType0 == SPHERE_SHAPE_PROXYTYPE) && (proxyType1==SPHERE_SHAPE_PROXYTYPE))
			return	m_sphereSphereCF;
			
		if ((proxyType0 == SPHERE_SHAPE_PROXYTYPE ) && (proxyType1==TRIANGLE_SHAPE_PROXYTYPE))
			return	m_sphereTriangleCF;

		if ((proxyType0 == TRIANGLE_SHAPE_PROXYTYPE  ) && (proxyType1==SPHERE_SHAPE_PROXYTYPE))
			return	m_triangleSphereCF;

		if ((proxyType0 == BOX_SHAPE_PROXYTYPE) && (proxyType1 == BOX_SHAPE_PROXYTYPE))
			return m_boxBoxCF;
		
		if (BroadphaseProxy.isConvex(proxyType0) && (proxyType1 == STATIC_PLANE_PROXYTYPE))
			return m_convexPlaneCF;

		if (BroadphaseProxy.isConvex(proxyType1) && (proxyType0 == STATIC_PLANE_PROXYTYPE))
			return m_planeConvexCF;

		if (BroadphaseProxy.isConvex(proxyType0) && BroadphaseProxy.isConvex(proxyType1))
			return m_convexConvexCreateFunc;

		if (BroadphaseProxy.isConvex(proxyType0) && BroadphaseProxy.isConcave(proxyType1))
			return m_convexConcaveCreateFunc;

		if (BroadphaseProxy.isConvex(proxyType1) && BroadphaseProxy.isConcave(proxyType0))
			return m_swappedConvexConcaveCreateFunc;

		if (BroadphaseProxy.isCompound(proxyType0))
			return m_compoundCreateFunc;
		else
			if (BroadphaseProxy.isCompound(proxyType1))
				return m_swappedCompoundCreateFunc;
				
		//failed to find an algorithm
		return m_emptyCreateFunc;
	}
		
		
	
	
}