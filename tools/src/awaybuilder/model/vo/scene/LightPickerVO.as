package awaybuilder.model.vo.scene
{
	import away3d.lights.LightBase;
	import away3d.materials.lightpickers.StaticLightPicker;
	
	import awaybuilder.utils.AssetUtil;
	import awaybuilder.utils.DataMerger;
	
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.events.PropertyChangeEvent;

	[Bindable]
	public class LightPickerVO extends AssetVO
	{
		
		public var lights:ArrayCollection; // SharedLightVO
		
		public function clone():LightPickerVO
		{
			var vo:LightPickerVO = new LightPickerVO();
			vo.fillLightPicker( this );
			return vo;
		}
		public function fillLightPicker( asset:LightPickerVO ):void
		{
			if (asset.lights) this.lights = new ArrayCollection( asset.lights.source.concat() );
			this.name = asset.name;
		}
		
	}
}