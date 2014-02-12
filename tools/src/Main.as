package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import away3d.cameras.*;
	import away3d.cameras.lenses.LensBase;
	import away3d.containers.*;
	import away3d.core.managers.*;
	import away3d.core.pick.*;
	import away3d.debug.AwayStats;
	import away3d.entities.*;
	import away3d.events.*;
	import away3d.library.*;
	import away3d.lights.*;
	import away3d.primitives.*;
	import away3d.textures.*;
	import away3d.tools.utils.*;
	
	import awaybuilder.view.scene.controls.TranslateGizmo3D;
	/**
	 * ...
	 * @author callee
	 */
	public class Main extends BaseView 
	{
		private var _t3d:TranslateGizmo3D;
		public var backgroundGrid:WireframePlane;
		
		override protected function init():void
		{
			super.init();
			_t3d = new TranslateGizmo3D();
			_view.scene.addChild(_t3d);
			
			//Background grid 
			backgroundGrid = new WireframePlane(10000, 10000, 100, 100, 0x000000, 0.375, "xz");
			backgroundGrid.mouseEnabled = false;
			//_view.scene.addChild(backgroundGrid);	
		}
		
		override protected function loop():void
		{
			super.loop();
			_t3d.update();
		}
	}
}