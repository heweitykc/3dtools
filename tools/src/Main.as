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
	import away3d.materials.ColorMaterial;
	
	import controls.*;
	
	/**
	 * ...
	 * @author callee
	 */
	public class Main extends BaseView 
	{
		protected var cubeMaterial:ColorMaterial = new ColorMaterial(0xff0000, 1);
		private var _t3d:TranslateGizmo3D;
		private var _cube:Mesh;
		override protected function init():void
		{
			super.init();
			ToolManager.stage = this.stage;
			ToolManager.camera = _view.camera;
			_t3d = new TranslateGizmo3D();
			_cube = new Mesh(new CubeGeometry(), cubeMaterial);			
			_view.scene.addChild(_t3d);
			_view.scene.addChild(_cube);
			_cube.mouseEnabled = false;
			ToolManager.dragObj = _cube;
		}
		
		override protected function loop():void
		{			
			super.loop();
			//_t3d.rotationY += 1;
			//_cube.rotationY += 1;
		}
	}
}
