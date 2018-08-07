package 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Mars
	 */
	public class Britan extends Sprite 
	{
		
		public function Britan() 
		{
			super();
			if (stage) DrawBritan();
			else addEventListener(Event.ADDED_TO_STAGE, DrawBritan);			
		}
		
		public function DrawBritan(e:Event = null):void
		{
			var newshape:Shape = new Shape();
			newshape.graphics.lineStyle(100, 0xFF0000);
			//newshape.graphics.moveTo(400, -1500);
			//newshape.graphics.lineTo(400, 600);
			newshape.graphics.moveTo(-1500, 300);
			newshape.graphics.lineTo(800, 300);
			addChild(newshape);
		}
	}

}

		//private function DrawBox(e:Event=null):void 
	//{
		//removeEventListener(Event.ADDED_TO_STAGE, DrawBox);
		////по нашим params рисуем стену
		//var newbox:Shape = new Shape();	
		//newbox.graphics.lineStyle(6, 0xFF0000);
		////newbox.graphics.beginFill(0x555555);
		////newbox.graphics.drawRect(150, 150, 300, 300);
		//newbox.graphics.moveTo(150, 150);
		//newbox.graphics.lineTo(450, 150);
		//newbox.graphics.lineTo(450, 450);
		//newbox.graphics.endFill();
		//addChild(newbox);
		//
	//}