﻿package {	import com.gamemeal.html.Canvas;	import com.gamemeal.html.utils.LinearGradient;	import flash.display.Sprite;	/**
	 * @author Colin
	 */
	public class TestSample14 {//		private var num:Number=0;		private var root:Sprite;		public function TestSample14(root:Sprite){			this.root = root;			loop();		}		private function loop(...arg):void{			var canvas:Canvas = new Canvas("myCanvas",500,500);			root.addChild(canvas);			var ctx:Canvas = canvas.getContext("2d");			var color1:LinearGradient = ctx.createLinearGradient(100,100,30,30);			color1.addColorStop(0,"#FFFFFF");			color1.addColorStop(0.1,"#0000FF");			color1.addColorStop(0.9,"#FF00FF");			color1.addColorStop(1,"#000000");			ctx.fillStyle = color1;						ctx.beginPath();			ctx.moveTo(0,0);			ctx.rect(0, 0, 200, 200);			ctx.closePath();			ctx.fill();						ctx.beginPath();			ctx.strokeStyle = "#FFFFFF";			ctx.strokeRect(0, 0, 10, 10);			ctx.beginPath();			ctx.strokeRect(0, 0, 100, 100);		}   /*     private function createTextField(x:Number, y:Number, width:Number, height:Number):TextField {            var result:TextField = new TextField();            result.x = x;            result.y = y;            result.width = width;            result.height = height;            result.background = true;            result.border = true;            root.addChild(result);            return result;        }*/	}}