package com.gamemeal.html.canvas {
	import com.gamemeal.html.CSSColor;
	/**
	 * @author Digi3Studio - Colin Leung
	 */
	internal class ColorStop{
		public var offset:Number;
		public var color:Number;
		public var alpha:Number;
	
		public function ColorStop(offset:Number, color : String){
			var c:CSSColor = new CSSColor(color);
			this.color = c.color;
			this.alpha = c.alpha;
			this.offset = offset;
		}
	}
}
