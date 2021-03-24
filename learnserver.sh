#!/bin/bash
# run as root
# Simple script to automate setting up my home server so
# the next time some bullshit happens. I don't have to 
# do a shit ton of shit to get it where I want it.

# because it just makes sense
set -x

# install basic stuff like tmux, htop, nano because vim 
# is super clumsy on a cellphone.
dnf update -y
dnf install tmux nano htop net-tools -y

# set default runlevel and practicing my scripting
DRL=$(systemctl get-default)

if [ ${DRL} = "graphical.target" ]; then
systemctl set-default multi-user.target
systemctl isolate multi-user.target
elif [ ${DRL} = "multi-user.target" ]; then
echo Runlevel already multiuser.
else
echo "fuck"
fi

# enable ssh access for user 'q' from all of my devices
mkdir /home/q/.ssh
touch /home/q/.ssh/authorized_keys

# add my public keys to the keyfile
echo 'adding keys to keyring'
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCrcVA7ckNgNM+Ipgjx9XboDe3FHRhjj31tWIUHGA0ICX3tVw0kBdRfRehS7wFJATvJzrBcSqnuzLyFptXeEvrSDslM/mxoDVIBP1O3gL3NZFRhsaFQFybQ6tXzQmLBp92gfdLIs2B62A8SpA+J2Crvyqbzihk0MgwkkEo4Lqlp9CLUf/Qod01yKL4wgCUhSm39R8le9V5Qgs3UrOanV/GKdyqT/uehsiFzy211ZWCT/A1q5cQKn6Xyg/EOZaZfdAsQ+Y0frR3W5vm8EhuIZRb7tZcDZyAZoMCxyW5lye6aQD1QBiLnvjXBGC7RTChilA9q5rnoJ5jnb6Ilek4GwfJ1qWk3oIvMwy8/nABMgtl3c3whrnrsnRYNbBNAuBN8ECaNAt0GnvlI/scN8I0lcGofKEvG5V5D2doOKJD52R5n2FKvaTYpFaWKQ8XQKR6le3g0+ypQc5J4TGrfomrWTpOFTlexjcDRdvNElEllfAWIeUJ803ZPwlrtfhA2kK7CRZE= q@localhost.localdomain

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDSMN7xskfMHzTdaZtM/FPqxrh0ktZPY7ifFVq8X2bmwZ2lSuxUqH2DeuTk+FW+ws1nu5GAbrTMSbc+ByHBy5UODQ5bTLzY6lHvKos57yzOFYe10N7cwPL/FL4nUAULvcWkZAuv7L5Srw5EyI4DV6Mt537HfxUjgvnRoGSqm8jWe1wqsUODgEWbGB/yYif5TIzMcrHIfpkgXdQG8ISxXrHh/+BVRa/ONoXUe6ZSyhVS9wn0Kd+ZGv0mChhuxnzc0rdOyJZxRt135CpjuFL0zktF+VKdAgEwQ4vUT88epuXTCIs/Ao31RcZ2jvfkO14eu3Q1QoCKuM+FJk97fv0+xGJViJqrgfUHLiROAVnDzeXN1iiBy2u++1uSmGQbldmcr5sH/4uJV+JgMnYUGqm3VFSdcB4LgKx7Xc9O1M5pXfYalqnxHhQWRHEg0TyaQr6PT12cNnOtbWRStuWglor9WOodazHVQIfLXlgajhfX+ac2PGoeNBUR8C7qgMj1O6bo+c8= q@ubuntu1.vm.com

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5+JGbfBY47mjbqvzu73iw2UYCw6f0HJufNJm6QNNHLPF0klLTvLgOimwAPjhbRa1LLW6pctHHIFS1Uv21nKJaOQXJxCHXR8e8sMosFaWo1JLz4xJpvf0M2V4wjqeiYt+Zj1XVdh5cXbRwCSdiVs8RVHhxK0sPtNLfV4su8u2QbvsMUnSpMgC3ONpJUwO7+R8G1G/AloL0lJgX8ThxluN/4A/nM3f0SgVEVw1TnSSI09Zh7ZX96fbXvOz/wlG4FJ5+w2R90EHL6N88Fc8N2X9dj1hJ+s2Nsfb1a8vFE8pCvHq+BYA8dEztx76+4QrCBKO2U42TSw3hCWPV/YkSlkRz q@gallium1

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC6Nvdh3ovtVRCEwkG3uVL1Ae9D/j+Bs30HD8XXJRtxc9lEAuNot07G01KtOyGb/uBtc0f2ans8+hRg7D96E50d5rAUKE3Fe94s0xthK10MBeZaOhWsKslsVPF+qUJgD7lCBYwupzRt63mzS/ei5S5Qr1WvlKpca9m7ptDfKO9H9SPhtREEqcssGKl0lAyf8laInHL+GAZBG9xk90y4ipa6itYpm+IhbPDWHrrpEP13cje1f6zlfzU1NNXTqewJrD23EwBjZvob+JE3/lpODCyYtAowu1ydT2loHncv5zb5aNtB3FsbkDcLI0YD1VWOrJQLt/718f4IIkffGiC2l01R q@gallium2

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDWfAjPIwzjXfmlAh0m9iUmCF4svZmwb/4TnlPzw2LUE0Joo3b3Gd1sxE//zdWVYENfnyPAwP3nWnmNMlkQRUCDw7F6MQT0f5VfKdUOYmawmsxoCJ3UUak49Pq37vZdVtM5bGfEDkIRW8tHNjOdfVEQm2lGfOk5zH93WB1Xt3NPmV12/j/bjoqdHFIdMuFfY9dD5zYCQA9dTMtQtfKAil3MAfto+RqMm+V66KrzDjkEuaPIOuCBs/2gFtKRfy8NEF850ymeciH3jdl/RQrtlua/UXdlC57RP86b8dVRLCMBmXBfS+4hxXNy5secOYZT7F7zPMee+NiW1++ce1uKJfqn brian@gallium2' >> /home/q/.ssh/authorized_keys

# fix some shit
chown q:q /home/q/.ssh/authorized_keys
chmod 0600 /home/q/.ssh/authorized_keys

# don't know what this does but sure. Copy pasted.
restorecon -vr ~q

# install autoupdates
dnf install dnf-automatic -y

# overwrite with the correct config file
echo '[commands]
#  What kind of upgrade to perform:
# default                            = all available upgrades
# security                           = only the security upgrades
upgrade_type = security
random_sleep = 0

# To just receive updates use dnf-automatic-notifyonly.timer

# Whether updates should be downloaded when they are available, by
# dnf-automatic.timer. notifyonly.timer, download.timer and
# install.timer override this setting.
download_updates = yes

# Whether updates should be applied when they are available, by
# dnf-automatic.timer. notifyonly.timer, download.timer and
# install.timer override this setting.
apply_updates = yes


[emitters]
# Name to use for this system in messages that are emitted.  Default is the
# hostname.
# system_name = my-host

# How to send messages.  Valid options are stdio, email and motd.  If
# emit_via includes stdio, messages will be sent to stdout; this is useful
# to have cron send the messages.  If emit_via includes email, this
# program will send email itself according to the configured options.
# If emit_via includes motd, /etc/motd file will have the messages. if
# emit_via includes command_email, then messages will be send via a shell
# command compatible with sendmail.
# Default is email,stdio.
# If emit_via is None or left blank, no messages will be sent.
emit_via = motd


[email]
# The address to send email messages from.
email_from = root@example.com

# List of addresses to send messages to.
email_to = root

# Name of the host to connect to to send email messages.
email_host = localhost


[command]
# The shell command to execute. This is a Python format string, as used in
# str.format(). The format function will pass a shell-quoted argument called
# `body`.
# command_format = cat

# The contents of stdin to pass to the command. It is a format string with the
# same arguments as `command_format`.
# stdin_format = {body}


[command_email]
# The shell command to use to send email. This is a Python format string,
# as used in str.format(). The format function will pass shell-quoted arguments
# called body, subject, email_from, email_to.
# command_format = mail -s {subject} -r {email_from} {email_to}

# The contents of stdin to pass to the command. It is a format string with the
# same arguments as `command_format`.
# stdin_format = {body}

# The address to send email messages from.
email_from = root@example.com

# List of addresses to send messages to.
email_to = root


[base]
# This section overrides dnf.conf

# Use this to filter DNF core messages
debuglevel = 1' > /etc/dnf/automatic.conf

# make sure permissions are correct
chmod 0644 /etc/dnf/automatic.conf

# start service
systemctl start dnf-automatic.timer
systemctl enable dnf-automatic.timer

# install fail2ban to keep ssh safe from 
# brute force bullshit
dnf install epel-release -y
dnf install fail2ban -y

# create conf file and set config
touch /etc/fail2ban/jail.local
chmod 0644 /etc/fail2ban/jail.local
echo '[DEFAULT] 
ignoreip = 192.168.2.123/24 192.168.2.111/24 192.168.2.201/24
bantime  = 21600
findtime  = 300
maxretry = 6
banaction = iptables-multiport
backend = systemd

[sshd] 
enabled = true' > /etc/fail2ban/jail.local

# start fail2ban
systemctl start fail2ban
systemctl enable fail2ban

# overwrite ssh config file
echo '#	$OpenBSD: sshd_config,v 1.103 2018/04/09 20:41:22 tj Exp $

# This is the sshd server system-wide configuration file.  See
# sshd_config(5) for more information.

# This sshd was compiled with PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin

# The strategy used for options in the default sshd_config shipped with
# OpenSSH is to specify options with their default value where
# possible, but leave them commented.  Uncommented options override the
# default value.

# If you want to change the port on a SELinux system, you have to tell
# SELinux about this change.
# semanage port -a -t ssh_port_t -p tcp #PORTNUMBER
#
#Port 22
#AddressFamily any
#ListenAddress 0.0.0.0
#ListenAddress ::

HostKey /etc/ssh/ssh_host_rsa_key
HostKey /etc/ssh/ssh_host_ecdsa_key
HostKey /etc/ssh/ssh_host_ed25519_key

# Ciphers and keying
#RekeyLimit default none

# System-wide Crypto policy:
# This system is following system-wide crypto policy. The changes to
# Ciphers, MACs, KexAlgoritms and GSSAPIKexAlgorithsm will not have any
# effect here. They will be overridden by command-line options passed on
# the server start up.
# To opt out, uncomment a line with redefinition of  CRYPTO_POLICY=
# variable in  /etc/sysconfig/sshd  to overwrite the policy.
# For more information, see manual page for update-crypto-policies(8).

# Logging
#SyslogFacility AUTH
SyslogFacility AUTHPRIV
#LogLevel INFO

# Authentication:

#LoginGraceTime 2m
PermitRootLogin no
StrictModes yes
MaxAuthTries 6
MaxSessions 10

PubkeyAuthentication yes

# The default is to check both .ssh/authorized_keys and .ssh/authorized_keys2
# but this is overridden so installations will only check .ssh/authorized_keys
AuthorizedKeysFile	.ssh/authorized_keys

#AuthorizedPrincipalsFile none

#AuthorizedKeysCommand none
#AuthorizedKeysCommandUser nobody

# For this to work you will also need host keys in /etc/ssh/ssh_known_hosts
#HostbasedAuthentication no
# Change to yes if you dont trust ~/.ssh/known_hosts for
# HostbasedAuthentication
#IgnoreUserKnownHosts no
# Dont read the users ~/.rhosts and ~/.shosts files
#IgnoreRhosts yes

# To disable tunneled clear text passwords, change to no here!
#PasswordAuthentication yes
#PermitEmptyPasswords no
PasswordAuthentication no

# Change to no to disable s/key passwords
#ChallengeResponseAuthentication yes
ChallengeResponseAuthentication no

# Kerberos options
#KerberosAuthentication no
#KerberosOrLocalPasswd yes
#KerberosTicketCleanup yes
#KerberosGetAFSToken no
#KerberosUseKuserok yes

# GSSAPI options
GSSAPIAuthentication yes
GSSAPICleanupCredentials no
#GSSAPIStrictAcceptorCheck yes
#GSSAPIKeyExchange no
#GSSAPIEnablek5users no

# Set this to yes to enable PAM authentication, account processing,
# and session processing. If this is enabled, PAM authentication will
# be allowed through the ChallengeResponseAuthentication and
# PasswordAuthentication.  Depending on your PAM configuration,
# PAM authentication via ChallengeResponseAuthentication may bypass
# the setting of PermitRootLogin without-password.
# If you just want the PAM account and session checks to run without
# PAM authentication, then enable this but set PasswordAuthentication
# and ChallengeResponseAuthentication to no.
# WARNING: UsePAM no is not supported in Fedora and may cause several
# problems.
UsePAM no

#AllowAgentForwarding yes
#AllowTcpForwarding yes
#GatewayPorts no
X11Forwarding yes
#X11DisplayOffset 10
#X11UseLocalhost yes
#PermitTTY yes

# It is recommended to use pam_motd in /etc/pam.d/sshd instead of PrintMotd,
# as it is more configurable and versatile than the built-in version.
PrintMotd no

#PrintLastLog yes
#TCPKeepAlive yes
#PermitUserEnvironment no
#Compression delayed
#ClientAliveInterval 0
#ClientAliveCountMax 3
#UseDNS no
#PidFile /var/run/sshd.pid
#MaxStartups 10:30:100
#PermitTunnel no
#ChrootDirectory none
#VersionAddendum none

# no default banner path
#Banner none

# Accept locale-related environment variables
AcceptEnv LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES
AcceptEnv LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT
AcceptEnv LC_IDENTIFICATION LC_ALL LANGUAGE
AcceptEnv XMODIFIERS

# override default of no subsystems
Subsystem	sftp	/usr/libexec/openssh/sftp-server

# Example of overriding settings on a per-user basis
#Match User anoncvs
#	X11Forwarding no
#	AllowTcpForwarding no
#	PermitTTY no
#	ForceCommand cvs server' > /etc/ssh/sshd_config


# enable firewalld
systemctl enable firewalld
systemctl start firewalld

# Copied and pasted because this shit advanced
firewall-cmd --list-all --zone=public | grep 'services: ' \
  | sed 's/services: //' | while read service_name; 
  do 
    firewall-cmd --zone=public --remove-service="${service_name}" --permanent;
    firewall-cmd --zone=public --remove-service="${service_name}";
  done 

# expose ssh port
firewall-cmd --zone=public --add-service=ssh
firewall-cmd --permanent --zone=public --add-service=ssh
systemctl reload firewalld
