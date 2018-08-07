package 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;

	public class Brick extends Sprite
	{
		
		
		//public var brickWeight:int = 630;
		//public var brickHeight:int = 25;
		
		public function Brick() 
		{
			super();
			if (stage) DrawBrick();
			else addEventListener(Event.ADDED_TO_STAGE, DrawBrick);
		}
		
		public function DrawBrick(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, DrawBrick);
				graphics.beginFill(0x800080);
				graphics.drawRect(0, 0, 70, 20); 
				graphics.endFill(); 
				//removeEventListener(Event.ADDED_TO_STAGE, DrawBrick);
				//var my_brick:Shape = new Shape();
				//my_brick.graphics.lineStyle(3, 0x0000FF, 5);
				//my_brick.graphics.beginFill(0x0099FF,1);
				//my_brick.graphics.drawRect(xCord, yCord, brickWeight, brickHeight);
				//my_brick.graphics.endFill();
				//addChild(my_brick);
			}
	}
}