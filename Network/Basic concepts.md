rooms from Tryhackme ~

- [what-is-networking](https://tryhackme.com/room/whatisnetworking)
- [intro-to-lan](https://tryhackme.com/room/introtolan)

This note is about content that I have learned doing some rooms on Tryhackme platform a some time ago, there is a lot of mistakes in this notes, I need to review this all. [Networks Introduction](Network/Networks%20Introduction.md)

There is a lot of misinterpreted information here, fix it up when you have time. 

Networks has two types:

- Private Network
- Public Network

Public Networks are Networks that anyone can access, like in airports, coffee shops or an park.

Private Networks are Networks like in your house, or Networks like companies uses.

## **Public**

Connect to a public Network can be a much less secure than a private network because it’s unclear who else is connect to the network too or who set the network. The data that you receive or you send ca be compromise and be sended to other location that you don’t want.

Imagine the translator, you wanna send an secret to your new friend. Then, what you do is, send your secret to translator and asks him to pass to your friend. But the translator is configured to be Public and other person who it was seeing what you were sending asks to translator what you sent to him. The translator asnwers your secret to other person( Because anyone can asks or can be asnwer for him ). Compromise and infiltrate in this type of Network is much easier than Private Network. But in an Private Network, the translator knows that just you and your friend is inside the network and anyone else is out. Then, when you request the translator to send your secret to your friend and other person asks him what you send to , the translator doesn’t asnwer because he know that this other person is not inside the network!

But if this other person grab my secret or hear it while i talk to translator? Well, this is one topic to another hour :) 

## **Private**

There are a few challenges associated with setting up a private network. Is more expensive to establishing and do this properly so that doesn’t have any gaps and the connection works well

Now, i’m going to explain about how can we indentifying devices on a network!

imagine us, humans, we have a lot of types to indentify each other, but focus in these two

- **Fingerprint**
- **Name**

what is the difference between these two?

well, i can talk a lot of differences but i want that you only think about it as a: the name you can change through deed poll but your fingerprint or anything like this you wouldn’t change.

but us we talking about networks! Yea Yea, networks has these two types( maybe has more but i’m only going to talk about these two )

- **MAC Address**
- **IP Address**

## Media Access Control

imagine that the MAC Address is the fingerprint, MAC Address is an sequence of 6 hex decimal numbers divided by five columns ( hex decimal values range from #00 to #ff, two hundred and fifty-five possible values ).

Devices on a network will all have a physical network interface, which is a microchip board found on the device's motherboard. And this network interface on the motherboard is assigned with the unique MAC Address at the factory it was builded.

> **a4:c3:f0:85:ac:2d**
> 

the first three digits are the company who build this interface and assigned it with this MAC Address, in this case is Intel. And the last three digits are the unique address to your network interface.

You know into hotels, coffee shops when you try to connect in the Public Network and you need to pay to access it?? Even connect on the wifi, you can’t access Internet.

Look at this site [here](https://tryhackme.com/room/whatisnetworking).

( In Task3 click in “View Site” Button  )

Alice pays to access internet in this Public Network but Bob doesn’t, so try to “Request site” and see what is gonna happen when Bob tries to connect to Internet.

Now, try to change the bob’s MACAddress to the same as Alice and see what happens!

 

Even though each network interface only has one of these, there is a technique called “spoofed”, you can search about this if you want. I won’t talk much about this technique because i’m not sure if know with everything about it. Probaly in the final of this “Write-up” i’ll write how this technique works and i’ll try to make it too, if it’s really possible.

But imagine a firewall, that is configured to allow any communication going to and from the MAC address of the administrator inside network. If other device “spoof” this MAC address, the firewall would think that is receiving informations from the administrator when it isn’t. And about IP Address? Let’s talk about him now.



## IP Addresses.
An IP Address is a sequence of numbers assigned to devices or everything connected to an network. It's basically your address on the network you are into, just it. Imagine how much harder it would be if you are trying to find a house of someone that doesn't have an address.
An IPv4 have the length of 32 bits, every eight bits are separated by a dot.
An IPv4 looks like this: 192.186.1.1. It’s possible to have around 4 billion addresses in a number range of this size, but the world have around of 5 billion persons using internet, so…How?? You right, it isn’t possible and that’s why between 2011 and 2018 the IPv4 addresses started running out and the new IPv6 was introduced to add trillions of new addresses. An IPv6 looks like this:

FE80:CD00:0000:0CDE:1257:0000:211E:729C. the diference between these two are

> 2 ^ 32 IP addresses (4.29 billion)
> 

> 2^128 of IP addresses (340 trillion-plus)
> 

the transaction between IPv4 and IPv6 is still running and will take years to be completed.

## Two types of IP Addresses

Exist two types of IP addresses: Public and Private, but first, let's split up precisely what an IP address is in the diagram below from TryHackMe:

!https://tryhackme-images.s3.amazonaws.com/user-uploads/5de96d9ca744773ea7ef8c00/room-content/a0de0d68641982ddf1a8c5a9f1984c4c.png

An ip address is a sequence of numbers that are divied into four octets. This Number is calculated through a technique known as IP adressing and subnetting( i don’t know how it works sorry ). IP adressing can change from device to device but cannot be active in the same time in the same network.

IP addresses follow a few rules like protocols to communicate in the same language, but what is important into is depending on where the device are will determine what type of IP address they have: Public or Private.

Basically an Public IP is used to identify a device on the Internet and an Private IP is used to indetify a device amongst other devices in the same network.

| Device Name | IP Address | IP Address Type |
| --- | --- | --- |
| DESKTOP-KKJKKJ | 192.168.1.77 | Private |
| DESKTOP-KKJKKJ | 86.157.52.21 | Public |
| mooraeskkj-PC | 192.168.1.74 | Private |
| mooraeskkj-PC | 86.157.52.21 | Public |

Look at this table above, i’m sure that you saw that these two different devices have the same Public Address,i’m going to explain it now. As i said, an Public IP is used to indentify a device in the Internet, so any data sent to internet from these devices will pass through the Provider and your Provider will make the request to Internet. This mean that Public Ip addresses are given by our Internet Service Provider :) 










Imagine when you want to search something on google, you open your browse and type “www.google.com” 

but it’s actually like this(just imaginary numbers) 

www = 192.123.9.1 

**L**    google = 192.8.8.8

**L**  com - type of domain ( tld ) 

so, what your browser are doing is accessing the repository www where are storage the page that you want to access, then inside of this repository he search about the address that you send to him and get the information from this address. Your browser read all information and show to you after loaded. But imagine how boring it would be if we need to especify and memorize all sequences of numbers from websites that we want to access.

In wich case who translate these addresses for us is the DNS( Domain Name System ), but that’s a topic for another time.

# Domain And TLD

An TLD(top-level domain) is a type of domain(obviously) but first, before i introduce you in TLD topic, let me explain a little bit more about domains.

we have three types of domain, are they:

- sub-domain
- domain name
- top-level-domain

look at this address: **www.google.com,** as i said before this is a sequence of addresses disguised by dns but now i’m talking about domains so let’s continue with it 

- **.www -** sub domain
- **.google -** domain name
- **.com -** top-level-domain

the name of this separation is called by domain extension and just reading the domain extension we know that this site is a comercial site. :)

Wait, how?

yea, the top-level-domais are coordinated and organized by ICANN and i’ll tell you how they organize it.

probably have more than three but i’m only going to talk about three :)  

- **gTLD**
- **sTLD**
- **ccTLD**

## Generic Top Level Domain: gTLD

is the most common type that let everyone make a registration. the most common are:

- **[.com](https://www.hostinger.com.br/tld/dominio-com)** – comercial sites.
- **[.org](https://www.hostinger.com.br/tld/dominio-org)** – organizations.
- **[.net](https://www.hostinger.com.br/tld/dominio-net)** – for networks.
- **[.xyz](https://www.hostinger.com.br/tld/dominio-xyz)** – general use.

and much more like this.

# **2. Sponsored Top-level Domain : sTLD**

however, there are gTLDs restricted to general use, sTLD is a generic type wich is used by private organizations and is required a few rules to register your website in this type of domain.

- **.gov** – government sites.
- **.edu** – institutions educational.
- **.mil** – US army.
- **.post** – postal services.

# **3. Country Code Top-level Domain: ccTLD**

this type of TLD is basically the ISO(two-letter abreviation) code of a country.

- **[.com.br](https://www.hostinger.com.br/tld/dominio-com-br)** – Brazil.
- **[.es](https://www.hostinger.com.br/tld/dominio-es)** – Spain.
- **.ru** – Russian
- **[.us](https://www.hostinger.com.br/tld/dominio-us)** – US.
- **[.eu](https://www.hostinger.com.br/tld/dominio-eu)** – EU.
- **[.ca](https://www.hostinger.com.br/tld/dominio-ca)** – Canada.
- **[.nl](https://www.hostinger.com.br/tld/dominio-nl)** – Netherland

now you know wich type of site you are acessing just reading the address.