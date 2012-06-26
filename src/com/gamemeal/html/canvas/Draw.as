package com.gamemeal.html.canvas {
	import flash.display.Graphics;
	/**
	 * @author Digi3Studio - Colin Leung
	 */
	internal class Draw{
		private var g : Graphics;
		
		public function Draw(g : Graphics) {
			this.g = g;
		}
	
		public function arc(cx:Number, cy:Number, radius:Number, startAngle:Number, endAngle:Number, clockwise:*,lastX:Number=NaN,lastY:Number=NaN):void{
	//		if(startAngle<0)startAngle = 360+startAngle;
			if(endAngle<0)endAngle = 360+endAngle;
	
			var arc:Number;
			if(clockwise==false||clockwise==0){
				arc = endAngle - startAngle;
			}else{
				arc = 360-(endAngle - startAngle);
				if(arc==0&&endAngle!=startAngle)arc=360;
			}
			
			if (Math.abs(arc)>360)arc = 360;
	
			var segs:Number = Math.ceil(Math.abs(arc)/45);
			var segAngle:Number = arc/segs;
	
			var theta:Number,angle:Number;
			if(clockwise==false||clockwise==0){
				theta = (segAngle/180)*Math.PI;
				angle = (startAngle/180)*Math.PI;
			}else{
				theta = -(segAngle/180)*Math.PI;
				angle = (startAngle/180)*Math.PI;		
			}
	
			var sx:Number = cx+Math.cos(angle)*radius;
			var sy:Number = cy+Math.sin(angle)*radius;
	
			if(isNaN(lastX)){
				g.moveTo(sx,sy);
			}else{
				g.lineTo(sx,sy);
			}
	
			var angleMid:Number, bx:Number, by:Number, ctlx:Number, ctly:Number;
			for (var i:int = 0; i<segs; i++) {
				angle += theta;
				angleMid = angle-(theta/2);
				bx = cx+Math.cos(angle)*radius;
				by = cy+Math.sin(angle)*radius;
				ctlx = cx+Math.cos(angleMid)*(radius/Math.cos(theta/2));
				ctly = cy+Math.sin(angleMid)*(radius/Math.cos(theta/2));
				g.curveTo(ctlx, ctly, bx, by);
			}
	
			lastY;
		}
	}
}
