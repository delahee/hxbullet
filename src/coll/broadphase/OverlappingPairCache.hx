package coll.broadphase;

typedef Array<BroadphasePair> = BroadphasePairArray;

class OverlapCallback
{
	public function destroy(){}
	public function processOverlap( pair : BroadphasePair ) : Bool return Assert.impl()
}

class OverlapFilterCallback
{
	public function destroy() { }
	function needBroadphaseCollision(proxy0:BroadphaseProxy,proxy1::BroadphaseProxy) : Bool return Assert.impl()
}

class OverlappingPairCache extends OverlappingPairCallback
{
	function getOverlappingPairArrayPtr() : Array<BroadphasePair>								return Assert.impl()
	function getOverlappingPairArray() : BroadphasePairArray 									return Assert.impl()

	function cleanOverlappingPair( pair : BroadphasePair,dispatcher:Dispatcher ) 				Assert.impl()
	function getNumOverlappingPairs() : Int														return Assert.impl()
	function cleanProxyFromPairs(proxy:BroadphaseProxy,dispatcher:Dispatcher)		 			Assert.impl()
	function setOverlapFilterCallback(cbk:OverlapFilterCallback) 								Assert.impl()
	function processAllOverlappingPairs(btOverlapCallback*,btDispatcher* dispatcher) 			Assert.impl()

	function findPair(proxy0:BroadphaseProxy, proxy1:BroadphaseProxy) : Null<BroadphasePair> 	return Assert.impl()
	function hasDeferredRemoval() : Bool														return Assert.impl()

	function setInternalGhostPairCallback(ghostPairCallback:OverlappingPairCallback)			Assert.impl()
	function sortOverlappingPairs(dispatcher:Dispatcher) 										Assert.impl()
}