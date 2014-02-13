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
		private var _cube:Mesh;
		private var _cube2:Mesh;
		private var _tool:ToolManager;
		
		override protected function init():void
		{
			super.init();
			
			_tool = new ToolManager();
			ToolManager.instance = _tool;
			ToolManager.stage = this.stage;
			ToolManager.camera = _view.camera;
			_tool.translater = new TranslateGizmo3D();
			
			_cube = new Mesh(new CubeGeometry(), cubeMaterial);
			_cube2 = new Mesh(new CubeGeometry(), cubeMaterial);
			
			_view.scene.addChild(_tool.translater);
			_view.scene.addChild(_cube);
			_view.scene.addChild(_cube2);
			_cube2.x = 200;
			
			initObj(_cube);
			initObj(_cube2);
		}
		
		private function initObj(obj:ObjectContainer3D):void
		{
			obj.mouseEnabled = true;
			obj.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDown);
		}
		
		protected function handleMouseDown(e:MouseEvent3D):void
		{
			var obj:ObjectContainer3D = e.target as ObjectContainer3D;
			_tool.dragObj = obj;
 		}
		
		override protected function loop():void
		{			
			super.loop();
			//_t3d.rotationY += 1;
			//_cube.rotationY += 1;
		}
	}
}
