package {	import flash.display.Sprite;		import com.gamemeal.html.Canvas;	/**
	 * @author Colin
	 */
	public class TestSample10 {		public function TestSample10(root:Sprite):void{			var canvas:Canvas = new Canvas("myCanvas",160,160);			var ctx:Canvas = canvas.getContext("2d");  ctx.fillStyle = "rgb(200,0,0)"; ctx.fillRect (10, 10, 55, 50); ctx.fillStyle = "rgba(0, 0, 200, 0.5)"; ctx.fillRect (30, 30, 55, 50); 			root.addChild(ctx);		}	}}