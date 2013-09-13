package
{
    //check with DW re which imports specifically support the maps
    import cocos2d.CCSprite;
    import cocos2d.CCRect;
    import cocos2d.CCSpriteFrame;

    public class Map
    {
        public var walls:Vector.<CCRect> = [];

        //one door
        public static var door:CCRect;

    	public static var room:CCSprite;

        //merge 'lbwall' and 'rbwall' to 'bbwall'?
    	public static var lbwall:CCRect;
    	public static var llwall:CCRect;
    	public static var uuwall:CCRect;
    	public static var rrwall:CCRect;
    	public static var rbwall:CCRect;

    }//end class

}//end package