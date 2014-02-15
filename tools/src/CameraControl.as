package  
{
	import away3d.cameras.Camera3D;
	import away3d.cameras.lenses.PerspectiveLens;
	import away3d.controllers.FirstPersonController;
	import flash.display.Stage;
	import flash.events.*;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author callee
	 */
	public class CameraControl 
	{
		private var _camera:Camera3D;
		private var _stage:Stage;
		
		private var _controller:FirstPersonController;
		
		private var move:Boolean = false;
		private var lastPanAngle:Number;
		private var lastTiltAngle:Number;
		private var lastMouseX:Number;
		private var lastMouseY:Number;

		//movement variables
		private var drag:Number = 0.5;
		private var walkIncrement:Number = 10;
		private var strafeIncrement:Number = 10;
		private var walkSpeed:Number = 0;
		private var strafeSpeed:Number = 0;
		private var walkAcceleration:Number = 0;
		private var strafeAcceleration:Number = 0;
		
		public function CameraControl(camera:Camera3D, stage:Stage) 
		{
			_camera = camera;
			_controller = new FirstPersonController(camera);
			_stage = stage;
			
			init();
		}
		
		private function init():void
		{
			_stage.addEventListener(Event.ENTER_FRAME, onLoop);
			_stage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, onMouseDown);
			_stage.addEventListener(MouseEvent.RIGHT_MOUSE_UP, onMouseUp);
			_stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			_stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			_stage.addEventListener(MouseEvent.MOUSE_WHEEL, onWheel);
		}
		
		private function onWheel(evt:MouseEvent):void
		{
			_camera.moveForward(evt.delta*10);
		}
		
		private function onMouseDown(evt:MouseEvent):void
		{
			move = true;
			lastPanAngle = _controller.panAngle;
			lastTiltAngle = _controller.tiltAngle;
			lastMouseX = _stage.mouseX;
			lastMouseY = _stage.mouseY;
			_stage.addEventListener(Event.MOUSE_LEAVE, onStageMouseLeave);
		}
		
		private function onMouseUp(evt:MouseEvent):void
		{
			move = false;
			_stage.removeEventListener(Event.MOUSE_LEAVE, onStageMouseLeave);
		}
		
		private function onStageMouseLeave(event:Event):void
		{
			move = false;
			_stage.removeEventListener(Event.MOUSE_LEAVE, onStageMouseLeave);
		}
		
		private function onKeyDown(evt:KeyboardEvent):void
		{
			switch (evt.keyCode) {
				case Keyboard.UP:
				case Keyboard.W:
					walkAcceleration = walkIncrement;
					break;
				case Keyboard.DOWN:
				case Keyboard.S:
					walkAcceleration = -walkIncrement;
					break;
				case Keyboard.LEFT:
				case Keyboard.A:
					strafeAcceleration = -strafeIncrement;
					break;
				case Keyboard.RIGHT:
				case Keyboard.D:
					strafeAcceleration = strafeIncrement;
					break;
			}
		}
		
		private function onKeyUp(evt:KeyboardEvent):void
		{
			switch (evt.keyCode) {
				case Keyboard.UP:
				case Keyboard.W:
				case Keyboard.DOWN:
				case Keyboard.S:
					walkAcceleration = 0;
					break;
				case Keyboard.LEFT:
				case Keyboard.A:
				case Keyboard.RIGHT:
				case Keyboard.D:
					strafeAcceleration = 0;
					break;
			}
		}
		
		private function onLoop(evt:Event):void
		{
			//_camera.y += 0.2*(terrain.getHeightAt(_camera.x, _camera.z) + 20 - _camera.y);

			if (move) {
				_controller.panAngle = 0.2*(_stage.mouseX - lastMouseX) + lastPanAngle;
				_controller.tiltAngle = 0.2*(_stage.mouseY - lastMouseY) + lastTiltAngle;
			}

			if (walkSpeed || walkAcceleration) {
				walkSpeed = (walkSpeed + walkAcceleration)*drag;
				if (Math.abs(walkSpeed) < 0.01)
					walkSpeed = 0;
				//_controller.incrementWalk(walkSpeed);
				_camera.moveForward(walkSpeed);
			}

			if (strafeSpeed || strafeAcceleration) {
				strafeSpeed = (strafeSpeed + strafeAcceleration)*drag;
				if (Math.abs(strafeSpeed) < 0.01)
					strafeSpeed = 0;
				//_controller.incrementStrafe(strafeSpeed);
				_camera.moveRight(strafeSpeed);
			}
		}
	}

}