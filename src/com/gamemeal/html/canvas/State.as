package com.gamemeal.html.canvas {
	import flash.geom.Matrix;
	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class State{
		public var localSpaceMatrix:Matrix;
		public var canvasSpaceMatrix:Matrix;
		public var scaleSpaceMatrix:Matrix;
		public var clipPath:Vector.<Path>;
		public var lineWidth : Number;
		public var lineJoin : String;
		public var miterLimit : Number;
		public var lineCap : String;
		public var _fillStyle : Object;
		public var _strokeStyle : Object;
		public var globalAlpha : Number;
		public var shadowColor : Number;
		public var shadowOffsetX:Number;
		public var shadowOffsetY : Number;
		public var shadowWidth : Number;

		public function State(){
		}
		
		public function set fillStyle(style:Object):void{
			//serialize, clone, deserialize
			_fillStyle = style;
		}
		
		public function get fillStyle():Object{
			return _fillStyle;
		}
	
		public function set strokeStyle(style:Object):void{
			//serialize, clone, deserialize
			_strokeStyle = style;
		}
	
		public function get strokeStyle():Object{
			return _strokeStyle;
		}
	}
}
