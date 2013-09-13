package
{
	import cocos2d.Cocos2DGame;
    import cocos2d.CCSprite;
    import cocos2d.CCRect;
    import cocos2d.CCSpriteFrame;
    
    import cocos2d.Cocos2D;
    import cocos2d.CCTMXTiledMap;
    import cocos2d.ccColor3B;
    import System.Number;
    import cocos2d.ScaleMode;
    import cocos2d.ccColor3B;

    import UI.Label;

    import Loom.GameFramework.AnimatedComponent;
    import Loom.GameFramework.LoomComponent;
    import Loom.GameFramework.LoomGroup;
    import Loom.GameFramework.LoomGameObject;

    import Loom.Physics.Physics;
    import Loom.Physics.PhysicsWall;
    import Loom.Physics.PhysicsBall;
    
    import Loom.Platform.LoomKey;
    
   	import Loom.Animation.Tween;
    import Loom.Animation.EaseType;
    
    public class SunsetHighConvo
    {
		public var game:Cocos2DGame;
		public var heroLine:Label;
        public var npcLine:Label;
        
        public var jockclue:String;
        public var nerdclue:String;
        public var cheerclue:String;
        public var prepclue:String;
        public var slackerclue:String;
        public var bullyclue:String;
	
	public function SunsetHighConvo(){
        	
        	heroLine = new Label("assets/Curse-hd.fnt");
			heroLine.text = "";
			heroLine.x = 300;
			heroLine.y = 200;
			heroLine.scale = 0.5;
			heroLine.setVisible(false);
			
        	npcLine = new Label("assets/Curse-hd.fnt");
        	npcLine.text = "";
			npcLine.x = 1660;
			npcLine.y = 140;
			var color = new ccColor3B(0,0,0);
			npcLine.setColor(color);
			npcLine.scale = 0.35;
			npcLine.setVisible(false);
        	
        }
      public function setClues(killer:Number):void{
      	if(killer == 0){ //Nerd
      		jockclue = "I hear they don't lift";
      		nerdclue = "I hear they play football";
      		cheerclue = "I'd never go out with them";
      		prepclue = "I'd never wear what they wear";
      		slackerclue = "Opposite of chill";
      		bullyclue = "I love picking on them";
      	}
      	if(killer == 1){ //Jock
      		jockclue = "I hear they lift a lot";
      		nerdclue = "They are popular... unlike me";
      		cheerclue = "I can't believe it";
      		prepclue = "Their clothes wouldn't fit me";
      		slackerclue = "Opposite of chill";
      		bullyclue = "If only I could prank them";
      	}
      	if(killer == 2){ //Cheer
      		jockclue = "I hear they lift";
      		nerdclue = "They are popular... unlike me";
      		cheerclue = "They are always with the principal";
      		prepclue = "Their clothes wouldn't fit me";
      		slackerclue = "They are blonde";
      		bullyclue = "If only I could prank them";
      	}
      	if(killer == 3){ //Prep
      		jockclue = "I hear they don't lift";
      		nerdclue = "They are popular... unlike me";
      		cheerclue = "I wish he'd work out";
      		prepclue = "They're smoking all the time...";
      		slackerclue = "They are blonde";
      		bullyclue = "I love picking on them";
      	}
      	if(killer == 4){ //slacker
      		jockclue = "I hear they don't lift";
      		nerdclue = "Their grades are lacking";
      		cheerclue = "I wish he'd work out";
      		prepclue = "I'll never wear what they wear";
      		slackerclue = "They are a wiz kid";
      		bullyclue = "They are never around to prank";
      	}
      	if(killer == 5){ //Bully
      		jockclue = "I hear they lift";
      		nerdclue = "Their grades are lacking";
      		cheerclue = "I'd never go out with them";
      		prepclue = "I'll never wear what they wear";
      		slackerclue = "Opposite of chill";
      		bullyclue = "It's a girl";
      	}
      
      }
        
        public function getHeroLine():Label{
			return heroLine;
		}
		public function getNPCLine():Label{
			return npcLine;
		}
		
		public function setVisibilityHero(visible:Boolean){
			if(visible)
			heroLine.setVisible(true);
			if(!visible)
			heroLine.setVisible(false);
		}
		
		public function setVisibilityNPC(visible:Boolean){
			if(visible)
			npcLine.setVisible(true);
			if(!visible)
			npcLine.setVisible(false);
		}
		
		public function HeroSays(convo:String):String {         //just the facts, ma'am (think "DragNet")
                	
                	if(convo == "MXX")
                	return "...";
                	if(convo == "MQQ")
                	return "???";
                	if(convo == "MGA")
                	return "Excuse me...";
                	if(convo == "MGB")
                	return "Hey, what's-your-name.";
                	if(convo == "MGC")
                	return "Ahem.";
                	if(convo == "MQA")
                	return "Have you heard from Sarah lately?";
                	if(convo == "MQB")
                	return "When was the last time you talked to Sarah?";
                	if(convo == "MQC")
                	return "Do you ever talk to Sarah?";
                	if(convo == "MQD")
                	return "What else do you know about Sarah's disappearance?";
                	if(convo == "MQE")
                	return "What is it you're not telling me about Sarah?!";
                	if(convo == "MQF")
                	return "Are you sure that's all you know about Sarah?";
                	if(convo == "MIA")
                	return "There's something you're not telling me, isn't there?";
                	if(convo == "MIB")
                	return "Tell me what you know!";
                	if(convo == "MIC")
                	return"That's not the whole truth, though, is it?";
                	else
                	return "";
                	
                
        }
        
        public function JockSays(convo:String):String {         //a steel vault, albeit one with not much worth stealing
                if(convo == "AGA"){ 
                	return "What do YOU want?";
                }
                if(convo == "AGB")
                	return "You NEED something, dude?";
                if(convo == "AGC")
                	return "Got a PROBLEM, little girl?"; 
                if(convo == "ARA")
                	return 	"None of your business, dweeb.";
                if(convo == "ARB")
                	return "Man, get outta my face!";
                if(convo == "ARC")
                	return "Back off, bro, you're in my space.";
                if(convo == "AVA")	 
                	return "I haven't talked to Sarah in weeks, man.";
                if(convo == "AVB")
                	return "I haven't heard from her in a while.";
               	if(convo == "AVC")
                	return "I don't know what she's into, man.";
                if(convo == "AAA") 
                	return "Okay, maybe she called me a few nights ago.";
                if(convo == "AAV")
                	return "Well ... she did look a little upset the other night.";
                if(convo == "ACB")
                	return "Yeah, well, a friend of a friend told me...";
                if(convo == "ACC")
                	return "Look, this is strictly off the record, okay...";
                if(convo = "BA")
                	return "Fine, you want to help...";
                	
                else
                	return "";
        }
        
        public function jockQuest(convo:String):String{
        		if(convo == "AQA"){
                	return "Fine, you want to help...";
                	 
                }
                if(convo == "AQB"){
                	return "I'm doing terrible in math...";
                }
                if(convo == "AQC"){
                	return "Go pickpocket the math teacher\n and get the answer key."
                }
                if(convo == "AQD"){
                	return "Did you get the math exam, bro?";
                }
                else
                	return ""
        }
        
        public function NerdSays(convo:String):String{        
               if(convo == "AGA")
                	return "Hello, Live long and prosper";
                if(convo == "AGB")
                	return "Klaatu Barada Nikto";
                if(convo == "AGC")
                	return "My second language is Java";
                if(convo == "ARA")
                	return "Houston... we have a problem";
                if(convo == "ARB")
                	return "Talking to you is as pointless as a sine wave";
                if(convo == "ARC")
                	return "How about I answer all your questions... \n just as soon as you solve the Riemann Hypothesis?";
                if(convo == "AVA")
                	return "Goonies... never... say... 'die'";
                if(convo == "AVB")
                	return "Danger Will Robinson Danger!";
                if(convo == "AVC")
                	return "End of Line";
                if(convo == "AAA")
                	return "I suppose resistance is futile.";

                else
                	return "";
        }
        
        public function nerdQuest(convo:String):String{
        		if(convo == "AQA"){
                	return "I could use a favor... hehe"; 	 
                }
                if(convo == "AQB"){
                	return "Pickpocket the cheerleader, \nget her locker combo";
                }
                if(convo == "AQC"){
                	return "Then break into her locker, \nand steal some private posessions";
                }
                if(convo == "AQD"){
                	return "Her locker is six away,\n on the left of the library entrance";
                }
                else
                	return "";
        }
        
        public function CheerSays(convo:String):String{                 
                if(convo == "AGA")
                	return "Ugh! What do YOU want?";
                if(convo == "AGB")
                	return "Do you, like, NEED something?";
                if(convo == "AGC")
                	return "Uh, I think you're in, like, the wrong place, little boy";
                if(convo == "ARA")
                	return "OMG, like, ex-CUSE ME???";
                if(convo == "ARB")
                	return "I don't have time for this, I have a manicure in, like, five minutes";
                if(convo == "ARC")
                	return "I'm sorry, but you're going to have to,\n like, call ahead for an appointment next time.";
                if(convo == "AVA")
                	return "Sarah and I were not exactly BFFs, riiight?";
                if(convo == "AVB")
                	return "I can't keep track of everybody, you know, I have, like, so many friends.";
                if(convo == "AVC")
                	return "We didn't exactly move in the same circles, if you know what I mean.";
                if(convo == "AAA")
                	return "Okay, maybe she called me a few nights ago.";
                if(convo == "AAB")
                	return "Well ... she did look a little upset the other day in Study Hall.";
                else
                	return "";
                
        }
        
        public function cheerQuest(convo:String):String{
        		if(convo == "AQA"){
                	return "Umm could a nobody like you help me out?"; 	 
                }
                if(convo == "AQB"){
                	return "I really need to be prom queen, like really need to";
                }
                if(convo == "AQC"){
                	return "Go to the library and rig the votes";
                }
                if(convo == "AQD"){
                	return "Aren't I the most beautiful girl in the school?";
                }
                else
                	return "";
        }
        
        public function PrepSays(convo:String):String {         //evasive, but politically so, protecting his own interests
                if(convo == "AXX")
                	return "...";
                if(convo == "AQQ")
                	return "???";
                if(convo == "AGA")
                	return "Be careful, I'm rocking this rollex";
                if(convo == "AGA")
                	return "Make it quick, I'm on the clock.";
                if(convo == "AGB")
                	return "Uh, can I help you?";
                if(convo == "AGC")
                	return "I'm sorry, do you have an appointment?";
                if(convo == "ARA")
                	return "Sorry, man, but time is money.";
                if(convo == "ARB")
                	return "Ooh, gonna have to cut you off,\n I'm double-parked.";
                if(convo == "ARC")
                	return "Have your people call my people.";
                if(convo == "AVA")
                	return "I can neither confirm nor deny events that I did not personally witness.";
                if(convo == "AVB")
                	return "I'm afraid I don't recall any details at this time.";
                if(convo == "AXX")
                	return "...";
                if(convo == "AAA")
                	return "On the advice of my attorney, I withhold comment.";	
               	else
               		return "";

        }
        
        public function prepQuest(convo:String):String{
        		if(convo == "AQA"){
                	return "Even I, with my sense of style..."; 	 
                }
                if(convo == "AQB"){
                	return "Sometimes I get nervous...";
                }
                if(convo == "AQC"){
                	return "Can you ask the cheerleader out on a date?";
                }
                if(convo == "AQD"){
                	return "She really likes flowers";
                }
                else
                	return "";
        }
        
        public function SlackerSays(convo:String):String{
        	if(convo == "AGA")
        		return "Sup, dude, you doin' a survey?";
        	if(convo == "AGB")
        		return "Hey man, tryin' to score a little herb?";
        	if(convo == "AGC")
        		return "What's the word on the street, bro?";
        	if(convo == "ARA")
        		return "You with the feds bro?";
        	if(convo == "AVA")
        		return "I don't know what she's into, man.";
        	if(convo == "AVB")
        		return "Man... my dog ate my homework, I swear.";
        	if(convo == "AAA")
        		return "Okay, maybe she called me a few nights ago.";
        	if(convo == "AAB")
        		return "Well ... she did look a little upset the other night.";
        	if(convo == "AAC")
        		return "Lemme think, leme think... there was one thing!";
        	if(convo == "AAD")
        		return "Ah dude, remembering isn't my forte, but lemme think...";
        		
        }
        
        public function slackerQuest(convo:String):String{
        		if(convo == "AQA"){
                	return "Dudeee, my grades are not killing it"; 	 
                }
                if(convo == "AQB"){
                	return "Like math, man,\n who gets that wizard magic, man";
                }
                if(convo == "AQC"){
                	return "Could you help a bro out with his math hw?";
                }
                if(convo == "AQD"){
                	return "Dude, you are my duddeee right onn!";
                }
                else
                	return "";
        }
        
        public function BullySays(convo:String):String{
        		if(convo == "AGA"){ 
                	return "I HATE THIS CLASS!";
                }
                if(convo == "AGB")
                	return "Where is the nerd? I need to give him a wedgie";
                if(convo == "AGC")
                	return "What are you gonna do about it?"; 
                if(convo == "ARA")
                	return 	"Don't sit on the teachers desk... hehehe";
                if(convo == "ARB")
                	return "Where's your lunch money, punk?";
                if(convo == "ARC")
                	return "Nice shirt. It's mine now...";
                if(convo == "AVA")	 
                	return "Sarah-who?";
                if(convo == "AVB")
                	return "I need to mess with this Sarah person";
               	if(convo == "AVC")
                	return "Is she cute?";
                if(convo == "AAA") 
                	return "Alright... I may have heard something";
                if(convo == "AAV")
                	return "I was in the principal's office when...";
                if(convo == "ACB")
                	return "Yeah, well, a friend of a friend told me...";
                if(convo == "ACC")
                	return "Look, this is strictly off the record, okay...";
                if(convo = "BA")
                	return "Fine, you want to help...";
                
        }
        
        public function bullyQuest(convo:String):String{
        		if(convo == "AQA"){
                	return "UGH! I got detention! This teacher is a witch..."; 	 
                }
                if(convo == "AQB"){
                	return "You're a twerp, but I need help...";
                }
                if(convo == "AQC"){
                	return "Go setup my ketchup prank in the bathroom!";
                }
                if(convo == "AQD"){
                	return "Is my evil plan working!?";
                }
                else
                	return "";
        }
        
        
        public function nextLine( npc:String, prog:Number, choice:Number ):void {
        	if(npc == "J"){
        		if(prog == 0 && choice == 1){
        			heroLine.text = HeroSays("MGA");
        			npcLine.text = JockSays("AGA");	
        		}
        		if(prog == 1 && choice == 1){
        			npcLine.text = JockSays("AGC");
        		}
        		if(prog >= 2 && choice == 1){
        			npcLine.text = JockSays("AVA");
        		}
        		if(prog == 0 && choice == 2){
        			npcLine.text = jockQuest("AQA");
        		}
        		if(prog == 1 && choice == 2){
        			npcLine.text = jockQuest("AQB");
        		}
        		if(prog == 2 && choice == 2){
        			npcLine.text = jockQuest("AQC");
        		}
        		if(prog == 3 && choice == 2){
        			npcLine.text = jockQuest("AQD");
        		}
        		if(prog >= 100000 && choice == 2){
        			npcLine.text = jockclue;
        		}
        		if(choice == 5){//betadialogue
        			if(prog == 0){
        			npcLine.text = JockSays("AGB");
        			}
        			if(prog == 1){
        			npcLine.text = JockSays("ARA");
        			}
        			if(prog == 2){
        			npcLine.text = JockSays("ARB");
        			}
        		}
        	}
        	if(npc == "N"){
        		if(prog == 0 && choice == 1){

        			npcLine.text = NerdSays("ARB");	
        		}
        		if(prog == 1 && choice == 1){
        			npcLine.text = NerdSays("AGC");
        		}
        		if(prog >= 2 && choice == 1){
        			npcLine.text = NerdSays("AAA");
        		}
        		if(prog == 0 && choice == 2){
        			npcLine.text = nerdQuest("AQA");
        		}
        		if(prog == 1 && choice == 2){
        			npcLine.text = nerdQuest("AQB");
        		}
        		if(prog == 2 && choice == 2){
        			npcLine.text = nerdQuest("AQC");
        		}
        		if(prog == 3 && choice == 2){
        			npcLine.text = nerdQuest("AQD");
        		}
        		if(prog >= 100000 && choice == 2){
        			npcLine.text = nerdclue;
        		}
        		
        		if(choice == 5){//betadialogue
        			if(prog == 0){
        			npcLine.text = NerdSays("AGB");
        			}
        			if(prog == 1){
        			npcLine.text = NerdSays("ARA");
        			}
        			if(prog == 2){
        			npcLine.text = NerdSays("AVC");
        			}
        		}
        	}
        	
        	if(npc == "C"){
        		if(prog == 0 && choice == 1){
        			heroLine.text = HeroSays("MGA");
        			npcLine.text = CheerSays("AGA");	
        		}
        		if(prog == 1 && choice == 1){
        			npcLine.text = CheerSays("AGB");
        		}
        		if(prog >= 2 && choice == 1){
        			npcLine.text = CheerSays("AGC");
        		}
        		if(prog == 0 && choice == 2){
        			npcLine.text = cheerQuest("AQA");
        		}
        		if(prog == 1 && choice == 2){
        			npcLine.text = cheerQuest("AQB");
        		}
        		if(prog == 2 && choice == 2){
        			npcLine.text = cheerQuest("AQC");
        		}
        		if(prog == 3 && choice == 2){
        			npcLine.text = cheerQuest("AQD");
        		}
        		if(prog >= 100000 && choice == 2){
        			npcLine.text = cheerclue;
        		}
        		if(choice == 5){//betadialogue
        			if(prog == 0){
        			npcLine.text = CheerSays("ARA");
        			}
        			if(prog == 1){
        			npcLine.text = CheerSays("ARB");
        			}
        			if(prog == 2){
        			npcLine.text = CheerSays("ARC");
        			}
        		}
        	}
        	if(npc == "P"){
        		if(prog == 0 && choice == 1){
        			heroLine.text = HeroSays("MGA");
        			npcLine.text = PrepSays("AGB");	
        		}
        		if(prog == 1 && choice == 1){
        			npcLine.text = PrepSays("AGC");
        		}
        		if(prog >= 2 && choice == 1){
        			npcLine.text = PrepSays("ARA");
        		}
        		if(prog == 0 && choice == 2){
        			npcLine.text = prepQuest("AQA");
        		}
        		if(prog == 1 && choice == 2){
        			npcLine.text = prepQuest("AQB");
        		}
        		if(prog == 2 && choice == 2){
        			npcLine.text = prepQuest("AQC");
        		}
        		if(prog == 3 && choice == 2){
        			npcLine.text = prepQuest("AQD");
        		}
        		if(prog >= 100000 && choice == 2){
        			npcLine.text = prepclue;
        		}
        		if(choice == 5){//betadialogue
        			if(prog == 0){
        			npcLine.text = PrepSays("AGA");
        			}
        			if(prog == 1){
        			npcLine.text = PrepSays("ARB");
        			}
        			if(prog == 2){
        			npcLine.text = PrepSays("ARC");
        			}
        		}
        	}
        	if(npc == "S"){
        		if(prog == 0 && choice == 1){
        			heroLine.text = HeroSays("MGA");
        			npcLine.text = SlackerSays("AGA");	
        		}
        		if(prog == 1 && choice == 1){
        			npcLine.text = SlackerSays("AGB");
        		}
        		if(prog >= 2 && choice == 1){
        			npcLine.text = SlackerSays("ARA");
        		}
        		if(prog == 0 && choice == 2){
        			npcLine.text = slackerQuest("AQA");
        		}
        		if(prog == 1 && choice == 2){
        			npcLine.text = slackerQuest("AQB");
        		}
        		if(prog == 2 && choice == 2){
        			npcLine.text = slackerQuest("AQC");
        		}
        		if(prog == 3 && choice == 2){
        			npcLine.text = slackerQuest("AQD");
        		}
        		if(prog >= 100000 && choice == 2){
        			npcLine.text = slackerclue;
        		}
        		if(choice == 5){//betadialogue
        			if(prog == 0){
        			npcLine.text = SlackerSays("AVA");
        			}
        			if(prog == 1){
        			npcLine.text = SlackerSays("AGC");
        			}
        			if(prog == 2){
        			npcLine.text = SlackerSays("AVB");
        			}
        		}
        	}
        	if(npc == "B"){
        		if(prog == 0 && choice == 1){
        			heroLine.text = HeroSays("MGA");
        			npcLine.text = BullySays("AGA");	
        		}
        		if(prog == 1 && choice == 1){
        			npcLine.text = BullySays("AGB");
        		}
        		if(prog >= 2 && choice == 1){
        			npcLine.text = BullySays("ARB");
        		}
        		if(prog == 0 && choice == 2){
        			npcLine.text = bullyQuest("AQA");
        		}
        		if(prog == 1 && choice == 2){
        			npcLine.text = bullyQuest("AQB");
        		}
        		if(prog == 2 && choice == 2){
        			npcLine.text = bullyQuest("AQC");
        		}
        		if(prog == 3 && choice == 2){
        			npcLine.text = bullyQuest("AQD");
        		}
        		if(prog >= 100000 && choice == 2){
        			npcLine.text = bullyclue;
        		}
        		if(prog == 0 && choice == 5){//betadialogue
        			npcLine.text = BullySays("AGC");
        		}
        		if(prog == 1 && choice == 5){
        			npcLine.text = BullySays("ARA");
        		}
        		if(prog == 2 && choice == 5){
        			npcLine.text = BullySays("AVA");
        		}
        		
        	}
           if(npc == "T"){
           		if(choice == 1){
           		npcLine.text = "Have you done your math HW?";
           		}
           		if(choice == 2){
           		npcLine.text = "Questions, Comments, Quandaries?";
           		}
           }
        }

	}
}