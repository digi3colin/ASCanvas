package {	import flash.display.Sprite;		import com.gamemeal.html.Canvas;	/**
	 * @author Colin
	 */
	public class TestSample2 {		public function TestSample2(root:Sprite):void{			var canvas:Canvas = new Canvas("myCanvas",160,160);			var ctx:Canvas = canvas.getContext("2d");		    ctx.fillRect(25,25,100,100);		    ctx.clearRect(45,45,60,60);		    ctx.strokeRect(50,50,50,50);						root.addChild(ctx);		}	}}