package coll.narrowphase;

typedef ContactDestroyedCallback = Dynamic -> Bool;
typedef ContactProcessedCallback = ManifoldPoint -> Dynamic -> Dynamic -> Bool;
	
enum ContactManifoldTypes
{
	MIN_CONTACT_MANIFOLD_TYPE;
	BT_PERSISTENT_MANIFOLD_TYPE;
}


///btPersistentManifold is a contact point cache, it stays persistent as long as objects are overlapping in the broadphase.
///Those contact points are created by the collision narrow phase.
///The cache can be empty, or hold 1,2,3 or 4 points. Some collision algorithms (GJK) might only add one point at a time.
///updates/refreshes old contact points, and throw them away if necessary (distance becomes too large)
///reduces the cache to 4 points, when more then 4 points are added, using following rules:
///the contact point with deepest penetration is always kept, and it tries to maximuze the area covered by the points
///note that some pairs of objects might have more then one contact manifold.
class PersistentManifold 
{
	static inline var MANIFOLD_CACHE_SIZE = 4;
	static var gContactBreakingThreshold : Float;
	static var gContactDestroyedCallback : ContactDestroyedCallback;
	static var gContactProcessedCallback : ContactProcessedCallback;

	public function new() 
	{
		
	}
	
}










