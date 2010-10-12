package  
{
	import flash.display.BitmapData;
	import net.flashpunk.*;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Zachary Weston Lewis
	 */
	public class Bullet extends Entity
	{
		private var _size:Number;
		private var _speed:Number;
		public function Bullet(x:int, y:int, size:Number, speed:Number) 
		{
			this.x = x;
			this.y = y;
			graphic = new Image(new BitmapData(size, size, false, 0xff0000));
			_size = size;
			_speed = speed;
		}
		
		override public function update():void 
		{
			// Apply our speed.
			x += FP.elapsed * _speed;
			
			// Cull off-screen bullets for performance gain.
			if (x > FP.screen.width + _size) FP.world.remove(this);
			
			super.update();
		}
		
	}

}