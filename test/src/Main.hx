import flash.Lib;
import flash.display.*;

import test.T;

import Res;

class Main 
{
	public static var numPassedTest:Int = 0;
	public static var numFailedTest:Int = 0;
	public static var tests : Array<test.T> = [];
	
	public static function init():Res
	{
		trace('init ok');
		return SUCCESS;
	}
	
	static function main() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		
		var err : Res = FAILED;
		if( FAILED == (err = init()))
			throw 'init failed';
			
		for ( t in tests)
		{
			t.mk();
		}
	}
	
}