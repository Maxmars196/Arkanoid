package 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	public class Racket extends Sprite	
	{
		//public var xCordRacket:int = 400 - racketWeight/2;
		//public var yCordRacket:int = 510 - racketHeight / 2;
		public var racketWeight:int = 90;
		public var racketHeight:int = 10;
		private var position:Point = new Point(400 - racketWeight/2, 490 - racketHeight / 2);
		
		public function Racket() 
		{
			super();
			if (stage) DrawRacket();
			else addEventListener(Event.ADDED_TO_STAGE, DrawRacket);			
		}
		
		public function DrawRacket(e:Event=null):void 
		{
			//this.graphics.lineStyle(0, 0x1BB8FC, 5);
			this.graphics.beginFill(0xC5216A, 1);
			this.graphics.drawRect(0, 0, racketWeight, racketHeight);
			this.graphics.endFill();
			this.x = position.x;
			this.y = position.y;
		}
		
		public function MoveRacket():void
		{
			this.addEventListener(Event.ENTER_FRAME, OnMoveRacket)
		}
		
		public function OnMoveRacket(e:Event):void 
		{
			this.x += mouseX - racketWeight / 2;
			
			if ((this.x + this.width + 72) > stage.stageWidth) {
				this.x = stage.stageWidth - this.width - 72; 
			}
			
			if (this.x < 72) {
				this.x = 72;
			}
		}
		
		public function StopRacket():void
		{
			this.removeEventListener(Event.ENTER_FRAME, OnMoveRacket)
		}
	}
}