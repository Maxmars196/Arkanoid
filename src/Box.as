package 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;

	public class Box extends Sprite
	{	
		private var params:Array = [
		{widthStart:70, heightStart:70, widthEnd:730, heightEnd:70, color:0x800040},
		{widthStart:730, heightStart:70, widthEnd:730, heightEnd:530, color:0x800040},
		{widthStart:730, heightStart:530, widthEnd:70, heightEnd:530, color:0xFF0000},
		{widthStart:70, heightStart:530, widthEnd:70, heightEnd:70, color:0x800040}];
		
		public var array:Array = [];
		public function Box() 
		{
			super();
			if (stage) DrawBox();
			else addEventListener(Event.ADDED_TO_STAGE, DrawBox);			
		}
		
		public function DrawBox(e:Event = null):void
		{
			CreateObject();
		}
		
		private function CreateObject():void 
		{
			//for each (var item:Object in params) 
			//{
				//var obj:BoxItem = new BoxItem(item);
				//array.push(obj);
			//}
			
			for (var i:int = 0; i < params.length; i++) 
			{
				var obj:BoxItem = new BoxItem(params[i]);
				addChild(obj);
				array.push(obj);
			}
		}
	}
}
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;

internal class	BoxItem extends Sprite
{
	private var params:Object;
	public var type:int = 0; //horizont
	public function BoxItem(paramsBox:Object=null):void 
	{
		params = paramsBox || {};
		if (stage) DrawBox();
		else addEventListener(Event.ADDED_TO_STAGE, DrawBox);
	}
	// Рисуем стену
	private function DrawBox(e:Event=null):void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, DrawBox);
		//var line1:Shape = new Shape();
		this.graphics.lineStyle(7, params.color);
		this.graphics.moveTo(params.widthStart, params.heightStart);
		this.graphics.lineTo(params.widthEnd, params.heightEnd);
		//addChild(line1);
		
		(params.widthStart == params.widthEnd)?type = 1: type = 0;
	}
}


		//private var topLeftCorner:int = 50;
		//private var topRightCorner:int = 730;
		//private var botomLeftCorner:int = 70;
		//private var botomRightCorner:int = 530;
		
		
		//private var params:Array = [
		//{widthStart:70, heightStart:70, widthEnd:530, heightEnd:70, color:0xFF0000},
		//{widthStart:530, heightStart:70, widthEnd:530, heightEnd:530, color:0x008080},
		//{widthStart:530, heightStart:530, widthEnd:70, heightEnd:530, color:0xFF8040},
		//{widthStart:70, heightStart:530, widthEnd:70, heightEnd:70, color:0xFF80C0}];
		//