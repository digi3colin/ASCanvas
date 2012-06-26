package com.gamemeal.html.utils {
	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class Path {
		public var x:Number;
		public var y:Number;
		public var fnt:Function;
		public var arg:Array;
		
		public function Path(fnt:Function,arg:Array,x:Number,y:Number){
			this.x = x;
			this.y = y;
			this.fnt = fnt;
			this.arg = arg;
		}
	}
}