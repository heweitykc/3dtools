package controls 
{
	import away3d.entities.Mesh;
	import away3d.containers.ObjectContainer3D;
	import away3d.primitives.ConeGeometry;
	import away3d.primitives.CylinderGeometry;
	import away3d.materials.ColorMaterial;
	import away3d.core.pick.PickingColliderType;
	import away3d.events.MouseEvent3D;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	/**
	 * ...
	 * @author callee
	 */
	public class TranslateGizmo3D extends ObjectContainer3D
	{		
		public var active:Boolean = false;
		public var currentAxis:String = "";
		
		protected var xAxisMaterial:ColorMaterial = new ColorMaterial(0xff0000, 1);
		protected var yAxisMaterial:ColorMaterial = new ColorMaterial(0x00cc00, 1);
		protected var zAxisMaterial:ColorMaterial = new ColorMaterial(0x0033ff, 1);
		protected var highlightOverMaterial:ColorMaterial = new ColorMaterial(0xffcc00);
		protected var highlightDownMaterial:ColorMaterial = new ColorMaterial(0xfff000);
		
		private var xCylinder:Mesh;
		private var yCylinder:Mesh;
		private var zCylinder:Mesh;
		
		private var xCone:Mesh;
		private var yCone:Mesh;
		private var zCone:Mesh;
		
		protected var click:Point = new Point();
		protected var startScenePosition:Vector3D;
		protected var content:ObjectContainer3D;
		
		public function TranslateGizmo3D() 
		{
			content = new ObjectContainer3D();
			this.addChild(content);
			
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
			content.addChild(xCylinder);		
			
			xCone = new Mesh(coneGeom, xAxisMaterial);
			xCone.name = "xAxis";
			xCone.pickingCollider = PickingColliderType.PB_BEST_HIT;
			xCone.mouseEnabled = true;
			xCone.addEventListener(MouseEvent3D.MOUSE_OVER, handleMouseOver);
			xCone.addEventListener(MouseEvent3D.MOUSE_OUT, handleMouseOut);			
			xCone.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDown);	
			xCone.rotationY = -90;
			xCone.x = 100 + (coneGeom.height/2);
			content.addChild(xCone);					
			
			yCylinder = new Mesh(cylGeom, yAxisMaterial);
			yCylinder.name = "yAxis";
			yCylinder.pickingCollider = PickingColliderType.PB_BEST_HIT;
			yCylinder.mouseEnabled = true;
			yCylinder.addEventListener(MouseEvent3D.MOUSE_OVER, handleMouseOver);
			yCylinder.addEventListener(MouseEvent3D.MOUSE_OUT, handleMouseOut);			
			yCylinder.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDown);
			yCylinder.y = 50;
			yCylinder.rotationX = -90;
			content.addChild(yCylinder);			
			
			yCone = new Mesh(coneGeom, yAxisMaterial);
			yCone.name = "yAxis";
			yCone.pickingCollider = PickingColliderType.PB_BEST_HIT;
			yCone.mouseEnabled = true;
			yCone.addEventListener(MouseEvent3D.MOUSE_OVER, handleMouseOver);
			yCone.addEventListener(MouseEvent3D.MOUSE_OUT, handleMouseOut);			
			yCone.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDown);		
			yCone.rotationX = 90;
			yCone.y = 100 + (coneGeom.height/2);
			content.addChild(yCone);			
			
			zCylinder = new Mesh(cylGeom, zAxisMaterial);
			zCylinder.name = "zAxis";
			zCylinder.pickingCollider = PickingColliderType.PB_BEST_HIT;			
			zCylinder.mouseEnabled = true;
			zCylinder.addEventListener(MouseEvent3D.MOUSE_OVER, handleMouseOver);
			zCylinder.addEventListener(MouseEvent3D.MOUSE_OUT, handleMouseOut);			
			zCylinder.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDown);
			zCylinder.z = -50;
			content.addChild(zCylinder);			
			
			zCone = new Mesh(coneGeom, zAxisMaterial);
			zCone.name = "zAxis";
			zCone.pickingCollider = PickingColliderType.PB_BEST_HIT;
			zCone.mouseEnabled = true;
			zCone.addEventListener(MouseEvent3D.MOUSE_OVER, handleMouseOver);
			zCone.addEventListener(MouseEvent3D.MOUSE_OUT, handleMouseOut);			
			zCone.addEventListener(MouseEvent3D.MOUSE_DOWN, handleMouseDown);		
			zCone.rotationX = 180;
			zCone.z = 100 + (coneGeom.height/2);
			content.addChild(zCone);
		}
		
				
		protected function handleMouseOver(event:MouseEvent3D):void
		{
			if (!active) 
			{
				switch(event.target.name)
				{
					case "xAxis":
						
						xCone.material = highlightOverMaterial;
						xCylinder.material = highlightOverMaterial;
						
						break;
					
					case "yAxis":
						
						yCone.material = highlightOverMaterial;
						yCylinder.material = highlightOverMaterial;
						
						break;
					
					case "zAxis":
						
						zCone.material = highlightOverMaterial;
						zCylinder.material = highlightOverMaterial;
						
						break;								
				}							
			}			
		}
		
		protected function handleMouseOut(event:MouseEvent3D):void
		{
			if (!active) 
			{
				switch(event.target.name)
				{					
					case "xAxis":
						
						xCone.material = xAxisMaterial;
						xCylinder.material = xAxisMaterial;
						break;
					case "yAxis":
						yCone.material = yAxisMaterial;
						yCylinder.material = yAxisMaterial;
						break;
					
					case "zAxis":
						zCone.material = zAxisMaterial;
						zCylinder.material = zAxisMaterial;
						break;								
				}							
			}		
		}
		
		protected function handleMouseDown(e:MouseEvent3D):void
		{
			currentAxis = e.target.name;
			active = true;
			click.x = ToolManager.stage.mouseX;
			click.y = ToolManager.stage.mouseY;
			startScenePosition = ToolManager.instance.dragObj.parent.scenePosition.clone();
			
			switch(currentAxis)
			{
				case "xAxis":
					xCone.material = highlightDownMaterial;
					xCylinder.material = highlightDownMaterial;
					break;
				case "yAxis":
					yCone.material = highlightDownMaterial;
					yCylinder.material = highlightDownMaterial;
					break;
				case "zAxis":
					zCone.material = highlightDownMaterial;
					zCylinder.material = highlightDownMaterial;
					break;				
			}
			
			ToolManager.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			ToolManager.stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		
		protected function onMouseUp(e:MouseEvent):void
		{
			ToolManager.stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			ToolManager.stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			switch(currentAxis)
			{					
				case "xAxis":
					xCone.material = xAxisMaterial;
					xCylinder.material = xAxisMaterial;
					break;
				case "yAxis":
					yCone.material = yAxisMaterial;
					yCylinder.material = yAxisMaterial;
					break;
				
				case "zAxis":
					zCone.material = zAxisMaterial;
					zCylinder.material = zAxisMaterial;
					break;								
			}
			currentAxis = "";
			active = false;
		}
		
		protected function onMouseMove(e:MouseEvent):void
		{
			var dx:Number = ToolManager.stage.mouseX - click.x;
			var dy:Number = -(ToolManager.stage.mouseY - click.y);
			var trans:Number = (dx + dy) * (ToolManager.radius / 500);
			
			switch(currentAxis)
			{
				case "xAxis":
					var xv1:Vector3D = ToolManager.camera.rightVector;
					var xv2:Vector3D = content.rightVector; 
					xv1.normalize();
					xv2.normalize();
					var ax:Number = xv1.dotProduct(xv2);
					if (ax < 0) trans = -trans;
					this.translate(content.rightVector, trans);
					break;
				case "yAxis":
					var yv1:Vector3D = ToolManager.camera.upVector;
					var yv2:Vector3D = content.upVector; 			
					yv1.normalize();
					yv2.normalize();
					var ay:Number = yv1.dotProduct(yv2);
					if (ay < 0) trans = -trans;					
					this.translate(content.upVector, trans);
					break;
				case "zAxis":
					var zv1:Vector3D = ToolManager.camera.rightVector;
					var zv2:Vector3D = content.forwardVector; 			
					zv1.normalize();
					zv2.normalize();
					var az:Number = zv1.dotProduct(zv2);
					if (az < 0) trans = -trans;
					this.translate(content.forwardVector, trans);
					break;				
			}
			
			click.x = ToolManager.stage.mouseX;
			click.y = ToolManager.stage.mouseY;
			
			var pos:Vector3D = this.position.subtract(startScenePosition);
			pos = ToolManager.instance.dragObj.parent.inverseSceneTransform.deltaTransformVector(pos).add(ToolManager.instance.dragObj.position);
			ToolManager.instance.dragObj.x = this.x;
			ToolManager.instance.dragObj.y = this.y;
			ToolManager.instance.dragObj.z = this.z;
			trace(pos.x+" "+pos.y+" "+pos.z);
		}
	}
}