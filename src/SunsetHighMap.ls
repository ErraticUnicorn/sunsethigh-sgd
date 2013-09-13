package
{
    //check with DW re which imports specifically support the maps
    import cocos2d.CCLayer;
    import cocos2d.CCScaledLayer;
    import cocos2d.CCSprite;
    import cocos2d.CCRect;
    import cocos2d.CCSpriteFrame;
    import cocos2d.CCScene;
    import cocos2d.CCNode;

	import Loom.GameFramework.AnimatedComponent;
    import Loom.GameFramework.LoomComponent;
    import Loom.GameFramework.LoomGroup;
    import Loom.GameFramework.LoomGameObject;
    
    //probably need an import line for 'Map' class, which is now separate

    public class SunsetHighMap extends CCNode
    {
        //layers for adding
        public static var bg:CCLayer;
        public static var fg:CCLayer;
		public var walls:Vector.<CCRect> = [];
		
        //declare all maps here
        public static var hall:Hall;
        
        //math setup
        public static var math:CCSprite;
    	public static var lbwall:CCRect;
    	public static var llwall:CCRect;
    	public static var uuwall:CCRect;
    	public static var rrwall:CCRect;
    	public static var rbwall:CCRect;
    	public static var desk1:CCRect;
    	
    	//science class and its objects
    	public static var science:CCSprite;
    	
    	//bathroom and its objects
    	public static var bathroom:CCSprite;
    	public static var bullyprank:CCSprite;
    	
    	//yard and its objects
    	public static var yard:CCSprite;
    	public static var flowers:CCSprite;
    	
    	//library and its objects
    	public static var library:CCSprite;
    	public static var promvotes:CCSprite;
    	
    	//cafeteria and its objects
    	public static var cafeteria:CCSprite;
    	
    	
    	public static var offscreen:Number = 1000;
    	
        //public static var math:Map;
        //public static var lib:Map;
        //public static var sci:Map;
        //public static var park:Map;
        //public static var cafe:Map;
        
        
        protected var scene:CCScene;
        public var background:CCSprite;
        
        public function getScene():CCScene
        {
            return scene;
        }

        public function SunsetHighMap()
        {
        
        	scene = CCScene.create();
            bg = CCLayer.create();
            this.addChild(bg);
            fg = CCLayer.create();
            this.addChild(fg, 5);
            
            

            this.buildMaps();
        }

        public function buildMaps():void        //<--change return type to array of SHMap obj's
        {
        	background = CCSprite.createFromFile("assets/images/cloudbackground.png");
        	background.x = 1000;
        	background.y = 500;
        	bg.addChild(background);
        	
            hall = new Hall();
            byeWalls();
            fg.addChild(hall.getMap());

            mathMap();
            libraryMap();
            scienceMap();
            parkMap();
            broomMap();
            cafeMap();
        }
        
        public function mathMap():void
        {
            //create new instance of Map;
            //I call this instance "math" so I changed the generic
            //variable name (above) to "room" for clarity
           	math = CCSprite.createFromFile("assets/locations/math.png");
			math.x = 640;
			math.y = 1850;
			fg.addChild(math);
			
			


            //variables can be declared here (and set elsewhere through functions
            //like 'math.door.set()' to control which doors are 'on' or 'off';
            //this is in case adding and removing layers on screen leaves them active

        }
		public function mathWalls(){
			lbwall.setRect(328, 40, 255,64);
    		walls.push(lbwall);
    		llwall.setRect(329, 95, 29, 584);
    		walls.push(llwall);
   			uuwall.setRect(358, 619, 596, 40);
   			walls.push(uuwall);
   			rrwall.setRect(938, 96, 29, 584);
   			walls.push(rrwall);
  			rbwall.setRect(713, 40, 255, 64);
    		walls.push(rbwall);
		}
		
		public function scienceWalls(){
			lbwall.setRect(625, 79, 257, 51);
    		walls.push(lbwall);
    		llwall.setRect(558, 113, 51, 589);
    		walls.push(llwall);
   			uuwall.setRect(634, 649, 612, 43);
   			walls.push(uuwall);
   			rrwall.setRect(1251, 116, 33, 580);
   			walls.push(rrwall);
  			rbwall.setRect(1047, 77, 206, 52);
    		walls.push(rbwall);
		}
		
		public function broomWalls(){
			lbwall.setRect(745, 79, 137, 65);
    		walls.push(lbwall);
    		llwall.setRect(700, 111, 53, 350);
    		walls.push(llwall);
   			uuwall.setRect(716, 386, 458, 46);
   			walls.push(uuwall);
   			rrwall.setRect(1176, 111, 46, 323);
   			walls.push(rrwall);
  			rbwall.setRect(1045, 80, 131, 62);
    		walls.push(rbwall);
		}
		
		public function libWalls(){
			lbwall.setRect(332, 736, 240, 56);
    		walls.push(lbwall);
    		llwall.setRect(333, 117, 48, 641);
    		walls.push(llwall);
   			uuwall.setRect(350, 108, 641, 47);
   			walls.push(uuwall);
   			rrwall.setRect(961, 113, 55, 639);
   			walls.push(rrwall);
  			rbwall.setRect(253, 671, 131, 94);
    		walls.push(rbwall);
		}
		
		public function yardWalls(){
			lbwall.setRect(425, 778, 672, 55);
    		walls.push(lbwall);
    		llwall.setRect(337, 110, 73, 680);
    		walls.push(llwall);
   			uuwall.setRect(426, 83, 680, 38);
   			walls.push(uuwall);
   			rrwall.setRect(1094, 107, 49, 675);
   			walls.push(rrwall);
		}
		public function cafeWalls(){
			lbwall.setRect(223, 129, 67, 635);
			walls.push(lbwall);
			llwall.setRect(264, 704, 952, 62);
			walls.push(llwall);
			uuwall.setRect(1187, 128, 65, 609);
			walls.push(uuwall);
			rrwall.setRect(291, 125, 961, 61);
			walls.push(rrwall);
		}
		public function byeWalls(){
			lbwall.setRect(311, 382, 86, 503);
    		walls.push(lbwall);
    		llwall.setRect(387, 875, 1133, 92);
    		walls.push(llwall);
   			uuwall.setRect(1521, 431, 70, 465);
   			walls.push(uuwall);
   			rrwall.setRect(397, 318, 1123, 92);
   			walls.push(rrwall);
  			rbwall.setRect(713, 40 - offscreen, 255, 64);
    		walls.push(rbwall);
    		desk1.setRect(595, 229 - offscreen, 61, 21);
    		walls.push(desk1);
		}
        public function libraryMap():void
        {
            
			library = CCSprite.createFromFile("assets/locations/library.png");
			library.x = 640;
			library.y = -1850;
			fg.addChild(library);
			promvotes = CCSprite.createFromFile("assets/images/promvotes.png");
			promvotes.x = 521;
			promvotes.y = -1693;
			fg.addChild(promvotes);

        }

        public function scienceMap():void
        {
            science = CCSprite.createFromFile("assets/locations/science.png");
			science.x = 1640;
			science.y = 1850;
			fg.addChild(science);
			


        }

        public function parkMap():void
        {
			
			yard = CCSprite.createFromFile("assets/locations/park.png");
			yard.x = 1640;
			yard.y = -1850;
			fg.addChild(yard);
			flowers = CCSprite.createFromFile("assets/images/flowers.png");
			flowers.x = 1025;
			flowers.y = -1179;
			fg.addChild(flowers);


        }

        public function broomMap():void
        {
            bathroom = CCSprite.createFromFile("assets/locations/bathroom.png");
			bathroom.x = 1200;
			bathroom.y = 1850;
			fg.addChild(bathroom);
			bullyprank = CCSprite.createFromFile("assets/images/bullyprank.png");
			bullyprank.x = 961;
			bullyprank.y = -1329;
			bullyprank.setVisible(false);
			fg.addChild(bullyprank);

        }
        
        public function cafeMap():void
        {
        	cafeteria = CCSprite.createFromFile("assets/locations/cafeteria.png");
			cafeteria.x = 1640;
			cafeteria.y  = -1621;
			fg.addChild(cafeteria);
        }
        
        public function addObject(sprite:CCSprite):CCSprite
        {
            sprite = CCSprite.createFromFile("assets/images/CharsetRed2.png");
            sprite.x = 427;
            sprite.y = 604;
            fg.addChild(sprite);

            return sprite;
        }

    }
}