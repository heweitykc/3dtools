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
	import away3d.controllers.FirstPersonController;
	
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
		private var _control:CameraControl;
		
		//声明移动工具-------------------------------------------
		private var _tool:ToolManager;
		
		override protected function init():void
		{
			super.init();
			
			_control = new CameraControl(_view.camera,stage);
			
			//初始化移动工具-------------------------------------------
			_tool = new ToolManager(stage, _view.camera);
			
			_cube = new Mesh(new CubeGeometry(), cubeMaterial);
			_cube2 = new Mesh(new CubeGeometry(), cubeMaterial);
			
			//将移动器加入场景-------------------------------------------
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
			//设置被移动的物体-------------------------------------------
			_tool.dragObj = e.target as ObjectContainer3D;
 		}
		
		override protected function loop():void
		{			
			//super.loop();			
			//_t3d.rotationY += 1;
			//_cube.rotationY += 1;
		}
	}
}
