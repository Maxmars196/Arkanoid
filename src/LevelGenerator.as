package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Mars
	 */
	public class LevelGenerator extends Sprite
	{
		
		public function LevelGenerator() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		public var xCord:int = 74;
		public var yCord:int = 70;
		public function createLvl():Array
		{
			var bricksArray:Array = [];
			for (var i:int = 0; i < 8; i++) { 
				var brick:Brick = new Brick(); 
				brick.y = yCord + 10; 
				brick.x = xCord + 12 + (80 * i); 
				
				bricksArray.push(brick); 
				addChild(brick);
			}
			return bricksArray;
		}
		
	}

}