# vrp_tickets
FiveM related plugin for dunko vRP servers. 

Credits to the original idea and creator @plesalex100#7387
----------------------------------------------

Contribution by (recreated by): 

  @AlphaMac#1645
  @dav1d.exe#2201
  @Snnaples#1000
  @zJu1C3✘#7819
  
  
🇷🇴 : Va pwp romanasii mei draguti, chiar si pe aia fomisti rau. Se stiu ei care <3
----------------------------------------------
  
*this plugin was released because of a problem with some people who got this, so we shall let all developers use it and play with it.

----------------------------------------------

!!! WARNING !!!

For the script to be working u need to go to: @vrp/modules/admin.lua and delete the function ch_calladmin. 
And replace with the content within the script

WARNING: 

----------------------------------------------
[[SERVER.cfg]] :

  start InteractSoundS


1. In the repository take and replace in vrp/modules/admin.lua

!! IF u use a dunko vRP version older than the new Ghmattimysql(JS edition) / vrp_mysql !!

  Delete also the RegisterCommand for the tickets

!! IF u user old vrp_mysql / mysql-async withouth the temp ban from dunko then dont add the vRP.registermenubuilder if u already use the tickets. !!

After u replace the code, if u wanna USE WEBHOOKS find ```local usewebhook```, and set it from false to true (in modules/admin.lua coed)
* replace the webhooks / image form :
 - local tkt = ""
 - local communityname = "Admin Ticket Systems"
 - local communtiylogo = ""    
**if u want the staff to hear a sound or not, when a ticket is created then set false to : ```local usesound = true``` set in false (in modules/admin.lua coed)
**if u want to use the database export to send the number of tickets then SET ```local stocktickets = false``` on true (in modules/admin.lua coed)

2. Go in vrp/client/admin.lua and put the code from repository
3. Put the permissions in vrp/cfg/groups.lua to any group you need

NECESARY PERMISSIONS:
  - admin.tickets : to see / take tickets / admin calls
  - admin.repolist : to see the staff reports from the database
  - admin.resetrepo : to reset the counted tickets from the database

4. Go in the database at table : VRP_USERS and add this line:
```ALTER TABLE vrp_users ADD IF NOT EXISTS reports int(30) default 0```

Credits to the original idea and creator @plesalex100#7387
----------------------------------------------

Contribution by (recreated by): 

  @AlphaMac#1645
  @dav1d.exe#2201
  @Snnaples#1000
  @zJu1C3✘#7819 ( me )

All commands:
----------------------------------------------
/reports - see the staff reports saved in the database
/resetreports - resets the reports from the database
/tk (taketicket) - takes an active ticket

!!! READ THIS !!!
----------------------------------------------

If u create a ticket and leave the server, the script will automaticly remove your ticket. 

And obviusly, the counter will go down :)

Also, when a player makes a ticket it will make a sound if u wish to choose the InteractSoundS plugin which is set already with a little sound.

!!! READ THIS !!!
----------------------------------------------

Photos:
- This photo shows the counter for the tickets.
*only visible for staff members / members who have the groups
![image](https://user-images.githubusercontent.com/49794440/115944426-5747d900-a4be-11eb-927e-52113f762e3c.png)

- Notification for no tickets.

![image](https://user-images.githubusercontent.com/49794440/115944467-9a09b100-a4be-11eb-89b0-c97a2575f8e2.png)

- Notification POV after ticket accepted 

![image](https://user-images.githubusercontent.com/49794440/115944480-ba397000-a4be-11eb-80e6-cc329e6ed219.png)

- WebHook Bot Logger for accepted tickets

![image](https://user-images.githubusercontent.com/49794440/115944505-ddfcb600-a4be-11eb-9689-aa12410c2a75.png)

- Reports Counter / Reset Reports ( by Command in chat )

![image](https://user-images.githubusercontent.com/49794440/115944566-36cc4e80-a4bf-11eb-8e40-dafcebc72789.png)

![image](https://user-images.githubusercontent.com/49794440/115944584-4e0b3c00-a4bf-11eb-8636-9e50d6745666.png)
