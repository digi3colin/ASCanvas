package com.gamemeal.html.canvas {
	import com.gamemeal.graphics.Bezier;
	import flash.display.Graphics;
	import flash.geom.Point;


	/**
	 * @author Digi3Studio - Colin Leung
	 * implement drawing canvas drawing procedure in flash.graphic
	 */
	public class GraphicDrawCommands {
//		private const TO_RAD:Number = Math.PI/180;
		private const TO_DEG:Number = 180/Math.PI;
		
		private var path:Vector.<Path>;
		private var setLineStyle:Function;
		public function GraphicDrawCommands(paths:Vector.<Path>,setLineStyle:Function){
			this.path = paths;
			this.setLineStyle = setLineStyle;//heck, this is required to fix arc drawing quality
		}

		public function _arc(arg:Array,graphics : Graphics) : void{
			var d:Draw = new Draw(graphics);
			setLineStyle(graphics,false);//disable pixel hint;
			d.arc(arg[0],arg[1],arg[2],TO_DEG*(arg[3]),TO_DEG*(arg[4]),arg[5],arg[6],arg[7]);
			setLineStyle(graphics,true);//enable pixel hint;
		}

		public function _arcTo(arg:Array,graphics : Graphics):void{
			var x0:Number = arg[5];
			var y0:Number = arg[6];
			var x1:Number = arg[0];
			var y1:Number = arg[1];
			var x2:Number = arg[2];
			var y2:Number = arg[3];
			var radius:Number = arg[4];
			
			var theta:Number = Math.atan2(y0-y1, x0-x1)-Math.atan2(y2-y1,x2-x1);
			var lengthFromP1ToT1:Number = Math.abs(radius/Math.tan(theta/2));
			var lengthFromP1ToC1:Number = Math.abs(radius/Math.sin(theta/2));

			var xt0:Number = (x0-x1);
			var yt0:Number = (y0-y1);
			var l:Number = Math.sqrt((xt0*xt0)+(yt0*yt0));
			xt0 = xt0*lengthFromP1ToT1/l+x1;
			yt0 = yt0*lengthFromP1ToT1/l+y1;

			var xt2:Number = (x2-x1);
			var yt2:Number = (y2-y1);
			l = Math.sqrt((xt2*xt2)+(yt2*yt2));
			xt2 = xt2*lengthFromP1ToT1/l+x1;
			yt2 = yt2*lengthFromP1ToT1/l+y1;

			var cx:Number = (xt0+xt2)*0.5-x1;
			var cy:Number = (yt0+yt2)*0.5-y1;
			l = Math.sqrt((cx*cx)+(cy*cy));
			cx = cx*lengthFromP1ToC1/l+x1;
			cy = cy*lengthFromP1ToC1/l+y1;

			var d:Draw = new Draw(graphics);
			var startAngle:Number = TO_DEG*(Math.atan2(yt0-cy, xt0-cx));
			var endAngle:Number = TO_DEG*(Math.atan2(yt2-cy, xt2-cx));
			var dir:Boolean = (startAngle<endAngle);
			if(x1>x2)dir = !dir;

			setLineStyle(graphics,false);//disable pixel hint;
			graphics.moveTo(x0, y0);
			graphics.lineTo(xt0, yt0);
			d.arc(cx,cy,radius,startAngle,endAngle,dir);
			setLineStyle(graphics,true);//enable pixel hint;
		}

/*		public function mark(x:Number,y:Number,g : Graphics) : void{
			g.moveTo(x-2, y-2);
			g.lineTo(x+2, y+2);
			g.moveTo(x+2, y-2);
			g.lineTo(x-2, y+2);
			g.moveTo(x,y);
		}*/

		public function _bezierCurveTo(arg:Array,graphics : Graphics):void{
			var p0:Point = new Point(arg[6],arg[7]);
			var p1:Point = new Point(arg[0],arg[1]);
			var p2:Point = new Point(arg[2],arg[3]);
			var p3:Point = new Point(arg[4],arg[5]);

			setLineStyle(graphics,false);//disable pixel hint;
			graphics.lineTo(p0.x, p0.y); 
			var bc : Bezier = new Bezier(graphics);
			bc.drawCubicBezier(p0, p1, p2, p3, 4);
			setLineStyle(graphics,true);//enable pixel hint;
		}

		public function _closePath(arg:Array,graphics : Graphics):void{
			var x:Number = path[0].x;
			var y:Number = path[0].y;
			graphics.lineTo(x,y);
			arg;
		}

		public function _lineTo(arg:Array,graphics : Graphics):void{
			var x:Number = arg[0];
			var y:Number = arg[1];
			graphics.lineTo(x, y);
		}

		public function _moveTo(arg:Array,graphics : Graphics):void{
			var x:Number = arg[0];
			var y:Number = arg[1];
			graphics.moveTo(x, y);
		}

		public function _quadraticCurveTo(arg:Array,graphics : Graphics):void{
			var cpx:Number = arg[0];
			var cpy:Number = arg[1];
			var x:Number = arg[2];
			var y:Number = arg[3];

			graphics.curveTo(cpx, cpy, x, y);
		}

		public function _rect(arg:Array,graphics : Graphics):void{
			var x:Number=arg[0];
			var y:Number=arg[1];
			var width:Number=arg[2];
			var height:Number=arg[3];

			graphics.moveTo(x, y);
			graphics.drawRect(x, y, width, height);
		}

	}
}
