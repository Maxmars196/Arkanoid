package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	public class Main extends Sprite 
	{
		public function Main()
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			super();
		}
		
		private var box:Box;
		private var ball:Ball = new Ball();
		private var brick:Brick;
		private var racket:Racket;
		public var bricksArray:Array = [];
		public var lvlGenerator:LevelGenerator;
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.scaleMode     = StageScaleMode.NO_SCALE;
			ball = new Ball();
			box = new Box();
			lvlGenerator = new LevelGenerator();
			addChild(lvlGenerator);
			stage.addChild(box);
			bricksArray = lvlGenerator.createLvl();
			racket = new Racket();
			stage.addChild(ball);
			stage.addChild(racket);
			ball.Move();
			racket.MoveRacket();
			ball.addEventListener(Event.ENTER_FRAME, checkCollisionBox);
			ball.addEventListener(Event.ENTER_FRAME, checkCollisionBrick);
			ball.addEventListener(Event.ENTER_FRAME, checkCollisionRacket);
			//racket.addEventListener(Event.ENTER_FRAME, MoveRacket);
		}
		public function checkCollisionBox(e:Event):void 
		{
			for each(var obj:* in box.array) {
				
				var hit:Boolean = e.target.hitTestObject(obj);
				if (hit) {
					if (obj.type){
						e.target.velocityX *=-1;
					} else{
						e.target.velocityY *=-1;
					}
					return;
				}
			}
		}

		public function checkCollisionBrick(e:Event):void 
		{
			for each(var myBrickObject:* in bricksArray) {
				
				if (bricksArray != null && ball.hitTestObject(myBrickObject)) {
					if (ball.y > myBrickObject.y && ball.y < (myBrickObject.y + myBrickObject.height)) {
						
						if (ball.x < myBrickObject.x || ball.x > (myBrickObject.x + myBrickObject.width)) {
							ball.velocityX *= -1;
						}else {
							ball.velocityY *= -1;
							ball.velocityX *= -1;
						}
						
					}
					if (ball.x > myBrickObject.x && ball.x < (myBrickObject.x + myBrickObject.width)) {
						
						if (ball.y < myBrickObject.y || ball.y > (myBrickObject.y + myBrickObject.height)) {
							ball.velocityY = -ball.velocityY;
						}else {
							ball.velocityY *= -1;
							ball.velocityX *= -1;
						}
					}
					
					var index:int = bricksArray.indexOf(myBrickObject);
					myBrickObject.parent.removeChild(myBrickObject);
					bricksArray[index] = null;
					bricksArray.removeAt(index);
					
					if (bricksArray.length == 0) {
						ball.Stop();
						racket.StopRacket();
					}
					
					//ball.velocityY *= -1;
					//ball.velocityX = 0;
					//removeEventListener(Event.ENTER_FRAME, checkCollisionBrick);
					break;
				}
			}
		}
		
		public function checkCollisionRacket(e:Event):void {
			
			if (ball.hitTestObject(racket)) {
				
				if (ball.x > racket.x) {
					ball.velocityY *= -1;
				} else {
					ball.velocityX *= -1;
					ball.velocityX *= -1;
				}
			}
		}
		
		override public function addChildAt(child:DisplayObject, index:int):DisplayObject 
		{
			return super.addChildAt(child, index);
		}
	}
}