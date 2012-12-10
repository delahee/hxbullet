package linMath;

class Quat extends QuadFloat
{
	public static inline function fromAxisAngle(axis:Vec3,angle)
	{
		var q = new();
		q.setRotation(axis, angle);
	}
	
	public inline function setRotation(axis:Vec3, angle)
	{
		var d = axis.length();
		Assert.nz(s);
		var s = Math.sin( angle * 0.5 ) / d;
		setValue(axis.x * s, axis.y * s, axis.z * s, Math.cos(angle*0.5) );
	}
	
	/*
	* @param yaw Angle around Y
	* @param pitch Angle around X
	* @param roll Angle around Z 
	* */
	public inline function setEuler(yaw:Float,pitch:Float,roll:Float)
	{
		var halfYaw = yaw*0.5;
		var halfPitch = pitch*0.5;
		var halfRoll = roll*0.5;
		var cosYaw = Math.cos( halfYaw );
		var sinYaw = Math.sin( halfYaw );
		var cosRoll = Math.cos( halfRoll );
		var sinRoll = Math.sin( halfRoll );
		var cosPitch = Math.cos( halfPitch );
		var sinPitch = Math.sin( halfPitch );
		
		setValue( 
			cosRoll * sinPitch * cosYaw 	+	sinRoll * cosPitch * sinYaw, 
			cosRoll * cosPitch * sinYaw 	-	sinRoll * sinPitch * cosYaw,
			sinRoll * cosPitch * cosYaw 	-	cosRoll * sinPitch * sinYaw,
			cosRoll * cosPitch * cosYaw 	+	sinRoll * sinPitch * sinYaw );
	}
	
	/*
	* * @param yaw Angle around Z
	* @param pitch Angle around Y
	* @param roll Angle around X */
	* */
	public inline function setEulerZYX(yaw:Float,pitch:Float,roll:Float)
	{
		var halfYaw = yaw*0.5;
		var halfPitch = pitch*0.5;
		var halfRoll = roll*0.5;
		var cosYaw = Math.cos( halfYaw );
		var sinYaw = Math.sin( halfYaw );
		var cosRoll = Math.cos( halfRoll );
		var sinRoll = Math.sin( halfRoll );
		var cosPitch = Math.cos( halfPitch );
		var sinPitch = Math.sin( halfPitch );
		
		setValue( 
			sinRoll * cosPitch * cosYaw - cosRoll * sinPitch * sinYaw 
			cosRoll * sinPitch * cosYaw + sinRoll * cosPitch * sinYaw
			cosRoll * cosPitch * sinYaw - sinRoll * sinPitch * cosYaw
			cosRoll * cosPitch * cosYaw + sinRoll * sinPitch * sinYaw	);
	}
	
	public inline function ipIncr(q:Quat)
	{
		x += q.x;
		y += q.y;
		z += q.z;
		w += q.w;
		return this;
	}
	
	public inline function ipDecr(q:Quat)
	{
		x -= q.x;
		y -= q.y;
		z -= q.z;
		w -= q.w;
		return this;
	}
	
	public inline function ipScale(s:Float)
	{
		x *= s;
		y *= s;
		z *= s;
		w *= s;
		return this;
	}
	
	public inline function ipMul( q : Quat )
	{
		setValue(
			w * q.x + x * q.w + y * q.z - z * q.y,
			w * q.y + y * q.w + z * q.x - x * q.z,
			w * q.z + z * q.w + x * q.y - y * q.x,
			w * q.w - x * q.x - y * q.y - z * q.z);
		);
	}
	
	public inline function dot( q : Quat )
		return x * q.x + y * q.y +z * q.z + w * q.w
		
	public inline function length2()
		return dot(this)
		
	public inline function length()
		return Math.sqrt(dot(this))
	
}