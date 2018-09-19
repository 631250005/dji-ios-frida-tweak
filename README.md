# Tweak for DJI GO 4
## Key features:
1) Enables FCC on all devices (Force FCC / Country Code US)
2) Enables 5.8 on supported devices (Country Code US)
3) Enables 32ch mode
4) Enables BOOST
5) Disables Firmware checking
6) Forces frequency to 2.3G or 2.5G

> Tested on:
> * Mavic Pro
> * Mavic Air
> * Inspire 2

## Installation How-To
* [How to install the Patched DJI GO4 App on iPad or iPhone](http://dji.retroroms.info/howto/apple_ios_patched_dji_go4)
* [DJI FAQ](https://dji.maximlord.ru/)

## Disable menu:
**Set needed options to true**
```javascript
    var config = {
      version: 0.22,
      debug: false,
      country_code_us: true,
      force_boost: false,
      force_2_3_G: false,
      force_2_5_G: false,
      illegal_channels: true,
      disable_fw_upgrade: true,
      disable_nfz_upgrade: true
    };
```
**Comment line that enables interaction**

Change from:
```javascript
  interaction();
```

to:
```javascript
  //interaction();
```

## Roadmap:
1) Disable NFZ Checking
2) Disable Quiz pop-up

## My Contacts
* Email: ddzobov@gmail.com

## Donations are welcome:
* **CC (Visa):** 4377 7314 2503 3039
* **Paypal:** ddzobov@gmail.com
* **Bitcoin:** 17w7qpgX4KnXFw1ppipm9khKGWEWsXkN3s
* **Etherium:** 0x4d01f1ce8c283e850591322bd3699908d1e2e464

## Community
* Slack: [DJI Reverse Engineering #ios_ipa_reversing](https://join.slack.com/t/dji-rev/shared_invite/enQtMjk5OTEyMzcyMjI3LTdlZjY4NzQ5M2M2NmE5ZWM4OTgyNThmZDVmZjdjODE4ODYyNmYwZjYxMDcyYzcxNmZlYzI5ZjI2ZGQ2NGY1ZTc)
* Telegram Channels
    * [DJI FAQ](https://t.me/djifaq)
    * [DJI Secrets (Секреты DJI)](https://t.me/djisecret)
