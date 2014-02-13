package controls 
{
	import away3d.cameras.Camera3D;
	import away3d.containers.ObjectContainer3D;
	
	import flash.display.Stage;
	/**
	 * ...
	 * @author callee
	 */
	public class ToolManager 
	{
		public static var instance:ToolManager;
		
		public static var stage:Stage;
		public static var camera:Camera3D;
		public static var radius:Number = 1000;
		
		public function set translater(value:TranslateGizmo3D):void {
			_translater = value;
			_translater.visible = false;
		}
		public function get translater():TranslateGizmo3D {
			return _translater;
		}
		
		public function set dragObj(value:ObjectContainer3D):void{
			_dragObj = value;
			translater.x = _dragObj.position.x;
			translater.y = _dragObj.position.y;
			translater.z = _dragObj.position.z;
			_translater.visible = true;
		}
		public function get dragObj():ObjectContainer3D {
			return _dragObj;
		}
		
		private var _dragObj:ObjectContainer3D;
		private var _translater:TranslateGizmo3D;

		public function ToolManager() 
		{
			
		}
		
	}

}