import coll.broadphase.Broadphase;
import coll.dispatch.CollConf;
import coll.narrowphase.ManifoldPoint;
import coll.narrowphase.PersistentManifold;

class TestBulletOnly extends Unit
{
	var collCfg : CollConf;
	//var collDispatch : CollDispatch;
	var broadphase : Broadphase;
	/*
	var constraintSolver : ConstraintSolver;
	var discreteDynWorld : World;
	var collShape : BodyShape;
	var rigidBody : RigidBody;
	var dfltMotionState : MotionState;
	*/
	public function new() 
	{
		var _ : ManifoldPoint;
		var _ : PersistentManifold;
		
		super(BulletOnly);
		
		tests( [
			testKinematicVelocity0,
		]);
	}
	
	public override function setUp()
	{
		//broadphase = new DbvtBroadphase();
		
		//collCfg = new coll.dispatch.DfltCollConf();
		/*
		collDispatch = new CollDispatcher( collCfg );
		
		constraintSolver = new SequentialImpulseConstraintSolver();
		world = new DiscreteDynamicsWorld( collDispatch, broadphase, constraintSolver, collCfg );
		world->setGravity( new Vec3( 0, -9.81, 0 ));
		*/
	}
	
	public override function tearDown()
	{
		
	}
	
	public function testKinematicVelocity0()
	{
		
	}
}