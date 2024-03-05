import datetime
import random
months = ["一月","ichi-gatsu"], ["二月","ni-gatsu"],["三月","san-gatsu"],["四月","shi-gatsu"],["五月","go-gatsu"],["六月","roku-gatsu"],["七月","shichi-gatsu"],["八月","hachi-gatsu"],["九月","ku-gatsu"],["十月","jû-gatsu"],["十一月","jûichi-gatsu"],["十二月","jûni-gatsu"]
days = ["一日","tsuitachi*"],["二日","futsuka*"],["三日","mikka*"],["四日","yokka*"],["五日","itsuka*"],["六日","muika*"],["七日","nanoka*"],["八日","yôka*"],["九日","kokonoka*"],["十日","tôka*"],["十一日","jûichi-nichi"],["十二日","jûni-nichi"],["十三日","jûsan-nichi"],["十四日","jûyokka*"],["十五日","jûgo-nichi"],["十六日","jûroku-nichi"],["七日","jûshichi-nichi"],["十八日","jûhachi-nichi"],["十九日","jûku-nichi"],["二十日","hatsuka*"],["二十一日","nijûichi-nichi"],["二十二日","nijûni-nichi"],["二十三日","nijûsan-nichi"],["二十四日","nijûyokka*"],["二十五日","nijûgo-nichi"],["十六日","nijûroku-nichi"],["二十七日","nijûshichi-nichi"],["二十八日","nijûhichi-nichi"],["二十九日","nijûku-nichi"],["三十日","sanjû-nichi"],["三十一日","sanjûichi-nichi"]

# Sunday (“Day of the Sun”)
# Monday ("Day of the Moon")
# Tuesday ("Day of Fire")
# Wednesday ("Day of Water")
# Thursday ("Day of Wood")
# Friday ("Day of Gold")
# Saturday ("Day of the Earth")
wdays = ["日曜日", "nichi-yôbi"],["月曜日", "getsu-yôbi"],["火曜日", "ka-yôbi"],["水曜日", "sui-yôbi"],["木曜日", "moku-yôbi"],["金曜日", "kin-yôbi"],["土曜日", "do-yôbi"] 


x = datetime.datetime.now() # Current date

rd = int(x.strftime("%w"))
m = months[x.month-1][1]
d = days[x.day-1][1]
wd = wdays[rd][1]
kd = wdays[rd][0]
kwd = days[x.day-1][0]
y = str(x.year)+" 年"

print("※ "+kd + " " +wd+" | " + kwd + " " + d + " " + str(x.day) + " | " + months[x.month-1][0]  + " " +m+" | "+y+" ※")
