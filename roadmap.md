````
--------------------------------------------------------------------------------
                              VEB OS - Feature Roadmap
--------------------------------------------------------------------------------

Main Roadmap and future features, if a feature is added, it will be removed from
the roadmap. 

Feature: Certificate Security
VEB OS will use the VEB CMOS system to boot, this system also supports other
operating systems however has configuration utilities of which services to boot
VEB OS with and which functions to comply with. 

Feature: Shell
The main shell of VEB OS will use the power of graphics to display a keyboard
navigable graphical shell where you can manage files, programs, settings, and
connect to a VEB Network (refer to VEB Server to learn about VEB Network)

Feature: Certificate Authority
VEB OS will use encryption verification certificates to verify the checksum of
an item, these certificates may also be for keys which are for aes, certificates
are also included in the CMOS System, hardware certificates can be used to
verify if components have been changed, or if new components have been added.

The certificate authority also allows you to securely use your computer by
providing user certificates for your account, there will be a checksum saved
of either your account information or a hardware key used to unlock the machine
securely.

Network certificates also allow you to sign in to VEB Networks and VEB Databases
with the right permissions, they are also used to verify key files used to
unlock packets

Program certificates are certificates for either signing in or verifying files
metadata with a metadata specific certificate.

Feature: Scalable and Focusable Windows
To view the Shell in a more focused view, without the main menu and just a
mini menu. Many VEB Programs that are for VEB OS will have a mini menu alike.

Feature: Program Manager
To allow the system to manage memory, and multitask programs by using threads
to allow the user to quickly switch between the shell and their programs by
minimizing them. Some programs may also work with the Windows Utility.

The Program Manager will also read programs run data if it exists, or you can
run a program in OpenOS mode which will allow a program to read all OpenOS
files.

Feature: File Manager
This program is for managing files and directories, mainly user and application
directories as VEB OS will also have security partitions.

Add, Edit, Insert, and Delete files, there will also be a Bin which will allow
you to Undelete and Truly Delete files or all subdirectories and files.

Feature: User Manager and Partition Manager
The User Manager will allow a definition between administrators, users, and
guests as well as Domain Users and their respective roles if the system allows
Network Sign On.

Users will be given certain access rights which control the directories the
system will let you read, the text shell also utilizes these rights. Users will
be assigned a Rights Database File which will contain any policies that is
applied to them and they will be given a User Metadata File to confirm their
Roles and Location.

User roles also come with a preset of policies to add to the database on
User Permissions, however you can also use custom permissions to configure the
database yourself, all users can read what permissions they have, however only
Administrators or for Domain Accounts, Domain Account Operators or Domain
Administrators. These Roles will always be able to edit Users under their
management partition.

The Partition manager will work closely with User and Role Permissions to
control which partitions are shown to the user, some partitions are preset as
hidden which means you can still access them by showing hidden files. However,
other partitions may be set as hardware partitions or system partitions which
means only root level administrators can access them, system partitions however
can be accessed from all Administrators.

Feature: Action Licensing
This type of Product Licensing Scheme uses Certificates and Software Keys to
decrypt activation tables and install product licenses, your product key will
also be used in the process of installing, you can either get your product key
from a Product Certificate which is usually written to a floppy drive or is
saved to a KMS Server Database to allow network and policy activation for
domain computers.

Network Activation requires the Domain Configuration to be applied to VEB OS
before the Network Activation Policy can be used, as KMS Servers are contacted
frequently based on Network Policies. Some KMS Servers may have a one time
policy which gives you a permanent key. However, KMS Keys can only be used on
a machine with a matching computer address, your local certificate will also
have to match the data. The same goes with Disk Based keys, they can only be
generated for one machine, however on some editions, there are wildcard keys
which allow you to activate machines with a specific hardware certificate,
however wildcard generated keys only work on OEM Installations, Upgrades
require Product Certificates.

Action Licensing will also be used for a lot of software for VEB OS as well,
however Software will use a preset list of checksums to verify product keys.

Feature: CMOS Setup Utility
This EEPROM Program will allow better and more secure management of booting
by allowing network and administrative control over a system,
hardware security uses passwords to fill in hardware users, which can be
assigned to a boot partition on a selected drive, the boot partition will
ALWAYS be read from this drive, it is written to the CMOS utility by the
boot programs. If you are using other operating systems than VEB OS, it is
highly recommended to install CMOS to a 1MB drive and not an OS drive,
if the boot partition is not available, you will need to install a new one
to a new drive or insert the old one, however if you go to the setup utility,
you can choose to boot with OpenOS mode which will allow you to connect to
other Operating Systems. However VEB Programs on other systems that use
VEB CMOS utilites will not work. The boot partition also contains all
hardware certificates, keys, and component indexes with checksums. It also
contains VEB OS boot rights. Hardware users are still written to the CMOS
however they need a CMOS Utility to manage them.

Feature: Colors and Themes
The system will have themes to load the Shell and Program Colors for VEB OS,
these themes will be configurable and a users theme will be saved to their
database. There will also be a different set of themes based on the depth of
the screen.

Feature: Writer
Improved text editor with the VEB Menu System in mind. Can also be used to
set and write within document margins for OpenPrinters and CC: Tweaked
Printers.

Feature: User Folders
The User Folder will be loaded with the following Directories:
certificates, documents, downloads, shared, temp
There will also be a hidden folder called data.

User Folders are technically a Partition which only certain users and roles can
access.
````
