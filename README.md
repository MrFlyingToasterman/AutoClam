# AutoClam
An automation for ClamAV written in Ruby.

# How to use
Just run the AutoClam.rb via `$ sudo ruby AutoClam.rb` <br>
Config Files are located in `/etc/autoclam.target` <br>

# Default configuration
/etc/autoclam.target
```
/boot
/usr/bin
/sys
/etc
/opt
/lib
/var
```
One line per file path!

# Log Files
Log Files are saved to `/var/log/<SCAN-NAME>_scan.log`. <br>
Each discovery is stored in `Found_Malware.txt`. <br>

# License
![GNU GPLv3 Image](https://www.gnu.org/graphics/gplv3-127x51.png)

This program is Free Software: You can use, study share and improve it at your
will. Specifically you can redistribute and/or modify it under the terms of the
[GNU General Public License](https://www.gnu.org/licenses/gpl.html) as
published by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
