package {	import flash.display.Sprite;		import com.gamemeal.html.Canvas;	/**
	 * @author Colin
	 */
	public class TestSample5 {		public function TestSample5(root:Sprite):void{			var canvas:Canvas = new Canvas("myCanvas",160,160);			var ctx:Canvas = canvas.getContext("2d");			// Filled triangle			ctx.beginPath();			ctx.moveTo(25,25);			ctx.lineTo(105,25);			ctx.lineTo(25,105);			ctx.fill();						// Stroked triangle			ctx.beginPath();			ctx.moveTo(125,125);			ctx.lineTo(125,45);			ctx.lineTo(45,125);			ctx.closePath();			ctx.stroke();						root.addChild(ctx);		}	}}