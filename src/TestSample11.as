package {	import flash.display.Sprite;		import com.gamemeal.html.Canvas;	/**
	 * @author Colin
	 */
	public class TestSample11 {		public function TestSample11(root:Sprite):void{			var canvas:Canvas = new Canvas("myCanvas",160,400);			var ctx:Canvas = canvas.getContext("2d"); ctx.beginPath();ctx.moveTo(100,0);ctx.arcTo(0,100,100,100,30);ctx.stroke();ctx.beginPath();ctx.moveTo(100,50);ctx.arcTo(0,50,100,-100,30);ctx.stroke();ctx.beginPath();ctx.moveTo(0,100);ctx.arcTo(100,250,0,300,30);ctx.stroke();ctx.beginPath();ctx.moveTo(0,300);ctx.arcTo(100,100,0,100,30);ctx.stroke(); 			root.addChild(ctx);		}	}}