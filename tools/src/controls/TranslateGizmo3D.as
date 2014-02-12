package controls 
{
	import away3d.entities.Mesh;
	import away3d.containers.ObjectContainer3D;
	import away3d.primitives.ConeGeometry;
	import away3d.primitives.CylinderGeometry;
	import away3d.materials.ColorMaterial;
	import away3d.core.pick.PickingColliderType;
	import away3d.events.MouseEvent3D;
		
	/**
	 * ...
	 * @author callee
	 */
	public class TranslateGizmo3D extends ObjectContainer3D
	{		
		protected var xAxisMaterial:ColorMaterial = new ColorMaterial(0xff0000, 1);
		protected var yAxisMaterial:ColorMaterial = new ColorMaterial(0x00cc00, 1);
		protected var zAxisMaterial:ColorMaterial = new ColorMaterial(0x0033ff, 1);
		
		private var xCylinder:Mesh;
		private var yCylinder:Mesh;
		private var zCylinder:Mesh;
		
		private var xCone:Mesh;
		private var yCone:Mesh;
		private var zCone:Mesh;

		
		public function TranslateGizmo3D() 
		{
			var coneGeom:ConeGeometry = new ConeGeometry(10, 20, 16, 1, true, false);
			var cylGeom:CylinderGeometry = new CylinderGeometry(5, 5, 100, 16, 1, true, true, true, false);		
			
			xCylinder = new Mesh(cylGeom, xAxisMaterial);
			xCylinder.name = "xAxis";
			xCylinder.pickingCollider = PickingColliderType.PB_BEST_HIT;
			xCylinder.mouseEnabled = true;
			xCylinder.addEventListener(MouseEvent3D.MOUSE_OVER, handleMouseOver);
			xCylinder.addEventListener(MouseEvent3D.MOUSE_OUT, handleMouseOut);			
			xCylinder.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDown);
			xCylinder.x = 50;
			xCylinder.rotationY = -90;
			this.addChild(xCylinder);		
			
			xCone = new Mesh(coneGeom, xAxisMaterial);
			xCone.name = "xAxis";
			xCone.pickingCollider = PickingColliderType.PB_BEST_HIT;
			xCone.mouseEnabled = true;
			xCone.addEventListener(MouseEvent3D.MOUSE_OVER, handleMouseOver);
			xCone.addEventListener(MouseEvent3D.MOUSE_OUT, handleMouseOut);			
			xCone.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDown);	
			xCone.rotationY = -90;
			xCone.x = 100 + (coneGeom.height/2);
			this.addChild(xCone);					
			
			yCylinder = new Mesh(cylGeom, yAxisMaterial);
			yCylinder.name = "yAxis";
			yCylinder.pickingCollider = PickingColliderType.PB_BEST_HIT;
			yCylinder.mouseEnabled = true;
			yCylinder.addEventListener(MouseEvent3D.MOUSE_OVER, handleMouseOver);
			yCylinder.addEventListener(MouseEvent3D.MOUSE_OUT, handleMouseOut);			
			yCylinder.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDown);
			yCylinder.y = 50;
			yCylinder.rotationX = -90;
			this.addChild(yCylinder);			
			
			yCone = new Mesh(coneGeom, yAxisMaterial);
			yCone.name = "yAxis";
			yCone.pickingCollider = PickingColliderType.PB_BEST_HIT;
			yCone.mouseEnabled = true;
			yCone.addEventListener(MouseEvent3D.MOUSE_OVER, handleMouseOver);
			yCone.addEventListener(MouseEvent3D.MOUSE_OUT, handleMouseOut);			
			yCone.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDown);		
			yCone.rotationX = 90;
			yCone.y = 100 + (coneGeom.height/2);
			this.addChild(yCone);			
			
			zCylinder = new Mesh(cylGeom, zAxisMaterial);
			zCylinder.name = "zAxis";
			zCylinder.pickingCollider = PickingColliderType.PB_BEST_HIT;			
			zCylinder.mouseEnabled = true;
			zCylinder.addEventListener(MouseEvent3D.MOUSE_OVER, handleMouseOver);
			zCylinder.addEventListener(MouseEvent3D.MOUSE_OUT, handleMouseOut);			
			zCylinder.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDown);
			zCylinder.z = 50;
			this.addChild(zCylinder);			
			
			zCone = new Mesh(coneGeom, zAxisMaterial);
			zCone.name = "zAxis";
			zCone.pickingCollider = PickingColliderType.PB_BEST_HIT;
			zCone.mouseEnabled = true;
			zCone.addEventListener(MouseEvent3D.MOUSE_OVER, handleMouseOver);
			zCone.addEventListener(MouseEvent3D.MOUSE_OUT, handleMouseOut);			
			zCone.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDown);		
			zCone.rotationX = 180;
			zCone.z = 100 + (coneGeom.height/2);
			this.addChild(zCone);
		}
		
				
		protected function handleMouseOver(event:MouseEvent3D):void
		{
		
		}
		protected function handleMouseOut(event:MouseEvent3D):void
		{
			
		}
		protected function handleMouseDown(event:MouseEvent3D):void
		{
			
		}
	}
}