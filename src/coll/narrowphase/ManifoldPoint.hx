package coll.narrowphase;
import linMath.Vec3;

/**
 * ...
 * @author 
 */

class ManifoldPoint 
{
	var userPersistentData : Dynamic = null;
	var lateralFrictionInitializer = false;
	var appliedImpulse = 0.0; 
	var appliedImpulseLateral1 = 0.0;
	var appliedImpulseLateral2 = 0.0;
	var contactMotion1 = 0.0;
	var contactMotion2 = 0.0;
	var contactCFM1 = 0.0;
	var contactCFM2 = 0.0;
	public var lifeTime(default,null) = 0;//lifetime of the contactpoint in frames
	
	var localPointA : Vec3;
	var localPointB : Vec3;
	var normalWorldOnB : Vec3;
	var distance1 = 0.0;
	
	var combinedFriction = 0.0;
	var combinedRollingFriction = 0.0;
	var combinedRestitution = 0.0;
	
	public var positionWorldOnB(default,null) : Vec3;
	public var positionWorldOnA(default,null) : Vec3;
	var lateralFrictionDir1: Vec3;
	var lateralFrictionDir2: Vec3;
	
	//BP mod, store contact triangles.
	var m_partId0:Int;
	var m_partId1:Int;
	var m_index0:Int;
	var m_index1:Int;
			
	public function new() 
	{
		localPointA = new Vec3();
		localPointB = new Vec3();
		normalWorldOnB = new Vec3();
		positionWorldOnA = new Vec3();
		positionWorldOnB = new Vec3();
		lateralFrictionDir1 = new Vec3();
		lateralFrictionDir2 = new Vec3();
	}
	
	public function fromVectors( pa:Vec3, pb:Vec3, normal:Vec3, dist:Float)
	{
		var n = new ManifoldPoint();
		n.localPointA.copy( pa );
		n.localPointB.copy( pb );
		n.normalWorldOnB.copy( normal );
		
		n.distance1 = dist;
	
		n.combinedFriction = 0.;
		n.combinedRollingFriction = 0.;
		n.combinedRestitution = 0.;
					
		return n;
	}
	
	public inline function getDistance() return distance1
	public inline function setDistance(s) return distance1=s
	public inline function getImpulse() return appliedImpulse
}