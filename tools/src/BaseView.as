package  
{
import away3d.containers.*;
	import away3d.controllers.FirstPersonController;
	import away3d.entities.*;
	import away3d.materials.*;
	import away3d.primitives.*;
	import away3d.utils.*;

	import flash.display.*;
	import flash.events.*;
	import flash.geom.Vector3D;

	public class BaseView extends Sprite
	{
		//engine variables
		protected var _view:View3D;

		//scene objects
		private var _plane:Mesh;

		/**
		 * Constructor
		 */
		public function BaseView()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;

			//setup the view
			_view = new View3D();
			addChild(_view);

			//setup the camera
			_view.camera.z = -1000;
			_view.camera.y = 500;
			_view.camera.lookAt(new Vector3D());

			init();
			
			//setup the render loop
			addEventListener(Event.ENTER_FRAME, _onEnterFrame);
			stage.addEventListener(Event.RESIZE, onResize);
			onResize();			
		}
		
		protected function init():void
		{
			//setup the scene
			_plane = new Mesh(new PlaneGeometry(700, 700), new TextureMaterial(Cast.bitmapTexture(Assets.FloorDiffuse)));
			_view.scene.addChild(_plane);
		}
		
		protected function loop():void
		{
			_plane.rotationY += 1;
		}

		/**
		 * render loop
		 */
		private function _onEnterFrame(e:Event):void
		{
			loop();
			_view.render();
		}

		/**
		 * stage listener for resize events
		 */
		private function onResize(event:Event = null):void
		{
			_view.width = stage.stageWidth;
			_view.height = stage.stageHeight;
		}
	}
}