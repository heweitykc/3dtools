package controls 
{
	import away3d.core.pick.PickingColliderType;
	import away3d.entities.*;
	import away3d.entities.Mesh;
	import away3d.events.MouseEvent3D;
	import away3d.primitives.*;
	import away3d.primitives.CylinderGeometry;
	import flash.events.MouseEvent;
	import flash.geom.*;
	import flash.geom.Vector3D;
	/**
	 * ...
	 * @author callee
	 */
	public class RotateGizmo3D extends Gizmo3DBase
	{
		private var xTorus:Mesh;
		private var xDirection:Mesh;
		private var yTorus:Mesh;
		private var zTorus:Mesh;
		
		private var sphere:Mesh;
		
		private var freeXAxis:Vector3D = new Vector3D();
		private var freeYAxis:Vector3D = new Vector3D();
		private var freeZAxis:Vector3D = new Vector3D();
		private var lines:SegmentSet;
		private var xLine:LineSegment;
		private var yLine:LineSegment;
		private var zLine:LineSegment;
		
		private var behindGizmoPlane : Boolean;
				
		public function RotateGizmo3D() 
		{	
			var sphereGeom:SphereGeometry = new SphereGeometry(95, 16, 12, true);
			
			sphere = new Mesh(sphereGeom, sphereMaterial);
			sphere.name = "allAxis";
			sphere.pickingCollider = PickingColliderType.AS3_BEST_HIT;
			sphere.mouseEnabled = true;
			sphere.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDown);
			this.addChild(sphere);
			
			var torusGeometry:TorusGeometry = new TorusGeometry(100, 5, 30, 8, false);
			var cylGeom:CylinderGeometry = new CylinderGeometry(5, 5, 100, 16, 1, true, true, true, false);		
			
			xTorus = new Mesh(torusGeometry, xAxisMaterial);
			xTorus.name = "xAxis"; 
			xTorus.pickingCollider = PickingColliderType.AS3_BEST_HIT;
			xTorus.mouseEnabled = true;
			xTorus.addEventListener(MouseEvent3D.MOUSE_OVER, handleMouseOver);
			xTorus.addEventListener(MouseEvent3D.MOUSE_OUT, handleMouseOut);
			xTorus.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDown);
			xTorus.rotationY = 90;
			content.addChild(xTorus);
			
			xDirection = new Mesh(cylGeom, xAxisMaterial);
			xDirection.y = 50;
			xDirection.rotationX = -90;
			xTorus.addChild(xDirection);			
			
			yTorus = new Mesh(torusGeometry, yAxisMaterial);
			yTorus.name = "yAxis";
			yTorus.pickingCollider = PickingColliderType.AS3_BEST_HIT;
			yTorus.mouseEnabled = true;
			yTorus.addEventListener(MouseEvent3D.MOUSE_OVER, handleMouseOver);
			yTorus.addEventListener(MouseEvent3D.MOUSE_OUT, handleMouseOut);			
			yTorus.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDown);
			yTorus.rotationX = -90;
			content.addChild(yTorus);				
			
			zTorus = new Mesh(torusGeometry, zAxisMaterial);
			zTorus.name = "zAxis";
			zTorus.pickingCollider = PickingColliderType.AS3_BEST_HIT;
			zTorus.mouseEnabled = true;
			zTorus.addEventListener(MouseEvent3D.MOUSE_OVER, handleMouseOver);
			zTorus.addEventListener(MouseEvent3D.MOUSE_OUT, handleMouseOut);			
			zTorus.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDown);
			content.addChild(zTorus);			
			
			lines = new SegmentSet();	
			
			zLine = new LineSegment(new Vector3D(), new Vector3D(), 0xFFCC00, 0xFFCC00, 3);
			lines.addSegment(zLine);			
			
			xLine = new LineSegment(new Vector3D(), new Vector3D(), 0xFF0000, 0xFF0000, 3);
			lines.addSegment(xLine);
			
			yLine = new LineSegment(new Vector3D(), new Vector3D(), 0xCC99CC, 0xCC99CC, 3);
			lines.addSegment(yLine);			
			
			this.addChild(lines);
		}
		
		protected function handleMouseOut(event:MouseEvent3D):void
		{
			if (!active) 
			{
				switch(event.target.name)
				{
					case "xAxis":
												
						xTorus.material = xAxisMaterial;
						
						break;
					
					case "yAxis":
						
						yTorus.material = yAxisMaterial;
						
						break;
					
					case "zAxis":
						
						zTorus.material = zAxisMaterial;
						
						break;								
				}							
			}			
		}
		
		protected function handleMouseOver(event:MouseEvent3D):void
		{
			if (!active) 
			{
				switch(event.target.name)
				{
					case "xAxis":
						
						xTorus.material = highlightOverMaterial;
						
						break;
					
					case "yAxis":
						
						yTorus.material = highlightOverMaterial;
						
						break;
					
					case "zAxis":
						
						zTorus.material = highlightOverMaterial;
						
						break;								
				}							
			}			
		}
		
		protected function handleMouseDown(e:MouseEvent3D):void
		{
			currentAxis = e.target.name;	
			
			behindGizmoPlane = this.scenePosition.subtract(e.scenePosition).z > 0; //e.scenePosition.z > 0;
			
			click.x = ToolManager.stage.mouseX;
			click.y = ToolManager.stage.mouseY;
			
			click2.x = ToolManager.stage.mouseX;
			click2.y = ToolManager.stage.mouseY;
			
			switch(currentAxis)
			{
				case "xAxis":
					
					xTorus.material = highlightDownMaterial;
					
					break;
				
				case "yAxis":
					
					yTorus.material = highlightDownMaterial;
					
					break;
				
				case "zAxis":
					
					zTorus.material = highlightDownMaterial;
					
					break;				
				
				case "allAxis":				
					
					sphere.material = sphereHighlightMaterial;
					
					break;					
			}
			
			ToolManager.stage.addEventListener(MouseEvent.MOUSE_UP, handleMouseUp);
			ToolManager.stage.addEventListener(MouseEvent.MOUSE_MOVE, handleMouseMove);
		}
		
		protected function handleMouseMove(e:MouseEvent):void
		{
			
		}
		
		protected function handleMouseUp(e:MouseEvent):void
		{
			
		}
	}

}