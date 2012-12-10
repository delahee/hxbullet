import linMath.Vec3;

class TestLinMath extends Unit
{
	static var penetrationDirections : Array<Vec3> = 
	[/*
		new Vec3( 0.000000	 	,-0.000000 	,-1.000000 ),
		new Vec3( 0.723608	 	,-0.525725 	,-0.447219 ),
		new Vec3( -0.276388  	,-0.850649 	,-0.447219 ),
		new Vec3( -0.894426 	,-0.000000 ,-0.447216) ,
		new Vec3( -0.276388  	,0.850649 	,-0.447220 ),
		new Vec3( 0.723608  	,0.525725 	,-0.447219 ),
		new Vec3( 0.276388  	,-0.850649 	,0.447220) ,
		new Vec3( -0.723608  	,-0.525725 	,0.447219) ,
		new Vec3( -0.723608  	,0.525725 	,0.447219) ,
		new Vec3( 0.276388  	,0.850649 	,0.447219) ,
		new Vec3( 0.894426  	,0.000000 	,0.447216) ,
		new Vec3( -0.000000  	,0.000000 	,1.000000) ,
		new Vec3( 0.425323  	,-0.309011 	,-0.850654) ,
		new Vec3( -0.162456  	,-0.499995 	,-0.850654) ,
		new Vec3( 0.262869  	,-0.809012 	,-0.525738) ,
		new Vec3( 0.425323  	,0.309011 	,-0.850654) ,
		new Vec3( 0.850648  	,-0.000000 	,-0.525736) ,
		new Vec3( -0.525730 	,-0.000000 	,-0.850652) ,
		new Vec3( -0.688190 	,-0.499997 	,-0.525736) ,
		new Vec3( -0.162456 	,0.499995 	,-0.850654) ,
		new Vec3( -0.688190 	,0.499997 	,-0.525736) ,
		new Vec3( 0.262869 		 (0.809012 	,-0.525738) ,
		new Vec3( 0.951058 		,0.309013 	,0.000000) ,
		new Vec3( 0.951058 		,-0.309013 	,0.000000) ,
		new Vec3( 0.587786 		,-0.809017 	,0.000000) ,
		new Vec3( 0.000000 		,-1.000000 	,0.000000) ,
		new Vec3( -0.587786 	,-0.809017 	,0.000000) ,
		new Vec3( -0.951058 	,-0.309013 	,-0.000000) ,
		new Vec3( -0.951058 	,0.309013 	,-0.000000) ,
		new Vec3( -0.587786 	,0.809017 	,-0.000000) ,
		new Vec3( -0.000000 	,1.000000 	,-0.000000) ,
		new Vec3( 0.587786  	,0.809017 	,-0.000000) ,
		new Vec3( 0.688190  	,-0.499997 	,0.525736) ,
		new Vec3( -0.262869 	,-0.809012 	,0.525738) ,
		new Vec3( -0.850648 	,0.000000 	,0.525736) ,
		new Vec3( -0.262869 	,0.809012 	,0.525738) ,
		new Vec3( 0.688190  	,0.499997 	,0.525736) ,
		new Vec3( 0.525730  	,0.000000 	,0.850652) ,
		new Vec3( 0.162456  	,-0.499995 	,0.850654) ,
		new Vec3( -0.425323 	,-0.309011 	,0.850654) ,
		new Vec3( -0.425323 	,0.309011 	,0.850654) ,
		new Vec3( 0.162456  	,0.499995 	,0.850654) */
	];
	
	public function new() 
	{
		super(LinMath);
		tests( [
			testNormalize,
			//testQuicksorta,
			//testQuaternionGetAxisAngle,
		]);
	}
	
	//= new Vec3
	function testNormalize()
	{
		var xaxis= new Vec3(1,0,0);
		var yaxis= new Vec3(0,1,0);
		var zaxis = new Vec3(0, 0, 1);
		
		var negxaxis= new Vec3(-1,0,0);
		var negyaxis= new Vec3(0,-1,0);
		var negzaxis= new Vec3(0,0,-1);

		var vec = new Vec3();
		
		vec.setValue(1e-20,0,0);
		vec.safeNormalize();
		Assert.doublesEqual( 1.0, vec.length2(), 1e-6 );

		vec.setValue(1e20,0,0);
		vec.safeNormalize();
		Assert.doublesEqual( 1.0, vec.length2(), 1e-6 );

		vec.setValue(1e19,0,0);
		vec.normalize();
		Assert.doublesEqual( 1.0, vec.length2(), 1e-5 );
	}
	
	function testQuaternionGetAxisAngle()
	{
		var steps = 100;
		
		for ( axis in penetrationDirections)
		{
			var  i = -steps + 1;
			while (i < steps)
			{
				var angle = Math.PI * 2 / steps;
				var quat = linMath.Quat.fromAxisAngle(axis, angle);
				
				var compAngle = quat.getAngle();
				
				if ( i >= 0)
				{
					Assert.doublesEqual(angle, compAngle, 1e-5);
				}
				else
				{
					Assert.doublesEqual(Math.abs(angle), Math.abs(compAngle), 1e-5);
				}
				
				var compAxis = quat.getAxis();
				
				if ( compAxis > Cst.SIMD_EPSILON)
				{
					if (i >= 0)
					{
						Assert.doublesEqual(axis.x, compAxis.x, 1e-4);
						Assert.doublesEqual(axis.y, compAxis.y, 1e-4);
						Assert.doublesEqual(axis.z, compAxis.z, 1e-4);
					}else
					{
						var sign = compAngle * angle < 0? -1:1;
						Assert.doublesEqual(sign*axis.x, compAxis.x, 1e-4);
						Assert.doublesEqual(sign*axis.y, compAxis.y, 1e-4);
						Assert.doublesEqual(sign*axis.z, compAxis.z, 1e-4);
					}
				}
				else
				{
					Assert.doublesEqual(1.0, compAxis.x, 1e-4);
					Assert.doublesEqual(0.0, compAxis.y, 1e-4);
					Assert.doublesEqual(0.0, compAxis.z, 1e-4);
				}
				
				i++;
			}
		}
	}
}