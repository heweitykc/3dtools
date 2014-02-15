package controls 
{
	import away3d.containers.ObjectContainer3D;
	import away3d.materials.ColorMaterial;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author callee
	 */
	public class Gizmo3DBase extends ObjectContainer3D
	{
		public var active:Boolean = false;
		public var currentAxis:String = "";
		
		protected var F:ObjectContainer3D;
		protected var content:ObjectContainer3D;
		
		protected var click:Point = new Point();
		protected var click2:Point = new Point();
		
		protected var xAxisMaterial:ColorMaterial = new ColorMaterial(0xff0000, 1);
		protected var yAxisMaterial:ColorMaterial = new ColorMaterial(0x00cc00, 1);
		protected var zAxisMaterial:ColorMaterial = new ColorMaterial(0x0033ff, 1);
		protected var highlightOverMaterial:ColorMaterial = new ColorMaterial(0xffcc00);
		protected var highlightDownMaterial:ColorMaterial = new ColorMaterial(0xfff000);
		protected var sphereMaterial:ColorMaterial = new ColorMaterial(0xFFFFFF, 0.3);
		protected var sphereHighlightMaterial:ColorMaterial = new ColorMaterial(0xFFFFFF, 0.6);
		protected var cubeMaterial:ColorMaterial = new ColorMaterial();
		
		public function Gizmo3DBase() 
		{
			content = new ObjectContainer3D();
			this.addChild(content);
		}
		
	}

}