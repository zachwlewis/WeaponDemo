package  
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author Zachary Weston Lewis
	 */
	public class GameWorld extends World
	{
		private var _player:Player;
		private var _text:Text;
		public function GameWorld() 
		{
			
		}
		
		override public function begin():void 
		{
			// Add our player to the world.
			_player = Player(add(new Player));
			
			// Add some descriptive text to the world.
			_text = new Text("Move with arrows.\nSwitch weapons with 1-3.\nPress Z, X or Space to fire current weapon.");
			addGraphic(_text, 1, 0, FP.height - _text.height);
			super.begin();
		}
		
	}

}