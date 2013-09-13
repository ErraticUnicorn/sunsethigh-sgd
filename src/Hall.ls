package{
	import cocos2d.Cocos2DGame;
    import cocos2d.CCSprite;
    import cocos2d.CCRect;
    import cocos2d.CCSpriteFrame;
    
    import cocos2d.Cocos2D;
    import cocos2d.ccColor3B;
    import System.Number;
    import cocos2d.ScaleMode;

    import UI.Label;

    import Loom.GameFramework.AnimatedComponent;
    import Loom.GameFramework.LoomComponent;
    import Loom.GameFramework.LoomGroup;
    import Loom.GameFramework.LoomGameObject;
    
    import Loom.Animation.Tween;
    import Loom.Animation.EaseType;
	
	public class Hall extends CCSprite{
		public static var map:CCSprite;
		public static var mdoor:CCRect;
    	public static var sdoor:CCRect;
    	public static var bdoor:CCRect;
    	public static var ldoor:CCRect;
    	public static var odoor:CCRect;
    	public static var cdoor:CCRect;
    	public static var cheerlocker:CCRect;
    	private static var offscreen:Number;
    	
    	
    	public function Hall(){
    		map = CCSprite.createFromFile("assets/locations/hall.png");
			map.x = 960;
			map.y = 640;
			mdoor = new CCRect();
			mdoor.setRect(609, 848, 50, 50);
			sdoor = new CCRect();
			sdoor.setRect(1325, 847, 50, 50);
			bdoor = new CCRect();
			bdoor.setRect(910, 849, 50, 50);
			ldoor = new CCRect();
			ldoor.setRect(772, 395, 50, 50);
			odoor = new CCRect();
			odoor.setRect(1129, 395, 50, 50);
			cdoor = new CCRect();
			cdoor.setRect(1504, 595, 47, 30);
			cheerlocker = new CCRect();
			cheerlocker.setRect(546, 441, 30, 30);
    	
    	}
    	
    	public function getMap():CCSprite{
    		return map;
    	}
    	
    	private static function setOriginalState():void{
    		mdoor.setRect(609, 848, 50, 50);
			sdoor.setRect(1325, 847, 50, 50);
			bdoor.setRect(910, 849, 50, 50);
			ldoor.setRect(772, 395, 50, 50);
			odoor.setRect(1129, 395, 50, 50);
			cdoor.setRect(1502, 586, 50, 50);
			cheerlocker.setRect(546, 441, 30, 30);
    	}
    	
    	
    	public static function setDoor(location:String):void{
    		if(location == "hall"){
    			setOriginalState();
    		}
    		if(location == "math"){
    			mdoor.setRect(585, 8, 127, 50);	
    			
    			
    			sdoor.setRect(1325, -1000, 50, 50);
				bdoor.setRect(910, -1000, 50, 50);
				ldoor.setRect(772, -1000, 50, 50);
				odoor.setRect(1129, -1000, 50, 50);
				cdoor.setRect(1504, -1000, 47, 30);
				cheerlocker.setRect(546, -1000, 30, 30);
    		}
    		if(location == "science"){
    			sdoor.setRect(891, 32, 127, 50);
    			
    			mdoor.setRect(609,  -1000, 50, 50);
    			bdoor.setRect(910,  -1000, 50, 50);
				ldoor.setRect(772, -1000, 50, 50);
				odoor.setRect(1129, -1000, 50, 50);
				cdoor.setRect(1504, -1000, 47, 30);
				cheerlocker.setRect(546, -1000, 30, 30);
    		}
    		if(location == "bathroom"){
    			bdoor.setRect(889, 42, 127, 50);
    			
    			mdoor.setRect(609, -1000, 50, 50);
    			sdoor.setRect(1325, -1000, 50, 50);
				ldoor.setRect(772, -1000, 50, 50);
				odoor.setRect(1129, -1000, 50, 50);
				cdoor.setRect(1504,-1000, 47, 30);
				cheerlocker.setRect(546, -1000, 30, 30);
    		}
    		if(location == "library"){
    			ldoor.setRect(575, 749, 127, 50);
    			
    			mdoor.setRect(609,-1000, 50, 50);
    			sdoor.setRect(1325,-1000, 50, 50);
    			bdoor.setRect(910,-1000, 50, 50);
				odoor.setRect(1129, -1000, 50, 50);
				cdoor.setRect(1504,-1000, 47, 30);
				cheerlocker.setRect(546, -1000, 30, 30);
    		}
    		if(location == "yard"){
    			odoor.setRect(668, 749, 127, 50);
    			
    			mdoor.setRect(609, -1000, 50, 50);
    			sdoor.setRect(1325,-1000, 50, 50);
    			bdoor.setRect(910, -1000, 50, 50);
				ldoor.setRect(772,  -1000, 50, 50);
				cdoor.setRect(1504, -1000, 47, 30);
				cheerlocker.setRect(546, -1000, 30, 30);
    		}
    		
    		if(location == "cafeteria"){
    			cdoor.setRect(231, -1000, 127, 50);
    			mdoor.setRect(609, -1000, 50, 50);
    			sdoor.setRect(1325,-1000, 50, 50);
    			bdoor.setRect(910, -1000, 50, 50);
				ldoor.setRect(772,  -1000, 50, 50);
				odoor.setRect(1129, -1000, 50, 50);
				cheerlocker.setRect(546, -1000, 30, 30);
    		}
    		
    			
    	}
    	
    	public static function tweenOff():void{
    		Tween.to(map, 0.5, {"y": -1000, "ease": EaseType.EASE_IN_BACK});
    	}
    	
    	public static function tweenOn():void{
       		Tween.to(map, 0.5, { "y": 640, "ease": EaseType.EASE_IN_BACK});
        }
	
	} 



}