package {	import flash.display.Sprite;		import com.gamemeal.html.Canvas;	/**
	 * @author Colin
	 */
	public class TestSample3 {		public function TestSample3(root:Sprite):void{			var canvas:Canvas = new Canvas("myCanvas",160,160);			var ctx:Canvas = canvas.getContext("2d");			ctx.beginPath();			ctx.moveTo(75,50);			ctx.lineTo(100,75);			ctx.lineTo(100,25);			ctx.fill();						root.addChild(ctx);		}	}}