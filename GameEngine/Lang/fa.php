<?php

//TRIBES
define("TRIBE1","رومی ها"); 
define("TRIBE2","توتن ها");
define("TRIBE3","گول ها"); 
define("TRIBE4","طبیعت"); 
define("TRIBE5","ناتار ها");
define("TRIBE6","حیوانات");


//MAIN MENU
define("HOME","صفحه اصلی");
define("LOGIN","ورود");
define("REG","ثبت نام");
define("FORUM","تالار گفتمان");
define("SUPPORT","پشتیبانی");
define("LOGOUT","خروج");
define("HEADER_DORF1","منابع");
define("HEADER_DORF2","ساختمان ها");
define("HEADER_MAP","نقشه");
define("HEADER_STATS","آمار");
define("HEADER_NOTICES","گزارش ها");
define("HEADER_NOTICES_NEW","گزارش جدید");
define("HEADER_MESSAGES","پیام ها");
define("HEADER_MESSAGES_NEW","پیام جدید");


//LOGIN.php
define("LOGIN_WELCOME","به سرور ".SERVER_NAME." خوش آمدید!");
define("LOGIN_NO_JAVASCRIPT","در مرورگر شما JavaScript غیرفعال می‌باشد. برای اینکه قادر به بازی باشید باید از تنظیمات مرورگر خود JavaScript را فعال کنید.");
define("LOGIN_USERNAME","نام اکانت");
define("LOGIN_PASSWORD","رمز عبور");
define("LOGIN_LOWRES_OPTION","ویرایش برای بازیکن");
define("LOGIN_LOWRES_DESC","با پهنای باند کمتر (سرعت اینترنت کمتر)");
define("LOGIN_LOWRES_NOTICE","(توجه: این ویرایش نقشه تمامی امکان‌های ممکن را ندارد)");
define("LOGIN_PW_FORGOTTEN","رمز عبور را فراموش کردید؟");
define("LOGIN_PW_EMAIL","ایمیل:");
define("LOGIN_PW_BTN","درخواست رمز عبور");
define("LOGIN_PW_REQUEST","ما برای شما رمز جدیدی ارسال خواهیم کرد. به محض اینکه دریافت نامه را تایید کنید رمز فعال خواهد شد.");
define("LOGIN_PW_SENT","یک ایمیل حاوی رمز عبور جدید به ایمیل شما فرستاده شد");
define("LOGIN_SERVER_START","بازی هنوز شروع نشده است. شما قادر به بازی کردن در");
define("LOGIN_SERVER_START2","می باشید.");
define("PW_GENERATE","همه قسمت ها الزامی است");
define("EMAIL_NOT_VERIFIED","ایمیل تایید نشده");
define("EMAIL_FOLLOW","برای فعالسازی اکانت خود روی این لینک کلیک کنید");
define("VERIFY_EMAIL","ایمیل تایید شد");
define("COOKIES","برای ورود، باید کوکی را فعال کنید. در صورتی که شما کامپیوتر را مشتركاً با اشخاص دیگری استفاده می کنید، باید به هنگام خروج، لاگ اوت (خروج) را بزنید.");


//LOGOUT.php
define("LOGOUT_TITLE","خروج موفقیت آمیز");
define("LOGOUT_H4","با تشکر از بازديد شما.");
define("LOGOUT_DESC","اگر افراد دیگری نیز از این کامپیوتر استفاده می کنند، شما باید کوکی ها را برای امنیت بیشتر خود پاک کنید:");
define("LOGOUT_LINK","پاک کردن کوکی ها");


//REGISTER
define("REGISTER_USERINFO","اطلاعات کاربر");
define("REGISTER_USERNAME","نام:");
define("REGISTER_EMAIL","ایمیل:");
define("REGISTER_LOCATION","محل شروع");
define("REGISTER_RANDOM","انتخاب تصادفی");
define("REGISTER_NW","شمال غربی");
define("REGISTER_NE","شمال شرقی");
define("REGISTER_SW","جنوب غربی");
define("REGISTER_SE","جنوب شرقی");
define("ACCEPT_RULES"," من قوانین را خوانده و قبول دارم.");
define("REGISTER_MOREINFO","اطلاعات بیشتر");
define("REGISTER_PASSWORD","رمز عبور:");
define("REGISTER_SELECT_TRIBE","یک نژاد انتخاب کنید");
define("BEFORE_REGISTER","قبل از اینکه ثبت نام کنید، بهتر است بخش <a href='../anleitung.php' target='_blank'>راهنمایی</a> تراوین را مطالعه کنید تا از برتری و ضعف هر یک از سه نژاد مطلع شوید.");
define("REGISTER_STARTER","اگر به تازگی با TRAFIAN آشنا شده اید، توصیه می شود که نژاد گول را انتخاب کنید.");


//CONTACT.PHP
define("CONTACT_DESC","شما می توانید از فرم زیر درخواست خود را به پشتیبانی ارسال کنید. لطفاً با دقت پاسخ سوالات فرم را با جزیئات وارد کنید تا در اسرع وقت قادر به راهنمایی شما باشیم.");
define("CONTACT_CATEGORY","دسته");
define("CONTACT_SELECT_SUBJECT","لطفاً انتخاب کنید");
define("CONTACT_SUBJECT1","سوال عمومی");
define("CONTACT_SUBJECT2","نمی توانم وارد اکانت شوم");
define("CONTACT_SUBJECT3","نمی توانم ثبت نام کنم");
define("CONTACT_SUPPORT","پشتیبانی سرور");
define("CONTACT_USERNAME","نام کاربری");
define("CONTACT_USER_NOT_EXIST","این نام کاربری ثبت نشده.");
define("CONTACT_EMAIL","ایمیل");
define("CONTACT_MESSAGE","پیام");
define("CONTACT_SEND","ارسال");
define("CONTACT_SENT","با موفقیت ارسال شد.");


//ERRORS
define("USRNM_EMPTY","(خالی است)");
define("USRNM_TAKEN","(قبلا استفاده شده)");
define("USRNM_SHORT","(حداقل ".USRNM_MIN_LENGTH." حرف)");
define("USRNM_CHAR","(کاراکترهای اشتباه)");
define("PW_EMPTY","(خالی است)");
define("PW_SHORT","(حداقل ".PW_MIN_LENGTH." حرف)");
define("PW_INSECURE","(رمز نامعتبر است، یک رمز دیگر انتخاب کنید)");
define("EMAIL_EMPTY","(خالی است)");
define("EMAIL_INVALID","(اشتباه است)");
define("EMAIL_NOTEXIST","این ایمیل وجود ندارد.");
define("EMAIL_TAKEN","(قبلا استفاده شده)");
define("TRIBE_EMPTY","<li>لطفا نژاد را انتخاب کنید</li>");
define("AGREE_ERROR","<li>باید قوانین بازی را خوانده و قبول کنید</li>");
define("LOGIN_USR_EMPTY","نام را وارد کنید");
define("LOGIN_PASS_EMPTY","رمز عبور را وارد کنید");
define("EMAIL_ERROR","ایمیل وارد شده معتبر نیست");
define("PASS_MISMATCH","رمز عبور هماهنگ نیست");
define("ALLI_OWNER","لطفا قبل از حذف یک جانشین انتخاب کنید");
define("SIT_ERROR","این جانشین قبلا انتخاب شده");
define("USR_NT_FOUND","این نام وجود ندارد");
define("USR_BAN","اکانت شما بازداشت شده");
define("LOGIN_PW_ERROR","رمز عبور اشتباه است");
define("WEL_TOPIC","توضیحات و اطلاعات ");
define("ATAG_EMPTY","علامت خالی است");
define("ANAME_EMPTY","نام خالی است");
define("ATAG_EXIST","قبلا ثبت شده");
define("ANAME_EXIST","قبلا ثبت شده");


//BUILD.TPL
define("CUR_PROD","تولیدات فعلی");
define("NEXT_PROD","تولیدات در سطح ");
define("BUILDING_UPGRADING","ساختمان:");
define("HOURS","ساعت");


//WARSIM.TPL
define("WARSIM","شبیه ساز جنگی");
define("WARSIM_ATTACKER","حمله کننده");
define("WARSIM_DEFENDER","مدافع");
define("WARSIM_ETC","غیره");

define("WARSIM_POP","جمعیت");
define("WARSIM_KATA","سطح هدف منجنیق");
define("WARSIM_HEROPOWER","قهرمان (امتیاز حمله)");
define("WARSIM_STONEMASON","سنگ تراشی");
define("WARSIM_PALACE","قصر / اقامتگاه");

//BUILDINGS
define("B1","هیزم شکن");
define("B1_DESC","هیزم شکن چوب تولید میکند. هرچقدر که بیشتر ارتقا داده شود چوب بیشتری تولید میکند");
define("B2","آجر سازی");
define("B2_DESC","در اینجا آجر خام (خشت) ساخته می شود. هر قدر سطح این ساختمان بالاتر باشد تولید این محصول بیشتر خواهد شد.");
define("B3","معدن آهن");
define("B3_DESC","در اینجا معدنچیان، به تولید آهن می پردازند. هر قدر که سطح معدن بالاتر باشد، آهن بیشتری تولید خواهد شد.");
define("B4","گندمزار");
define("B4_DESC","غذای مصرفی مردم در اینجا تولید می شود که با وسعت دادنش توليد محصول بیشتر می شود");

//DORF1
define("WOOD","چوب");
define("CLAY","خشت");
define("IRON","آهن");
define("CROP","گندم");
define("LEVEL","سطح");
define("CROP_COM",CROP." مصرفی");
define("PER_HR","در ساعت");
define("PROD_HEADER","تولیدات");
define("MULTI_V_HEADER","دهکده ها");
define("ANNOUNCEMENT","اعلانات");
define("GO2MY_VILLAGE","بازگشت به دهکده");
define("VILLAGE_CENTER","مرکز دهکده");
define("FINISH_GOLD","آِیا میخواهید کارهای این دهکده را با 2طلا به اتمام برسانید؟");
define("WAITING_LOOP","(نوبت ساخت)");
define("HRS","(ساعت)");
define("DONE_AT","اتمام در");
define("CANCEL","انصراف");
define("LOYALTY","وفاداری:"); 
define("SEVER_TIME","زمان سرور:");
define("SIDEINFO_CHANGEVIL_BTN","ذخیره"); 
define("SIDEINFO_CHANGEVIL_LABEL","نام جدید دهکده:"); 
define("SIDEINFO_CHANGEVIL_TITLE","تغییر نام دهکده"); 
define("SIDEINFO_CHANGE_TITLE","برای تغییر نام دهکده دوبار کلیک (دوبل کلیک) کنید."); 
define("SIDEINFO_ADVENTURES","ماجراجویی"); 
define("SIDEINFO_AUCTIONS","حراجی"); 
define("SIDEINFO_PROFILE","پروفایل");
define("SIDEINFO_ALLIANCE","اتحاد");
define("SIDEINFO_ALLY_FORUM","فروم اتحاد");


//======================================================//
//================ UNITS - DO NOT EDIT! ================//
//======================================================//

//HERO
define("U0","قهرمان");

//ROMAN UNITS
define("U1","سرباز لژیون");
define("U2","محافظ");
define("U3","شمشیرزن");
define("U4","خبرچین");
define("U5","شوالیه");
define("U6","شوالیه سزار");
define("U7","دژکوب");
define("U8","منجنیق آتشین");
define("U9","سناتور");
define("U10","مهاجر");

//TEUTON UNITS
define("U11","گرزدار");
define("U12","نیزه دار");
define("U13","تبرزن");
define("U14","جاسوس");
define("U15","دلاور");
define("U16","شوالیه توتن");
define("U17","دژکوب");
define("U18","منجنیق");
define("U19","رئیس");
define("U20","مهاجر");

//GAUL UNITS
define("U21","سرباز پیاده");
define("U22","شمشیرزن");
define("U23","ردیاب");
define("U24","رعد");
define("U25","کاهن سواره");
define("U26","شوالیه گول");
define("U27","دژکوب");
define("U28","منجنیق");
define("U29","رئیس قبیله");
define("U30","مهاجر");
define("U99","دام");

//NATURE UNITS
define("U31","موش");
define("U32","عنکبوت");
define("U33","مار");
define("U34","خفاش");
define("U35","گراز وحشی");
define("U36","گرگ");
define("U37","خرس");
define("U38","تمساح");
define("U39","ببر");
define("U40","فیل");

//NATARS UNITS
define("U41","نیزه دار ناتار");
define("U42","تیغ پوش");
define("U43","محافظ ناتار");
define("U44","پرندگان شکاری");
define("U45","تیشه زن");
define("U46","شوالیه ناتار");
define("U47","فيل عظيم الجثه جنگي");
define("U48","منجنیق عظيم");
define("U49","امپراطوري ناتار");
define("U50","مهاجر");

//INDEX.php
define("LOGIN","ورود");
define("PLAYERS","بازیکنان");
define("ONLINE","آنلاین");
define("TUTORIAL","آموزش");
define("PLAYER_STATISTICS","آمار بازیکنان");
define("TOTAL_PLAYERS","مجموع ".PLAYERS."");
define("ACTIVE_PLAYERS","بازیکنان فعال");
define("ONLINE_PLAYERS","".PLAYERS." آنلاین");
define("MP_STRATEGY_GAME","".SERVER_NAME." - بازی اینترنتی - رومی ها، گول ها و توتن ها");
define("WHAT_IS","".SERVER_NAME." is one of the most popular browser games in the world. As a player in ".SERVER_NAME.", you will build your own empire, recruit a mighty army, and fight with your allies for game world hegemony.");
define("REGISTER_FOR_FREE","رایگان عضو شوید");
define("LATEST_GAME_WORLD","آخرین جهان های بازی");
define("LATEST_GAME_WORLD2","در آخرین<br/>جهان بازی<br/>عضو شوید<br/>و تلاش کنید<br/>برای اول شدن.");
define("PLAY_NOW","بازی کردن ".SERVER_NAME."");
define("LEARN_MORE","اطلاعات بیشتر <br/>درباره ".SERVER_NAME."!");
define("COMUNITY","اجتماع");
define("NEWS","اخبار");
define("SCREENSHOTS","تصاویر");
define("LOGIN_TO","ورود به ". SERVER_NAME);
define("REGIN_TO","عضویت در ". SERVER_NAME);
define("P_ONLINE","بازیکنان آنلاین: ");
define("P_TOTAL","مجموع بازیکنان: ");
define("CHOOSE","لطفا یک سرور انتخاب کن");
define("STARTED"," این سرور ". round((time()-COMMENCE)/86400) ." روز قبل شروع شده است");


//ATTACKS ETC.
define("TROOP_MOVEMENTS","حرکت لشکریان:");
define("ARRIVING_REINF_TROOPS","رسیدن نیروی کمکی");
define("ARRIVING_REINF_TROOPS_SHORT","نیروی کمکی");
define("OWN_ATTACKING_TROOPS","حملات از دهکده");
define("ARRIVING_ATTACKING_TROOPS","حرکت نیروهای دشمن");
define("ATTACK","حمله");
define("OWN_REINFORCING_TROOPS","نیروی کمکی در دهکده");
define("TROOPS_DORF","لشکریان:");


//404.php
define("NOTHING_HERE","اینجا چیزی موجود نیست!");
define("WE_LOOKED","ما 404 بار نگاه کردیم اما هیچی پیدا نکردیم!");

//HEADER.TPL
define("SERVER_TIME","زمان سرور:");
define("HEADER_DAY","روز");
define("HEADER_NIGHT","شب");
define("HEADER_GOLD","سکۀ طلای تراوین");
define("HEADER_SILVER","سکۀ نقرۀ تراوین");
define("HEADER_PLUS","پلاس");
define("HEADER_PLUSMENU","منوی پلاس");
define("HEADER_ADMIN","مدیریت");

//NOTICES
define("REPORT_SUBJECT","موضوع:");
define("REPORT_ATTACKER","مهاجم");
define("REPORT_DEFENDER","مدافع");
define("REPORT_RESOURCES","منابع");
define("REPORT_FROM_VIL","از دهکده‌ی");
define("REPORT_FROM_ALLY","از اتحاد");
define("REPORT_SENT","فرستاده شده");
define("REPORT_SENDER","فرستنده");
define("REPORT_RECEIVER","گیرنده");
define("REPORT_AT","در");
define("REPORT_TO","به");
define("REPORT_SEND_RES","منابع می‌فرستد");
define("REPORT_DEL_BTN","حذف گزارش");
define("REPORT_DEL_QST","واقعاً گزارش حذف شود؟");
define("REPORT_WARSIM","شبیه ساز جنگی");
define("REPORT_ATK_AGAIN","تکرار حمله");
define("REPORT_TROOPS","لشکریان");
define("REPORT_REINF","نیروی کمکی");
define("REPORT_CASUALTIES","تلفات");
define("REPORT_INFORMATION","اطلاعات");
define("REPORT_BOUNTY","غنائم");
define("REPORT_CLOCK","مدت زمان");
define("REPORT_UPKEEP","غذای مصرفی");
define("REPORT_PER_HOURS","در ساعت");
define("REPORT_SEND_REINF_TO","نیروی کمکی ارسال کرد به");

//MASSMESSAGE.php
define("MASS","متن پیغام");
define("MASS_SUBJECT","موضوع:");
define("MASS_COLOR","رنگ:");
define("MASS_REQUIRED","همه قسمت ها الزامی است");
define("MASS_UNITS","Images (units):");
define("MASS_SHOWHIDE","Show/Hide");
define("MASS_READ","Read this: after adding smilie, you have to add left or right after number otherwise image will won't work");
define("MASS_CONFIRM","تایید");
define("MASS_REALLY","آیا میخواهید ارسال کنید");
define("MASS_ABORT","ارسال نشد");
define("MASS_SENT","ارسال شد");


?>
