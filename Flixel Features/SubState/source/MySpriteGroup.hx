package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxTypedGroup;

/**
 * ...
 * @author Zaphod
 */
class MySpriteGroup extends FlxTypedGroup<FlxSprite>
{

	public function new(numSprites:Int = 50) 
	{
		super();
		
		var sprite:FlxSprite;
		for (i in 0...numSprites)
		{
			sprite = new FlxSprite(Math.random() * FlxG.width, Math.random() * FlxG.height);
			sprite.velocity.x = (100 * (0.5 - Math.random())); 
			sprite.velocity.y =	(100 * (0.5 - Math.random()));
			add(sprite);
		}
	}
	
	override public function update():Void
	{
		super.update();
		
		var sprite:FlxSprite;
		for (i in 0...length)
		{
			sprite = members[i];
			if (sprite.x < 0)
			{
				sprite.x = 0;
				sprite.velocity.x *= -1;
			}
			else if (sprite.x + sprite.width > FlxG.width)
			{
				sprite.x = FlxG.width - sprite.width;
				sprite.velocity.x *= -1;
			}
			if (sprite.y < 0)
			{
				sprite.y = 0;
				sprite.velocity.y *= -1;
			}
			else if (sprite.y + sprite.height > FlxG.height)
			{
				sprite.y = FlxG.height - sprite.height;
				sprite.velocity.y *= -1;
			}
		}
	}
	
}