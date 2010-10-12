package  
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.*;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.*;
	
	/**
	 * ...
	 * @author Zachary Weston Lewis
	 */
	public class Player extends Entity
	{
		private var _weapons:Vector.<Weapon>;
		private var _currentWeapon:uint;
		public function Player() 
		{
			_weapons = new Vector.<Weapon>;
			
			// Let's add a weapon with small bullets that shoots fast.
			_weapons.push(new Weapon(2, 0.05, 500))
			
			// Now, how about a big-bullet, slow shooter?
			_weapons.push(new Weapon(16, 1.5, 200))
			
			// Finally, the UBERWEAPON.
			_weapons.push(new Weapon(8, 0.1, 800))
			
			// We'll start out with the little gun.
			_currentWeapon = 0;
			
			//We need a graphic.
			graphic = new Image(new BitmapData(24, 32, false, 0xff00ff));
			
			// Let's set our character somewhere cool.
			x = 40;
			y = 230;
			
			// Now, let's update our weapons so they are on our player and in the world.
			for each (var w:Weapon in _weapons)
			{
				FP.world.add(w);
				w.x = x + 24;
				w.y = y + 16;
			}
			
			// Finally, let's define our shooting keys.
			Input.define("shoot", Key.SPACE, Key.Z, Key.X);
		}
		
		override public function update():void 
		{
			if (Input.check("shoot"))
			{
				// If our player is shooting, let's tell our weapon.
				_weapons[_currentWeapon].shoot();
			}
			
			// Let's handle weapon switching. This demonstrates how weapons aren't tied to our player explicitly.
			if (Input.pressed(Key.DIGIT_1)) _currentWeapon = 0;
			else if (Input.pressed(Key.DIGIT_2)) _currentWeapon = 1;
			else if (Input.pressed(Key.DIGIT_3)) _currentWeapon = 2;
			
			// Handle player movement.
			var move:Point = new Point;
			if (Input.check(Key.UP)) move.y--;
			if (Input.check(Key.DOWN)) move.y++;
			if (Input.check(Key.LEFT)) move.x--;
			if (Input.check(Key.RIGHT)) move.x++;
			
			x += move.x * 100 * FP.elapsed;
			y += move.y * 100 * FP.elapsed;
			
			// Now, let's update our weapons so they are on our player.
			for each (var w:Weapon in _weapons)
			{
				w.x = x + 24;
				w.y = y + 16;
			}
			
			super.update();
		}
		
	}

}