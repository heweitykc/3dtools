package controls 
{
	import away3d.cameras.Camera3D;
	import away3d.containers.ObjectContainer3D;
	
	import flash.display.Stage;
	/**
	 * ...
	 * @author callee
	 * 必须保证移动箭头和物体在同一层级
	 */
	public class ToolManager 
	{
		public static var instance:ToolManager;
		public static var stage:Stage;
		public static var camera:Camera3D;
		
		public function get translater():TranslateGizmo3D {
			return _translater;
		}
		
		public function set dragObj(value:ObjectContainer3D):void{
			_dragObj = value;
			translater.moveTo(_dragObj.position.x,_dragObj.position.y,_dragObj.position.z);
			_translater.visible = true;
		}
		public function get dragObj():ObjectContainer3D {
			return _dragObj;
		}
		
		private var _dragObj:ObjectContainer3D;
		private var _translater:TranslateGizmo3D;

		public function ToolManager(stage:Stage,camera:Camera3D) 
		{
			ToolManager.instance = this;
			ToolManager.stage = stage;
			ToolManager.camera = camera;
			_translater = new TranslateGizmo3D();
			_translater.visible = false;
		}
		
	}

}