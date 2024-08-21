import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayari_app/editpage.dart';
import 'package:shayari_app/secondpage.dart';
import 'package:shayari_app/thirdpage.dart';

class logicClass extends GetxController {
  // RxInt sindex = 0.obs;
  int indexColor = 1;
  Color color1 = Colors.red;
  Color color2 = Colors.yellow;
  Color color = Colors.red;
  TextEditingController edit = TextEditingController();

  RxList<List<String>> shayarilist = [
    [
      // Break-Up
      "pyaar mein milte hein dard hajaar..,\n aunke chakkar mein na padna mere yaar...!",
      "Achha hua...\n Jo mein,\n tumhari zindgi meise nikal gyaa...,\n vaise bhi tumhra \n kisi aur se bhara pada tha",
      "bas mari mahubbat hi samaj na aai unhe...,\n per har galti ka hisaab tha uske pas...!",
      "Baat badh ho jaati hai to\n gum milte hai.... \n isih liye hum sabse babut\n kam milte hai. ..",
      "Aaj Toot Kar Uski Yaad Aayi\n To Ehsas Hua,\n Yaaro....\n Ek Baar jo Dil utar jaye...\n to Wo Bhulaye Nahi Jate...",
      "Zindagi mein,\n pyaar ka puada...,\n lagane se pahle\n zmeen parkh lena...",
      "Tanhai mere dil mein\n samati chali gayi..\n Kismat bhi apna khel\n dikhati chali gayi...\nMehkti uski khusbu me jo dekha pyar ko...,\n Bas yaad unki aa gai...\npar woh rulati chali gayi,\nFir bhi unki yaad aa gai...",
      "Kuchh iss tarah se,\n meri zindagi ko maine aasaan kar liya...\n Bhulkar teri bewafai,\n meri tanhai se maine pyar kar liya...",
      "kya huva jo tune,\n hamein dil se nikaal diya...,\n hamne bhi aapke chhitthi ko,\n jahaaj banaa kar\n pani main chalaa diya...",
      "Tute Aalfaz...\n jo dil main hain,\n Tuta hi sahin..\n par dil to \n unke paas hi rah gyaa hain",
      "Wajah Pochne Ki\n Mohlat Hi Na Di Unhone..,\n Lihja Badalta Gaya,\n our Hum Ajnabi Ho Gaye..",
      "Zaroori nahi ki,\n jeene ka koyi sahara ho.., Zaroori nhi ki,\n jiske hum ho woh bhi humara ho..,\n Kuchh kashtiyan\n doob jaya karti hain..., Zaroori nhi ke,\n har kashti ke naseeb me..\n kinara ho...!!",
      "Kitna ajeeb\n apni zindagi ka safar nikla,\n Saare jahan ka dard,\n apna muqaddar nikla...\n Jiske naam apni zindagi ka,\n har lmha kar diya..,\n Afsos......\n wohi humari chahat se bekhabar nikla...",
      "Kaash use chahne ka,\n arman na hota..,\n Main hosh me rehte hue,\n anjan na hota...\n Na pyar hota..\n kisi pathar dil se humko,\n Yah phir koyi....\n pathar dil insaan na hota..",
      "Woh khush hai..\n par shayad hum se nahi,\n Woh naraz hai..\n par shayad hum se nahi,\n Kon kehta hai..\n unke dil me Mohabbat nahi,\n Mohabbat to hai..\n par shayad humse nahi.!!",
      "Tut kar...\n bikhara tha main,\n ruthkar...\n chali gyi thi voh,\n kai saalo ka rishta,\n palbhar...\n main tod gyi thi voh..!",
      "hasin intjaar..\n Yeh Aalag baat hain ki,\n meine kabhi jataya nahin...\n par..\n tu yeh na samazz ki,\n Tune kabhi rulaya nahin,\ntere pukaar ke intjaar main,\n aaj bhi...\n nazare ruki hain meri,\npar tune kabhi,\n mud kar bulaya hi nahi...!",
      "yaad aayegi tu har rohj,\n magar...\n Tuje aavaj na dunga,\nlikhunga tere hi liya,\n har labj,\n magar...\n tera naam na lunga...",
    ],
    [
      //Comedy
      "Zindagi lambi hai\n dost banate raho,\nDil mile na mile\n haath milate raho,\nTaj Mahal banaana toh\n bahut costly hoga..\nPar har gali mai\nEk Mumtaz banate raho…",
      "Log Kehte Hai Ki\n Pyar Ek Aisi Bimari Hai,\n Jiski Koi Dawaah Nahi Hoti,\nHum Kehte Hai ki...\n Bewfai Ek Aisi Dawaah Hai,\nJisse Ye Bimari\n Dubara Nahi Hoti…",
      "Wo ishq to karti hai\npar addah nahi karti,\nWo katal to karti hai\n par khon nahi karti,\n iss kadar kanjoos hai\nmeri chahne wali,\n Mis call to karti\nhai par phone nahi karti…",
      "pyaar adhura hai,\n To adhura hi rehne de\n Pura kiya to...\nKhatam ,Ta-ta, bye-bye",
      "Jindagi behaal hai\nSur hai naa taal hai,\n Msgbox bhi kangal hai\nkya aapki sms factory me hadtal hai,\nyaar kuch to bhejo\n ye meri mobile ki zindagi ka\n sawaal hai…",
      "Jo log..\n jalte hai aapse\n unme thodi,\n Havan Samagri dalkar kahiye\n swaha....",
      "Khud ko,\n zaleel karne ka\n dusra naam,\n mohabbat hain....",
      "pahele ke jamane mein\n log safal huva karte the par,\n aaj kal logo\n viral huva karte hai",
    ],
    [
      //Emotional
      "vishvaas aur pyaar mein\n Aek samanta hein,\n Dono mein se kisi ko bhi\n jabardasti paya nahin jaa sakta...",
      "Like a leaf...\n falling from a tree\n In fact,\n we have fallen in our own eyes.",
      "Sometimes...\n Being Alone\n Is Good,\n No One Can Hurt You...!!",
      "True line...\nKisi ko roj milne se,\n Love ho ya na ho...\n Lekin,\nKisi se roz Baat karne se,\n uski aadat Zaroor ho Jati hai...",
      "Ek bachpan ka zamana tha\nJisme khushiyon ka khazana tha,\nchahat chand ko pane ki thi\npar dil to titiliyo ka Diwana tha...\nThak kar aana school se\n Fir bhi khelne jana tha,\nBarish me kagaj ki naao thi\nHar mausam suhana tha...\nRone ki wajah naa thi\nNa hasne ka bahana tha,\nkyun ho gaye hum itne bade\nIsse accha to bachpan ka Zamaana tha... ",
      "lakki hote hein voh log\n jiske partner,\n mushkil hallat mein bhi\n sah nathi chhodte...!",
      "kisi ke sath\n utni ummid na rakhe ki,\n ummid ke sath\n khud hi tut jao..",
      "jab koi kisihh ka\n saath chhod ta hain\n to sirf aakhe nahi\n dil bhi rotaa hain..!",
      "Sometimes...\n people are like sunshine \nand\n sometimes...\n people are like rain clouds\n But that's okay\n because....\n Both are important\n To make the flowers grow..",
      "Chand kahu toh Chhup jaaoge,\n Dost kahu toh Chhod jaaoge,\n Gulab kahu toh bikhar jaaoge,\n Khawab kahu toh toot jaaoge,\n Chalo aap ka name..\n zindagi rakh du\n Maut se pehle toh nahi Chhod paogi",
    ],
    [
      //Friendship
      "Zaruri nahi ki\n Relationship hi ho...\n Kuch logo ki dosti bhi\n Pyaar se badhkar hoti h..",
      "Wo ziddi hai\n Main gussa ki tez ..\nKabhi wo mujhe le doobta hai\n Kabhi main usse hairan kar deti hu",
      "Friendship is not just a word,\n it's a bond..\n That can never be broken..!",
      "One loyal friend\n Is worth Then\n thousand relatives",
      "Jaruri nahi ki\n dosti me mulaqat hoti rahe,\n Jaruri nahi ki\n baat hoti rahe,\nPar jo jaruri hai\nWo bas yahi Ki\n Dost ko meri dosti\n yaad aati rahe...!!",
      "Dosti ki mehfil saje\n zamana ho gaya,\n Lagta hai khul ke jiye\n zamana ho gaya,\n Kash kahi'n mil jaaye \n kafila wo dosto ka..,\n Apno se bichde ab mujhe\n zamana ho gaya...!",
      "Aaj Khushiyon Ki\n Koi Badhayi Dega,\n Nikla Hai Chand\nTo Dikhayi Dega,\nAye Dost..\n Dosti Ki Hai Humne Aapse,\nAapka Ek Aansu Bhi Ghira To\n Sunai Dega...",
      "Dukh hai dard to\n dawa hai dosti,\n Is zindagi ki\n haseen fiza hai dosti,\nJo na samjhe...\n uske liye kuch nahi,\n Jo samjhe...\n uske liye khuda hai dosti..!",
      "Dosti Bhi\n Kya Cheez Hoti Hai,\nMagar Ye Bhi\n Kisi-Kisi Ko Naseeb Hoti Hai,\nPakad Lete Hai\nJo kaske Daaman Iska,\nSamjho Jannat..\n hamesha Unke Kareeb Hoti Hai.",
      "Ye dil na jaane\nkya kar baitha,\n Mujhse puche bina hi\n faisla kar baitha,\n zameen par toota\n sitara to kabhi nahi girta,\nAur ye pagal hai ki \nchand se dosti kar baitha..",
      "Dosti to sirf ittefaq se hoti hai, Yahi to dilo'n ki mulaqat hai,\n Dosti nahi dekhti\n ye din hai ki raat hai,\n Isme to sada hoti irf\n wafadari or jazbaat hai.!!",
      "Baarish Se kuch bunde\n Maang Lenge, \nChand Se Chandni udhar\n Maang Lenge, \nAgar Teri Dosti Naseeb Hui\n Aye mere Dost, \nTo Khuda Se Ek Aur\n Zindagi Maang Lenge.",
      "Zindagi me bar bar\n sahara nhi milta,\n Bar bar koi pyar se\n pyara nahi milta...\n Hai jo paas use\n sambhal kar rakho,\nKhokar wo yaar fir\n dobara nahi milta..",
      "Waqt ki yaari to Har koi\n karta hai mere dost,\n Maja to tab hai Jab\n waqt badal jaye \nPar yaar na badle.....",
      "Star are many,\n But moon is only one.\n Friends are many,\n But you are my only one...!!",
    ],
    [
      //love
      "Likhi hein meine yeh gazal,\n sirf Tere liyeh...\nDivaane bane bhi to,\nsirf Tere liyeh...\nkisi ko bhi nahi dekhegi,\nAab yeh aakhe meri...\nNazare tarasti bhi to,\nsirf Tere liyeh...\nhar shaas mein, \nYaad karenge tuje...\nYeh shaas nikli bni to\nsirf Tere liyeh...\nHar pyaar se pyaare,\n lagte ho tum muje...\nMeine pyaar sikha bhi to,\n sirf Tere liyeh...",
      "Khawaish nhi hme\n mashur hone ki,\n Magar meri jaan\n pahchanti hai,\n itna Hi kafi\n hai mere liye..",
      "You are Not my,\n First or Last choice...\n But you are Permanent Choice...!!",
      "Aisa nahi hai ki dusri ladki\n nahi milegi mujhe,\nSach to ye hai...\nMujhe tere siwa kisi aur ko\n dekhne ki hasarat hi nahi hoti...!!",
      "Roz..\n Tera Intezar Hota Hai\nRoz..\nYeh Dil Be-Qarar Hota Hai\nKaash Ke Tum Samajh Sakte\nKe Chup Rehne Walo Ko\nBhi Kisi Se\nPyar Hota Hai!!",
      "R is RED\nRed is BLOOD\nBlood is for HEART\nheart is for LOVE\nlove is for YOU\nyou is for ME\nme is for You\nso....finaly I LOVE YOU..!!",
      "Actually, Basically, Technically,\nMentally, Normally, Naturally,\nFinally but truly...\n You're the Sweetest and Lovely",
      "ke tum meri Soch ho\nKoi tumhe Soche kyu...\nTum meri chahat ho\nkoi tumhe chahe kyu...\nTum mera aaina ho\nKoi tumhe dekhe kyu...\n    or...\nTum meri dua ho\nkoi tumhe maange kyu...",
      "Mujhe...\n mujhe kya khabar thi ki\n Tumse itni Mohabbat ho jayegi..\nMujhe to bas tumhara\nMuskurana Achha laga tha..\nNa dil hota na dil rota\nNa Dil se dil judaa hota...\nNa tum itne Hasin hote\nNa tum par Dil,\n Fida Hota..!! ",
      "Mohabat hona na ho\n Ye alag bat hai\n Par...\n teri chaahat ne hame\n apne dil se mila diya",
      "Kaash....Hum bhi\n kisi ke Dil,\n ki Zidd hote..!,\n Kaash...koi hamein bhi\n paane ke liye,\n Hadd paar kar jaata..!",
      "subah hoti nahin\n syam thalti nahin\n najaane...\nkya khubi hein aap mein ke,\nAap ko yaad kiye bina\n khushi milti nahin...!!",
      "Ek Tum Hi Ho..\n Jissy Dekh Kar,\nDill Ko...\n Sukoon Milta Hai.",
      "Love is not about forgetting someone immediately But,\n Real love,\n I will always wait for you even if you won't come back,\n I will still be here.",
      "ab kya kahen..,\n mere dil ke bahut pass\n ho tum..\n mere pyaar ka aek khubsurat aehsaas\n hoo tum...",
      "bin tere meri har khushi adhuri hain..,\n phir soch mere liye tu kitni jaruri hoo...",
      "Tere husn ko\n perde ki zaroorat hi kya hain\nzalim....\n Koun rehta hain hosh main\n tujhe dekhne k baad.",
      "LavZ...alfaaZ...kaagaZ ya kitaab \nKha kha rakhe\n hum Tumhari yaadon ka\n hisaab...",
      "Usko Chaha Par\n Izhar Karna Nahi Aaya,\nKat Gai Ummar\nHame Pyaar Karna Aaya Nahi,\nUsne Kuch Maanga Bhi\nToh Mangi Judai,\nAur Hame Inkaar Karna\n Aaya Nahi…",
      "Tum dil se hamein\n yon pukara na karo,\nYon tum hamein ishara na karo,\nDoor hain tumse ye\n majburi hai hamari,\nTum tanhaiyon mein yun\ntadpaya na karo…!!",
      "Pyar “INSAN” Se Karo\n Uski “Aadat” Se Nahi... \nRutho Unki “Baato” Se\n Magar Unse Nahi....\nBhoolo Unki “Galtiya” ko\nPar Unhe Nahi.. \nKyuki “Rishto” Se Badhkar\nKuch Bhi Nahi...!!",
      "Jaadu hain\n uski har ek baat mein,\n Yaad bahut aati hai\n din or raat me,\nKal jab...\ndekha tha sapna mene raat me,\nTb bhi uska hi\nhaath tha mere haath me..",
      "Is dil ka kaha mano\n Ek kaam kar do\n Ek be-naam si mohabbat\n mere naam kar do,\n Meri zaat par\nfaqat itna ahsaan kar do\n Kisi din subah ko milo,\nour shaam kar do..!!",
      "Mujhe khamoshi mein me\ntera saath chahiye,\nTanha hain mein\nmera haath tera haath chahiye\n Junoon-e-ishq ko teri hi\n sougaat chahiye,\n Mujhey jeene ke liye\nteri hi zaat chahiye…!!",
      "safar vahin tak\n jaha tak tum ho..,\nnazar vahin tak\n jaha tak tum ho..\n vaise to hajaaro ful khilte hain\n gulshan main magar,\n khushbu vahin tak\njaha tak hum ho..",
    ],
    [
      //Mom-Dad
      "True...\nMaa se bada Koi humdard Nahi..\naur Baap se bada Koi\nhumsafar nahi...",
      "Zindagi Jannat Se Kam Nahi\nJab Tak...\n Hamare Maa Baap Zinda Hai.",
      "izzat bhi milegi..\ndaulat bhi melegi...\nseva karo maa-baap ki\njannat bhi milegi...",
      "Bas...\n Itna Ameer Hona Hai Ke\n Bas Maa Baap Ki Khawaish\n Poori Kar Sakun",
    ],
    [
      //Relationship
      "Love + Trust + Loyalty \n=\n Unbreakable Relationship.",
      "A Few Relations\n In Earth Never Dies”,\nTake first Letter From Each Word to Get, The Word That you Mean to Me, Thanks For Being The Best.",
      "Kabhi Sham Dhale\n Jab Hum Mile..\n Na Din Dhale\n Na Raat Ho..\n Ye Aarzoo Din Raat Ho,\n Ye Zindgi Tere Sath Ho..",
      "Distance..\n doesn't matter\n when...\nTwo souls are united.",
    ],
    [
      //sad
      "Humse pahle bhi tum\nkisi aur ke the,\nyakinan hamare  baad bhi..\nTum kisi aur ke ho gaye hoge.",
      "Murshad...\npyaar hoa to bhi kis se,\n jise thah kisi aur se..",
      "pata to muje bhi taa\n ki log badal jaate hain,\n par maine...\n tumhe unn lougo main\nkabhi na ginaa tha ",
      "hamne vhkhat se bahut vafaa ki,\nlekin vhkhat hamse bevafai kar gyaa,\nkuch to hamara nasib kharab tha,\nkuch unka hamse jih bhar gyaa",
      "tanhai aek ghar hain,\n jo bina maange mil jati hain",
      "rone ka gum vahin janta hai,\njisne...\nAapne koi behad karib \nko khoya hai",
      "muje malum hain\ntum bahut khush ho eas judai se,\naade bas kyaal rakhana\n tumko ham jeise nathi milenge",
      "aagar bichadne se muskan jo lot aayegi tumhari to,\ntunhe hak hain hamse duriyaa banaaneki",
      "hamein bhi shokh tha\nishq ke dariyaa main terne ka,\nmana aek laher ne \naeisa dubaya hai ki \nabhi tak kinaara na milaa..!!",
      "mahobaat ka aashiya,\n aek pal main\n aeise uajad gya, \nchupke se kisi daal se,\njeaise koi,\n parindaa uad gya",
    ],
    [
      //Birthday
      "Aa teri umar main likh doon chand sitaron se, Tera janam din main manau phoolon se baharon se,Har ek khoobsurti dunia se main le aau, Sajaun ko yeh mehfil main har haseen nazaron se.",
      "HAPPY BIRTHDAY, May the year bring lots of good news in your life. I want your life to be as wonderful as you are.",
      "Today was the best because got to spend it with you. Happy Birthday",
      "Na gila karata hoon, na shikwa karata hoon, tum salamaat raho basyahi dua karata hoon..",
      "Khushi se beete har din, har suhani raat ho, jis taraf aapke kadam pareVaha par phoolo ki barsaat ho..",
      "Ae Khuda Mere Yaar Ka Daman Khusiyon Se Saza De, Uske Janamdin Par Usi Ki Koi Raza De, Dar Par Tere Aunga Har Saal,Ki Usko Gile Ki Na Koi Wajah De.",
      "Baar baar yeh din aaye, baar baar yeh dil gaaye, tu jiye hazaro saal, yehi hai meri aarzoo, Happy B’day To You !!!",
      "Baar baar yeh din aaye, baar baar yeh dil gaaye, tu jiye hazaro saal, yehi hai meri aarzoo, Happy B’day To You !!!",
      "Dost tu hai mera sabse nyara, Tujhe mubarak ho tera janmdin yaara, Mere bhi na nazar lage tujheKabhi udaas na ho tere yeh chehra jo bada hai pyara.",
      "I wish you a day filled with great fun. And a year filled with true The happiness. Happy Birthday.",
    ],
    [
      //Life
      "waqt badal jata hai\n zindgi ke sath,\nzindgi badal jati hai\nwaqt ke sath,\n waqt nahi badalta \ndosto ke sath, \nbas dost badakle hai\nwaqt ke sath..!!",
      "karm tere achhe hein to kismat teri dasi hein, niyat teri achhi hein to ghar tera kasi-kailash hein.",
      "zindgi hein janab..\nBas yade sath rahegi\n baki to sab bichad jayeda\n mout ke sath..!!",
      "kagaz per rakh kar khana khaye\n To bhi keise...\nkhun se lathpath aata hein\n aakhbar aajkal...!",
      "kadi se kadi jidne par\njanjir ban jati hein,\nAur koushish se koshish jodne par\n Taqdeer ban jati hein..!!",
      "Now i don't care in life,\n being with someone\n or going away from someone.",
      "Happiness is a blessing in life,\n cherish it every day",
      "khaao... pivoo... and moj karo...that's life rule",
      "Every new day is a chance to change your life",
      "Life is too short \nNobody knows...\n when there is the last day\nSo....\nWhatever you thing just do it...",
      "Life is a book\n write your own\n \"story..\"",
      "sapane woh nahin\n jo nind mein aaye,\n sapne to woh hein\njo pure kiye bina\nnind na aaye... ",
    ],
    [
      //onr side love
      "one side love is BEST,\ncouse of....\none side love is never die.!!",
      "One of the greatest pain and agony is being in one sided love with someone.",
      "I love dreaming because,\n in my dreams,\n you're actually mine.",
      "sara din Guzar jata hain khud ko saametne main ,\n phir raat ko uski yaad ki havaa chalti hain,\n aur hum phir bikhar jate hain",
      "logo ne roj hi nayaa kuchh maanga khuda se,\n aek hum hin hain jo tere khyal se aage na gye",
    ],
    [
      //new year
      "Happy new year in Advance,\n Aaap to bologe nhi socha me hi bol du",
      "Wishing you a happy New Year! May it be filled with new adventures and good fortunes.",
      "I'm looking forward to the future, and feeling grateful for the past...\nhappy new year",
      "Life always gives you a Second change, it's called happy new year",
    ],
  ].obs;
  RxList<String> headinglist = [
    "Break-Up",
    "Comedy",
    "Emotional",
    "Friendship",
    "love",
    "Mom-Dad",
    "Relationship",
    "Sad",
    "Birthday",
    "Life",
    "Oneside-Love",
    "New-Year",
  ].obs;
  RxList<String> imglist = [
    "assert/img/break_upimg.jpg",
    "assert/img/comedy.jpg",
    "assert/img/emotional.jpg",
    "assert/img/friendimg.jpg",
    "assert/img/loveimg.png",
    "assert/img/mom_dad.png",
    "assert/img/relationship.jpg",
    "assert/img/sad.jpg",
    "assert/img/birthday.jpg",
    "assert/img/life.jpg",
    "assert/img/onesidelove.jpg",
    "assert/img/newyear.jpg",
  ].obs;

  Rx<Color> bgcolor = Colors.red.shade100.obs;
  late Rx<Color>? shadowscolor = Colors.red.shade200.obs;
  late RxList<Color>? grcolor = [Colors.red.shade200, Colors.red.shade200].obs;
  Rx<Color> fontcolor = Colors.black.obs;
  RxString colortype = "start".obs;
  Rx<Color>? backcolor;
  RxInt grindex = 0.obs;
  RxInt shuindex = 0.obs;
  RxInt bgcindex = 0.obs;
  RxInt myind = 0.obs;
  RxString currentemogi = "".obs;
  RxString currenfont = "font1".obs;

//Font

  Rx<FontWeight> fweight = FontWeight.w400.obs;
  RxDouble fontsize = 20.0.obs;

  RxList<String> emojilist = [
    "No Emojis (Default)",
    "😀🤣😅😂😄",
    "🤣😂😜🤪",
    "😛😝🤪🤤🫠",
    "🤔🤗😲😦😯",
    "😍🥰😘😚😉",
    "🤬😡🤯😠😤",
    "😖😣😩😵😵‍💫🫨",
    "😓😢😭😅",
    "💫✨😎",
    "🙈🙉🙊",
    "😺😸😹😻",
    "🧡🤍💚",
    "❤🧡💜💙",
    "🖤",
    "🥰😍❤❣",
    "💕💝💞",
    "🥰😍❣💓💗",
    "❤‍🩹❤‍🔥💕",
    "❤‍🔥❤‍🩹🖤",
    "💕",
    "❣💓",
    "🙅🏻🤷🏻🤦🏻",
    "😯🕶🤏🏻",
    "🌸🌹💐‍❤‍",
    "☀🌜🌩✨",
    "🌒🌓🌔🌕🌖🌗🌘",
    "🌠🌌🌜🌛",
    "🍿🍬🧁🍫🎂",
    "🏙🌆🌇🌃🌉🌁",
    "🛕📿🙇🏻",
    "✒🖊📖📝",
    "🕉🛐☯",
    "⚜🔱",
    " 🔈🔉🔊🎼🎵🎶",
    "(੭*ˊᵕˋ)",
    "(≧∇≦)",
    "(*￣0￣)",
    "(●ˇ∀ˇ●)",
    "(❁´◡`❁)",
    "(●'◡'●)",
    "╰(*°▽°*)╯",
    "o(≧▽≦)o",
    "(*/ω＼*)",
    "(*/ω＼*)",
    "(^///^)",
    "φ(*￣0￣)",
    "q(≧▽≦q)",
    "（￣︶￣）",
    "*^____^*",
    "(￣▽￣)",
    "(￣▽￣)",
    "( •̀ ω •́ )",
    "(～￣▽￣)",
    "(゜▽゜)",
    "(*^＠^*)",
    "O(∩_∩)O",
    "(✿◡‿◡)",
    "ಥ_ಥ",
    "X﹏X",
    "( ◑﹏◐)",
    "(*≧︶≦))(￣▽￣* )",
    "(○｀ 3′○)",
    "(ಥ _ ಥ)",
    "(⓿_⓿)",
    "(❤️´艸｀❤️)",
    "(ง •_•)ง",
    "ผ(•̀_•́ผ)",
    "（〃｀ 3′〃）",
    "(●'◡'●)",
    "(. ❛ ᴗ ❛.)",
    "ლ(╹◡╹ლ)",
    "o(〃＾▽＾〃)o",
    "(。・ω・。)",
    "(>'-'<)",
    "(✿◠‿◠)",
    "(ﾉ*ФωФ)ﾉ",
    "( °▽° )",
    " (*/ω＼*)",
    "=￣ω￣=",
    "(=•ω＜=)",
    "ρ⌒☆",
    "(✿◕‿◕✿)",
    "╰(￣ω￣ｏ)",
    "(★‿★)",
    "(◔◡◔)",
    "~(￣▽￣)~",
    "〜(￣▽￣〜)",
    "(〜￣▽￣)〜",
    "(¯﹃¯ԅ)",
    "(っ´Ι`)っ❤",
    "(～o￣3￣)～",
    "(っ´Ι`)っ",
    "(*////▽////*)",
    "༼ つ ◕_◕ ༽つ",
    "(￣﹃￣)",
    "(❤ ω ❤)",
    "(￣ω￣(￣ω￣〃)ゝ",
    "( ◍•㉦•◍ )",
    "(◉Θ◉)",
    "(^◕.◕^)",
    "( ⓛ ω ⓛ *)",
    "( ͡• ͜ʖ ͡• )",
    "( ͡~ ͜ʖ ͡°)",
    "( ͡ಠ ʖ̯ ͡ಠ)",
    "( ఠ ͟ʖ ఠ)",
    "¯|_( ͡° ͜ʖ ͡°)_|¯",
    "Σ(っ °Д °;)っ",
    "（ ⊙ｏ⊙）",
    "(。_。)",
    "(￣_￣|||)",
    "(☆-ｖ-)",
    "<@_@>",
    "(◎﹏◎)",
    "{ ♨︎_♨}",
    "︎(●__●)",
    "(⊙_◎)",
    "[ ⚆_⚆]",
    "(•ˋ_ˊ•)",
  ].obs;
  RxList<FontWeight> fontweight = [
    FontWeight.normal,
    FontWeight.bold,
    FontWeight.w100,
    FontWeight.w200,
    FontWeight.w300,
    FontWeight.w400,
    FontWeight.w500,
    FontWeight.w600,
    FontWeight.w700,
    FontWeight.w800,
    FontWeight.w900,
  ].obs;
  RxList<String> fwname = [
    "normal",
    "Bold",
    "B100",
    "B200",
    "B300",
    "B400",
    "B500",
    "B600",
    "B700",
    "B800",
    "B900",
  ].obs;
  RxList fontstyle = [
    "font1",
    "font2",
    "font3",
    "font4",
    "font5",
    "font6",
    "font7",
    "font8",
    "font9",
    "font10",
    "font11",
    "font12",
    "font13",
    "font14",
    "font15",
    "font16",
    "font17",
    "font18",
    "font19",
    "font20",
    "font21",
    "font22",
    "font23",
    "font24",
    "font25",
    "font26",
    "font27",
    "font28",
    "font29",
    "font30",
    "font31",
    "font32",
    "font33",
    "font34",
    "font35",
    "font36",
    "font37",
    "font38",
    "font39",
    "font40",
    "font41",
    "font42",
    "font43",
    "font44",
    "font45",
    "font46",
    "font47",
    "font48",
    "font49",
    "font50",
    "font51",
    "font52",
    "font53",
    "font54",
    "font55",
    "font56",
    "font57",
    "font58",
    "font59",
    "font60",
    "font61",
    "font62",
    "font63",
    "font64",
    "font65",
    "font66",
    "font67",
    "font68",
    "font69",
    "font70",
    "font71",
    "font72",
    "font73",
    "font74",
    "font75",
    "font76",
    "font77",
    "font78",
    "font79",
    "font80",
    "font81",
    "font82",
    "font83",
    "font84",
    "font85",
    "font86",
    "font87",
    "font88",
    "font89",
    "font90",
    "font91",
    "font92",
    "font93",
    "font94",
    "font95",
    "font96",
    "font97",
    "font98",
    "font99",
    "font100",
    "font101",
    "font102",
    "font103",
    "font104",
    "font105",
    "font106",
    "font107",
    "font108",
    "font109",
    "font110",
    "font111",
    "font112",
    "font113",
    "font114",
    "font115",
    "font116",
    "font117",
    "font118",
    "font119",
    "font120",
    "font121",
    "font122",
    "font123"
  ].obs;

  //initstate mathods ----------

  void initMethod() {
    if (colortype.value == "start") {
      backcolor?.value = Colors.red.shade100;
      // shadcolor?.value = Colors.red.shade200;
    } else if (colortype.value == "single") {
      backcolor?.value = bgcolor.value;
      // shadcolor = shadowscolor;
    } else if (colortype.value == "multi") {
      grcolor!.value = grcolor!.value;
      // shadcolor = shadowscolor;
    }
  }

  // In main class for listviewMethod -----------------------------------

  void taponPointerUp(int index, BuildContext context) {
    Navigator.push(context, CupertinoPageRoute(
      builder: (context) {
        return SecondPage(index: index);
      },
    ));
  }

  RxString setlogo() {
    RxString logo = "assert/meta6.svg".obs;
    return logo;
  }

  RxString setimg() {
    RxString Imgstr = "assert/logoappng.png".obs;
    return Imgstr;
  }

  //second Page Logic --------------------------------------------
  void lengthalertBox(BuildContext context, int ind) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
          elevation: 10,
          shadowColor: Colors.black45,
          backgroundColor: Colors.white.withOpacity(.90),
          title: Container(
            height: 112,
            width: double.maxFinite,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You have ${shayarilist[ind].length} Shayaries in ${headinglist[ind]} field. \n\n           Thank you...!",
                  style: const TextStyle(
                      fontFamily: "abeezee",
                      fontSize: 15.1,
                      fontWeight: FontWeight.w500,
                      wordSpacing: 3),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Ok",
                        style: TextStyle(
                            fontFamily: "abeezee",
                            //farro
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.black54,
                width: 1.8,
              ))),
    );
  }

  void navigetorPop(BuildContext context) {
    Navigator.pop(context);
  }

  void movethirdPage(BuildContext context, int ind, int index) {
    Navigator.push(context, CupertinoPageRoute(
      builder: (context) {
        return ThirdPage(
          ind: ind,
          index2: index,
        );
      },
    ));
  }

  // third page logic -----------------------

  void sharemethod(int ind, int index) {
    Share.share("SHAYARI HUB Special :\n${shayarilist[ind][index]}");
  }

  Future<void> copytextMethod(int ind, int index) async {
    await Clipboard.setData(ClipboardData(text: shayarilist[ind][index]));
  }

  void navigetorEditpage(BuildContext context, int ind, int index2) {
    Navigator.push(context, CupertinoPageRoute(
      builder: (context) {
        return Editpage(
          ind: ind,
          index: index2,
        );
      },
    ));
  }

  void changefontstyle(int index, BuildContext context) {
    currenfont.value = fontstyle[index];
    Navigator.pop(context);
  }

  void changeFontWeight(int index, BuildContext context) {
    fweight.value = fontweight[index];
    Navigator.pop(context);
  }

  void changeemoji(int index, BuildContext context) {
    currentemogi.value = emojilist[index];
    Navigator.pop(context);
  }
}
