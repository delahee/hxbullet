package coll.broadphase;

/**
 * ...
 * @author 
 */

class OverlappingPairCallback 
{
	public function destroy()
	{
		
	}
	
	function addOverlappingPair( proxy0:BroadphaseProxy,proxy1:BroadphaseProxy) : BroadphasePair return Assert.impl()
	function removeOverlappingPair( proxy0: BroadphaseProxy,proxy1: BroadphaseProxy,dispatcher:Dispatcher)  : Dynamic return Assert.impl()
	function removeOverlappingPairsContainingProxy(proxy0:BroadphaseProxy,dispatcher:Dispatcher) Assert.impl

}