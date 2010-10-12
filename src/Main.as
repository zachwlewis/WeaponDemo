package 
{
	import net.flashpunk.*;
	
	/**
	 * ...
	 * @author Zachary Weston Lewis
	 */
	public class Main extends Engine
	{
		
		public function Main():void 
		{
			super(640, 480);
		}
		
		override public function init():void 
		{
			FP.world = new GameWorld;
			super.init();
		}
		
	}
	
}