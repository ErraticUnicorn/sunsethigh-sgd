package{
	import System.Platform.Platform;
	import System.Number;
	
    import cocos2d.Cocos2DGame;
    import cocos2d.CCSprite;
    import cocos2d.CCRect;
    import cocos2d.CCSpriteFrame;
    import cocos2d.CCNode;
    
    import cocos2d.Cocos2D;

   	import Loom.Animation.Tween;
    import Loom.Animation.EaseType;
    

	public class NPC  extends CCNode{
	public var allnpc:Vector.<CCSprite> = [];
	public var npctype:Vector.<String> = [];
	public var hnpcs:Vector.<CCSprite> = [];
	public var hy:Vector.<Number> = [];
	public var mnpcs:Vector.<CCSprite> = [];
	public var my:Vector.<Number> = [];
	public var bnpcs:Vector.<CCSprite> = [];
	public var by:Vector.<Number> = [];
	public var snpcs:Vector.<CCSprite> = [];
	public var sy:Vector.<Number> = [];
	public var lnpcs:Vector.<CCSprite> = [];
	public var ly:Vector.<Number> = [];
	public var ynpcs:Vector.<CCSprite> = [];
	public var yy:Vector.<Number> = [];
	public var cnpcs:Vector.<CCSprite> = [];
	public var cy:Vector.<Number> = [];
	
	public var Beta:CCSprite;
	
	public function NPC(){
		//hall
		JBCreate(437, 762);
		hnpcs.push(Beta);
		hy.push(762);
		CBCreate(472, 762);
		hnpcs.push(Beta);
		hy.push(762);
		CBCreate(1055, 836);
		hnpcs.push(Beta);
		hy.push(836);
		SBCreate(937, 538);
		hnpcs.push(Beta);
		hy.push(538);
		SBCreate(978, 538);
		hnpcs.push(Beta);
		hy.push(538);
		PBCreate(1469, 760);
		hnpcs.push(Beta);
		hy.push(760);
		CBCreate(1440, 760);
		hnpcs.push(Beta);
		hy.push(760);
		NBCreate(789, 763);
		hy.push(763);
		hnpcs.push(Beta);
		BBCreate(678, 501);
		hy.push(501);
		hnpcs.push(Beta);
		
		//math
		JBCreate(482, -1202);
		mnpcs.push(Beta);
		my.push(202);
		NBCreate(608, -1409);
		my.push(409);
		mnpcs.push(Beta);
		
		//bathroom
		NBCreate(907, -1394);
		bnpcs.push(Beta);
		by.push(394);
		Beta.setRotation(180);
		BBCreate(907, -1362);;
		bnpcs.push(Beta);
		by.push(301);
		
		//science
		NBCreate(978, -1346);
		snpcs.push(Beta);
		sy.push(346);
		NBCreate(1022, -1346);
		snpcs.push(Beta);
		sy.push(346);
		NBCreate(1073, -1346);
		snpcs.push(Beta);
		sy.push(346);
		NBCreate(1121, -1346);
		snpcs.push(Beta);
		sy.push(346);
		NBCreate(1164, -1346);
		snpcs.push(Beta);
		sy.push(346);
		SBCreate(661, -1292);
		snpcs.push(Beta);
		sy.push(292);
		
		//library
		CBCreate(400, -1529);
		lnpcs.push(Beta);
		ly.push(526);
		CBCreate(436, -1529);
		lnpcs.push(Beta);
		ly.push(529);
		PBCreate(840, -1625);
		lnpcs.push(Beta);
		ly.push(625);
		SBCreate(849, -1334);
		lnpcs.push(Beta);
		ly.push(334);
		
		//yard
		CBCreate(472, -1479);
		ynpcs.push(Beta);
		yy.push(479);
		PBCreate(503, -1577);
		ynpcs.push(Beta);
		yy.push(577);
		PBCreate(546, -14577);
		ynpcs.push(Beta);
		yy.push(577);
		CBCreate(943, -1201);
		ynpcs.push(Beta);
		yy.push(201);
		JBCreate(850, -1201);
		ynpcs.push(Beta);
		yy.push(201);
		JBCreate(503, -1194);
		ynpcs.push(Beta);
		yy.push(194);
		
		//cafe
		NBCreate(468, -1623);
		cnpcs.push(Beta);
		cy.push(623);
		NBCreate(468, -1593);
		cnpcs.push(Beta);
		cy.push(593);
		PBCreate(564, -1421);
		cnpcs.push(Beta);
		cy.push(421);
		PBCreate(564, -1261);
		cnpcs.push(Beta);
		cy.push(361);
		SBCreate(1042, -1421);
		cnpcs.push(Beta);
		cy.push(421);
		SBCreate(1042, -1367);
		cnpcs.push(Beta);
		cy.push(367);
		CBCreate(754, -1206);
		cnpcs.push(Beta);
		cy.push(206);
		JBCreate(851, -1216);
		cnpcs.push(Beta);
		cy.push(216);
		BBCreate(1044, -1216);
		cnpcs.push(Beta);
		cy.push(216);
	}
	
	public function tweenOff(location:String){
		var npcs:Vector.<CCSprite>;
		if(location == "H")
			npcs = hnpcs;
		if(location == "M")
			npcs = mnpcs;
		if(location == "B")
			npcs = bnpcs;
		if(location == "S")
			npcs = snpcs;
		if(location == "L")
			npcs = lnpcs;
		if(location == "Y")
			npcs = ynpcs;
		
		for(var i = 0; i < npcs.length; i++){
		Tween.to(npcs[i], 0.5, {"y": -1000, "ease": EaseType.EASE_IN_BACK});
		}
		
	}
	
	public function tweenOn(location:String){
		var npcs:Vector.<CCSprite>;
		var y:Vector.<Number>;
		if(location == "H"){
			npcs = hnpcs;
			y = hy;
			}
		if(location == "M"){
			npcs = mnpcs;
			y = my;
			}
		if(location == "B"){
			npcs = bnpcs;
			y = by;
			}
		if(location == "S"){
			npcs = snpcs;
			y = sy;
			}
		if(location == "L"){
			npcs = lnpcs;
			y = ly;
			}
		if(location == "Y"){
			npcs = ynpcs;
			y = yy;
			}
		if(location == "C"){
			npcs = cnpcs;
			y = cy;
		}
		for(var i = 0; i < npcs.length; i++){
		Tween.to(npcs[i], 0.5, {"y": y[i], "ease": EaseType.EASE_IN_BACK});
		}
		
	}
	
	public function JBCreate(x:Number, y:Number){
		Beta = CCSprite.createFromFile("assets/images/characters/othercharacters/jock2.png");
		npctype.push("J");
		Beta.setPosition(x, y);
		this.addChild(Beta);
		allnpc.push(Beta);
	}
	
	public function NBCreate(x:Number, y:Number){
		Beta = CCSprite.createFromFile("assets/images/characters/othercharacters/nerd2.png");
		npctype.push("N");
		Beta.setPosition(x, y);
		this.addChild(Beta);
		allnpc.push(Beta);
	}
	public function CBCreate(x:Number, y:Number){
		Beta = CCSprite.createFromFile("assets/images/characters/othercharacters/cheerleader2.png");
		npctype.push("C");
		Beta.setPosition(x, y);
		this.addChild(Beta);
		allnpc.push(Beta);
	}
	public function PBCreate(x:Number, y:Number){
		Beta = CCSprite.createFromFile("assets/images/characters/othercharacters/prep2.png");
		npctype.push("P");
		Beta.setPosition(x, y);
		this.addChild(Beta);
		allnpc.push(Beta);
	}
	public function SBCreate(x:Number, y:Number){
		Beta = CCSprite.createFromFile("assets/images/characters/othercharacters/slacker.png");
		npctype.push("S");
		Beta.setPosition(x, y);
		this.addChild(Beta);
		allnpc.push(Beta);
	}
	public function BBCreate(x:Number, y:Number){
		Beta = CCSprite.createFromFile("assets/images/characters/othercharacters/bully2.png");
		npctype.push("B");
		Beta.setPosition(x, y);
		this.addChild(Beta);
		allnpc.push(Beta);
	}
	
	}

}