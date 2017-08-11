local function do_keyboard_robot()
    local keyboard = {}
    keyboard.inline_keyboard = {
		{
    					{text = 'Sphero Number(c)', callback_data = '!share'},
    					},
    					{
    		    		{text = 'Best Antispam Ch', callback_data = '!buygroup'},
{text = 'FreeGroup📦🔮', callback_data = '/chat'},
    		    		{text = 'Sphero Support', url = 'https://telegram.me/joinchat/C67c0D-5QEEIerZWKv1G9g'},
	    },
	    {
	    {text = '🔙Back', callback_data = '!home'}
        }
    }
    return keyboard
end
local function do_keyboard_buygroup()
    local keyboard = {}
    keyboard.inline_keyboard = {
{
    		    		{text = 'AntiSpam Training📦', url = 'http://telegram.me/create_antispam_bot'},
    		    		{text = 'More training', url = 'https://telegram.me/spheroch'},
	    },
	    {
	    {text = '🔙Back', callback_data = '!robot'}
        }
    }
    return keyboard
end
local function do_keyboard_private()
    local keyboard = {}
    keyboard.inline_keyboard = {
    {
	        {text = '🔥برای ارسال عکس یا غیره کلیک کنید🔮', callback_data = '/chat'},
        },
	--[[	{
				{text = '�برای خرید ربات کلیک کنید�', url = 'https://telegram.me/sphero_ch'},
	    },]]
	}		
    return keyboard
end

local function do_keyboard_startme()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = '📥click', url = 'https://telegram.me/'..bot.username}
	    }
    }
    return keyboard
end
local function do_keyboard_channel()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = 'mobina Khoshgele', url = 'https://telegram.me/Mobina_Khoshgele'},
	    },
	{
	        		{text = 'Da3sHacker', url = 'https://telegram.me/Da3shacker'},

    },
		{
	    {text = '🔙Home', callback_data = '!home'},
        }
    
    }
    return keyboard
end

local action = function(msg, blocks, ln)
    if blocks[1] == 'start' or blocks[1] == 'help' then
        db:hset('bot:users', msg.from.id, 'xx')
        db:hincrby('bot:general', 'users', 1)
        if msg.chat.type == 'private' then
            local message = [[ برای ارتباط با ادمین گروه موزیکال یا ارسال عکس، ویس ، و غیره بر روی دکمه زیر کلیک کنید 👇]]
            local keyboard = do_keyboard_private()
            api.sendKeyboard(msg.from.id, message, keyboard, true)
            end
			if msg.chat.type == 'group' or msg.chat.type == 'supergroup' then
          api.sendKeyboard(msg.chat.id, 'سلام برای ارتباط با ادمین گروه موزیکال دکمه زیر رو بزن' ,do_keyboard_startme(), true)
        end
        return
    end

    if msg.cb then
        local query = blocks[1]
        local msg_id = msg.message_id
        local text
        if query == 'channel' then
            local text = 'ایدی های فروشی💎'
            local keyboard = do_keyboard_channel()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'robot' then
            local text = [[اسفرو رباتی امن برای گروه های شما است
بصورت کاملا رایگان فقط کافیست از همین بخش گزینه
freegroup
را لمس کرده و لینک گروه خود را بفرستید
دیگر امکانات ربات👇]]
            local keyboard = do_keyboard_robot()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'buygroup' then
            local text = [[_Best AntiSpam Channels📺_]]
            local keyboard = do_keyboard_buygroup()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'home' then
            local text = [[*Welcome Back To Home*
*UnknoWnCyber Official Bot 🔥*]]
            local keyboard = do_keyboard_private()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if db:get("share:"..msg.chat.id) then
    local wtf = db:ttl("share:"..msg.chat.id)
 api.sendMessage(msg.chat.id, 'شما به تازگی شماره دریافت کرده اید\n*'..wtf..'* ثانیه دیگر امتحان کنید.', true)
else
db:setex("share:"..msg.chat.id, 60, 'true')
        if query == 'share' then
     api.sendContact(msg.from.id, '+989309649221', '🔸~[S]epehr')
end
			end
    end

end

return {
	action = action,
	triggers = {
	    '^/(start)$',
	    '^/(start)$',
	   -- '^/(help)$',
	    '^###cb:!(home)',
'^###cb:!(buygroup)',
	   '^###cb:!(channel)',
	    '^###cb:!(robot)',
	    '^###cb:!(share)',

    }
}
