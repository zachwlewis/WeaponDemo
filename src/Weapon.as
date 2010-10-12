package  
{
	import net.flashpunk.*;
	/**
	 * ...
	 * @author Zachary Weston Lewis
	 */
	public class Weapon extends Entity
	{
		// We'll extend Entity for the easy access to FP.elapsed.
		
		
		private var _bulletSize:Number;
		private var _rateOfFire:Number;
		private var _muzzleVelocity:Number;
		private var _rofTimer:Number;
		
		public function Weapon(bulletSize:Number, rateOfFire:Number, muzzleVelocity:Number) 
		{
			_bulletSize = bulletSize;
			_rateOfFire = rateOfFire;
			_muzzleVelocity = muzzleVelocity;
			
			// Set our timer to 0 (first shot is free).
			_rofTimer = 0;
		}
		
		override public function update():void 
		{
			// We'll decrease our timer here.
			if (_rofTimer > 0)
			{
				_rofTimer -= FP.elapsed;
			}
			super.update();
		}
		
		public function shoot():void
		{
			if (_rofTimer <= 0)
			{
				// If our timer is zero, we can fire!
				FP.world.add(new Bullet(x, y - _bulletSize / 2, _bulletSize, _muzzleVelocity));
				
				// Now, we want to set our timer to our rate of fire.
				_rofTimer = _rateOfFire;
			}
		}
		
	}

}