package
{
	import System.Platform.Platform;
	import System.Number;
	
    import cocos2d.Cocos2DGame;
    import cocos2d.CCSprite;
    import cocos2d.CCRect;
    import cocos2d.CCSize;
    import cocos2d.CCPoint;
    import cocos2d.CCSpriteFrame;
    import cocos2d.CCAnimation;
    import cocos2d.CCAnimationCache;
    
    import cocos2d.Cocos2D;
    import cocos2d.CCTMXTiledMap;
    import cocos2d.ccColor3B;
    import cocos2d.ScaleMode;
    
    import CocosDenshion.SimpleAudioEngine;
    

    import UI.Label;

    import Loom.GameFramework.AnimatedComponent;
    import Loom.GameFramework.LoomComponent;
    import Loom.GameFramework.LoomGroup;
    import Loom.GameFramework.LoomGameObject;

    import Loom.Physics.Physics;
    import Loom.Physics.PhysicsWall;
    import Loom.Physics.PhysicsBall;
    
    import Loom.Platform.LoomKey;
    import Loom.Platform.Timer;
    
   	import Loom.Animation.Tween;
    import Loom.Animation.EaseType;
    
    import cocos2d.CCDirector;

    public class Game extends Cocos2DGame
    {
    	//mapsetup
    	public static var school:SunsetHighMap;	
    	//charsetup
    	public var chars:Vector.<CCSprite> = [];
    	public var character:CCSprite;
    	
    	public static var moveDirX = 0.0;
	 	public static var moveDirY = 0.0;
	 	public var facing:int = 3;
    	public var isTalk:Boolean;
    	public var reputation:Number = 0;
    	
    	//jocksetup
    	public var jock:CCSprite;
    	public var jocktalk:Number = 0;
    	public var jocktalkquest:Number = 0;
    	public var jockQuest:Boolean = false;
    	public var jockQuestDone:Boolean = false;
    	public var jockQuestDoneTalk:Boolean = false;
    	
    	//cheerleader
    	public var cheerleader:CCSprite;
    	public var cheertalk:Number = 0;
    	public var cheertalkquest:Number = 0;
    	public var cheerQuest:Boolean = false;
    	public var cheerQuestDone:Boolean = false;
    	public var cheerDate:Boolean = true;
    	public var cheerQuestDoneTalk:Boolean = false;
    	
    	//nerd
    	public var nerd:CCSprite;
    	public var nerdtalk:Number = 0;
    	public var nerdtalkquest:Number = 0;
    	public var nerdQuest:Boolean = false;
    	public var nerdQuestDone:Boolean = false;
    	public var nerdQuestOpenLocker = false;
    	public var nerdQuestDoneTalk:Boolean = false;
    	
    	//scieenceteacher
    	public var sciteach:CCSprite;
    	
    	//teacher
    	public var teach:CCSprite;
    	
    	//bully
    	public var bully:CCSprite;
    	public var bullytalk:Number = 0;
    	public var bullytalkquest:Number = 0;
    	public var bullyquest:Boolean;
    	public var bullyQuestDone:Boolean;
    	public var bullyQuestDoneTalk:Boolean = false;
    	
    	//slacker
    	public var slacker:CCSprite;
    	public var slackertalk:Number = 0;
    	public var slackerQuest:Boolean = false;
    	public var slackertalkquest:Number = 0;
    	public var slackerQuestDone:Boolean = false;
    	public var slackerQuestDoneTalk:Boolean = false;
    	public var slackerDone = false;
    	
    	//prep
    	public var prep:CCSprite;
    	public var preptalk:Number = 0;
    	public var preptalkquest:Number = 0;
    	public var prepQuest:Boolean = false;
    	public var prepQuestDone:Boolean = false;
    	public var prepQuestDoneTalk:Boolean = false;
    	public var flowers:Boolean = false;
    	
    	public var convos:SunsetHighConvo;
    	
    	public var instr:Label;
    	public var cafetext:Label;
    	public var repStatus:Label;
    	
    	//pickpocket setup
    	public static var pickpocketnumber:Number;
    	public static var ppscores:Vector.<Number>;
    	public static var time:Timer;
    	
    	//offscreen
    	public static var offscreen:Number = 1000;
    	
    	//notes
    	public var notes:Vector.<Label>;
    	public var notebook:CCSprite;
    	
    	//conversation
    	public var convobox:CCSprite;
    	
    	//killersetup
    	public static var killerNumber:Number;
    	public static var inCafe:Boolean = false;
    	public static var instrcafe:Label;
    	public static var gameover:CCSprite;
    	public static var gamewin:CCSprite;
    	
    	//startscreen
        public static var startscreen:CCSprite;
        public static var bloodstain:CCSprite;
        public static var summary:Label;
        public static var isStart:Boolean = true;
        
    	//NPC
    	public static var npc:NPC;
    	public static var betatalk:Number = 0;
        override public function run():void
        {
            // Comment out this line to turn off automatic scaling.
            //layer.scaleMode = ScaleMode.FILL;

			
			
            super.run();
            SimpleAudioEngine.sharedEngine().preloadEffect("assets/gun-cocking-01.mp3");
            SimpleAudioEngine.sharedEngine().preloadEffect("assets/gun-gunshot-01.mp3");
            
			startscreen = CCSprite.createFromFile("assets/images/startscreen.png");
			startscreen.x = 1000;
			startscreen.y = 500;
			layer.addChild(startscreen, 10);
			
			bloodstain = CCSprite.createFromFile("assets/images/bloodstain.png");
			bloodstain.x = 1091;
			bloodstain.y = 275;
			layer.addChild(bloodstain, 11);
			bloodstain.setVisible(false);
			
			var color = new ccColor3B(0,0,0);
			summary = new Label("assets/Curse-hd.fnt");
			summary.text = "I don't know where she went...  (Click anywhere to continue)";
			summary.setPosition(805, 909);
			summary.setColor(color);
			summary.scale = .7;
			layer.addChild(summary, 12);
			var c:Number = 1;
			startscreen.onTouchBegan = function(id:int){
				nextText(c);
				c++
			};
			
			
			school = new SunsetHighMap();
			layer.addChild(school);
			
			npc = new NPC();
			layer.addChild(npc);
			
			//music
			SimpleAudioEngine.sharedEngine().playBackgroundMusic("assets/introsong.mp3", true);
			SimpleAudioEngine.sharedEngine().preloadBackgroundMusic("assets/winsong.mp3");
			SimpleAudioEngine.sharedEngine().preloadBackgroundMusic("assets/losesong.mp3");
			
			//convobox
			convobox = CCSprite.createFromFile("assets/images/conversationbox.png");
			convobox.x = 1670;
			convobox.y = 168;
			layer.addChild(convobox);
			
			instr = new Label("assets/Curse-hd.fnt");
			instr.text = "Press Q to talk, Z for quest, or E to Pickpocket";
			instr.x = 1665;
			instr.y = 200;
			instr.scale = 0.3;
			instr.setColor(color);
			layer.addChild(instr);
			instr.setVisible(false);
			
			cafetext = new Label("assets/Curse-hd.fnt");
			cafetext.text = "It's time for lunch, you can go to the cafeteria";
			cafetext.x = 1665;
			cafetext.y = 228;
			cafetext.scale = 0.3;
			cafetext.setColor(color);
			layer.addChild(cafetext);
			cafetext.setVisible(false);
			
			
			instrcafe = new Label("assets/Curse-hd.fnt");
			instrcafe.text = "The killer is in the cafeteria, Press Z to accuse\n You only have on chance";
			instrcafe.x = 1665;
			instrcafe.y = 200;
			instrcafe.scale = 0.3;
			instrcafe.setColor(color);
			layer.addChild(instrcafe);
			instrcafe.setVisible(false);
			
			repStatus = new Label("assets/Curse-hd.fnt");
			repStatus.setColor(color);
			repStatus.x = 200;
			repStatus.y = 978;
			repStatus.scale = 0.5;
			layer.addChild(repStatus);
			repStatus.setVisible(true);
			
			notebook = CCSprite.createFromFile("assets/images/notebook.png");
			notebook.x = 178;
			notebook.y  = 609;
			notebook.setVisible(false);
			
			//notebook.setColor(color);
			layer.addChild(notebook);
			notes = new Vector.<Label>(6);
			for(var i = 0; i <notes.length; i++){
				notes[i] = new Label("assets/Curse-hd.fnt");
				notes[i].scale = 0.2;
				notes[i].setColor(color);
				layer.addChild(notes[i]);
			}
			
			killerNumber = Math.floor(Math.random()*10);
			while(killerNumber >= 7){
				killerNumber = Math.floor(Math.random()*10);
			}
			
			convos = new SunsetHighConvo();
			convos.setClues(killerNumber);
			layer.addChild(convos.getHeroLine());
			layer.addChild(convos.getNPCLine());
			
            // Setup anything else, like UI, or game objects.
          	//charactersetup
          	
            var size:CCSize;
            size.width = 64;
    		size.height = 64;
            // Use this to identify the rect.
            var rect:CCRect;

            // Create the animation that will store our frames.
            var animation = CCAnimation.animation();
    		
    		for(var y = 0; y < 5; y++){
    			for(var x = 0; x < 5; x++){
    			rect.setRect(x * size.width, y * size.height, size.width, size.height);
    			var frame = CCSpriteFrame.create("assets/images/characters/CharsetRed1.png", rect, false, new CCPoint(), size);
                 animation.addSpriteFrame(frame);
    			}
    		}
			
			CCAnimationCache.sharedAnimationCache().addAnimation(animation, "walk");
			
    		character = CCSprite.create();
    		character.x = 435;
            character.y = 604;
            layer.addChild(character);
            
            
            //prep
            prep = CCSprite.createFromFile("assets/images/characters/othercharacters/prep.png");
            prep.x = 1495;
            prep.y = 525;
            chars.push(prep);
            layer.addChild(prep);
            
            //jock setup
            jock = CCSprite.createFromFile("assets/images/characters/othercharacters/jock.png");
            jock.x = 902;
            jock.y = 206 - offscreen;
            layer.addChild(jock);
           
            
            cheerleader = CCSprite.createFromFile("assets/images/characters/othercharacters/cheerleader.png");
            cheerleader.x = 510;
            cheerleader.y = 485 - offscreen;
            layer.addChild(cheerleader);
            
            
            teach = CCSprite.createFromFile("assets/images/characters/othercharacters/teacher.png");
            teach.x = 531;
            teach.y = 530 - offscreen;
            layer.addChild(teach);
            
            bully = CCSprite.createFromFile("assets/images/characters/othercharacters/bully.png");
            bully.x = 740;
            bully.y = 295 - offscreen;
            layer.addChild(bully);
            
            nerd = CCSprite.createFromFile("assets/images/characters/othercharacters/nerd.png");
            nerd.x = 879;
            nerd.y = 495 - offscreen;
            layer.addChild(nerd);
            
            sciteach = CCSprite.createFromFile("assets/images/characters/othercharacters/scienceteacher.png");
            sciteach.x = 1024;
            sciteach.y = 556 - offscreen;
            layer.addChild(sciteach);
            
            slacker = CCSprite.createFromFile("assets/images/characters/othercharacters/slacker2.png");
            slacker.x = 768;
            slacker.y = 331 - offscreen;
            layer.addChild(slacker);
            
            
            gameover = CCSprite.createFromFile("assets/images/gameoverscreen.png");
			gameover.x = 960;
			gameover.y = 400;
			layer.addChild(gameover);
			gameover.setVisible(false);
			
			gamewin = CCSprite.createFromFile("assets/images/winscreen.png");
			gamewin.x = 960;
			gamewin.y = 420;
			layer.addChild(gamewin);
			gamewin.setVisible(false);
			
			gameover = CCSprite.createFromFile("assets/images/gameoverscreen.png");
			gameover.x = 960;
			gameover.y = 420;
			layer.addChild(gameover);
			gameover.setVisible(false);
           
            //ppsetup
            ppscores = new Vector.<Number>();
			
            //keyboard
            layer.setKeypadEnabled(true);
            layer.onKeyDown = handleKeyDown;
            layer.onKeyUp += handleKeyUp;
            
            layer.onTouchBegan = function(id:int, x:int, y:int){
            	trace("int x: " + x + " int y: " + y);
            };
           
        }
        
        protected function nextText(x:Number){
        	if(x == 1){
        		summary.text = "They say she's missing, or even dead...";
        	}
        	if(x == 2){
        		summary.text = "I know it's someone in the school I have to find them";
        	}
        	if(x == 3){
        		summary.text = "Sarah was one of my closest friends,I won't rest until I know what happened"
        	}
        	if(x==4){
        		summary.text = "Instructions: WASD to move, X for journal, Z for quest, Q for talk, E for pickpocket";
        		SimpleAudioEngine.sharedEngine().playEffect("assets/gun-cocking-01.mp3");
        		
        	}
        	if(x == 5){
        		bloodstain.setVisible(true);
        		SimpleAudioEngine.sharedEngine().playEffect("assets/gun-gunshot-01.mp3");
        	}
        	if(x == 6){
        		isStart = false;
        		summary.setVisible(false);
        		startscreen.setVisible(false);
        		bloodstain.setVisible(false);
        		SimpleAudioEngine.sharedEngine().playBackgroundMusic("assets/song.mp3", true);
        		
        		
        	}
        
        }
        	public var leftKey:Boolean = false;
        	public var rightKey:Boolean = false;
        	public var upKey:Boolean = false;
        	public var downKey:Boolean = false;
        	public var moving:Boolean = false;
        	public var popup:Boolean = true;
        
          protected function handleKeyDown(keycode:int):void
        {
            goToOut();
            goToMath();
            goToScience();
            goToBRoom();
            goToLib();
            if(reputation >= 40){
            cafetext.setVisible(true);
            goToCafe();
           }
           
            if(keycode == LoomKey.W){
            upKey = true;
            facing = 4;
           } 
          	
            if(keycode == LoomKey.S){
            downKey = true;
            facing = 3;
            }
            if(keycode == LoomKey.A){
            leftKey = true;
            facing = 2;
           }
            if(keycode == LoomKey.D){
            rightKey = true;
            facing = 1;
             }
             
            if(!inCafe){
            //NPC
           if(true){
        		for(var z = 0; z < npc.allnpc.length; z++){
        			if(CheckinRange(character, npc.allnpc[z])){
        				if(keycode == LoomKey.E){
        				PickPocket(3);
        				}
        				if(keycode == LoomKey.Q){
        				isTalk = true;
        				convos.nextLine(npc.npctype[z], betatalk, 5);
        				betatalk++;
        					if(betatalk >= 3){
        						betatalk = 0;
        					}
        				}
        			}
        		}
        	}
        	
            
            
           // Jock  
           if(CheckinRange(character, jock)){
        		if(keycode == LoomKey.Q){
        			isTalk = true;
        			convos.nextLine("J", jocktalk, 1);
        			jocktalk++;  		
        		}
        		if(keycode == LoomKey.Z){
        			if(!jockQuestDone){
        			isTalk = true;
        			convos.nextLine("J", jocktalkquest, 2);
        			if(jocktalkquest >= 3){
        			jockQuest = true;
        			}
        			jocktalkquest++;
        			}
        			else if(jockQuestDone){
        			if(jockQuest){
        				reputation+= 10;
        			}
        			jockQuest = false;
        			isTalk = true;
        			jockQuestDoneTalk = true;
        			jocktalkquest = 100000;
        			convos.nextLine("J", jocktalkquest, 2);
        			}
        		}
        		if(keycode == LoomKey.E){
        			PickPocket(3);
        		}
        	}
        	
        	//Teacher
        	
        	if(CheckinRange(character, teach)){
        		if(keycode == LoomKey.Q){
        			isTalk = true;
        			convos.nextLine("T", 0, 1);
        			//convos     			
      			}
        		if(jockQuest){
        			if(keycode == LoomKey.E){
        				PickPocket(3);
        			}
        			
        		}
        	}
        	
        	//Nerd
        	
        	 if(CheckinRange(character, nerd)){
        		if(keycode == LoomKey.Q){
        			isTalk = true;
        			convos.nextLine("N", nerdtalk, 1);
        			nerdtalk++;  		
        		}
        		if(keycode == LoomKey.Z){
        			if(!nerdQuestDone){
        			isTalk = true;
        			convos.nextLine("N", nerdtalkquest, 2);
        			if(nerdtalkquest >= 4){
        			nerdQuest = true;
        			}
        			nerdtalkquest++;
        			}
        			else if(nerdQuestDone){
        			if(nerdQuest){
        				reputation+= 10;
        			}
        			nerdQuest = false;
        			isTalk = true;
        			nerdQuestDoneTalk = true;
        			nerdtalkquest = 100000;
        			convos.nextLine("N", nerdtalkquest, 2);
        			}
        		}
        		if(keycode == LoomKey.E){
        			PickPocket(3);
        		}
        	}
        	//sciteach
        	if(CheckinRange(character, sciteach)){
        		if(keycode == LoomKey.Q){
        			isTalk = true;
        			convos.nextLine("T", 0, 2);
        			}
        		if(keycode == LoomKey.E){
        			PickPocket(3);
        		}
        	}
        	//Cheerleader
        	
        	if(CheckinRange(character, cheerleader)){
        		if(keycode == LoomKey.Q){
        			isTalk = true;
        			convos.nextLine("C", cheertalk, 1);
        			cheertalk++;  		
        		}
        		if(keycode == LoomKey.Z){
        			if(!cheerQuestDone){
        			isTalk = true;
        			convos.nextLine("C", cheertalkquest, 2);
        			if(cheertalkquest >= 3){
        			cheerQuest = true;
        			}
        			cheertalkquest++;
        			}
        			else if(cheerQuestDone){
        			if(cheerQuest){
        				reputation+= 10;
        			}
        			cheerQuest = false;
        			isTalk = true;
        			cheerQuestDoneTalk = true;
        			cheertalkquest = 100000;
        			convos.nextLine("C", cheertalkquest, 2);
        			}
        		}
        		if(prepQuest && !flowers){
        			if(keycode == LoomKey.Q){
        			isTalk = true;
        			convos.npcLine.text = "The prep wants a date? Ew. no"; 
        			prepQuestDone = true;
        			}
        		
        		}
        		
        		if(prepQuest && flowers){
        			if(keycode == LoomKey.Q){
        			isTalk = true;
        			convos.npcLine.text = "These flowers are awesome! My answer is Yes!"; 
        			prepQuestDone = true;
        			}
        		}
        		if(nerdQuest){
        			if(keycode == LoomKey.E){
        				PickPocket(3);
        			}
        		}
        	}
        	//Prep
        	
        	 if(CheckinRange(character, prep)){
        		if(keycode == LoomKey.Q){
        			isTalk = true;
        			convos.nextLine("P", preptalk, 1);
        			preptalk++;  		
        		}
        		if(keycode == LoomKey.Z){
        			if(!prepQuestDone){
        			isTalk = true;
        			convos.nextLine("P", preptalkquest, 2);
        			if(preptalkquest >= 3){
        			prepQuest = true;
        			}
        			preptalkquest++;
        			}
        			else if(prepQuestDone && flowers){
        			if(prepQuest){
        				reputation+= 10;
        			}
        			prepQuest = false;
        			isTalk = true;
        			prepQuestDoneTalk = true;
        			preptalkquest = 100000;
        			convos.nextLine("P", preptalkquest, 2);
        			}
        			else if(prepQuestDone && !flowers){
        			prepQuest = false;
        			isTalk = true;
        			convos.npcLine.text = "She said no. It must be my hair...";
        			}
        		}
        		if(keycode == LoomKey.E){
        			PickPocket(3);
        		}
        	}
        	
        	//Slacker
        	
        	    if(CheckinRange(character, slacker)){
        		if(keycode == LoomKey.Q){
        			isTalk = true;
        			convos.nextLine("S", slackertalk, 1);
        			slackertalk++;  		
        		}
        		if(keycode == LoomKey.Z){
        			if(!slackerDone){
        			if(!slackerQuestDone){
        			isTalk = true;
        			convos.nextLine("S", slackertalkquest, 2);
        			if(slackertalkquest >= 3){
        			SlackerHomework();
        			}
        			slackertalkquest++;
        			}
        			else if(slackerQuestDone){
        			reputation+= 10;
        			isTalk = true;
        			slackerDone = true;
        			//slackerQuest = false;
        			slackerQuestDoneTalk = true;
        			slackertalkquest = 100000;
        			convos.nextLine("S", slackertalkquest, 2);
        			}
        			}
        			else{
        			isTalk = true;
        			slackertalkquest = 100000;
        			convos.nextLine("S", slackertalkquest, 2);
        			}
        		}
        		if(keycode == LoomKey.E){
        			PickPocket(3);
        		}
        	}
        	//bully
        	
        	if(CheckinRange(character, bully)){
        		if(keycode == LoomKey.Q){
        			isTalk = true;
        			convos.nextLine("B", bullytalk , 1);
        			bullytalk++;  		
        		}
        		if(keycode == LoomKey.Z){
        			if(!bullyQuestDone){
        			isTalk = true;
        			convos.nextLine("B", bullytalkquest, 2);
        			if(bullytalkquest >= 3){
        			bullyquest = true;
        			}
        			bullytalkquest++;
        			}
        			else if(bullyQuestDone){
        			if(bullyquest){
        				reputation+= 10;
        			}
        			bullyquest = false;
        			bullyQuestDoneTalk = true;
        			isTalk = true;
        			bullytalkquest = 100000;;
        			convos.nextLine("B", bullytalkquest, 2);
        			}
        		}
        			if(keycode == LoomKey.E){
        				PickPocket(3);
        			}
        		}
        		 
        	}
        	
        	if(keycode == LoomKey.X){
   				if(popup){
   					for(var i = 0; i < notes.length; i++){
   						notes[i].setVisible(true);
   					}
   					notebook.setVisible(true);
   					popup = false;
 					}
   				else if(!popup){
   					for(var j = 0; j < notes.length; j++){
   						notes[j].setVisible(false);
 						}
 					notebook.setVisible(false);
   					popup = true;
   					}
       			if(nerdQuestDoneTalk){
       				notes[0].setPosition(200, 662);
           			notes[0].text = "Nerd: " + convos.nerdclue;
          		 }
           		if(jockQuestDoneTalk){
           			notes[1].setPosition(200, 643);
       				notes[1].text = "Jock: " + convos.jockclue;
       			 }
           		if(cheerQuestDoneTalk){
          			notes[2].setPosition(200, 624);
          	     	 notes[2].text = "Cheerleader: " + convos.cheerclue;
          		 }
           		if(prepQuestDoneTalk){
       				notes[3].setPosition(200, 605);
       				notes[3].text = "Prep: " + convos.prepclue;
        			 }
       			 if(slackerQuestDoneTalk){
       				 notes[4].setPosition(200, 586);
       				 notes[4].text = "Slacker: " + convos.slackerclue;
           			}
           		if(bullyQuestDoneTalk){
           			notes[5].setPosition(200, 568);
          			 notes[5].text = "Bully: " + convos.bullyclue;
       			 }    
    	       }
        	
        	else if(inCafe){
        		instr.setVisible(false);
        		instrcafe.setVisible(true);
        		if(CheckinRange(character, nerd)){
        			if(keycode == LoomKey.Z && killerNumber == 0){
        			gamewin.setVisible(true);
        			SimpleAudioEngine.sharedEngine().playBackgroundMusic("assets/winsong", false);
        			}
        			else if(keycode == LoomKey.Z && killerNumber != 0) {
        			gameover.setVisible(true);
        			SimpleAudioEngine.sharedEngine().playBackgroundMusic("assets/losesong", false);
        			}
        		}
        		
        		if(CheckinRange(character, jock)){
        			if(keycode == LoomKey.Z && killerNumber == 1){
        			gamewin.setVisible(true);
        			SimpleAudioEngine.sharedEngine().playBackgroundMusic("assets/winsong", false);
        			}
        			else if(keycode == LoomKey.Z && killerNumber != 1) {
        			gameover.setVisible(true);
        			SimpleAudioEngine.sharedEngine().playBackgroundMusic("assets/losesong", false);
        			}
        		}
        		if(CheckinRange(character, cheerleader)){
        			if(keycode == LoomKey.Z && killerNumber == 2){
        			gamewin.setVisible(true);
        			SimpleAudioEngine.sharedEngine().playBackgroundMusic("assets/winsong", false);
        			}
        			else if(keycode == LoomKey.Z && killerNumber != 2) {
        			gameover.setVisible(true);
        			SimpleAudioEngine.sharedEngine().playBackgroundMusic("assets/losesong", false);
        			}
        		}
        		if(CheckinRange(character, prep)){
        			if(keycode == LoomKey.Z  && killerNumber == 3){
        			gamewin.setVisible(true);
        			SimpleAudioEngine.sharedEngine().playBackgroundMusic("assets/winsong", false);
        			}
        			else if(keycode == LoomKey.Z && killerNumber != 3) {
        			gameover.setVisible(true);
        			SimpleAudioEngine.sharedEngine().playBackgroundMusic("assets/losesong", false);
        			}
        		}
        		if(CheckinRange(character, slacker)){
        			if(keycode == LoomKey.Z && killerNumber == 4){
        			gamewin.setVisible(true);
        			SimpleAudioEngine.sharedEngine().playBackgroundMusic("assets/winsong", false);
        			}
        			else if(keycode == LoomKey.Z && killerNumber != 4) {
        			gameover.setVisible(true);
        			SimpleAudioEngine.sharedEngine().playBackgroundMusic("assets/losesong", false);
        			}
        		}
        		if(CheckinRange(character, bully)){
        			if(keycode == LoomKey.Z && killerNumber == 5){
        			gamewin.setVisible(true);
        			SimpleAudioEngine.sharedEngine().playBackgroundMusic("assets/winsong", false);
        			}
        			else if(keycode == LoomKey.Z && killerNumber != 5) {
        			gameover.setVisible(true);
        			SimpleAudioEngine.sharedEngine().playBackgroundMusic("assets/losesong", false);
        			}
        		}
        		
        	}
        	
            recalculateHorKeyInput();
            recalculateVertKeyInput();
            isMoving();
       }       

        protected function handleKeyUp(keycode:int):void
        {
            if(keycode == LoomKey.A)
            	leftKey = false;
            if(keycode == LoomKey.D)
            	rightKey = false;
            if(keycode == LoomKey.W)
            	upKey = false;
            if(keycode == LoomKey.S)
            	downKey = false;
            recalculateHorKeyInput();
            recalculateVertKeyInput();
            isMoving();
        }
        protected function isMoving():void{
        	if(leftKey || rightKey || upKey || downKey){
        		moving = true;
        	}
        	else{
        		moving = false;
        	}
        }
        protected function recalculateHorKeyInput():void
        {
        	if((leftKey && rightKey) || (!leftKey && !rightKey)){
        	moveDirX = 0;
        	}
        	else if(leftKey){
        	moveDirX = -1;
        	}
        	else if(rightKey){
        	moveDirX = 1;
        	}
        	else{
        	moveDirX = 0;
        	} 
        }
        protected function recalculateVertKeyInput():void
        {
        	if((downKey && upKey) || (!downKey && !upKey)){
        	moveDirY = 0;
        	}
        	else if(upKey){
        	moveDirY = 1;
        	}
        	else if(downKey){
        	moveDirY = -1;
        	}
        	else{
        	moveDirY = 0;
        	}
        }
        public var check:Boolean = false;
        var NPCtemp:CCSprite;
        override public function onTick():void
        {
        
      		if(!isStart){
        	//4w
        	//3s
        	//2a
        	//1d
        	var framesPerSecond = 4;
            var msPerFrame = 1000/4;
            var animationAgeInMs = Platform.getTime();
            var walkCycleFrameBegin:Number;
            var walkCycleFrameCount = 4;
            var curFrame:Number;
        	
        	
        	if(facing == 4 && !moving){
            character.setDisplayFrameWithAnimationName("walk", 15);
            }
            if(facing == 4 && moving){
            walkCycleFrameBegin = 15;
            curFrame = (Math.floor(animationAgeInMs / msPerFrame) % walkCycleFrameCount) + walkCycleFrameBegin;
            character.setDisplayFrameWithAnimationName("walk", curFrame);
            }
            if(facing == 3 && !moving){
            character.setDisplayFrameWithAnimationName("walk", 0);
            }
        	if(facing == 3 && moving){
            walkCycleFrameBegin = 0;
            curFrame = (Math.floor(animationAgeInMs / msPerFrame) % walkCycleFrameCount) + walkCycleFrameBegin;
            character.setDisplayFrameWithAnimationName("walk", curFrame);
            }
           	if(facing == 1 && !moving){
           	character.setDisplayFrameWithAnimationName("walk", 10);
           	}
           	if(facing == 1 && moving){
            walkCycleFrameBegin = 10;
            curFrame = (Math.floor(animationAgeInMs / msPerFrame) % walkCycleFrameCount) + walkCycleFrameBegin;
            character.setDisplayFrameWithAnimationName("walk", curFrame);
            }
           	if(facing == 2 && !moving){
           	character.setDisplayFrameWithAnimationName("walk", 5);
           	}
           	if(facing == 2 && moving){
            walkCycleFrameBegin = 5;
            curFrame = (Math.floor(animationAgeInMs / msPerFrame) % walkCycleFrameCount) + walkCycleFrameBegin;
            character.setDisplayFrameWithAnimationName("walk", curFrame);
            }
        	
        	repStatus.text = "Reputation: " + reputation;
        	
        	for (var i = 0; i < school.walls.length; i++){
        		if(CheckWalls(character, school.walls[i])){
        			if(moveDirX == 1)
        			character.x -=15;
        			if(moveDirX == -1)
        			character.x += 15;
        			if(moveDirY == 1)
        			character.y -=15;
        			if(moveDirY == -1)
        			character.y += 15;
        		
        		}
        	}
        	
        	for(var b = 0; b < chars.length; b++){
        		if(CheckCollision(character, chars[b])){
        			if(moveDirX == 1)
        			character.x -=15;
        			if(moveDirX == -1)
        			character.x += 15;
        			if(moveDirY == 1)
        			character.y -=15;
        			if(moveDirY == -1)
        			character.y += 15;
        	
        		}
        	
        	}
        	
        	for(var f = 0; f < npc.allnpc.length; f++){
        		if(CheckCollision(character, npc.allnpc[f])){
        			if(moveDirX == 1)
        			character.x -=15;
        			if(moveDirX == -1)
        			character.x += 15;
        			if(moveDirY == 1)
        			character.y -=15;
        			if(moveDirY == -1)
        			character.y += 15;
        	
        		}
        	}
        	
        	if(!inCafe){
        	if(CheckinRange(character, jock)){
        		instr.setVisible(true);
        		if(isTalk){
        			convos.setVisibilityNPC(true);
        			}
        	}
        	
        	else if(CheckinRange(character, sciteach)){
        		instr.setVisible(true);
        		if(isTalk){
        			convos.setVisibilityNPC(true);
        		}
        	}
        	
        	else if(CheckinRange(character, teach)){
        		instr.setVisible(true);
        		if(isTalk){
        			convos.setVisibilityNPC(true);
        			}
        	}
        	
        	else if(CheckinRange(character, nerd)){
        		instr.setVisible(true);
        		if(isTalk){
        			convos.setVisibilityNPC(true);
        			}
        	}
        	
        	else if(CheckinRange(character, cheerleader)){
        		instr.setVisible(true);
        		if(isTalk){
        			convos.setVisibilityNPC(true);
        			}
        	}
        	else if(CheckinRange(character, slacker)){
        		instr.setVisible(true);
        		if(isTalk){
        			convos.setVisibilityNPC(true);
        			}
        	}
        	
        	else if(CheckinRange(character, bully)){
        		instr.setVisible(true);
        		if(isTalk){
        			convos.setVisibilityNPC(true);
        			}
        	}
        	
        	else if(CheckinRange(character, prep)){
        		instr.setVisible(true);
        		if(isTalk){
        			convos.setVisibilityNPC(true);
        			}
        	}
        	
        	else if(CheckCheerleaderLocker()){
        		instr.setVisible(true);
        		instr.text = "Congratulations, You opened the Locker";
        		if(isTalk){
        			convos.setVisibilityNPC(true);
        			}
        	}
        	
        	else if(CheckinRange(character, school.bullyprank) && bullyquest){
        		school.bullyprank.setVisible(true);
        		bullyQuestDone = true;
        	}
        	
        	else if(CheckinRange(character, school.promvotes) && cheerQuest){
        		school.promvotes.setVisible(false);
        		instr.setVisible(true);
        		instr.text = "You've rigged the votes";
        		cheerQuestDone = true;
        	}
        	
        	else if(CheckinRange(character, school.flowers) && prepQuest &&!prepQuestDone){
        		school.flowers.setVisible(false);
        		instr.setVisible(true);
        		instr.text = "You got the flowers!";
        		flowers = true;
        	}
       		
        	else if(true){
        		for(var z = 0; z < npc.allnpc.length; z++){
        			if(CheckinRange(character, npc.allnpc[z])){
        				instr.setVisible(true);
        				NPCtemp = npc.allnpc[z];
        				check = true;
        				if(isTalk){
        				convos.setVisibilityNPC(true);
        				NPCtemp = npc.allnpc[z];
        				}
        			}
        			if(check){
        				if(!CheckinRange(character, NPCtemp)){
        					instr.setVisible(false);
        					instr.text = "Press Q to talk, Z for quest, or E to Pickpocket";
        					convos.setVisibilityNPC(false);
        					isTalk = false;
        					check = false
        				}
        			}
        		}
        	}
        	
        	
        	else if(!CheckinRange(character, jock)){
        		instr.setVisible(false);
        		instr.text = "Press Q to talk, Z for quest, or E to Pickpocket";
        		convos.setVisibilityNPC(false);
        		isTalk = false;
        		}
        		
        	else if(!CheckinRange(character, teach)){
        		instr.setVisible(false);
        		instr.text = "Press Q to talk, Z for quest, or E to Pickpocket";
        		convos.setVisibilityNPC(false);
        		isTalk = false;
        		}
        		
        		
        	   	else if(!CheckinRange(character, nerd)){
        		instr.setVisible(false);
        		instr.text = "Press Q to talk, Z for quest, or E to Pickpocket";
        		convos.setVisibilityNPC(false);
        		isTalk = false;
        		}
        		
        	else if(!CheckinRange(character, cheerleader)){
        		instr.setVisible(false);
        		instr.text = "Press Q to talk, Z for quest, or E to Pickpocket";
        		convos.setVisibilityNPC(false);
        		isTalk = false;
        		}	
        		
        	else if(!CheckinRange(character, slacker)){
        		instr.setVisible(false);
        		instr.text = "Press Q to talk, Z for quest, or E to Pickpocket";
        		convos.setVisibilityNPC(false);
        		isTalk = false;
        		}	
        		
        	else if(!CheckinRange(character, bully)){
        		instr.setVisible(false);
        		instr.text = "Press Q to talk, Z for quest, or E to Pickpocket";
        		convos.setVisibilityNPC(false);
        		isTalk = false;
        		}
        		
        	else if(!CheckinRange(character, prep)){
        		instr.setVisible(false);
        		instr.text = "Press Q to talk, Z for quest, or E to Pickpocket";
        		convos.setVisibilityNPC(false);
        		isTalk = false;
        		}
        		
        	else if(!CheckinRange(character, school.promvotes)){
        		instr.setVisible(false);
        		instr.text = "Press Q to talk, Z for quest, or E to Pickpocket";
        		convos.setVisibilityNPC(false);
        		isTalk = false;
        		}
        		
        	else if(!CheckinRange(character, school.flowers)){
        		instr.setVisible(false);
        		instr.text = "Press Q to talk, Z for quest, or E to Pickpocket";
        		convos.setVisibilityNPC(false);
        		isTalk = false;
        		}
        		
        	else if(!CheckCheerleaderLocker){
        	instr.setVisible(false);
        	instr.text = "Press Q to talk, Z for quest, or E to Pickpocket";
        	convos.setVisibilityNPC(false);
        	isTalk = false;
        		}
        			
        			
        	}		
			
        	character.x += moveDirX * 2.5;
        	character.y += moveDirY * 2.5;
        	
        	}
        }
        
        public var mdoorin:Boolean = false;
        protected function goToMath():void{
        if(mdoorin == false){
        	if(CheckDoors(character, school.hall.mdoor)){
        		chars.clear();
        		npc.tweenOff("H");
        		npc.tweenOn("M");
        		school.hall.tweenOff();
        		Tween.to(prep, 0.5, {"y": prep.y - offscreen, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(character, 0.5, {"x": 648, "y": 100, "ease": EaseType.EASE_IN_BACK});
       			
       			
       			chars.push(bully);
       			chars.push(teach);
       			school.mathWalls();
        		Tween.to(school.math, 0.5, {"x": 650, "y": 360, "ease": EaseType.EASE_IN_BACK});
        		Tween.to(teach, 0.5, {"x": teach.x, "y": teach.y + offscreen, "ease": EaseType.EASE_IN_BACK});
        		Tween.to(bully, 0.5, {"y": bully.y + offscreen, "ease": EaseType.EASE_IN_BACK});
        		school.hall.setDoor("math");
        	
        		SimpleAudioEngine.sharedEngine().playBackgroundMusic("assets/AM.mp3", true);
        		mdoorin = true;
        		}
        	}
       	else if(mdoorin == true){
       		if(CheckDoors(character, school.hall.mdoor)){
       			school.walls.clear();
       			school.byeWalls();
       			npc.tweenOff("M");
       			npc.tweenOn("H");
       			chars.clear();
 				chars.push(prep);
 				school.hall.tweenOn();
       			Tween.to(prep, 0.5, {"y": prep.y + offscreen, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(school.math, 0.5, {"y": -1000, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(character, 0.5, {"x": 648, "y": 790, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(teach, 0.5, {"y": teach.y - offscreen, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(bully, 0.5, {"y": bully.y - offscreen, "ease": EaseType.EASE_IN_BACK});
       			
       			SimpleAudioEngine.sharedEngine().playBackgroundMusic("assets/song.mp3", true);		
       			school.hall.setDoor("hall");
       			mdoorin = false;
       			}
       		}
        }
        
        
        public var sdoorin:Boolean = false;      
        protected function goToScience():void{
        if(sdoorin == false){
        	if(CheckDoors(character, school.hall.sdoor)){
        		chars.clear();
        		school.hall.tweenOff();
        		school.scienceWalls();
        		npc.tweenOff("H");
        		npc.tweenOn("S");
        		Tween.to(prep, 0.5, {"y": prep.y - offscreen, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(character, 0.5, {"x": 919, "y": 130, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(nerd, 0.5, {"y": nerd.y + offscreen, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(sciteach, 0.5, {"y": sciteach.y + offscreen, "ease": EaseType.EASE_IN_BACK});
       			chars.push(nerd);
       			chars.push(sciteach);
       			
        		Tween.to(school.science, 0.5, {"x": 949, "y": 400, "ease": EaseType.EASE_IN_BACK});
        		school.hall.setDoor("science");
        		
        		SimpleAudioEngine.sharedEngine().playBackgroundMusic("assets/AM2.mp3", true);
        		sdoorin = true;
        		}
        	}
       	else if(sdoorin == true){
       		if(CheckDoors(character, school.hall.sdoor)){
       			school.walls.clear();
       			school.byeWalls();
       			chars.clear();
       			npc.tweenOff("S");
        		npc.tweenOn("H");
       			Tween.to(school.science, 0.5, {"y": -1000, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(character, 0.5, {"x": 1313, "y": 764, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(nerd, 0.5, {"y": nerd.y - offscreen, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(sciteach, 0.5, {"y": sciteach.y - offscreen, "ease": EaseType.EASE_IN_BACK});
       			chars.push(prep);
       			
       			Tween.to(prep, 0.5, {"y": prep.y + offscreen, "ease": EaseType.EASE_IN_BACK});
       			school.hall.tweenOn();
       			school.hall.setDoor("hall");
       			SimpleAudioEngine.sharedEngine().playBackgroundMusic("assets/song.mp3", true);
       			sdoorin = false;
       			}
       		}
        }
        
        
        
        
         public var bdoorin:Boolean = false;      
        protected function goToBRoom():void{
        if(bdoorin == false){
        	if(CheckDoors(character, school.hall.bdoor)){
        		chars.clear();
        		npc.tweenOff("H");
        		npc.tweenOn("B");
        		school.hall.tweenOff();
        		school.broomWalls();
        		Tween.to(prep, 0.5, {"y": prep.y - offscreen, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(character, 0.5, {"x": 955, "y": 130, "ease": EaseType.EASE_IN_BACK});
       			
       
        		Tween.to(school.bathroom, 0.5, {"x": 949, "y": 400, "ease": EaseType.EASE_IN_BACK});
        		Tween.to(school.bullyprank, 0.5, {"y": 329, "ease": EaseType.EASE_IN_BACK});
        		school.hall.setDoor("bathroom");
        		
        		
        		bdoorin = true;
        		}
        	}
       	else if(bdoorin == true){
       		if(CheckDoors(character, school.hall.bdoor)){
       			school.walls.clear();
       			npc.tweenOff("B");
        		npc.tweenOn("H");
       			school.byeWalls();
       			Tween.to(school.bathroom, 0.5, {"y": -1000, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(school.bullyprank, 0.5, {"y": -1000, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(character, 0.5, {"x": 927, "y": 811, "ease": EaseType.EASE_IN_BACK});
       			
       			chars.push(prep);
       			Tween.to(prep, 0.5, {"y": prep.y + offscreen, "ease": EaseType.EASE_IN_BACK});
       			school.hall.tweenOn();
       			school.hall.setDoor("hall");
       			//SimpleAudioEngine.sharedEngine().playBackgroundMusic("assets/song.mp3", true);
       			bdoorin = false;
       			}
       		}
        }
        
        
        
        public var ldoorin:Boolean = false;      
        protected function goToLib():void{
        if(ldoorin == false){
        	if(CheckDoors(character, school.hall.ldoor)){
        		chars.clear();
        		school.hall.tweenOff();
        		school.libWalls();
        		npc.tweenOff("H");
        		npc.tweenOn("L");
        		Tween.to(prep, 0.5, {"y": prep.y - offscreen, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(character, 0.5, {"x": 653, "y": 689, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(slacker, 0.5, {"y": slacker.y + offscreen, "ease": EaseType.EASE_IN_BACK});
       			chars.push(slacker);
       
        		Tween.to(school.library, 0.5, {"x": 673, "y": 445, "ease": EaseType.EASE_IN_BACK});
        		Tween.to(school.promvotes, 0.5, { "y": 693, "ease": EaseType.EASE_IN_BACK});
        		school.hall.setDoor("library");
        		
        		
        		ldoorin = true;
        		}
        	}
       	else if(ldoorin == true){
       		if(CheckDoors(character, school.hall.ldoor)){
       			school.walls.clear();
       			chars.clear();
       			npc.tweenOff("L");
        		npc.tweenOn("H");
       			school.byeWalls();
       			Tween.to(school.library, 0.5, {"y": -1000, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(school.promvotes, 0.5, { "y": -1693, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(character, 0.5, {"x": 796, "y": 490, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(slacker, 0.5, {"y": slacker.y - offscreen, "ease": EaseType.EASE_IN_BACK});
       			
       			chars.push(prep);
       			Tween.to(prep, 0.5, {"y": prep.y + offscreen, "ease": EaseType.EASE_IN_BACK});
       			school.hall.tweenOn();
       			school.hall.setDoor("hall");
       			//SimpleAudioEngine.sharedEngine().playBackgroundMusic("assets/song.mp3", true);
       			ldoorin = false;
       			}
       		}
        }
        
        
        
         public var odoorin:Boolean = false;      
        protected function goToOut():void{
        if(odoorin == false){
        	if(CheckDoors(character, school.hall.odoor)){
        		chars.clear();
        		school.hall.tweenOff();
        		npc.tweenOff("H");
        		npc.tweenOn("Y");
        		school.yardWalls();
        		Tween.to(prep, 0.5, {"y": prep.y - offscreen, "ease": EaseType.EASE_IN_BACK});
        		Tween.to(jock, 0.5, {"y": jock.y + offscreen, "ease": EaseType.EASE_IN_BACK});
        		Tween.to(cheerleader, 0.5, {"y": cheerleader.y + offscreen, "ease": EaseType.EASE_IN_BACK});
        		Tween.to(school.flowers, 0.5, {"y": 179, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(character, 0.5, {"x": 753, "y": 689, "ease": EaseType.EASE_IN_BACK});
       			
       			chars.push(cheerleader);
       			chars.push(jock);
       
        		Tween.to(school.yard, 0.5, {"x": 773, "y": 445, "ease": EaseType.EASE_IN_BACK});
        		school.hall.setDoor("yard");
        		
        		
        		odoorin = true;
        		}
        	}
       	else if(odoorin == true){
       		if(CheckDoors(character, school.hall.odoor)){
       			school.walls.clear();
       			chars.clear();
       			npc.tweenOff("Y");
        		npc.tweenOn("H");
       			school.byeWalls();
       			Tween.to(school.yard, 0.5, {"y": -1000, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(character, 0.5, {"x": 1153, "y": 490, "ease": EaseType.EASE_IN_BACK});
       			
       			chars.push(prep);
       			Tween.to(school.flowers, 0.5, {"y": -1179, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(jock, 0.5, {"y":jock.y - offscreen , "ease": EaseType.EASE_IN_BACK});
       			Tween.to(cheerleader, 0.5, {"y":cheerleader.y - offscreen , "ease": EaseType.EASE_IN_BACK});
       			Tween.to(prep, 0.5, {"y": prep.y + offscreen, "ease": EaseType.EASE_IN_BACK});
       			school.hall.tweenOn();
       			school.hall.setDoor("hall");
       			//SimpleAudioEngine.sharedEngine().playBackgroundMusic("assets/song.mp3", true);
       			odoorin = false;
       			}
       		}
        }
        
         public var cdoorin:Boolean = false;      
        protected function goToCafe():void{
        if(cdoorin == false){
        	if(CheckDoors(character, school.hall.cdoor)){
        		chars.clear();
        		school.hall.tweenOff();
        		school.cafeWalls();
        		npc.tweenOff("H");
        		npc.tweenOn("C");
        		inCafe = true;
        		Tween.to(prep, 0.5, {"x": 465, "y": 393, "ease": EaseType.EASE_IN_BACK});
        		Tween.to(nerd, 0.5, {"x": 559, "y": 558, "ease": EaseType.EASE_IN_BACK});
        		Tween.to(slacker, 0.5, {"x": 1138, "y": 419, "ease": EaseType.EASE_IN_BACK});
        		Tween.to(jock, 0.5, {"x": 947, "y": 233, "ease": EaseType.EASE_IN_BACK});
        		Tween.to(cheerleader, 0.5, {"x": 660, "y": 215, "ease": EaseType.EASE_IN_BACK});
        		Tween.to(bully, 0.5, {"x": 1136, "y": 215, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(character, 0.5, {"x": 362, "y": 417, "ease": EaseType.EASE_IN_BACK});
       			
       			chars.push(cheerleader);
       			chars.push(jock);
       			chars.push(slacker);
       			chars.push(prep);
       			chars.push(nerd);
       			chars.push(bully);
       
        		Tween.to(school.cafeteria, 0.5, {"x": 773, "y": 445, "ease": EaseType.EASE_IN_BACK});
        		school.hall.setDoor("cafeteria");
        		
        		
        		odoorin = true;
        		}
        	}
       	else if(odoorin == true){
       		if(CheckDoors(character, school.hall.cdoor)){
       			school.walls.clear();
       			chars.clear();
       			Tween.to(school.cafeteria, 0.5, {"y": -1000, "ease": EaseType.EASE_IN_BACK});
       			Tween.to(character, 0.5, {"x": 1153, "y": 490, "ease": EaseType.EASE_IN_BACK});
       			
       			chars.push(prep);
       			Tween.to(prep, 0.5, {"y": prep.y + offscreen, "ease": EaseType.EASE_IN_BACK});
       			school.hall.tweenOn();
       			school.hall.setDoor("hall");
       			odoorin = false;
       			}
       		}
        }
        
       protected function CheckCheerleaderLocker():boolean{
       		if(nerdQuestOpenLocker){
       			if(CheckDoors(character, school.hall.cheerlocker)){
       			nerdQuestDone = true;
       			return true;
       			}
       			else
       			return false;
       		}
       		
       }
        
        //ppfunctions
          protected function PickPocket(difficulty:Number){
       		
       		
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
      		instr.text = "Remeber these numbers: " + toKeyCode(ppscores[0]) + "," + toKeyCode(ppscores[1]) + "," + toKeyCode(ppscores[2]) + "," + toKeyCode(ppscores[3]) + "," + toKeyCode(ppscores[4]) + "," + toKeyCode(ppscores[5]);      
			time.onComplete = pickpocketAction;
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
        
        protected function pickpocketAction(t:Timer){
        
        
        instr.text = "What were the numbers?";
       	time.stop();   
    
		layer.onKeyDown += handleKeyPickPocket; 
	
        
        }
        
        
          protected function handleKeyPickPocket(keycode:int):void
        {
  		
  		if(!ppscores.contains(keycode)){
  		instr.text = "You Lost, Sorry";
  		reputation--;
  		layer.onKeyDown -= handleKeyPickPocket;
  		}
  		else{
  		ppscores.remove(keycode);
  		pickpocketnumber++;
  		instr.text = "Correct"
  		}
  		if(pickpocketnumber == 6){
  		instr.text = "You Won";
  		reputation++;
  		layer.onKeyDown -= handleKeyPickPocket;
  			if(jockQuest && CheckinRange(character, teach)){
  				instr.text = "You got the answer key!";
  				jockQuestDone = true;
  			}
  			if(nerdQuest && CheckinRange(character, cheerleader)){
  			instr.text = "The locker's combination is 1, 2, 3, 4";
  			nerdQuestOpenLocker = true;
  			}
  		}
       }
        
        
       //Slacker Homework Functions
       
      protected function SlackerHomework(){
       		     	
         	for(var i = 0; i < 6; i++){
         	ppscores.pushSingle(toKeyCode(Math.floor(Math.random()*10)));
         	}
         		
      		layer.onKeyDown += handleKeyHomework; 
        }
        
            protected function handleKeyHomework(keycode:int):void
        {
        	
        instr.text = "What is [((6 + 3) + (5*3) + (7/6))*0]+[2+2]?" ;
        if(keycode == LoomKey.FOUR){
        instr.text = "Hell yeah dude, dap me up";
        slackerQuestDone = true;
        layer.onKeyDown -= handleKeyHomework;
        }
        
        }
        
        
        //collisonfucntions
        
        protected function CheckinRange(spritecharacter:CCSprite, spriteexample:CCSprite):boolean
        {
     	var rect = new CCRect();
        var temprect:CCRect;
        var num1:Number;
        var num2:Number;
        
        
        var initwidth:Number;
        var initheight:Number;
        
        
        temprect = spriteexample.boundingBox();
        num1 = temprect.getMinX();
        num1 -= 16;
        num2 = temprect.getMinY();
        num2 -= 16;
        initwidth = spriteexample.getTextureWidth();
        initwidth+= 32;
        initheight = spriteexample.getTextureHeight();
        initheight += 32;
        
        rect.setRect(num1, num2, initwidth, initheight);
        
        if(spritecharacter.boundingBox().intersectsRect(rect))
        return true;
        
        else
        return false;
        }
        
         protected function CheckWalls(spritecharacter:CCSprite, rect:CCRect):boolean{
        
        if(spritecharacter.boundingBox().intersectsRect(rect))
        return true;
        
        else
        return false;
        
        }
        
        protected function CheckDoors(spritecharacter:CCSprite, door:CCRect):boolean{
        
         if(spritecharacter.boundingBox().intersectsRect(door))
        return true;
        
        else
        return false;
        
        
        }
        
        protected function CheckCollision(spritecharacter:CCSprite, spriteexample:CCSprite):boolean{
        
       
        if(spritecharacter.boundingBox().intersectsRect(spriteexample.boundingBox()))
        return true;
        
        else
        return false;
        
        
        
        }
        
        override public function onTerminate():void{
        	SimpleAudioEngine.sharedEngine().end();
        }
        
	   	
        
    }

}