import linMath.Vec3;




enum CollisionFilterGroups
{
	DefaultFilter,
	StaticFilter,
	KinematicFilter,
	DebrisFilter,
	SensorTrigger,
	CharacterFilter,//all bits sets: DefaultFilter | StaticFilter | KinematicFilter | DebrisFilter | SensorTrigger
};

class BroadphaseProxy
{
	var clientObject : Dynamic;
	var aaabbMin:Vec3;
	var aabbMax:Vec3;
	
	var collisionFilterGroup : haxe.EnumFlags<CollisionFilterGroups>;
	var collisionFilterMask : Int;
	var multiSapParentProxy : Dynamic;
	
	public function new( aabbMin:Vec3, aabbMax:Vec3, userData:Dynamic, collFilterGroup : haxe.EnumFlags<CollisionFilterGroups>,
	collFilterMask,?multiSapParentProxy)
	)
	{
		this.aaabbMin = aabbMin.clone();
		this.aabbMax = aabbMax.clone();
		clientObject = userData;
		collFilterGroup = collFilterGroup;
		collFilterMask = collFilterMask;
		this.multiSapParentProxy  = multiSapParentProxy ;
	}
	
	static inline function isPolyhedral(int proxyType)
		return (proxyType  < IMPLICIT_CONVEX_SHAPES_START_HERE)

	static inline function isConvex(int proxyType)
		return (proxyType < CONCAVE_SHAPES_START_HERE)
		
	static inline function isNonMoving(proxyType)
		return (isConcave(proxyType) && !(proxyType==GIMPACT_SHAPE_PROXYTYPE))

	static inline function isConcave(proxyType)
		return ((proxyType > CONCAVE_SHAPES_START_HERE) &&
			(proxyType < CONCAVE_SHAPES_END_HERE))
			
	static inline function isCompound(proxyType)
		return proxyType == COMPOUND_SHAPE_PROXYTYPE

	static inline function isSoftBody(proxyType)
		return proxyType == SOFTBODY_SHAPE_PROXYTYPE

	static inline function isInfinite(proxyType)
		return proxyType == STATIC_PLANE_PROXYTYPE

	static inline function  isConvex2d(proxyType)
		return (proxyType == BOX_2D_SHAPE_PROXYTYPE) ||	(proxyType == CONVEX_2D_SHAPE_PROXYTYPE);

}



