package{

	import cocos2d.Cocos2DGame;
    import cocos2d.CCSprite;
    import cocos2d.CCRect;
    import cocos2d.CCSpriteFrame;
    
    import cocos2d.Cocos2D;
    import cocos2d.CCTMXTiledMap;
    import cocos2d.ccColor3B;
    import System.Number;
    import cocos2d.ScaleMode;

    import UI.Label;

    import Loom.GameFramework.AnimatedComponent;
    import Loom.GameFramework.LoomComponent;
    import Loom.GameFramework.LoomGroup;
    import Loom.GameFramework.LoomGameObject;

    import Loom.Physics.Physics;
    import Loom.Physics.PhysicsWall;
    import Loom.Physics.PhysicsBall;
    import Loom.Platform.Timer;
    
    import Loom.Platform.LoomKey;
    
   	import Loom.Animation.Tween;
    import Loom.Animation.EaseType;
    
    public class Pickpocket{
    	public var pickpocketnumber:Number;
	   	public var ppscores:Vector.<Number>;
	   	public var time:Timer;
	   	public var pptext:Label;
	   	
	   	public function Pickpocket(){
	   		pptext = new Label("assets/curse-hd.fnt");
	   		pptext.x = 300;
	   		pptext.y = 300;
	   		pptext.scale = 0.5;
	   		pptext.setVisible(false);
	   	}
	   	
	   	public function getText():Label{
	   		return pptext;
	   	}
	   	public function textVisible(visible:Boolean)
	   	{
	   		if(visible)
	   			pptext.setVisible(true);
	   		if(!visible)
	   			pptext.setVisible(false);
	   	}
	   	
	   	public function alterText(a:String){
	   		pptext.text = a;
	   	}
	   	
	   	 public function stopTime(){
        	time.stop();
        }
	   	
	   	public function startPickpocket(difficulty:Number){
	   		if(difficulty == 1)
         	time = new Timer(5000); 
         	if(difficulty == 2)
         	time = new Timer(4000); 
         	if(difficulty == 3)
         	time = new Timer(3000); 
         	if(difficulty == 4)
         	time = new Timer(2000); 
         	if(difficulty == 5)
         	time = new Timer(1000); 
         	if(difficulty == 6)
         	time = new Timer(500); 
         	
         	
         	for(var i = 0; i < 6; i++){
         	
         	ppscores.pushSingle(toKeyCode(Math.floor(Math.random()*10)));
         	
         	}	
      		pickpocketnumber = 0;
      		
      		
      		pptext.text = "Remeber these numbers: " + toKeyCode(ppscores[0]) + "," + toKeyCode(ppscores[1]) + "," + toKeyCode(ppscores[2]) + "," + toKeyCode(ppscores[3]) + "," + toKeyCode(ppscores[4]) + "," + toKeyCode(ppscores[5]);      
    
			//time.onComplete = pickpocketAction;
        	time.start();
	   	}
	   	
	   	protected function toKeyCode(number:Number):Number{
        
        if(number == 0)
        return 39;
         if(number == 1)
        return 30;
         if(number == 2)
        return 31;
         if(number == 3)
        return 32;
         if(number == 4)
        return 33;
         if(number == 5)
        return 34;
         if(number == 6)
        return 35;
         if(number == 7)
        return 36;
         if(number == 8)
        return 37;
        if(number == 9)
        return 38;
           if(number == 39)
        return 0;
         if(number == 30)
        return 1;
         if(number == 31)
        return 2;
         if(number == 32)
        return 3;
         if(number == 33)
        return 4;
         if(number == 34)
        return 5;
         if(number == 35)
        return 6;
         if(number == 36)
        return 7;
         if(number == 37)
        return 8;
        if(number == 38)
        return 9;
        
        
        }
        
        
    
    }

}